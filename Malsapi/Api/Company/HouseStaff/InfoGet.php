<?php
/**
 * 默认接口服务类
 *
 * @author: Dm
 */
class Api_Company_HouseStaff_InfoGet extends PhalApi_Api {
    
    public function getRules() {
        return array (
                 'Go' => array(
                     'userId' => array('name' => 'user_id', 'type' => 'int', 'min' => 1, 'require' => true, 'desc' => '服务商ID'),
                     'staffId' => array('name' => 'staff_id', 'type' => 'int', 'min' => 1, 'require' => true, 'desc' => '员工ID'),
            ),
        );
    }
  
  /**
     * 获取家政员工详情
     * #desc 用于获取家政员工详情
     * #return int code 操作码，0表示成功
   * #return int id 员工ID
   * #return int user_id 服务商ID
   * #return string name 员工姓名
   * #return string birthday 出生日期
   * #return array avatar 员工照片
   * #return string sex 性别
   * #return int mobile 手机号
   * #return string address 现居住详细地址
   * #return string cardID 身份证号码
   * #return string idcard_p 身份证正面照片
   * #return string idcard_n 身份证反面照片
   * #return string work_experience 家政经验
   * #return string society_experience 社会经历
   * #return int create_time 创建时间
   * #return int last_modify  最后更新时间
   * #return string is_dormitory 是否住店:y 是, n 否, unknown 未知
   * #return string nation 民族
   * #return string education  文化程度
   * #return string marriage 婚姻情况
   * #return string industry 专业
   * #return string height 身高
   * #return string weight 体重
   * #return int native_place 籍贯
   * #return array native_place_district 户籍地区
   * #return string native_place_address 户籍详细地址
   * #return array now_district 现居住省市区
   * #return array staff_demand 业务需求
   * #return array staff_cert 证书信息
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

        $rs['info'] = $staffInfo;

        return $rs;
    }
    
}
