<?php
/**
 * 默认接口服务类
 *
 * @author: Dm
 */
class Api_JfyPlatForm_Order_AssignUser extends PhalApi_Api {
	
	public function getRules() {
		return array (
				 'Go' => array(
                     'userId' => array('name' => 'user_id', 'type' => 'int', 'min' => 1, 'require' => true, 'desc' => '用户ID'),
                     'orderId' => array('name' => 'order_id', 'type' => 'int', 'min' => 1, 'require' => true, 'desc' => '订单ID'),
            ),
		);
 	}

  /**
     * 平台分配服务商
     * #desc 用于平台分配服务商
     * #return int code 操作码，0表示成功
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
        $domainJfyPlatForm = new Domain_JfyPlatForm();
        $orderInfo = $domainJfyPlatForm->getBaseInfo($this->orderId);
        if(empty($orderInfo)){
            DI()->logger->debug('Order not found', $this->orderId);

            $rs['code'] = 143;
            $rs['msg'] = T('Order not exists');
            return $rs;
        }
        //判断订单是否已审核
        if($orderInfo['is_check'] == 'n'){
            $rs['code'] = 156;
            $rs['msg'] = T('The order review failed');
            return $rs;
        }
        //判断订单是否已分配服务商
        if($orderInfo['accept_user_id'] != 0){
            $rs['code'] = 149;
            $rs['msg'] = T('The order has been user');
            return $rs;
        }

        try {
            DI ()->notorm->beginTransaction ( 'db_api' );
            $data = array(
                'order_bn' => $orderInfo['order_bn'],
                'user_id' => $this->userId,
                'order_id' => $this->orderId,
            );
            $result = $domainJfyPlatForm->addUserOrder($data);
            DI ()->notorm->commit( 'db_api' );
        } catch ( Exception $e ) {

            DI ()->notorm->rollback ( 'db_api' );
            $rs ['code'] = $e->getCode ();
            $rs ['msg'] = $e->getMessage ();
        }


        $rs['info'] = $result;

        return $rs;
    }

}
