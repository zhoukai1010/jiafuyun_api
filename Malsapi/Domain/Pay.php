<?php
class Domain_Pay {
    var $model;

    public function __construct() {
        $this->model = new Model_OrderFinance ();
    }

    //获取订单支付记录信息
    public function getOrderPay($orderId){
        $rs = $this->model->get($orderId);
        return $rs;
    }
    //判断订单信息
    public function orderInfo($orderId){
        $orderModel = new Model_Order();
        $rs = $orderModel->get($orderId);
        return $rs;
    }
    public function payOk($data){
        $orderInfo = $this->model->getByWhere(array('item_bn'=>$data['item_bn']));
        if($orderInfo['pay_status'] == 'succ'){
            return ;
        }
        //更新支付记录
        $id = intval($orderInfo['id']);
        $rs = $this->model->update($id,$data);
        if(! $rs){
            throw new LogicException ( T ( 'Pay failed' ), 147 );
        }
        //更新订单信息
        $orderModel = new Model_Order();
        $orderRs = $orderModel->update($orderInfo['about_id'], array('is_pay' => 'succPay', 'pay_type' => 'all', 'last_modify' => time()));
        if(! $orderRs){
            throw new LogicException ( T ( 'Pay failed' ), 147 );
        }
        //添加订单日志
        $order_bn = $data['item_bn'];
        $logModel = new Model_OrderLog();
        $logDate = array(
            'order_id' => $orderInfo['about_id'],
            'content' => '买家支付成功，订单支付记录编号【'.$order_bn.'】',
            'create_time' => time()
        );
        $log = $logModel->insert($logDate);
        if(! $log){
            throw new LogicException ( T ( 'Pay failed' ), 147 );
        }
        //添加订单支付记录
        $payLogModel = new Model_OrderPayLog();
        $data = array(
            'order_id' => $orderInfo['about_id'],
            'pay_id' => $id,
            'amount' => $orderInfo['price'],
            'reason' => '订单支付成功',
            'create_time' => time(),
        );
        $payLogId = $payLogModel->insert($data);
        if(! $payLogId){
            throw new LogicException ( T ( 'Cancel order failed' ), 159 );
        }

        return $rs;
    }

    //客户申请退款
    public function CustomerRefund($data){
        $orderInfo = $data['orderInfo'];
        $financeId = $data['finance_id'];
//        $refund_money = $data['returnPrice'];
        $reason = $data['reason'];
        //查询订单支付记录（财务）
        $financeInfo = $this->model->getByWhere(array( 'id' => $financeId, 'about_id' =>$orderInfo['id'] ), 'id,about_id,item_bn,price,pay_type,serial_bn,status,pay_status,pay_time,pay_end_time');
        if(! empty($financeInfo)){
            //判断支付类型
            if($financeInfo['pay_type'] != 'wechat'){
                throw new LogicException ( T ( 'Pay type error' ), 180 );
            }
            //判断是否已支付
            if($financeInfo['pay_status'] == 'wait'){
                throw new LogicException ( T ( 'Order is not pay' ), 178 );
            }
            //判断是否已退款
            if($financeInfo['pay_status'] == 'refund'){
                throw new LogicException ( T ( 'Order is refund' ), 179 );
            }
            //判断支付记录状态
            if($financeInfo['status'] != 'finish'){
                throw new LogicException ( T ( 'Order status is error' ), 157 );
            }
            $refund_money = $financeInfo['price'];
            //判断退款金额不能大于实付金额
            if($financeInfo['price'] < $refund_money){
                throw new LogicException ( T ( 'The amount of refund shall not be greater than the amount pai' ), 181 );
            }
            //微信退款
            $result = $this->requestWxRefund($financeInfo,$refund_money);
            if($result){
                //退款成功-更新内部订单
                //判断支付金额是否等于退款金额
                if($financeInfo['price'] == $refund_money){
                    //全额退款
                    $updateOrder['is_pay'] = 'refund';
                    $updateOrder['service_status'] = 'close';
                    $updateFinance['pay_status'] = 'refund';
                }
                //退款金额小于支付金额
                if($refund_money < $financeInfo['price']){
                    //部分退款
                    $updateOrder['is_pay'] = 'partRefund';
                    $updateFinance['pay_status'] = 'part_refund';
                }
                //更新订单（订单关闭）
                $orderModel = new Model_Order();
                $updateOrder['last_modify'] = time();
                $ups = $orderModel->update($orderInfo['id'], $updateOrder);
                if(! $ups){
                    throw new LogicException ( T ( 'WeChat refund failed' ), 182 );
                }
                //更新支付记录
                $updateFinance['status'] = 'close';
                $updateFinance['last_modify'] = time();
                $ups = $this->model->update($financeInfo['id'], $updateFinance);
                if(! $ups){
                    throw new LogicException ( T ( 'WeChat refund failed' ), 182 );
                }
                //插入订单日志
                $order_bn = $financeInfo['item_bn'];
                $logModel = new Model_OrderLog();
                $logDate = array(
                    'order_id' => $orderInfo['id'],
                    'content' => '买家退款成功,订单关闭.退款订单支付记录编号【'.$order_bn.'】.退款金额:'.$refund_money.'元',
                    'create_time' => time()
                );
                $log = $logModel->insert($logDate);
                if(! $log){
                    throw new LogicException ( T ( 'WeChat refund failed' ), 182 );
                }
                //插入支付记录
                $payLogModel = new Model_OrderPayLog();
                $data = array(
                    'order_id' => $orderInfo['id'],
                    'pay_id' => $financeId,
                    'amount' => $refund_money,
                    'reason' => '订单退款,原因:'.$reason,
                    'create_time' => time(),
                );
                $payLogId = $payLogModel->insert($data);
                if(! $payLogId){
                    throw new LogicException ( T ( 'WeChat refund failed' ), 182 );
                }
                //
            }else{
                //微信退款失败
                throw new LogicException ( T ( 'WeChat refund failed' ), 182 );
            }

        }else{
            throw new LogicException ( T ( 'Order not exists' ), 143 );
        }
    }

    //发起退款申请
    public function requestWxRefund($order,$returnMoney){
        DI()->pay->set('WeChat');
        //实际付款金额
        $orderMoney = $order['price'] * 100;
        //退款申请金额
        $refundMoney = $returnMoney * 100;
        //支付明细编号
        $orderBn = $order['item_bn'];
        $refundOrderBn = $orderBn;
        //$orderBn 订单号; $refundOrderBn 退款单号; $orderMoney 订单金额; $refundMoney 退款金额
        $wxOrderInfo = DI()->pay->applyRefund($orderBn,$refundOrderBn,$orderMoney,$refundMoney);
        if($wxOrderInfo['result_code'] == 'SUCCESS'){
            return true;
        }else {
            return false;
        }

    }

}
