<?php
/**
 * 默认接口服务类
 *
 * @author: Dm
 */
class Api_Company_Order_ChangeStaff extends PhalApi_Api {

    public function getRules() {
        return array(
            'Go' => array(
                'userId' => array('name' => 'user_id', 'type' => 'int', 'min' => 1, 'require' => true, 'desc' => '接单服务商ID'),
                'orderId' => array('name' => 'order_id', 'type' => 'int', 'min' => 1, 'require' => true, 'desc' => '订单ID'),
                'returnCustomerFee' => array('name' => 'return_customer_fee', 'type' => 'float',  'require' => true, 'desc' => '退款给客户金额'),
                'returnStaffFee' => array('name' => 'return_staff_fee', 'type' => 'float',  'require' => true, 'desc' => '退款给家政员金额'),
                'receiveAmount' => array('name' => 'receive_amount', 'type' => 'float',  'require' => true, 'desc' => '应收金额'),
                'mark' => array('name' => 'mark', 'type' => 'string', 'require' => false, 'desc' => '备注'),
            ),
        );
    }


    /**
     * 订单更换家政员
     * #desc 用于订单更换家政员
     * #return int code 操作码，0表示成功
     * #return int demand_id  需求ID
     */
    public function Go()
    {
        $rs = array('code' => 0, 'msg' => '', 'info' => array());

        //判断订单是否存在
        $orderDomain = new Domain_Company_Order();
        $orderInfo = $orderDomain->getBaseInfo($this->orderId);
        if (empty($orderInfo)) {
            DI()->logger->debug('Order not found', $this->orderId);

            $rs['code'] = 143;
            $rs['msg'] = T('Order not exists');
            return $rs;
        }
        //判断订单是否通过平台审核
        if($orderInfo['is_check'] == 'n'){
            $rs['code'] = 156;
            $rs['msg'] = T('The order review failed');
            return $rs;
        }
        //判断接单公司是否为平台指派
        if($orderInfo['accept_user_id'] != $this->userId){
            $rs['code'] = 100;
            $rs['msg'] = T('Get failed');
            return $rs;
        }
        //判断订单服务状态
        if ($orderInfo['service_status'] != 'work') {
            $rs['code'] = 157;
            $rs['msg'] = T('Order status is error');
            return $rs;
        }
       $data = array(
           'order_info' => $orderInfo,
           'return_customer_fee' => $this->returnCustomerFee,
           'return_staff_fee' => $this->returnStaffFee,
           'receive_fee' => $this->receiveAmount,
       );
        if(isset($this->mark)){
            $data['mark'] = $this->mark;
        }
        try {
            DI()->notorm->beginTransaction('db_api');
            $changeRs = $orderDomain->changeStaff($data);
            DI()->notorm->commit('db_api');

        } catch (Exception $e) {

            DI()->notorm->rollback('db_api');
            $rs ['code'] = $e->getCode();
            $rs ['msg'] = $e->getMessage();
            return $rs;
        }
        if ($changeRs) {
            $rs['info']['status'] = 0;
        } else {
            $rs['info']['status'] = 1;
        }
        return $rs;
    }

}
