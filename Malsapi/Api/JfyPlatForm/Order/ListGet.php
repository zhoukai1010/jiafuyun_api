<?php
/**
 * 默认接口服务类
 *
 * @author: Dm
 */
class Api_JfyPlatForm_Order_ListGet extends PhalApi_Api {
	
	public function getRules() {
		return array (
				 'Go' => array(
                     'orderStatus' => array('name' => 'order_status','type' => 'enum','range'=>array('all','y','n'), 'default'=>'all','require' => true, 'desc' => '状态：all 全部;y 已分配;n 未分配'),
                     'isCheck' => array('name' => 'is_check','type' => 'enum','range'=>array('all','y','n'), 'default'=>'all','require' => true, 'desc' => '状态：all 全部;y 已审核;n 未审核'),
                     'orderBn' => array('name' => 'order_bn', 'type' => 'string', 'require' => false, 'desc' => '订单编号'),
                     'consignee' => array('name' => 'consignee', 'type' => 'string',  'require' => false, 'desc' => '收货人'),
                     'mobile' => array('name' => 'mobile', 'type' => 'string', 'require' => false, 'desc' => '手机号'),
                     'page' => array('name' => 'page', 'type' => 'int', 'min' => 1, 'default'=>1,'require' => true, 'desc' => '页码'),
                     'pageSize' => array('name' => 'page_size', 'type' => 'int', 'min' => 1,'default'=>20, 'require' => true, 'desc' => '每页显示'),
                     'orderby' => array('name' => 'orderby','type' => 'enum','range'=>array('id:asc','id:desc'), 'default'=>'id:asc','require' => true, 'desc' => '排序方式'),
            ),
		);
 	}

  /**
     * 平台获取订单列表
     * #desc 用于平台获取订单列表
     * #return int code 操作码，0表示成功
     */
    public function Go() {
        $rs = array('code' => 0, 'msg' => '', 'info' => array());

        $filter = array();
        //是否分配
        if($this->orderStatus != 'all'){
            if($this->orderStatus == 'y'){
                $filter['accept_user_id != ?'] = 0;
            }else{
                $filter['accept_user_id'] = 0;
            }
        }
        //是否审核
        if($this->isCheck != 'all'){
            $filter['is_check'] = $this->isCheck;
        }
        if(!empty($this->orderBn)){
            $filter['order_bn'] = $this->orderBn;
        }
        if(!empty($this->consignee)){
            $filter['consignee LIKE ?'] = '%'.$this->consignee.'%';
        }
        if(!empty($this->mobile)){
            $filter['mobile'] = $this->mobile;
        }

        $domain = new Domain_JfyPlatForm();
        $list = $domain->getAllByPage($filter,$this->page,$this->pageSize,$this->orderby);
        $total = $domain->getCount($filter);

        $rs['list'] = $list;
        $rs['total'] = $total;

        return $rs;
    }

}
