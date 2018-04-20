<?php
/**
 * 默认接口服务类
 *
 * @author: Dm
 */
class Api_Company_Order_Work extends PhalApi_Api {

    public function getRules() {
        return array (
            'Go' => array(
                'userId' => array('name' => 'user_id', 'type' => 'int', 'min' => 1, 'require' => true, 'desc' => '接单服务商ID'),
                'orderId' => array('name' => 'order_id', 'type' => 'int', 'min' => 1, 'require' => true, 'desc' => '订单ID'),
                'staffId' => array('name' => 'staff_id', 'type' => 'int', 'min' => 1, 'require' => true, 'desc' => '家政员ID'),
            ),
        );
    }


    /**
     * 家政员直接上单
     * #desc 用于家政员直接上单
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
        if($orderInfo['service_status'] != 'confirm' && $orderInfo['service_status'] != 'change'){
            $rs['code'] = 165;
            $rs['msg'] = T('Work Order failed');
            return $rs;
        }
        //判断家政人员是否存在
        $houseStaffDomain = new Domain_Company_Staff();
        $staffInfo = $houseStaffDomain->getBaseInfo($this->staffId);
        if( !$staffInfo) {
            $rs['code'] = 126;
            $rs['msg'] = T('Staff not exists');
            return $rs;
        }
        //判断家政员所属服务商
        if($staffInfo['user_id'] != $userInfo['id']){
            $rs['code'] = 126;
            $rs['msg'] = T('Staff not exists');
            return $rs;
        }

        $data = array(
            'user_info' => $userInfo,
            'order_info' => $orderInfo,
            'staff_info' => $staffInfo,
        );

        try {
            DI ()->notorm->beginTransaction ( 'db_api' );
            $return = $orderDomain->workOrder($data);
            DI ()->notorm->commit( 'db_api' );

        } catch ( Exception $e ) {

            DI ()->notorm->rollback ( 'db_api' );
            $rs ['code'] = $e->getCode ();
            $rs ['msg'] = $e->getMessage ();

        }
        $rs['info']['status'] = $return;


        return $rs;
    }

}
