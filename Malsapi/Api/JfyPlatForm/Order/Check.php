<?php
/**
 * 默认接口服务类
 *
 * @author: Dm
 */
class Api_JfyPlatForm_Order_Check extends PhalApi_Api {
	
	public function getRules() {
		return array (
				 'Go' => array(
                     'orderId' => array('name' => 'order_id', 'type' => 'int', 'min' => 1, 'require' => true, 'desc' => '订单ID'),
                     'status' => array('name' => 'status','type' => 'enum','range'=>array('pass'), 'require' => true, 'desc' => '操作状态：pass 审核通过'),
            ),
		);
 	}

  /**
     * 平台审核订单通过
     * #desc 用于平台审核订单通过
     * #return int code 操作码，0表示成功
     * #return int order_id 订单ID
     */
    public function Go() {
        $rs = array('code' => 0, 'msg' => '', 'info' => array());

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
        if($orderInfo['is_check'] == 'y'){
            $rs['code'] = 151;
            $rs['msg'] = T('The order has been pass');
            return $rs;
        }

        try {
            DI ()->notorm->beginTransaction ( 'db_api' );
            $data = array(
                'order_id' => $this->orderId,
                'is_check' => 'y',
                'last_modify' => time(),
            );
            $domainJfyPlatForm->orderCheck($data);
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
