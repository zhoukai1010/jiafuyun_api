<?php
/**
 * 默认接口服务类
 *
 * @author: Dm
 */
class Api_MiniSoft_WeChat_Check extends PhalApi_Api {

    public function getRules() {
        return array (
            'Go' => array(
                'openId' => array('name' => 'openid', 'type' => 'string', 'min' => 1, 'require' => true, 'desc' => '微信openid'),
                'customerId' => array('name' => 'bbc_customer_id', 'type' => 'int', 'min' => 1, 'require' => true, 'desc' => '会员ID'),
            ),
        );
    }


    /**
     * 微信小程序免登授权检测
     * #desc 用于微信免登授权检测
     */
    public function Go() {
        $rs = array('code' => 0, 'msg' => '', 'info' => array());

        try {
            $domain = new Domain_Customer();
            $info = $domain->minisoftWechatLoginCheck($this->openId, $this->customerId);

        }catch ( Exception $e ) {
            $rs ['code'] = $e->getCode ();
            $rs ['msg'] = $e->getMessage ();
        }

        $rs['info'] = $info;

        return $rs;
    }

}

