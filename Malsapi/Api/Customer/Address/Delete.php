<?php
/**
 * 默认接口服务类
 *
 * @author: Dm
 */
class Api_Customer_Address_Delete extends PhalApi_Api
{

    public function getRules()
    {
        return array(
            'Go' => array(
                'customerId' => array('name' => 'customer_id', 'type' => 'int', 'min' => 1, 'require' => true, 'desc' => '会员ID'),
                'addressId' => array('name' => 'address_id', 'type' => 'int', 'min' => 1, 'require' => true, 'desc' => '收货地址ID'),
            ),
        );
    }


    /**
     * 删除收货地址
     * #desc 用于删除用户的收货地址
     * #return int code 操作码，0表示成功
     * #return int address_id 收货地址ID
     */
    public function Go()
    {
        $rs = array('code' => 0, 'msg' => '', 'info' => array());

        $filter = array(
            'customer_id' => $this->customerId,
            'address_id' => $this->addressId
        );
        $customerDomain = new Domain_CustomerAddress();
        $result = $customerDomain->delAddress($filter);
        $rs['info']['status'] = $result;
        return $rs;
    }

}
