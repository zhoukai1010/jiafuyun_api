<?php
/**
 * 默认接口服务类
 *
 * @author: Dm
 */
class Api_Customer_Address_Default extends PhalApi_Api {
	
	public function getRules() {
		return array (
				 'Go' => array(
                     'customerId' => array('name' => 'customer_id', 'type' => 'int', 'min' => 1, 'require' => true, 'desc' => '会员ID'),
                     'addressId' => array('name' => 'address_id', 'type' => 'int', 'min' => 1, 'require' => true, 'desc' => '收货地址ID'),
            ),
		);
 	}
	
  
  /**
     * 设置默认收货地址
     * #desc 用于设置默认收货地址
     * #return int code 操作码，0表示成功
     * #return int address_id 收货地址ID
     */
    public function Go()
    {
        $rs = array('code' => 0, 'msg' => '', 'info' => array());
        $customerId = $this->customerId;
        $addressId = $this->addressId;
        $customerDomain = new Domain_CustomerAddress();
        $result = $customerDomain->setDefaultAddress($customerId, $addressId);
        $rs['info']['status'] = $result;
        return $rs;
    }
	
}
