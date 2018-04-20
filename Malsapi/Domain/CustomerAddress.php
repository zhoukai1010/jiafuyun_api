<?php
class Domain_CustomerAddress {
	var $model;

	public function __construct() {
		$this->model = new Model_CustomerAddress ();
	}

	//获取数量
	public function getCount($filter) {
		return $this->model->getCount ( $filter );
	}

	

	//获取收货地址
	public function getBaseInfo($addressId, $cols = '*') {
		$rs = array ();

		$addressId = intval ( $addressId );
		if ($addressId <= 0) {
			return $rs;
		}

		$rs = $this->model->get ( $addressId ,'id,consignee,mobile,zipcode,country,province,city,district,address,is_default');

		if (! $rs) {
			return false;
		}else{
			$domainArea = new Domain_Area();
			$country = $domainArea->getAreaNameById($rs['country']);
			$province = $domainArea->getAreaNameById($rs['province']);
			$city = $domainArea->getAreaNameById($rs['city']);
			$district = $domainArea->getAreaNameById($rs['district']);
			$rs['address_details'] = $country.$province.$city.$district.$rs['address'];
			$rs['country_name'] = $country;
			$rs['province_name'] = $province;
			$rs['city_name'] = $city;
			$rs['district_name'] = $district;
		}
		return $rs;
	}

	//获取收货地址列表
	public function getAddressList($filter){
		$domainArea = new Domain_Area();
		$rs = $this->model->getAll('id,consignee,mobile,zipcode,country,province,city,district,address,is_default',$filter);
		if(is_array($rs)) {
			foreach ($rs as $key => $value) {
				$country = $domainArea->getAreaNameById($value['country']);
				$province = $domainArea->getAreaNameById($value['province']);
				$city = $domainArea->getAreaNameById($value['city']);
				$district = $domainArea->getAreaNameById($value['district']);
				$rs[$key]['address_details'] = $country . $province . $city . $district . $value['address'];
			}
		}
		return $rs;
	}
    //获取一条服务地址或者默认的地址
    public function getAddressOne($filter, $fields = '*', $orderby = ''){
        $domainArea = new Domain_Area();
        $rs = $this->model->getOne($filter, $fields, $orderby);
        if(!empty($rs)){
            $country = $domainArea->getAreaNameById($rs['country']);
            $province = $domainArea->getAreaNameById($rs['province']);
            $city = $domainArea->getAreaNameById($rs['city']);
            $district = $domainArea->getAreaNameById($rs['district']);
            $rs['address_details'] = $country . $province . $city . $district . $rs['address'];
        }
        return $rs;
    }
	//添加收货地址
	public function addAddress($data){
		if($data['is_default'] == 'y'){
			$filter = array(
				'customer_id' => $data['customer_id'],
				'is_default' =>'y'
			);
			$update_data = array(
				'is_default' => 'n',
				'last_modify' => time(),
			);

			$this->model->updateByWhere($filter,$update_data);
		}
		$addressId = $this->model->insert($data);
		return $addressId;
	}

	//更新收货地址
	public function updateAddress($addressId,$data){
		if($data['is_default'] == 'y'){
			$filter_default = array(
				'customer_id' => $data['customer_id'],
				'is_default' =>'y'
			);
			$update_data = array(
				'is_default' => 'n',
				'last_modify' => time(),
			);

			$this->model->updateByWhere($filter_default,$update_data);
		}
		$rs = $this->model->update($addressId,$data);
		return $rs;
	}

	//设置默认收货地址
	public function setDefaultAddress($customerId,$addressId){
		$unDefaultFilter = array(
			'customer_id' => $customerId,
			'is_default' => 'y'
		);
		$rs = $this->model->updateByWhere($unDefaultFilter,array('is_default'=>'n','last_modify'=>time()));
		$data = array('is_default'=>'y','last_modify'=>time());
        $rs = $this->model->update($addressId,$data);
		return $rs;
	}

	//删除收货地址
	public function delAddress($filter){
		$rs = $this->model->delete($filter['address_id']);
		return $rs;
	}

}
