<?php
/**
 * 默认接口服务类
 *
 * @author: Dm
 */
class Api_Customer_Customer_Logout extends PhalApi_Api {

    public function getRules() {
        return array (
				 'Go' => array(
                     'customerId' => array('name' => 'bbc_customer_id', 'type' => 'int', 'min' => 1, 'require' => true, 'desc' => '客户ID'),
        ),
        );
    }


    /**
     * 客户退出登录
     * #desc 用于客户的退出登录
     * @return string login_name 商户名
     * @return string sessionKey 商户凭证
     */
    public function Go() {
        $rs = array('code' => 0, 'msg' => '', 'info' => array());
        $domain = new Domain_Customer();
        $domain->logout($this->customerId);
        return $rs;
    }

}

