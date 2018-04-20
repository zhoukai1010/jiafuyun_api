<?php
/**
 * 默认接口服务类
 *
 * @author: Dm
 */
class Api_Company_Order_ListGet extends PhalApi_Api {
	
	public function getRules() {
		return array (
				 'Go' => array(
                     'userId' => array('name' => 'user_id', 'type' => 'int', 'min' => 1, 'require' => true, 'desc' => '接单服务商ID'),
                     'serviceType' => array('name' => 'service_type','type' => 'enum','range'=>array('all','wait','confirm','work','finish','cancel'), 'default'=>'all','require' => true, 'desc' => '状态：all 全部;wait 未确认;confirm 已确认;work 服务中;finish 已完成;cancel 取消和关闭'),
                     'orderBn' => array('name' => 'order_bn', 'type' => 'string', 'require' => false, 'desc' => '订单编号'),
                     'mobile' => array('name' => 'mobile', 'type' => 'string', 'require' => false, 'desc' => '手机号'),
                     'page' => array('name' => 'page', 'type' => 'int', 'min' => 1, 'default'=>1,'require' => true, 'desc' => '页码'),
                     'pageSize' => array('name' => 'page_size', 'type' => 'int', 'min' => 1,'default'=>20, 'require' => true, 'desc' => '每页显示'),
                     'orderby' => array('name' => 'orderby','type' => 'enum','range'=>array('id:asc','id:desc'), 'default'=>'id:asc','require' => true, 'desc' => '排序方式'),
            ),
		);
 	}

  /**
     * 服务商获取订单列表
     * #desc 用于服务商获取订单列表
     * #return int code 操作码，0表示成功
     */
    public function Go() {
        $rs = array('code' => 0, 'msg' => '', 'info' => array());

        //判断服务商是否存在
        $domain = new Domain_Company_User();
        $userInfo = $domain->getBaseInfo($this->userId);
        if(empty($userInfo)){
            DI()->logger->debug('User not found', $this->userId);

            $rs['code'] = 106;
            $rs['msg'] = T('User not exists');
            return $rs;
        }

        $filter = array();
        $filter['accept_user_id'] = $this->userId;
        if(!empty($this->orderBn)){
            $filter['order_bn'] = $this->orderBn;
        }
        if(!empty($this->mobile)){
            $filter['mobile'] = $this->mobile;
        }
        if($this->serviceType != 'all'){
            if($this->serviceType == 'wait'){
                $filter['service_status'] = 'wait';
            }
            if($this->serviceType == 'confirm'){
                $filter['service_status'] = 'confirm';
            }
            if($this->serviceType == 'work'){
                $filter['service_status'] = array( 'confirm','test','work','change' );
            }
            if($this->serviceType == 'finish'){
                $filter['service_status'] = 'finish';
            }
            if($this->serviceType == 'cancel'){
                $filter['service_status'] = array( 'cancel','close','test_close');
            }
        }

        $orderDomain = new Domain_Company_Order();
        $list = $orderDomain->getAllByPage($filter,$this->page,$this->pageSize,$this->orderby);
        $total = $orderDomain->getCount($filter);

        $rs['list'] = $list;
        $rs['total'] = $total;

        return $rs;
    }

}
