<?php
/**
 * 默认接口服务类
 *
 * @author: Dm
 */
class Api_Company_HouseStaff_ListGet extends PhalApi_Api {
	
	public function getRules() {
		return array (
				 'Go' => array(
                     'userId' => array('name' => 'user_id', 'type' => 'int', 'min' => 1, 'require' => true, 'desc' => '商户ID'),
                     'name' => array('name' => 'name', 'type'=>'string', 'min' => 0, 'require'=> false,'desc'=> '家政员姓名'),
                     'mobile' => array('name' => 'mobile', 'type'=>'string', 'min' => 0, 'require'=> false,'desc'=> '手机号'),
                     'page' => array('name' => 'page', 'type' => 'int', 'min' => 1, 'default'=>1,'require' => true, 'desc' => '页码'),
                     'pageSize' => array('name' => 'page_size', 'type' => 'int', 'min' => 1,'default'=>20, 'require' => true, 'desc' => '每页显示'),
                     'orderby' => array('name' => 'orderby','type' => 'enum','range'=>array('id:asc','id:desc'), 'default'=>'id:asc','require' => true, 'desc' => '排序方式'),
            ),
		);
 	}

  /**
     * 获取家政员工列表
     * #desc 用于获取家政员工列表
     * #return int code 操作码，0表示成功
     * #return int id 员工ID
     * #return int user_id 服务商ID
     * #return string name 员工姓名
     * #return string birthday 出生日期
     * #return string age 年龄
     * #return array avatar 员工照片
     * #return string sex 性别
     * #return int mobile 手机号
     * #return string native_place_address 户籍详细地址
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
        $filter['user_id'] = $this->userId;
        if(!empty($this->name)){
            $filter['name LIKE ?'] = '%'.$this->name.'%' ;
        }
        if(!empty($this->mobile)){
            $filter['mobile'] = $this->mobile;
        }

        $houseStaffDomain = new Domain_Company_Staff();
        $list = $houseStaffDomain->getAllByPage($filter,$this->page,$this->pageSize,$this->orderby);
        $total = $houseStaffDomain->getCount($filter);

        $rs['list'] = $list;
        $rs['total'] = $total;

        return $rs;
    }

}
