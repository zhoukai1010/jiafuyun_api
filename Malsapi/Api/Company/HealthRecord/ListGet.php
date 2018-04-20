<?php
/**
 * 默认接口服务类
 *
 * @author: Dm
 */
class Api_Company_HealthRecord_ListGet extends PhalApi_Api {
	
	public function getRules() {
		return array (
				 'Go' => array(
                     'userId' => array('name' => 'user_id', 'type' => 'int', 'min' => 1, 'require' => true, 'desc' => '服务商ID'),
                     'staffId' => array('name' => 'staff_id', 'type' => 'int', 'min' => 1, 'require' => true, 'desc' => '家政员ID'),
                     'page' => array('name' => 'page', 'type' => 'int', 'min' => 1, 'default'=>1,'require' => true, 'desc' => '页码'),
                     'pageSize' => array('name' => 'page_size', 'type' => 'int', 'min' => 1,'default'=>20, 'require' => true, 'desc' => '每页显示'),
                     'orderby' => array('name' => 'orderby','type' => 'enum','range'=>array('id:asc','id:desc'), 'default'=>'id:asc','require' => true, 'desc' => '排序方式'),
            ),
		);
 	}
  
  /**
     * 获取体检记录列表
     * #desc 用于获取体检记录列表
     * #return int code 操作码，0表示成功
     * #return int id 体检记录ID
     * #return int user_id 服务商ID
     * #return string company_name 服务商名称
     * #return int staff_id 家政员ID
     * #return string staff_name 家政员名称
     * #return string send_time 发放日期
     * #return string end_time 截至有效日期
     * #return string img_url 图片路径
     * #return string status 状态：y 正常 n 作废
     * #return int create_time 创建时间
     * #return int last_modify  最后更新时间
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

        //判断家政人员是否存在
        $houseStaffDomain = new Domain_Company_Staff();
        $staffInfo = $houseStaffDomain->getBaseInfo($this->staffId);
        if( !$staffInfo) {
            $rs['code'] = 126;
            $rs['msg'] = T('Staff not exists');
            return $rs;
        }

        $filter = array();
        $filter['user_id'] = $this->userId;
        $filter['staff_id'] = $this->staffId;

        $healthRecordDomain = new Domain_Company_HealthRecord();
        $list = $healthRecordDomain->getAllByPage($filter,$this->page,$this->pageSize,$this->orderby);
        $total = $healthRecordDomain->getCount($filter);

        $rs['list'] = $list;
        $rs['total'] = $total;

        return $rs;
    }

}
