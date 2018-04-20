<?php
/**
 * 默认接口服务类
 *
 * @author: Dm
 */
class Api_MiniSoft_WeChat_Login extends PhalApi_Api {

    public function getRules() {
        return array (
            'Go' => array(
                'openId' => array('name' => 'openid', 'type' => 'string', 'min' => 1, 'require' => true, 'desc' => '微信openid'),
            ),
        );
    }


    /**
     * 微信小程序客户登录
     * #desc 用于微信客户免登录
     */
    public function Go() {
        $rs = array('code' => 0, 'msg' => '', 'info' => array());

        $domain = new Domain_Customer();
        $info = $domain->minisoftWechatLogin($this->openId);
 
        $rs['session'] = $info;

        return $rs;
    }

}

