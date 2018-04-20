<?php
/**
 * 默认接口服务类
 *
 * @author: Dm
 */
class Api_Task_CloseUnPay extends PhalApi_Api {
	
	public function getRules() {
		return array (
				 'Go' => array(

            ),
		);
 	}
  
  /**
     * 关闭支付超时的订单
     * #desc 用于关闭支付超时的订单
     * #return int code 操作码，0表示成功
     * #return int id 订单ID
     */
    public function Go() {
        $rs = array('code' => 0, 'msg' => '', 'info' => array());
        //查询订单
        $domainOrder = new Domain_CustomerOrder();
        $closeRs = $domainOrder->closeUnPayOrder();
        return $rs;
    }
	
}
