<?php
/**
 * 默认接口服务类
 *
 * @author: Dm
 */
class Api_Customer_InfoGet extends PhalApi_Api {

    public function getRules() {
        return array (
            'Go' => array(
                'customerId' => array('name' => 'customer_id', 'type' => 'int', 'min' => 1, 'require' => true, 'desc' => '会员ID'),
            ),
        );
    }


    /**
     * 客户详细资料
     * #desc 用于获取当前客户账号资料
     */
    public function Go() {
        $rs = array('code' => 0, 'msg' => '', 'info' => array());

        //判断客户是否存在
        $domain = new Domain_Customer();
        $customer = $domain->getBaseInfo($this->customerId);
        if( empty($customer)){
            $rs['code'] = 104;
            $rs['msg'] = T('Customer not exists');
            return $rs;
        }
        //获取微信资料
        $customerInfo = $domain->weChatInfo($customer);

        $rs['info'] = $customerInfo;
        return $rs;
    }

}

