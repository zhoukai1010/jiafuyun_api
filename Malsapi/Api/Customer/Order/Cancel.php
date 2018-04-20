<?php
/**
 * 默认接口服务类
 *
 * @author: Dm
 */
class Api_Customer_Order_Cancel extends PhalApi_Api {

    public function getRules() {
        return array (
            'Go' => array(
//                'userId' => array('name' => 'user_id', 'type' => 'int', 'min' => 1, 'require' => true, 'desc' => '接单服务商ID'),
                'orderId' => array('name' => 'order_id', 'type' => 'int', 'min' => 1, 'require' => true, 'desc' => '订单记录ID'),
            ),
        );
    }


    /**
     * 客户未付款订单取消
     * #desc 用于客户未付款订单取消
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
        if($orderInfo['is_pay'] == 'succPay'){
            DI()->logger->debug('Order is already pay', $this->orderId);

            $rs['code'] = 144;
            $rs['msg'] = T('Order is already pay');
            return $rs;
        }

        try {
            DI ()->notorm->beginTransaction ( 'db_api' );
            $orderId = $orderDomain->customerCancelOrder($orderInfo);
            DI ()->notorm->commit( 'db_api' );

        } catch ( Exception $e ) {

            DI ()->notorm->rollback ( 'db_api' );
            $rs ['code'] = $e->getCode ();
            $rs ['msg'] = $e->getMessage ();
        }

        $rs['info']['order_id'] = $orderId;

        return $rs;
    }

}
