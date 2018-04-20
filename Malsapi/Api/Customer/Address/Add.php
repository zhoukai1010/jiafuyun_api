<?php
/**
 * 默认接口服务类
 *
 * @author: Dm
 */
class Api_Customer_Address_Add extends PhalApi_Api
{

    public function getRules()
    {
        return array(
            'Go' => array(
                'customerId' => array('name' => 'customer_id', 'type' => 'int', 'min' => 1, 'require' => true, 'desc' => '会员ID'),
                'consignee' => array('name' => 'consignee', 'type' => 'string', 'min' => 1, 'require' => true, 'desc' => '收货人'),
                'mobile' => array('name' => 'mobile', 'type' => 'string', 'min' => 11, 'max' => 11, 'require' => true, 'desc' => '手机号码'),
                'zipCode' => array('name' => 'zipcode', 'type' => 'int', 'require' => false, 'desc' => '邮政编码'),
                'province' => array('name' => 'province', 'type' => 'int', 'min' => 1, 'require' => true, 'desc' => '省份'),
                'city' => array('name' => 'city', 'type' => 'int', 'min' => 1, 'require' => true, 'desc' => '城市'),
                'district' => array('name' => 'district', 'type' => 'int', 'min' => 1, 'require' => true, 'desc' => '区县'),
                'address' => array('name' => 'address', 'type' => 'string', 'min' => 1, 'require' => true, 'desc' => '详细地址'),
                'isDefault' => array('name' => 'is_default', 'type' => 'enum', 'range' => array('y', 'n'), 'default' => 'n', 'require' => true, 'desc' => '是否默认'),
            ),
        );
    }


    /**
     * 添加服务地址
     * #desc 用于添加用户的服务地址
     * #return int code 操作码，0表示成功
     * #return int address_id 服务地址ID
     */
    public function Go()
    {
        $rs = array('code' => 0, 'msg' => '', 'info' => array());

        $data = array(
            'customer_id' => $this->customerId,
            'consignee' => $this->consignee,
            'mobile' => $this->mobile,
            'zipcode' => isset($this->zipCode) ? $this->zipCode : '',
            'country' => 1,
            'province' => $this->province,
            'city' => $this->city,
            'district' => $this->district,
            'address' => $this->address,
            'is_default' => $this->isDefault,
            'create_time' => time(),
            'last_modify' => time(),
        );
        $customerDomain = new Domain_CustomerAddress();
        $result = $customerDomain->addAddress($data);
        $rs['info']['address_id'] = $result;
        return $rs;
    }

}
