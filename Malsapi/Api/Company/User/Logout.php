<?php
/**
 * 默认接口服务类
 *
 * @author: Dm
 */
class Api_Company_User_Logout extends PhalApi_Api {

    public function getRules() {
        return array (
				 'Go' => array(
                     'userId' => array('name' => 'user_id', 'type' => 'string', 'require' => true, 'desc' => '用户ID'),
        ),
        );
    }


    /**
     * 服务商退出登录
     * #desc 用于服务商退出登录
     * @return string login_name 商户名
     * @return string sessionKey 商户凭证
     */
    public function Go() {
        $rs = array('code' => 0, 'msg' => '', 'info' => array());
        $domain = new Domain_Company_User();
        $info = $domain->getBaseInfo($this->userId);
        if(empty($info)){
            DI()->logger->debug('user not found', $this->userId);

            $rs['code'] = 106;
            $rs['msg'] = T('user not exists');
            return $rs;
        }
        try {
            $domain->logout($this->userId);

        }catch ( Exception $e ) {
            $rs ['code'] = $e->getCode ();
            $rs ['msg'] = $e->getMessage ();
        }

        return $rs;
    }

}

