<?php
/**
 * 默认接口服务类
 *
 * @author: Dm
 */
class Api_JfyPlatForm_Customer_ListGet extends PhalApi_Api {
	
	public function getRules() {
		return array (
				 'Go' => array(
                     'mobile' => array('name' => 'mobile', 'type' => 'string', 'require' => false, 'desc' => '手机号码'),
                     'nickname' => array('name' => 'name', 'type' => 'string', 'require' => false, 'desc' => '真实姓名'),
                     'page' => array('name' => 'page', 'type' => 'int', 'min' => 1, 'default'=>1,'require' => true, 'desc' => '页码'),
                     'pageSize' => array('name' => 'page_size', 'type' => 'int', 'min' => 1,'default'=>20, 'require' => true, 'desc' => '每页显示'),
                     'orderby' => array('name' => 'orderby','type' => 'enum','range'=>array('id:asc','id:desc'), 'default'=>'id:asc','require' => true, 'desc' => '排序方式'),
            ),
		);
 	}

  /**
     * 平台获取客户列表
     * #desc 用于平台获取客户列表
     * #return int code 操作码，0表示成功
     */
    public function Go() {
        $rs = array('code' => 0, 'msg' => '', 'info' => array());

        $filter = array();
        if(!empty($this->mobile)){
            $filter['mobile'] = $this->mobile;
        }
        if(!empty($this->nickname)){
            $filter['nickname LIKE ?'] = '%'.$this->nickname.'%';
        }

        $domain = new Domain_Customer();
        $list = $domain->getAllByPage($filter,$this->page,$this->pageSize,$this->orderby);
        $total = $domain->getCount($filter);

        $rs['list'] = $list;
        $rs['total'] = $total;

        return $rs;
    }

}
