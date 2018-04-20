<?php
class Domain_JfyPlatForm {
    var $model;

    public function __construct() {
        $this->model = new Model_Order();
    }

    //获取订单详情
    public function getBaseInfo($orderId){
        $rs = array ();
        $orderId = intval ( $orderId );
        if ($orderId <= 0) {
            return $rs;
        }

        $rs = $this->model->get ( $orderId ,'*');

        if (! $rs){
            return false;
        }else{
            //拼接服务地址
            $domainArea = new Domain_Area();
            $country = $domainArea->getAreaNameById($rs['country']);
            $province = $domainArea->getAreaNameById($rs['province']);
            $city = $domainArea->getAreaNameById($rs['city']);
            $district = $domainArea->getAreaNameById($rs['district']);
            $rs['address_details'] = $country.$province.$city.$district.$rs['address'];
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
            $rs['service_type_info'] = $serviceCategoryModel->getByWhere(array('code' => $rs['service_type'],),'name,price');
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
            $rs['order_log'] = $logModel->getAll('*',array('order_id' => $orderId));
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
            $rs['customer_appraise_list'] = $appraiseModel->getAll('*',$customerAppraiseFilter);
            if(!empty($rs['customer_appraise_list'])){
                foreach ($rs['customer_appraise_list'] as $key=>$value){
                    $rs['customer_appraise_list'][$key]['mark'] = json_decode($value['mark'],true);
                }
            }
            $staffAppraiseFilter = array(
                'order_id' => $orderId,
                'type' => 'staff'
            );
            $rs['staff_appraise_list'] = $appraiseModel->getAll('*',$staffAppraiseFilter);
            //获取订单出入账信息
            $orderPayLogModel = new Model_OrderPayLog();
            $filter = array('order_id' => $orderId);
            $orderPayList = $orderPayLogModel -> getAll('*',$filter);
            $rs['order_pay_list'] = $orderPayList;

        }

        return $rs;
    }

    //获取列表
    public function getAllByPage($filter, $page = 1, $page_size = 20, $orderby = ''){
        $userModel = new Model_User();
        $rs = $this->model->getAll ( '*', $filter, $page, $page_size, $orderby );
        foreach ($rs as $key=>$value){
            $rs[$key]['company_name'] = '';
            if($value['accept_user_id'] > 0){
                $user = $userModel->get($value['accept_user_id'],'name');
                $rs[$key]['company_name'] = $user['name'];
            }
        }
        return $rs;
    }
    //获取数量
    public function getCount($filter) {
        return $this->model->getCount ( $filter );
    }

    //通过审核订单
    public function orderCheck($data){
        $id = intval($data['order_id']);
        unset($data['order_id']);
        $rs = $this->model->update($id, $data);
        if( $rs){
            //添加订单日志
            $logModel = new Model_OrderLog();
            $logDate = array(
                'order_id' => $id,
                'content' => '订单审核通过',
                'create_time' => time()
            );
            $log = $logModel->insert($logDate);
            if(! $log){
                throw new LogicException ( T ( 'Create failed' ), 101 );
            }
        }

        return $rs;
    }

    //订单审核不通过，订单终止
    public function closeOrder($orderInfo){
        $orderId = $orderInfo['id'];
        //更新订单为终止状态
        $orderData = array(
            'service_status' => 'close',
            'is_check' => 'y',
            'last_modify' => time(),
        );
        $orderRs = $this->model->update($orderInfo['id'],$orderData);
        if(! $orderRs){
            throw new LogicException ( T ( 'Cancel order failed' ), 159 );
        }
        //添加订单日志
        $orderDomain = new Domain_Company_Order();
        $orderLogRs = $orderDomain->addLog($orderInfo['id'],'家服云平台终止订单');
        if(! $orderLogRs){
            throw new LogicException ( T ( 'Cancel order failed' ), 159 );
        }

        //更新订单阿姨为订单终止
        $orderToStaffModel = new Model_OrderToStaff();
        $filter = array(
            'order_id' => $orderId,
            'staff_id' => $orderInfo['staff_id'],
        );
        $orderStaffData = array(
            'status' => 'close',
            'last_modify' => time(),
        );
        $updateRs = $orderToStaffModel->updateByWhere($filter,$orderStaffData);
        if(! $updateRs){
            throw new LogicException ( T ( 'Cancel order failed' ), 159 );
        }

        return true;
    }

    //分配订单给服务商
    public function addUserOrder($data){
        $id = intval($data['order_id']);
        $rs = $this->model->update($id, array( 'accept_user_id' => $data['user_id'], 'last_modify' => time() ));
        if( $rs){
            $order_bn = $data['order_bn'];
            unset($data['order_bn']);
            //添加订单日志
            $logModel = new Model_OrderLog();
            $logDate = array(
                'order_id' => $id,
                'content' => '订单【'.$order_bn.'】分配服务商成功',
                'create_time' => time()
            );
            $log = $logModel->insert($logDate);
            if(! $log){
                throw new LogicException ( T ( 'Create failed' ), 101 );
            }
        }

        return $rs;
    }

}
