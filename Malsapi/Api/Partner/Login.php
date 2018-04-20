<?php
/**
 * 默认接口服务类
 *
 * @author: Dm
 */
class Api_Partner_Login extends PhalApi_Api {

    public function getRules() {
        return array (
            'Go' => array(
                'loginName' => array('name' => 'login_name', 'type' => 'string',  'require' => true, 'desc' => '手机号码'),
                'loginPwd' => array('name' => 'login_password', 'type' => 'string', 'min' => 6, 'max' => 20 , 'require' => true, 'desc' => '密码'),
            ),
        );
    }


    /**
     * 合作人登录
     * #desc 用于合作人登录
     * #return int code 操作码，0表示成功
     * #return int partner_id 合作人ID
     */
    public function Go() {
        $rs = array('code' => 0, 'msg' => '', 'info' => array());
        //查询商户名是否注册
        $domain = new Domain_Partner();
        $user = array(
            'login_name' => $this->loginName,
            'login_password' => $this->loginPwd,
        );
        try {
            $user = $domain->login($user);
        }catch ( Exception $e ) {
            $rs ['code'] = $e->getCode ();
            $rs ['msg'] = $e->getMessage ();
        }
        $rs['user'] = $user;
        return $rs;
    }

}
