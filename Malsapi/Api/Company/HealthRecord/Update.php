<?php
/**
 * 默认接口服务类
 *
 * @author: Dm
 */
class Api_Company_HealthRecord_Update extends PhalApi_Api {

    public function getRules() {
        return array (
            'Go' => array(
                'userId' => array('name' => 'user_id', 'type' => 'int', 'min' => 1, 'require' => true, 'desc' => '服务商ID'),
                'healthId' => array('name' => 'health_id', 'type' => 'int', 'min' => 1, 'require' => true, 'desc' => '体检记录ID'),
                'sendTime' => array('name' => 'send_time', 'type' => 'string', 'min' => 1, 'require' => true, 'desc' => '发放日期'),
                'endTime' => array('name' => 'end_time', 'type' => 'string', 'min' => 1, 'require' => true, 'desc' => '截至有效期'),
                'imgUrl' => array('name' => 'img_url', 'type' => 'array', 'format'=>'json', 'require' => true, 'desc' => '图片路径'),
            ),
        );
    }


    /**
     * 更新体检记录
     * #desc 用于更新体检记录
     * #return int code 操作码，0表示成功
     * #return int status 0 成功 1 失败
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

        //判断体检记录是否存在
        $healthRecordDomain = new Domain_Company_HealthRecord();
        $healthInfo = $healthRecordDomain->getBaseInfo($this->healthId);
        if( !$healthInfo) {
            $rs['code'] = 119;
            $rs['msg'] = T('Health record not exist');
            return $rs;
        }

        $data = array(
            'health_id' => $this->healthId,
            'send_time' => strtotime($this->sendTime),
            'end_time' => strtotime($this->endTime),
            'img_url' => json_encode($this->imgUrl),
            'last_modify' => time(),
        );
        $update = $healthRecordDomain->updateHealthCard($data);
        if($update){
            $status = 0;
        }else{
            $status = 1;
        }

        $rs['info']['status'] = $status;

        return $rs;
    }

}
