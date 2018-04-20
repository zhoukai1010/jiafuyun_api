<?php
/**
 * 默认接口服务类
 *
 * @author: Dm
 */
class Api_Customer_Customer_Login extends PhalApi_Api {

    public function getRules() {
        return array (
				 'Go' => array(
                     'mobile' => array('name' => 'mobile', 'type' => 'string', 'require' => true, 'desc' => '电话号码'),
                     'code' => array ('name' => 'code', 'type' => 'string', 'require' => false, 'min' => 6, 'desc' => '验证码'),
                     'loginPwd' => array('name' => 'login_pwd', 'type' => 'string', 'require' => false, 'min' => 6, 'max' => 16, 'desc' => '登录密码'),
        ),
        );
    }


    /**
     * 客户登录
     * #desc 用于客户的登录
     * @return string login_name 商户名
     * @return string sessionKey 商户凭证
     */
    public function Go() {
//        $rs = array('code' => 0, 'msg' => '', 'info' => array());
        try {
            $domain = new Domain_Customer();
            $user = $domain->userLogin($this->mobile,$this->code,$this->loginPwd);
            $rs = $user;
        }catch ( Exception $e ) {
            $rs ['code'] = $e->getCode ();
            $rs ['msg'] = $e->getMessage ();
        }

        return $rs;
    }

}

