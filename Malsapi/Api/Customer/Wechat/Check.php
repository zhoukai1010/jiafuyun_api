<?php
/**
 * 默认接口服务类
 *
 * @author: Dm
 */
class Api_Customer_Wechat_Check extends PhalApi_Api {

    public function getRules() {
        return array (
            'Go' => array(
                'customerId' => array('name' => 'customer_id', 'type' => 'int', 'min' => 1, 'require' => true, 'desc' => '会员ID'),
            ),
        );
    }


    /**
     * 会员微信免登授权检测
     * #desc 用于会员微信免登授权检测
     */
    public function Go() {
        $rs = array('code' => 0, 'msg' => '', 'info' => array());
        //查找用户
        $customerDomain = new Domain_Customer();
        $customerId = $this->customerId;
        $info = $customerDomain->getBaseInfo($customerId);
        if (empty($info)) {
            $rs['code'] = 104;
            $rs['msg'] = T('Customer not exists');
            return $rs;
        }
        $info = $customerDomain->wechatCheck($customerId);

        $rs['info'] = $info;

        return $rs;
    }

}

