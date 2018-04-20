<?php
/**
 * 默认接口服务类
 *
 * @author: Dm
 */
class Api_Cart_Delete extends PhalApi_Api {
	
	public function getRules() {
		return array (
				 'Go' => array(
                     'cartId' => array('name' => 'cart_id', 'type' => 'string', 'min' => 1, 'require' => true, 'desc' => '购物车ID,多个用“,”隔开'),
            ),
		);
 	}
	
  
  /**
     * 删除服务购物车
     * #desc 用于删除服务购物车
     * #return int code 操作码，0表示成功
     * #return int cart_it 删除记录的ID
     */
    public function Go() {
        $rs = array('code' => 0, 'msg' => '', 'info' => array());

        $cartDomain = new Domain_ServiceCart();
        $info = $cartDomain->deleteCart($this->cartId);
        if (! $info) {
            DI()->logger->debug('Cart not found', $this->cartId);

            $rs['code'] = 120;
            $rs['msg'] = T('Cart not exists');
            return $rs;
        }
        
        $rs['info']['cart_id'] = $this->cartId;

        return $rs;
    }
	
}
