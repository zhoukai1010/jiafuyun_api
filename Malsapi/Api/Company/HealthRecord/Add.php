<?php
/**
 * 默认接口服务类
 *
 * @author: Dm
 */
class Api_Company_HealthRecord_Add extends PhalApi_Api {

    public function getRules() {
        return array (
            'Go' => array(
                'userId' => array('name' => 'user_id', 'type' => 'int', 'min' => 1, 'require' => true, 'desc' => '服务商ID'),
                'staffId' => array('name' => 'staff_id', 'type' => 'int', 'min' => 1, 'require' => true, 'desc' => '家政员ID'),
                'sendTime' => array('name' => 'send_time', 'type' => 'string', 'min' => 1, 'require' => true, 'desc' => '发放日期'),
                'endTime' => array('name' => 'end_time', 'type' => 'string', 'min' => 1, 'require' => true, 'desc' => '截至有效期'),
                'imgUrl' => array('name' => 'img_url', 'type' => 'array', 'format'=>'json', 'require' => true, 'desc' => '图片路径'),
            ),
        );
    }


    /**
     * 添加体检记录
     * #desc 用于添加体检记录
     * #return int code 操作码，0表示成功
     * #return int health_id  体检记录ID
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
        //判断体检记录有效期
        $healthRecordDomain = new Domain_Company_HealthRecord();
        $filter = array('user_id' => $this->userId,'staff_id' => $this->staffId);
        $check = $healthRecordDomain->checkHealthRecord($filter);
        if(! $check){
            $rs['code'] = 120;
            $rs['msg'] = T('Health record the validity period');
            return $rs;
        }

        $data = array(
            'user_id' => $staffInfo['user_id'],
            'staff_id' => $this->staffId,
            'send_time' => strtotime($this->sendTime),
            'end_time' => strtotime($this->endTime),
            'img_url' => json_encode($this->imgUrl),
            'create_time' => time(),
            'last_modify' => time(),
        );

        $healthId = $healthRecordDomain->addHealthCard($data);

        $rs['info']['health_id'] = $healthId;

        return $rs;
    }

}
