<?php
/**
 * 默认接口服务类
 *
 * @author: Dm
 */
class Api_Company_Insurance_Add extends PhalApi_Api {

    public function getRules() {
        return array (
            'Go' => array(
                'userId' => array('name' => 'user_id', 'type' => 'int', 'min' => 1, 'require' => true, 'desc' => '服务商ID'),
                'staffId' => array('name' => 'staff_id', 'type' => 'int', 'min' => 1, 'require' => true, 'desc' => '家政员ID'),
                'title' => array('name' => 'title', 'type'=>'string', 'min' => 1, 'require'=> true,'desc'=> '保险类别'),
                'insuredName' => array('name' => 'insured_name', 'type'=>'string', 'min' => 1, 'require'=> true,'desc'=> '投保人'),
                'policyBn' => array('name' => 'policy_bn', 'type' => 'string', 'min' => 1, 'require' => true, 'desc' => '保单号'),
                'endTime' => array('name' => 'end_time', 'type' => 'string', 'min' => 1, 'require' => true, 'desc' => '截至有效期'),
            ),
        );
    }


    /**
     * 添加保险记录信息
     * #desc 用于添加保险记录信息
     * #return int code 操作码，0表示成功
     * #return int record_id  记录ID
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
        //判断保险记录有效期
        $insuranceDomain = new Domain_Company_Insurance();
        $filter = array('user_id' => $this->userId,'staff_id' => $this->staffId);
        $check = $insuranceDomain->checkRecord($filter);
        if(! $check){
            $rs['code'] = 124;
            $rs['msg'] = T('Insurance record the validity period');
            return $rs;
        }

        $data = array(
            'user_id' => $this->userId,
            'staff_id' => $this->staffId,
            'title' => $this->title,
            'insured_name' => $this->insuredName,
            'policy_bn' => $this->policyBn,
            'end_time' => strtotime($this->endTime),
            'create_time' => time(),
            'last_modify' => time(),
        );
        $recordId = $insuranceDomain->addRecord($data);

        $rs['info']['record_id'] = $recordId;

        return $rs;
    }

}
