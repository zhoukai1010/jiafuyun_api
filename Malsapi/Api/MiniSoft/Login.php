<?php
/**
 * 默认接口服务类
 *
 * @author: Dm
 */
class Api_MiniSoft_Login extends PhalApi_Api {

    public function getRules() {
        return array (
            'Go' => array(
                'openId' => array('name' => 'openid', 'type' => 'string', 'min' => 1, 'require' => true, 'desc' => '微信openid'),
                'mobile' => array('name' => 'mobile', 'type' => 'string', 'require' => true, 'desc' => '电话号码'),
                'loginPwd' => array('name' => 'login_pwd', 'type' => 'string', 'require' => false, 'min' => 6, 'max' => 16, 'desc' => '登录密码'),
                'code' => array ('name' => 'code', 'type' => 'string', 'require' => false, 'min' => 6, 'desc' => '验证码'),
            ),
        );
    }


    /**
     * 小程序客户登录
     * #desc 用于小程序客户登录
     */
    public function Go() {
        $rs = array('code' => 0, 'msg' => '', 'info' => array());

        $filter = array();
        if(!is_null($this->mobile)){
            $filter['mobile'] = $this->mobile;
        }

        try {
            $domain = new Domain_Customer();
            $info = $domain->minisoftCodeLogin($this->openId, $this->mobile, $this->loginPwd, $this->code);
            if (empty($info)) {
                $rs['code'] = 271;
                $rs['msg'] = T('Username or password is error');
                return $rs;
            }

        } catch ( Exception $e ) {

            $rs ['code'] = $e->getCode ();
            $rs ['msg'] = $e->getMessage ();
            return $rs;
        }

        $rs['info'] = $info;

        return $rs;
    }

}

