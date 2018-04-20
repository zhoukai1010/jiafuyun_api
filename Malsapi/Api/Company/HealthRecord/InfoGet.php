<?php
/**
 * 默认接口服务类
 *
 * @author: Dm
 */
class Api_Company_HealthRecord_InfoGet extends PhalApi_Api {
    
    public function getRules() {
        return array (
                 'Go' => array(
                     'staffId' => array('name' => 'staff_id', 'type' => 'int', 'min' => 1, 'require' => true, 'desc' => '家政员ID'),
                     'healthId' => array('name' => 'health_id', 'type' => 'int', 'min' => 0, 'require' => false, 'desc' => '健康卡ID'),
            ),
        );
    }


    /**
     * 获取体检记录详情
     * #desc 用于获取体检记录详情
     * #return int code 操作码，0表示成功
     * #return int id 健康卡ID
     * #return int company_id 公司ID
     * #return int staff_id 家政员ID
     * #return string health_level 健康情况
     * #return string card_bn 健康卡号
     * #return string send_time 发放时间
     * #return string end_time 截至有效时间
     * #return string status 状态 y 正常 n 作废
     * #return int create_time 创建时间
     * #return int last_modify  最后更新时间
     * #return array staff_name 家政员名称
     * #return array sex 性别
     * #return array mobile 手机号
     * #return array birthday 出生日期
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

        //判断体检记录是否存在
        $healthRecordDomain = new Domain_Company_HealthRecord();
        $healthInfo = $healthRecordDomain->getBaseInfo($this->healthId);
        if( !$healthInfo) {
            $rs['code'] = 119;
            $rs['msg'] = T('Health record not exist');
            return $rs;
        }

        $rs['info'] = $healthInfo;

        return $rs;
    }
    
}
