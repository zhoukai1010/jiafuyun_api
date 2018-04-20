<?php
/**
 * 默认接口服务类
 *
 * @author: Dm
 */
class Api_Partner_Contract_ListGet extends PhalApi_Api {
	
	public function getRules() {
		return array (
				 'Go' => array(
                     'partnerId' => array('name' => 'partner_id', 'type' => 'int',  'require' => false, 'desc' => '合作人ID'),
                     'status' => array('name' => 'status', 'type' => 'enum', 'range'=>array('close','finish','active','all'), 'default'=>'all', 'require' => false, 'desc' => '合同状态'),
                     'page' => array('name' => 'page', 'type' => 'int', 'min' => 1, 'default'=>1,'require' => true, 'desc' => '页码'),
                     'pageSize' => array('name' => 'page_size', 'type' => 'int', 'min' => 1,'default'=>20, 'require' => true, 'desc' => '每页显示'),
                     'orderby' => array('name' => 'orderby','type' => 'enum','range'=>array('id:asc','id:desc'), 'default'=>'id:asc','require' => true, 'desc' => '排序方式'),
            ),
		);
 	}

  /**
     * 获取合作人合同列表
     * #desc 用于获取合作人合同列表
     * #return int code 操作码，0表示成功
     */
    public function Go() {
        $rs = array('code' => 0, 'msg' => '', 'info' => array());

        $filter = array();
        if(isset($this->partnerId)){
            $filter['partner_id'] = $this->partnerId;
        }
        if(isset($this->status) && $this->status != 'all'){
            $filter['status'] = $this->status;
        }
        $domain = new Domain_PartnerContract();
        $list = $domain->getAllByPage($filter,$this->page,$this->pageSize,$this->orderby);
        $total = $domain->getCount($filter);
        $rs['list'] = $list;
        $rs['total'] = $total;

        return $rs;
    }

}
