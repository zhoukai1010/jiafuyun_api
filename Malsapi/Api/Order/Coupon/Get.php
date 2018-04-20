<?php
/**
 * 默认接口服务类
 *
 * @author: Dm
 */
class Api_Order_Coupon_Get extends PhalApi_Api {
	
	public function getRules() {
		return array (
				 'Go' => array(
                     'customerId' => array('name' => 'bbc_customer_id', 'type' => 'int', 'min' => 1, 'require' => true, 'desc' => '客户ID'),
                     'orderId' => array('name' => 'order_id', 'type' => 'int', 'min' => 1, 'require' => true, 'desc' => '订单ID'),
            ),
		);
 	}

  /**
     * 获取订单是否使用优惠券
     * #desc 用于获取订单是否使用优惠券
     * #return int code 操作码，0表示成功
     */
    public function Go() {
        $rs = array('code' => 0, 'msg' => '', 'info' => array());

        $orderDomain = new Domain_Order();
        $info = $orderDomain->getCouponInfo($this->customerId,$this->orderId);
        $rs['info'] = $info;

        return $rs;
    }

}
