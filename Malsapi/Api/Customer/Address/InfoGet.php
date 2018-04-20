<?php
/**
 * 默认接口服务类
 *
 * @author: Dm
 */
class Api_Customer_Address_InfoGet extends PhalApi_Api {
	
	public function getRules() {
		return array (
				 'Go' => array(
                     'customerId' => array('name' => 'customer_id', 'type' => 'int', 'min' => 1, 'require' => true, 'desc' => '会员ID'),
                     'addressId' => array('name' => 'address_id', 'type' => 'int', 'min' => 1, 'require' => true, 'desc' => '收货地址ID'),
            ),
		);
 	}
	
  
  /**
     * 获取服务地址
     * #desc 用于获取用户的服务地址
     * #return int code 操作码，0表示成功
     * #return int id 收货地址ID
     * #return string consignee 收货人
     * #return string mobile 手机号码
     * #return int zipcode 邮政编码
     * #return int country 国家编码
     * #return int province 省份编码
     * #return int city 城市编码
     * #return int district 区县编码
     * #return string address 详细地址
     * #return string is_default 是否默认
     * #return string address_details 完整的收货地址
     */
    public function Go() {
        $rs = array('code' => 0, 'msg' => '', 'info' => array());

        $customerDomain = new Domain_CustomerAddress();
        $info = $customerDomain->getBaseInfo($this->addressId);
        if( ! $info){
            $rs['code'] = 118;
            $rs['msg'] = T('Address not exists');
            return $rs;
        }

        $rs['info'] = $info;
        return $rs;
    }
	
}
