<?php
/**
 * 默认接口服务类
 *
 * @author: Dm
 */
class Api_Order_Appraise_Add extends PhalApi_Api {
	
	public function getRules() {
		return array (
				 'Go' => array(
                     'customerId' => array('name' => 'bbc_customer_id', 'type' => 'int', 'min' => 1, 'require' => false, 'desc' => '会员ID'),
                     'orderId' => array('name' => 'order_id', 'type' => 'int', 'min' => 1, 'require' => true, 'desc' => '订单ID'),
                     'level' => array('name' => 'level', 'type' => 'int', 'min' => 1, 'max' => 5,'require' => true, 'desc' => '评价星级'),
                     'mark' => array('name' => 'mark', 'type' => 'array','format' => 'json','require' => false, 'desc' => '标签'),
                     'content' => array('name' => 'content', 'type' => 'string','require' => false, 'desc' => '评价内容'),
            ),
		);
 	}
	
  
  /**
     * 添加订单评价
     * #desc 用于添加订单评价
     * #return int code 操作码，0表示成功
     * #return string address_details 收货地址详情
     */
    public function Go() {
        $rs = array('code' => 0, 'msg' => '', 'info' => array());

        $data = array(
            'order_id' => $this->orderId,
            'customer_id' => $this->customerId,
            'level' => $this->level,
            'mark' => json_encode($this->mark),
            'content' => $this->content,
        );
        try {
            $orderDomain = new Domain_Order();
            $result = $orderDomain->addAppraise($data);
            if(!$result){
                $rs['code'] = 101;
                $rs['msg'] = T('Add failed');
                return $rs;
            }

        }catch ( Exception $e ) {
            $rs ['code'] = $e->getCode ();
            $rs ['msg'] = $e->getMessage ();
            return $rs;
        }

        $rs['info']['appraise_id'] = $result;

        return $rs;
    }
	
}
