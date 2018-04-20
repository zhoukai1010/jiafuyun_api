<?php
/**
 * 默认接口服务类
 *
 * @author: Dm
 */
class Api_Company_Insurance_InfoGet extends PhalApi_Api {
    
    public function getRules() {
        return array (
                 'Go' => array(
                     'staffId' => array('name' => 'staff_id', 'type' => 'int', 'min' => 1, 'require' => true, 'desc' => '家政员ID'),
                     'recordId' => array('name' => 'record_id', 'type' => 'int', 'min' => 1, 'require' => true, 'desc' => '记录ID'),
            ),
        );
    }

    /**
     * 获取保险记录详情
     * #desc 用于获取保险记录详情
     * #return int code 操作码，0表示成功
     * #return int id 保险记录ID
     * #return int user_id 服务商ID
     * #return string company_name 服务商名称
     * #return int staff_id 家政员ID
     * #return string staff_name 家政员名称
     * #return string title 保险类别
     * #return string policy_bn 保单号
     * #return string insured_name 投保人
     * #return string end_time 截至有效期
     * #return int create_time 创建时间
     * #return int last_modify  最后更新时间
     */
    public function Go() {
        $rs = array('code' => 0, 'msg' => '', 'info' => array());
        //判断家政人员是否存在
        $houseStaffDomain = new Domain_Company_Staff();
        $staffInfo = $houseStaffDomain->getBaseInfo($this->staffId);
        if( !$staffInfo) {
            $rs['code'] = 126;
            $rs['msg'] = T('Staff not exists');
            return $rs;
        }

        //判断保险记录是否存在
        $insuranceDomain = new Domain_Company_Insurance();
        $insuranceInfo = $insuranceDomain->getBaseInfo($this->recordId);
        if( !$insuranceInfo) {
            $rs['code'] = 123;
            $rs['msg'] = T('Insurance record not exist');
            return $rs;
        }

        $rs['info'] = $insuranceInfo;

        return $rs;
    }
    
}
