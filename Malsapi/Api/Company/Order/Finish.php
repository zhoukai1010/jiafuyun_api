<?php
/**
 * 默认接口服务类
 *
 * @author: Dm
 */
class Api_Company_Order_Finish extends PhalApi_Api {

    public function getRules() {
        return array (
            'Go' => array(
                'userId' => array('name' => 'user_id', 'type' => 'int', 'min' => 1, 'require' => true, 'desc' => '接单服务商ID'),
                'orderId' => array('name' => 'order_id', 'type' => 'int', 'min' => 1, 'require' => true, 'desc' => '订单ID'),
            ),
        );
    }


    /**
     *  订单完成
     * #desc 用于服务商订单完成
     * #return int code 操作码，0表示成功
     * #return int demand_id  需求ID
     */
    public function Go() {
        $rs = array('code' => 0, 'msg' => '', 'info' => array());

        //判断服务商是否存在
        $domain = new Domain_Company_User();
        $userInfo = $domain->getBaseInfo($this->userId);
        if(empty($userInfo)){
            DI()->logger->debug('User not found', $this->userId);

            $rs['code'] = 106;
            $rs['msg'] = T('User not exists');
            return $rs;
        }
        //判断订单是否存在
        $orderDomain = new Domain_Company_Order();
        $orderInfo = $orderDomain->getBaseInfo($this->orderId);
        if (empty($orderInfo)) {
            DI()->logger->debug('Order not found', $this->orderId);

            $rs['code'] = 143;
            $rs['msg'] = T('Order not exists');
            return $rs;
        }
        //判断订单服务状态
        if($orderInfo['service_status'] != 'work'){
            $rs['code'] = 163;
            $rs['msg'] = T('Finish Order failed');
            return $rs;
        }
        $data = array(
            'user_id' => $this->userId,
            'userInfo' => $userInfo,
            'order_info' => $orderInfo,
        );

        try {
            DI ()->notorm->beginTransaction ( 'db_api' );
            $orderId = $orderDomain->finishOrder($data);
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
