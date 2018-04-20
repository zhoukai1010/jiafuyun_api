<?php
/**
 * 默认接口服务类
 *
 * @author: Dm
 */
class Api_Partner_ListGet extends PhalApi_Api {
	
	public function getRules() {
		return array (
				 'Go' => array(
                     'loginName' => array('name' => 'login_name', 'type' => 'string',  'require' => false, 'desc' => '手机号码'),
                     'name' => array('name' => 'name', 'type' => 'string', 'min' => 1, 'require' => false, 'desc' => '伙伴名称'),
                     'page' => array('name' => 'page', 'type' => 'int', 'min' => 1, 'default'=>1,'require' => true, 'desc' => '页码'),
                     'pageSize' => array('name' => 'page_size', 'type' => 'int', 'min' => 1,'default'=>20, 'require' => true, 'desc' => '每页显示'),
                     'orderby' => array('name' => 'orderby','type' => 'enum','range'=>array('id:asc','id:desc'), 'default'=>'id:asc','require' => true, 'desc' => '排序方式'),
            ),
		);
 	}

  /**
     * 获取合作人列表
     * #desc 用于获取合作人列表
     * #return int code 操作码，0表示成功
     * #return int id 合伙人ID
     * #return string login_name 登录名
     * #return string name 名称
     * #return string create_time 创建时间
     * #return string last_modify  最后更新时间
     */
    public function Go() {
        $rs = array('code' => 0, 'msg' => '', 'info' => array());

        $filter = array();
        $domain = new Domain_Partner();
        if(isset($this->loginName)){
            $filter['login_name = ?'] = '%'.$this->loginName.'%';
        }
        if(isset($this->loginName)){
            $filter['name = ?'] = '%'.$this->name.'%';
        }
        $list = $domain->getAllByPage($filter,$this->page,$this->pageSize,$this->orderby);
        $total = $domain->getCount($filter);

        $rs['list'] = $list;
        $rs['total'] = $total;

        return $rs;
    }

}
