<?php
/**
 * 默认接口服务类
 *
 * @author: Dm
 */
class Api_Customer_Coupon_Add extends PhalApi_Api {
	
	public function getRules() {
		return array (
				 'Go' => array(
                     'customerId' => array('name' => 'bbc_customer_id', 'type' => 'int', 'min' => 1, 'require' => true, 'desc' => '会员ID'),
                     'couponCode' => array('name' => 'coupon_code', 'type' => 'string', 'min' => 1, 'require' => true, 'desc' => '兑换码'),
            ),
		);
 	}
	
  
  /**
     * 兑换优惠券
     * #desc 用于客户兑换优惠券
     * #return int code 操作码，0表示成功
     * #return int status 状态 0 成功 1 失败
     */
    public function Go() {
        $rs = array('code' => 0, 'msg' => '', 'info' => array());
        //判断客户是否存在
        $customerDomain = new Domain_Customer();
        $user = $customerDomain->getCustomerInfo($this->customerId);
        if(!$user){
            $rs['code'] = 160;
            $rs['msg'] = T('Customer not exists');
            return $rs;
        }

        try {
            DI ()->notorm->beginTransaction ( 'db_api' );
            $couponDomain = new Domain_Coupon();
            $couponDomain->addCoupon($user,$this->couponCode);

            DI ()->notorm->commit( 'db_api' );
        } catch ( Exception $e ) {

            DI ()->notorm->rollback ( 'db_api' );
            $rs ['code'] = $e->getCode ();
            $rs ['msg'] = $e->getMessage ();
            return $rs;
        }
        $rs['info']['customer_id'] = $this->customerId;

        return $rs;
    }
	
}
