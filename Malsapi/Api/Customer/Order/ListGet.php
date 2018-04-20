<?php
/**
 * 默认接口服务类
 *
 * @author: Dm
 */
class Api_Customer_Order_ListGet extends PhalApi_Api {
	
	public function getRules() {
		return array (
				 'Go' => array(
                     'customerId' => array('name' => 'customer_id', 'type' => 'int', 'min' => 1, 'require' => true, 'desc' => '客户ID'),
                     'serviceType' => array('name' => 'service_type','type' => 'enum','range'=>array('all','noPay','work','cancel'), 'default'=>'all','require' => true, 'desc' => '状态：all 全部;noPay 未支付;confirm 已确认;work 服务中;cancel 取消和关闭'),
                     'orderBn' => array('name' => 'order_bn', 'type' => 'string', 'require' => false, 'desc' => '订单编号'),
                     'mobile' => array('name' => 'mobile', 'type' => 'string', 'require' => false, 'desc' => '手机号'),
                     'page' => array('name' => 'page', 'type' => 'int', 'min' => 1, 'default'=>1,'require' => true, 'desc' => '页码'),
                     'pageSize' => array('name' => 'page_size', 'type' => 'int', 'min' => 1,'default'=>20, 'require' => true, 'desc' => '每页显示'),
                     'orderby' => array('name' => 'orderby','type' => 'enum','range'=>array('id:asc','id:desc'), 'default'=>'id:asc','require' => true, 'desc' => '排序方式'),
            ),
		);
 	}

  /**
     * 客户获取订单列表
     * #desc 用于客户获取订单列表
     * #return int code 操作码，0表示成功
     */
    public function Go() {
        $rs = array('code' => 0, 'msg' => '', 'info' => array());

        $filter = array();
        $filter['customer_id'] = $this->customerId;
        if(!empty($this->orderBn)){
            $filter['order_bn'] = $this->orderBn;
        }
        if(!empty($this->mobile)){
            $filter['mobile'] = $this->mobile;
        }
        if($this->serviceType != 'all'){
            //未支付
            if($this->serviceType == 'noPay'){
                $filter['is_pay'] = 'noPay';
                $filter['service_status'] = array( 'wait','confirm');
                $filter['order_type'] = 'ordinary';
                $orderDomain = new Domain_CustomerOrder();
                $list = $orderDomain->getAllByPage($filter,$this->page,$this->pageSize,$this->orderby);
                $total = $orderDomain->getCount($filter);
            }
            //待受理
            if($this->serviceType == 'work'){
                $filter['service_status'] = array( 'wait','confirm','test','work','change' );
                $orderDomain = new Domain_CustomerOrder();
                $workOrder = $orderDomain->getAllWorkOrder($filter,$this->page,$this->pageSize,$this->orderby);
                $list = $workOrder['list'];
                $total = $workOrder['total'];
            }
            //已关闭
            if($this->serviceType == 'cancel'){
                $filter['service_status'] = array( 'finish','cancel','close','test_close');
                $orderDomain = new Domain_CustomerOrder();
                $list = $orderDomain->getAllByPage($filter,$this->page,$this->pageSize,$this->orderby);
                $total = $orderDomain->getCount($filter);
            }
        }else{
            $orderDomain = new Domain_CustomerOrder();
            $list = $orderDomain->getAllByPage($filter,$this->page,$this->pageSize,$this->orderby);
            $total = $orderDomain->getCount($filter);
        }

        $rs['list'] = $list;
        $rs['total'] = $total;

        return $rs;
    }

}
