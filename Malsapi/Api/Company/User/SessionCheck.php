<?php
/**
 * 默认接口服务类
 *
 * @author: Dm
 */
class Api_Company_User_SessionCheck extends PhalApi_Api {

    public function getRules() {
        return array (
            'Go' => array(
                'session' => array('name' => 'session', 'type' => 'string', 'min' => 1, 'require' => true, 'desc' => 'sessionID'),
            ),
        );
    }


    /**
     * 服务商Session验证
     * #desc 用于服务商Session验证
     * #return int status 1:有效，0：无效
     */
    public function Go() {
        $rs = array('code' => 0, 'msg' => '', 'info' => array());

        $domain = new Domain_Company_UserSession();
        $sessionData = $domain->checkSession($this->session);
        $status = 0;
        if($sessionData){
            $status = 1;
        }
        $rs['info'] = $sessionData;
        $rs['status'] = $status;

        return $rs;
    }

}

