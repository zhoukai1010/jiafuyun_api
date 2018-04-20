<?php
/**
 * 默认接口服务类
 *
 * @author: Dm
 */
class Api_Customer_Wechat_Login extends PhalApi_Api {

    public function getRules() {
        return array (
            'Go' => array(

            ),
        );
    }


    /**
     * 微信客户登录
     * #desc 用于微信客户免登录
     */
    public function Go() {
        $rs = array('code' => 0, 'msg' => '', 'info' => array());

        $domain = new Domain_Customer();
        $info = $domain->wechatLogin();
        if (empty($info)) {
            $rs['code'] = 104;
            $rs['msg'] = T('Customer not exists');
            return $rs;
        }
        $rs['session'] = $info;

        return $rs;
    }

}

