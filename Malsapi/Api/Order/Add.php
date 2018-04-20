<?php
///**
// * 默认接口服务类
// *
// * @author: Dm
// */
//class Api_Order_Add extends PhalApi_Api {
//
//	public function getRules() {
//		return array (
//				 'Go' => array(
//                     'customerId' => array('name' => 'bbc_customer_id', 'type' => 'int', 'min' => 1, 'require' => true, 'desc' => '会员ID'),
//                     'cartId' => array('name' => 'cart_id', 'type' => 'int', 'min' => 1, 'require' => true, 'desc' => '购物车ID'),
//                     'addressId' => array('name' => 'address_id', 'type' => 'int', 'min' => 0, 'require' => false, 'desc' => '收货地址ID'),
//                     'couponDetailsId' => array('name' => 'coupon_details_id', 'type' => 'int', 'require' => false, 'desc' => '客户优惠券详情ID'),
//                     'consignee' => array('name' => 'consignee', 'type' => 'string', 'require' => false, 'desc' => '收货人'),
//                     'mobile' => array('name' => 'ship_mobile', 'type' => 'string', 'require' => false, 'desc' => '手机号码'),
//                     'number' => array('name' => 'number', 'type' => 'string', 'require' => false, 'desc' => '门牌号'),
//                     'mark' => array('name' => 'mark', 'type' => 'string', 'require' => false, 'desc' => '买家备注'),
//            ),
//		);
// 	}
//
//
//  /**
//     * 提交订单
//     * #desc 用于提交订单
//     * #return int code 操作码，0表示成功
//     * #return string address_details 收货地址详情
//     */
//    public function Go() {
//        $rs = array('code' => 0, 'msg' => '', 'info' => array());
//
//        //查找用户
//        $domain = new Domain_Customer();
//        $user = $domain->getCustomerInfo($this->customerId);
//        if(!$user){
//            $rs['code'] = 160;
//            $rs['msg'] = T('Customer not exists');
//            return $rs;
//        }
//        //判断购物车是否存在
//        $serviceCartDomain = new Domain_ServiceCart();
//        $cart = $serviceCartDomain->getCartInfo($this->customerId,$this->cartId);
//        if( ! $cart){
//            $rs['code'] = 120;
//            $rs['msg'] = T('Cart not exists');
//            return $rs;
//        }
//        $data = array(
//            'customer_id' => $this->customerId,
//            'address_id' => $this->addressId,
//            'coupon_details_id' => $this->couponDetailsId,
//            'consignee' => $this->consignee,
//            'mobile' => $this->mobile,
//            'number' => $this->number,
//            'mark' => $this->mark,
//        );
//        try {
//            $orderDomain = new Domain_Order();
//            $result = $orderDomain->addOrder($data,$cart);
//
//        }catch ( Exception $e ) {
//            $rs ['code'] = $e->getCode ();
//            $rs ['msg'] = $e->getMessage ();
//            return $rs;
//        }
//
//        $rs['info'] = $result;
//
//        return $rs;
//    }
//
//}
