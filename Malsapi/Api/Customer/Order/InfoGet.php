<?php
/**
 * 默认接口服务类
 *
 * @author: Dm
 */
class Api_Customer_Order_InfoGet extends PhalApi_Api {
	
	public function getRules() {
		return array (
				 'Go' => array(
                     'orderId' => array('name' => 'order_id', 'type' => 'int', 'min' => 1, 'require' => true, 'desc' => '订单ID'),
            ),
		);
 	}

  /**
     * 客户获取订单详情
     * #desc 用于客户获取订单详情
     * #return int code 操作码，0表示成功
     */
    public function Go() {
        $rs = array('code' => 0, 'msg' => '', 'info' => array());

        //判断订单是否存在
        $orderDomain = new Domain_CustomerOrder();
        $orderInfo = $orderDomain->getBaseInfo($this->orderId);
        if(empty($orderInfo)){
            DI()->logger->debug('Order not found', $this->orderId);

            $rs['code'] = 143;
            $rs['msg'] = T('Order not exists');
            return $rs;
        }

        $rs['info'] = $orderInfo;

        return $rs;
    }

}
