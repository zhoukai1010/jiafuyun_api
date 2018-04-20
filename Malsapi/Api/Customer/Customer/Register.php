<?php
/**
 * 默认接口服务类
 *
 * @author: Dm
 */
class Api_Customer_Customer_Register extends PhalApi_Api {

    public function getRules() {
        return array (
				 'Go' => array(
                     'mobile' => array('name' => 'mobile', 'type' => 'string', 'require' => true, 'desc' => '电话号码'),
                     'code' => array ('name' => 'code', 'type' => 'string', 'require' => true, 'min' => 6, 'desc' => '验证码'),
                     'loginPwd' => array('name' => 'login_pwd', 'type' => 'string', 'min' => 6, 'max' => 16, 'require' => true, 'desc' => '登录密码'),
        ),
        );
    }


    /**
     * 客户注册
     * #desc 用于客户注册
     * @return string login_name 商户名
     * @return string sessionKey 商户凭证
     */
    public function Go() {
        try {
            $domain = new Domain_Customer();
            $user = $domain->Register($this->mobile,$this->code,$this->loginPwd);
            $rs = $user;
        }catch ( Exception $e ) {
            $rs ['code'] = $e->getCode ();
            $rs ['msg'] = $e->getMessage ();
        }

        return $rs;
    }

}

