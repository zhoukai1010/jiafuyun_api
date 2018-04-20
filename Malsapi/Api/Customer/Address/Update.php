<?php
/**
 * 默认接口服务类
 *
 * @author: Dm
 */
class Api_Customer_Address_Update extends PhalApi_Api {
	
	public function getRules() {
		return array (
				 'Go' => array(
                     'customerId' => array('name' => 'customer_id', 'type' => 'int', 'min' => 1, 'require' => true, 'desc' => '会员ID'),
                     'addressId' => array('name' => 'address_id', 'type' => 'int', 'min' => 1, 'require' => true, 'desc' => '收货地址ID'),
                     'consignee' => array('name' => 'consignee', 'type' => 'string', 'min' => 1, 'require' => true, 'desc' => '收货人'),
                     'mobile' => array('name' => 'mobile', 'type' => 'string', 'min' => 11, 'max'=> 11,'require' => true, 'desc' => '手机号码'),
                     'zipCode' => array('name' => 'zipcode', 'type' => 'int',  'require' => false, 'desc' => '邮政编码'),
                     'province' => array('name' => 'province', 'type' => 'int', 'min' => 1, 'require' => true, 'desc' => '省份'),
                     'city' => array('name' => 'city', 'type' => 'int', 'min' => 1, 'require' => true, 'desc' => '城市'),
                     'district' => array('name' => 'district', 'type' => 'int', 'min' => 1, 'require' => true, 'desc' => '区县'),
                     'address' => array('name' => 'address', 'type' => 'string', 'min' => 1, 'require' => true, 'desc' => '详细地址'),
                     'isDefault' => array('name' => 'is_default', 'type' => 'enum','range'=>array('y','n'), 'default' => 'n', 'require' => true, 'desc' => '是否默认'),
            ),
		);
 	}
	
  
  /**
     * 更新收货地址
     * #desc 用于更新用户的收货地址
     * #return int code 操作码，0表示成功
     * #return boolean status 状态
     */
    public function Go() {
        $rs = array('code' => 0, 'msg' => '', 'info' => array());

        $data = array(
            'customer_id' => $this->customerId,
            'consignee' => $this->consignee,
            'mobile' => $this->mobile,
            'zipcode' => isset($this->zipCode) ? $this->zipCode : '',
            'province' => $this->province,
            'city' => $this->city,
            'district' => $this->district,
            'address' => $this->address,
            'is_default' => $this->isDefault,
        );
        $customerDomain = new Domain_CustomerAddress();
        $result = $customerDomain->updateAddress($this->addressId,$data);
        $rs['info']['status'] = $result;
        return $rs;
    }
	
}
