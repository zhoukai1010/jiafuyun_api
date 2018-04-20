<?php
class Domain_CustomerOrder {
    var $model;

    public function __construct()
    {
        $this->model = new Model_Order ();
    }

    //获取详情
    public function getBaseInfo($orderId)
    {
        $rs = array();
        $orderId = intval($orderId);
        if ($orderId <= 0) {
            return $rs;
        }

        $rs = $this->model->get($orderId, '*');

        if (!$rs) {
            return false;
        } else {
            //拼接服务地址
            $domainArea = new Domain_Area();
            $country = $domainArea->getAreaNameById($rs['country']);
            $province = $domainArea->getAreaNameById($rs['province']);
            $city = $domainArea->getAreaNameById($rs['city']);
            $district = $domainArea->getAreaNameById($rs['district']);
            $rs['address_details'] = $country . $province . $city . $district . $rs['address'];
            $rs['country'] = $country;
            $rs['province'] = $province;
            $rs['city'] = $city;
            $rs['district'] = $district;
            $rs['create_time'] = date('Y-m-d H:i:s', $rs['create_time']);
            $rs['last_modify'] = date('Y-m-d H:i:s', $rs['last_modify']);
            $rs['service_time'] = date('Y-m-d H:i:s', $rs['service_time']);
            $rs['service_content'] = json_decode($rs['service_content'], true);
            //获取服务类型
            $rs['service_type_info'] = array();
            $serviceCategoryModel = new Model_ServiceCategory();
            $rs['service_type_info'] = $serviceCategoryModel->getByWhere(array('code' => $rs['service_type'],), 'name,price');
            //获取订单支付记录
            $financeModel = new Model_OrderFinance();
            $item_list = $financeModel->getAll('*',array('about_id' =>$orderId ));
            if(! empty($item_list)){
                foreach ($item_list as $key=>$value){
                    $item_list[$key]['pay_time'] =  $value['pay_time'] == 0 ? '-': date("Y-m-d H:i:s",$value['pay_time']);
                    $item_list[$key]['pay_end_time'] = date('Y-m-d H:i:s', $value['pay_end_time']);
                    $pay_end_time = $value['pay_end_time'];
                }
                $rs['item_list'] = $item_list;
                $rs['pay_end_time'] = $pay_end_time;
            }else{
                $rs['item_list'] = array();
                $rs['pay_end_time'] = 0;
            }
            //获取订单日志
            $logModel = new Model_OrderLog();
            $rs['order_log'] = $logModel->getAll('*', array('order_id' => $orderId));
            //获取服务商信息
            $rs['company_info'] = '';
            $userDomain = new Domain_Company_User();
            if($rs['accept_user_id'] > 0){
                $user = $userDomain->getBaseInfo($rs['accept_user_id']);
                $rs['company_info'] = $user;
            }
            //获取评价
            $appraiseModel = new Model_OrderAppraise();
            $customerAppraiseFilter = array(
                'order_id' => $orderId,
                'type' => 'customer'
            );
            $rs['customer_appraise_list'] = $appraiseModel->getAll('*', $customerAppraiseFilter);
            if(!empty($rs['customer_appraise_list'])){
                foreach ($rs['customer_appraise_list'] as $key=>$value){
                    $rs['customer_appraise_list'][$key]['mark'] = json_decode($value['mark'],true);
                }
            }
            $staffAppraiseFilter = array(
                'order_id' => $orderId,
                'type' => 'staff'
            );
            $rs['staff_appraise_list'] = $appraiseModel->getAll('*', $staffAppraiseFilter);
            //获取订单出入账信息
            $orderPayLogModel = new Model_OrderPayLog();
            $filter = array('order_id' => $orderId);
            $orderPayList = $orderPayLogModel->getAll('*', $filter);
            $rs['order_pay_list'] = $orderPayList;

        }
        return $rs;
    }

    //获取列表
    public function getAllByPage($filter, $page = 1, $page_size = 20, $orderby = '')
    {
        $userModel = new Model_User();
        $domainArea = new Domain_Area();
        $serviceCategoryModel = new Model_ServiceCategory();
        $rs = $this->model->getAll('id,user_id,accept_user_id,customer_id,staff_id,order_bn,total_amount,discount_amount,service_amount,real_amount,is_pay,pay_type,service_type,service_status,create_time,last_modify,service_time,country,province,city,district,address,is_check,payment_deadline,order_type', $filter, $page, $page_size, $orderby);
        foreach ($rs as $key => $value) {
            $rs[$key]['service_time'] = date('Y-m-d H:i:s', $value['service_time']);
            $rs[$key]['company_name'] = '';
            if($value['accept_user_id'] > 0){
                $user = $userModel->get($value['accept_user_id'],'name');
                $rs[$key]['company_name'] = $user['name'];
            }
            //拼接服务地址
            $country = $domainArea->getAreaNameById($value['country']);
            $province = $domainArea->getAreaNameById($value['province']);
            $city = $domainArea->getAreaNameById($value['city']);
            $district = $domainArea->getAreaNameById($value['district']);
            $rs[$key]['address_details'] = $country . $province . $city . $district . $value['address'];
            $rs[$key]['country'] = $country;
            $rs[$key]['province'] = $province;
            $rs[$key]['city'] = $city;
            $rs[$key]['district'] = $district;
            //获取服务类型
            $rs[$key]['service_type_info'] = array();
            $rs[$key]['service_type_info'] = $serviceCategoryModel->getByWhere(array('code' => $value['service_type'],), 'name,price');
        }
        return $rs;
    }

