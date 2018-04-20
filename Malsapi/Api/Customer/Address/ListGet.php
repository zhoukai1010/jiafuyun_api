<?php
/**
 * 默认接口服务类
 *
 * @author: Dm
 */
class Api_Customer_Address_ListGet extends PhalApi_Api {
	
	public function getRules() {
		return array (
				 'Go' => array(
                     'customerId' => array('name' => 'customer_id', 'type' => 'int', 'min' => 1, 'require' => true, 'desc' => '客户ID'),
            ),
		);
 	}

  /**
     * 获取客户服务地址列表
     * #desc 用于获取客户服务地址列表
     * #return int code 操作码，0表示成功
     */
    public function Go() {
        $rs = array('code' => 0, 'msg' => '', 'info' => array());

        $customerDomain = new Domain_CustomerAddress();
        $filter = array('customer_id' => $this->customerId);
        $result = $customerDomain->getAddressList($filter);
        $count = $customerDomain->getCount($filter);
        $rs['list'] = $result;
        $rs['total'] = $count;
        return $rs;
    }

}
