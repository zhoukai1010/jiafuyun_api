<?php
/**
 * 默认接口服务类
 *
 * @author: Dm
 */
class Api_Customer_Customer_InfoGet extends PhalApi_Api {
    
    public function getRules() {
        return array (
                 'Go' => array(
                    'customerId' => array('name' => 'customer_id', 'type' => 'int', 'min' => 1, 'require' => true, 'desc' => '客户ID'),
            ),
        );
    }
  
  /**
     * 获取单个客户信息
     * #desc 用于获取当前客户信息
     * #return int code 操作码，0表示成功
     * #return int id 客户ID
     * #return string mobile 电话号码
     * #return string nickname 客户昵称
     * #return string introduce 个人简介
     * #return string source 客户来源:h5 微信; pc 网页; mini 小程序
     * #return int create_time 注册时间
     * #return int last_modify 最后更新时间
  */
    public function Go() {
        $rs = array('code' => 0, 'msg' => '', 'info' => array());

        $domain = new Domain_Customer();
        $user = $domain->getBaseInfo($this->customerId);
        if( empty($user)){
            $rs['code'] = 104;
            $rs['msg'] = T('Customer not exists');
            return $rs;
        }

        $rs['info'] = $user;

        return $rs;
    }
    
}
