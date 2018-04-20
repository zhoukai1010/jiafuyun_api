<?php
/*
 * +----------------------------------------------------------------------
 * | 支付
 * +----------------------------------------------------------------------
 * | Copyright (c) 2015 summer All rights reserved.
 * +----------------------------------------------------------------------
 * | Author: summer <aer_c@qq.com> <qq7579476>
 * +----------------------------------------------------------------------
 * | This is not a free software, unauthorized no use and dissemination.
 * +----------------------------------------------------------------------
 * | Date
 * +----------------------------------------------------------------------
 */

class Api_MiniSoft_Openid_Get extends PhalApi_Api {

	public function getRules() {
        return array(
            'Go' => array(
                'code' 	=> array('name' => 'code', 'type' =>'string', 'require' => true,  'desc' => '微信Code'),
            ),
        );
	}

    /**
     * 获取小程序访问者的openid
     * #desc 用于获取小程序访问者的openid
     * #return int code 操作码，0表示成功
     */
	public function Go(){
        $rs = array('code' => 0, 'msg' => '', 'info' => array());

        $appId = 'wx2a7a83c81e6d57dd';
        $secret = '370830e959e98e600e4fd7df7bd8f07a';
        $customerDomain = new Domain_Customer();
        $info = $customerDomain->changeOpenId($appId,$secret,$this->code);

        $rs['info'] = $info;
        return $rs;
	}
}