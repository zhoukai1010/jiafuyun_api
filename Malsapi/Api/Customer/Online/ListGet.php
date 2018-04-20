<?php
/**
 * 默认接口服务类
 *
 * @author: Dm
 */
class Api_Customer_Online_ListGet extends PhalApi_Api {
	
	public function getRules() {
		return array (
				 'Go' => array(
                     'page' => array('name' => 'page', 'type' => 'int', 'min' => 1, 'default'=>1,'require' => true, 'desc' => '页码'),
                     'pageSize' => array('name' => 'page_size', 'type' => 'int', 'min' => 1,'default'=>20, 'require' => true, 'desc' => '每页显示'),
                     'orderby' => array('name' => 'orderby','type' => 'enum','range'=>array('id:asc','id:desc'), 'default'=>'id:asc','require' => true, 'desc' => '排序方式'),
            ),
		);
 	}

  /**
     * 获取客户在线报名列表
     * #desc 用于获取客户在线报名列表
     * #return int code 操作码，0表示成功
     */
    public function Go() {
        $rs = array('code' => 0, 'msg' => '', 'info' => array());
        $filter = array();

        $customerDomain = new Domain_Customer();
        $result = $customerDomain->getAllOnline($filter,$this->page,$this->pageSize,$this->orderby);
        $count = $customerDomain->getCountOnline($filter);

        $rs['list'] = $result;
        $rs['total'] = $count;
        return $rs;
    }

}
