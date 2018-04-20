<?php
/**
 * 默认接口服务类
 *
 * @author: Dm
 */
class Api_Company_Order_Appraise_Add extends PhalApi_Api {
	
	public function getRules() {
		return array (
				 'Go' => array(
                     'orderId' => array('name' => 'order_id', 'type' => 'int', 'min' => 1, 'require' => true, 'desc' => '订单ID'),
                     'staffId' => array('name' => 'staff_id', 'type' => 'int', 'min' => 1, 'require' => false, 'desc' => '家政员ID'),
                     'customerId' => array('name' => 'customer_id', 'type' => 'int', 'min' => 1, 'require' => false, 'desc' => '会员ID'),
                     'level' => array('name' => 'level', 'type' => 'int', 'min' => 1, 'max' => 5,'require' => true, 'desc' => '评价星级'),
                     'mark' => array('name' => 'mark', 'type' => 'array','format' => 'json','require' => false, 'desc' => '标签'),
                     'content' => array('name' => 'content', 'type' => 'string','require' => false, 'desc' => '评价内容'),
            ),
		);
 	}
  
  /**
     * 添加订单评价
     * #desc 用于添加订单评价
     * #return int code 操作码，0表示成功
     */
    public function Go() {
        $rs = array('code' => 0, 'msg' => '', 'info' => array());
        $data = array(
            'level' => $this->level,
            'content' => $this->content,
            'create_time' => time(),
            'last_modify' => time()
        );

        //判断订单是否存在
        $orderDomain = new Domain_Company_Order();
        $orderInfo = $orderDomain->getBaseInfo($this->orderId);
        if (empty($orderInfo)) {
            DI()->logger->debug('Order not found', $this->orderId);

            $rs['code'] = 143;
            $rs['msg'] = T('Order not exists');
            return $rs;
        }
        //判断订单是否完成
        if ($orderInfo['service_status'] != 'finish') {
            $rs['code'] = 159;
            $rs['msg'] = T('Cancel order failed');
            return $rs;
        }
        $data['order_id'] = $this->orderId;
        //判断家政人员是否存在
        if(! empty($this->staffId)){
            $houseStaffDomain = new Domain_Company_Staff();
            $staffInfo = $houseStaffDomain->getBaseInfo($this->staffId);
            if( !$staffInfo) {
                $rs['code'] = 126;
                $rs['msg'] = T('Staff not exists');
                return $rs;
            }

            $data['appraise_id'] = $this->staffId;
            $data['type'] = 'staff';
        }
        //判断客户是否存在
        if(! empty($this->customerId)){
            $domain = new Domain_Customer();
            $user = $domain->getBaseInfo($this->customerId);
            if(!$user){
                $rs['code'] = 104;
                $rs['msg'] = T('Customer not exists');
                return $rs;
            }
            $data['appraise_id'] = $this->customerId;
            $data['type'] = 'customer';
        }
        if(isset($this->mark)) {
            $data['mark'] = json_encode($this->mark);
        }
        $domainAppraise = new Domain_OrderAppraise();
        //判断是否评价过
        $filter = array(
            'order_id' => $this->orderId,
            'appraise_id' =>  $data['appraise_id'],
            'type' => $data['type'],
        );
        $has = $domainAppraise->getBaseInfoByFilter($filter);
        if($has){
            $rs['code'] = 169;
            $rs['msg'] = T('In repeatable evaluation');
            return $rs;
        }
        $result = $domainAppraise->addAppraise($data);
        if(! $result){
            $rs['code'] = 101;
            $rs['msg'] = T('Create failed');
            return $rs;
        }
        $rs['info']['appraise_id'] = $result;
        return $rs;
    }
	
}
