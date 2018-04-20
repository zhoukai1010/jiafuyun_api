<?php
/**
 * 默认接口服务类
 *
 * @author: Dm
 */
class Api_Company_Insurance_Update extends PhalApi_Api {

    public function getRules() {
        return array (
            'Go' => array(
                'userId' => array('name' => 'user_id', 'type' => 'int', 'min' => 1, 'require' => true, 'desc' => '服务商ID'),
                'recordId' => array('name' => 'record_id', 'type' => 'int', 'min' => 1, 'require' => true, 'desc' => '记录ID'),
                'title' => array('name' => 'title', 'type'=>'string', 'min' => 1, 'require'=> true,'desc'=> '保险类别'),
                'insuredName' => array('name' => 'insured_name', 'type'=>'string', 'min' => 1, 'require'=> true,'desc'=> '投保人'),
                'policyBn' => array('name' => 'policy_bn', 'type' => 'string', 'min' => 1, 'require' => true, 'desc' => '保单号'),
                'endTime' => array('name' => 'end_time', 'type' => 'string', 'min' => 1, 'require' => true, 'desc' => '截至有效期'),
            ),
        );
    }


    /**
     * 更新保险记录
     * #desc 用于更新保险记录
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

        //判断保险记录是否存在
        $insuranceDomain = new Domain_Company_Insurance();
        $insuranceInfo = $insuranceDomain->getBaseInfo($this->recordId);
        if( !$insuranceInfo) {
            $rs['code'] = 123;
            $rs['msg'] = T('Insurance record not exist');
            return $rs;
        }

        $data = array(
            'record_id' => $this->recordId,
            'title' => $this->title,
            'insured_name' => $this->insuredName,
            'policy_bn' => $this->policyBn,
            'end_time' => strtotime($this->endTime),
            'last_modify' => time(),
        );
        $update = $insuranceDomain->updateRecord($data);
        if($update){
            $status = 0;
        }else{
            $status = 1;
        }

        $rs['info']['status'] = $status;

        return $rs;
    }

}