    //获取数量
    public function getCount($filter)
    {
        return $this->model->getCount($filter);
    }

    //获取待受理列表
    public function getAllWorkOrder($filter, $page = 1, $page_size = 20, $orderby = ''){
        $rs = $this->model->getAll('id,user_id,accept_user_id,customer_id,staff_id,order_bn,total_amount,discount_amount,service_amount,real_amount,is_pay,pay_type,service_type,service_status,create_time,last_modify,service_time,country,province,city,district,address,is_check,payment_deadline,order_type', $filter);
        $ordinary_list = array();
        $long_term_list = array();
        foreach ($rs as $key=>$value){
            //ordinary 普通订单
            if($value['order_type'] == 'ordinary' && $value['is_pay'] == 'succPay'){
                $ordinary_list[] = $value;
            }
            //long_term 长期订单
            if($value['order_type'] == 'long_term'){
                $long_term_list[] = $value;
            }
        }
        $new_list = array_merge($ordinary_list,$long_term_list);
        if(is_array($new_list) && !empty($new_list)){
            //排序
            $flag = array();
            foreach($new_list as $v){
                $flag[] = $v['id'];
            }
            if($orderby == 'id:asc'){
                $sort = SORT_ASC;
            }else{
                $sort = SORT_DESC;
            }

            array_multisort($flag, $sort, $new_list);
            $start = ($page-1) * $page_size;
            $list = array_slice($new_list, $start, $page_size);
            $result['list']= $this->getInfo($list);
            $result['total'] = count($new_list);
        }else{
            $result['list'] = array();
            $result['total'] = 0;
        }
        return $result;
    }
    function getInfo($rs){
        $userModel = new Model_User();
        $domainArea = new Domain_Area();
        $serviceCategoryModel = new Model_ServiceCategory();
        foreach ($rs as $key => $value) {
            $rs[$key]['service_time'] = date('Y-m-d H:i:s', $value['service_time']);
            $rs[$key]['company_name'] = '';
            if($value['accept_user_id'] > 0){
                $user = $userModel->get($value['accept_user_id'],'name');
                $rs[$key]['company_name'] = $user['name'];
            }
            //拼接服务地址
            $country = $domainArea->getAreaNameById($value['country']);
            $province = $domainArea->getAreaNameById($value['province']);
            $city = $domainArea->getAreaNameById($value['city']);
            $district = $domainArea->getAreaNameById($value['district']);
            $rs[$key]['address_details'] = $country . $province . $city . $district . $value['address'];
            $rs[$key]['country'] = $country;
            $rs[$key]['province'] = $province;
            $rs[$key]['city'] = $city;
            $rs[$key]['district'] = $district;
            //获取服务类型
            $rs[$key]['service_type_info'] = array();
            $rs[$key]['service_type_info'] = $serviceCategoryModel->getByWhere(array('code' => $value['service_type'],), 'name,price');
        }
        return $rs;
    }

    //取消未付款订单
    public function customerCancelOrder($orderInfo){
        //更新订单为取消状态
        $orderData = array(
            'service_status' => 'cancel',
            'last_modify' => time(),
        );
        $orderRs = $this->model->update($orderInfo['id'],$orderData);
        if(! $orderRs){
            throw new LogicException ( T ( 'Cancel order failed' ), 159 );
        }
        //添加订单日志
        $companyOrderDomain = new Domain_Company_Order();
        $orderLogRs = $companyOrderDomain->addLog($orderInfo['id'],'客户取消未付款订单');
        if(! $orderLogRs){
            throw new LogicException ( T ( 'Cancel order failed' ), 159 );
        }
        return true;
    }

    //关闭支付超时的订单
    public function closeUnPayOrder(){
        $orderFinanceModel = new Model_OrderFinance();
        $filter = array( 'pay_end_time < ?' => time() );
        $list = $orderFinanceModel->getAll('*',$filter);
        foreach ($list as $k=>$v ){
            $info = $this->model->get($v['about_id'],'id,is_pay,is_check,service_status');
            if($info['is_pay'] == 'noPay' && $info['is_check'] == 'n'){
                $update = array('service_status' => 'cancel' ,'last_modify' => time());
                $rs = $this->model->update($info['id'],$update);
            }
        }

        return $rs;
    }

}