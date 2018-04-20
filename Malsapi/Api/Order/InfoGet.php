<?php
///**
// * 默认接口服务类
// *
// * @author: Dm
// */
//class Api_Order_InfoGet extends PhalApi_Api {
//
//	public function getRules() {
//		return array (
//				 'Go' => array(
//                     'customerId' => array('name' => 'bbc_customer_id', 'type' => 'int', 'min' => 1, 'require' => true, 'desc' => '客户ID'),
//                     'orderId' => array('name' => 'order_id', 'type' => 'int', 'min' => 1, 'require' => true, 'desc' => '订单ID'),
//            ),
//		);
// 	}
//
//  /**
//     * 获取客户订单详情
//     * #desc 用于获取客户订单详情
//     * #return int code 操作码，0表示成功
//     */
//    public function Go() {
//        $rs = array('code' => 0, 'msg' => '', 'info' => array());
//        //判断客户是否存在
//        $domain = new Domain_Customer();
//        $info = $domain->getCustomerInfo($this->customerId);
//        if ( !$info) {
//            $rs['code'] = 160;
//            $rs['msg'] = T('Customer not exists');
//            return $rs;
//        }
//
//        $orderDomain = new Domain_Order();
//        $info = $orderDomain->getOrderInfo($this->orderId);
//        $rs['info'] = $info;
//
//        return $rs;
//    }
//
//}
