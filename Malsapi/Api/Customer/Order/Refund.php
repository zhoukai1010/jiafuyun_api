<?php
/**
 * 默认接口服务类
 *
 * @author: Dm
 */
class Api_Customer_Order_Refund extends PhalApi_Api {

    public function getRules() {
        return array (
            'Go' => array(
                'orderId' => array('name' => 'order_id', 'type' => 'int', 'min' => 1, 'require' => true, 'desc' => '订单ID'),
                'financeId' => array('name' => 'finance_id', 'type' => 'int', 'min' => 1, 'require' => true, 'desc' => '订单明细ID'),
//                'returnPrice' => array('name' => 'return_price', 'type' => 'float', 'min' => 0.01, 'require' => true, 'desc' => '退款金额'),
                'reason' => array('name' => 'reason', 'type' => 'string',  'require' => false,  'desc' => '退款原因'),
            ),
        );
    }


    /**
     * 客户申请订单退款
     * #desc 用于客户申请订单退款
     * #return int code 操作码，0表示成功
     * #return int order_id  订单ID
     */
    public function Go() {
        $rs = array('code' => 0, 'msg' => '', 'info' => array());

        //判断订单是否存在
        $orderDomain = new Domain_CustomerOrder();
        $orderInfo = $orderDomain->getBaseInfo($this->orderId);
        if (empty($orderInfo)) {
            DI()->logger->debug('Order not found', $this->orderId);

            $rs['code'] = 143;
            $rs['msg'] = T('Order not exists');
            return $rs;
        }
        //判断订单是否已付款
        if($orderInfo['is_pay'] == 'noPay'){
            $rs['code'] = 178;
            $rs['msg'] = T('Order is not pay');
            return $rs;
        }
        //订单是否已退款
        if($orderInfo['is_pay'] == 'refund'){
            $rs['code'] = 179;
            $rs['msg'] = T('Order is refund');
            return $rs;
        }
        //判断订单服务状态
        if($orderInfo['service_status'] != 'wait'&& $orderInfo['service_status'] != 'confirm'){
            $rs['code'] = 157;
            $rs['msg'] = T('Order status is error');
            return $rs;
        }

        try {
            DI ()->notorm->beginTransaction ( 'db_api' );
            $data = array(
                'orderInfo' => $orderInfo,
                'finance_id' => $this->financeId,
//                'returnPrice' => $this->returnPrice,
                'reason' => $this->reason,
            );
            $payDomain = new Domain_Pay();
            $payDomain->CustomerRefund($data);
            DI ()->notorm->commit( 'db_api' );

        } catch ( Exception $e ) {

            DI ()->notorm->rollback ( 'db_api' );
            $rs ['code'] = $e->getCode ();
            $rs ['msg'] = $e->getMessage ();
        }

        $rs['info']['order_id'] = $this->orderId;

        return $rs;
    }

}
