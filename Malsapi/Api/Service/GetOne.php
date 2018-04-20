<?php
/**
 * 获取一条服务分类
 *
 * @author: Zh
 */
class Api_Service_GetOne extends PhalApi_Api{
    public function getRules()
    {
        return array(
            'Go' => array(
                'customerId' => array(
                    'name' => 'customer_id',
                    'type' => 'int',
                    'min' => 1,
                    'require' => true,
                    'desc' => '会员ID'
                ),
                'code' => array(
                    'name' => 'code',
                    'type' => 'string',
                    'require' => true,
                    'desc' => '服务分类标识码'
                ),
                'name' => array(
                    'name' => 'name',
                    'type' => 'string',
                    'desc' => '服务名称'
                ),
                'status' => array(
                    'name' => 'status',
                    'type' => 'int',
                    'desc' => '服务状态'
                ),
                'addressId' => array(
                    'name' => 'address_id',
                    'type' => 'int',
                    'desc' => '地址id'
                ),
            ),
        );
    }
    /**
     *  获取其中一条服务的信息(包括父类)
     *  #desc 获取一条服务的详细信息
     * #return int code 操作码，0表示成功
     * #return int id 服务id
     * #return int pid 服务父级id 0表示第一级分类
     * #return string name 服务名称
     * #return double price 服务价格
     * #return string content 服务描述或内容
     * #return int status 服务状态 1开启 2关闭
     * #return string img_src 服务状态 1开启 2关闭
     */
    public function Go(){
        $rs = array(
            'code' => 0,
            'msg'  => '',
            'info' => array()
        );
        $filter = array();
        if(!empty($this->code)){
            $filter['code'] = $this->code;
        }
        if (!empty($this->status)){
            $filter['status'] = $this->status;
        }
        if (!empty($this->name)){
            $filter['name LIKE ?'] = "%$this->name%";
        }
        
        $serviceCategoryDomain = new Domain_ServiceCategory();
        $data = $serviceCategoryDomain->getOne($filter, 'id, pid, name, price, content, status, img_src, config, service_hours, service_start_time, service_end_time, code, is_need_time, lower_single_type,payment_method,default_img');
        //获取用户默认的 地址信息
        $customerAddressDomain = new Domain_CustomerAddress();
        if(isset($this->addressId) && $this->addressId !== 0){
            $userAddress = $customerAddressDomain->getBaseInfo(
                $this->addressId,
                'id, customer_id, consignee, mobile, zipcode, country, province, city, district, address, is_default, create_time, last_modify'
            );
            if(empty($userAddress)){
                $rs['code'] = 150;
                $rs['msg'] = T('You can not find the address information you choose');
            }
        }else{
            $userAddress = $customerAddressDomain->getAddressOne(
                array('is_default' => 'y', 'customer_id' => $this->customerId),
                'id, customer_id, consignee, mobile, zipcode, country, province, city, district, address, is_default, create_time, last_modify'
            );
        }
        $rs['address_detail'] = $userAddress;
        $rs['list'] = $data;
        return $rs;
    }
}
