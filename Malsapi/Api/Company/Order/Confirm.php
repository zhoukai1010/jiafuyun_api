<?php
/**
 * 默认接口服务类
 *
 * @author: Dm
 */
class Api_Company_Order_Confirm extends PhalApi_Api {

    public function getRules() {
        return array (
            'Go' => array(
                'userId' => array('name' => 'user_id', 'type' => 'int', 'min' => 1, 'require' => true, 'desc' => '接单服务商ID'),
                'orderId' => array('name' => 'order_id', 'type' => 'int', 'min' => 1, 'require' => true, 'desc' => '订单ID'),
            ),
        );
    }


    /**
     * 服务商订单确认
     * #desc 用于服务商订单确认
     * #return int code 操作码，0表示成功
     * #return int status  状态码
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
        if($orderInfo['service_status'] != 'wait'){
            $rs['code'] = 157;
            $rs['msg'] = T('Order status is error');
            return $rs;
        }
        try {
            DI ()->notorm->beginTransaction ( 'db_api' );
            $status = $orderDomain->confirmOrder($orderInfo);
            if($status){
                $rs['info']['status'] = 0;
            }else{
                $rs['info']['status'] = 1;
            }
            DI ()->notorm->commit( 'db_api' );

        } catch ( Exception $e ) {

            DI ()->notorm->rollback ( 'db_api' );
            $rs ['code'] = $e->getCode ();
            $rs ['msg'] = $e->getMessage ();
        }

        return $rs;
    }

}
