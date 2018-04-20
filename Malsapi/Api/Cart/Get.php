<?php
/**
 * 默认接口服务类
 *
 * @author: Dm
 */
class Api_Cart_Get extends PhalApi_Api {
	
	public function getRules() {
		return array (
				 'Go' => array(
                     'customerId' => array('name' => 'bbc_customer_id', 'type' => 'int', 'min' => 1, 'require' => true, 'desc' => '客户ID'),
            ),
		);
 	}
	
  
  /**
     * 获取购物车是否存在服务
     * #desc 用于获取购物车是否存在服务
     * #return int code 操作码，0表示成功
     * #return string status 状态:0 有效 1 无效
     */
    public function Go() {
        $rs = array('code' => 0, 'msg' => '', 'info' => array());

        $cartDomain = new Domain_ServiceCart();
        $info = $cartDomain->checkCart($this->customerId);
        if($info){
            $status = 0;
        }else{
            $status = 1;
        }
        $rs['info']['status'] = $status;

        return $rs;
    }
	
}
