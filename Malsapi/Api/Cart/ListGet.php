<?php
/**
 * 默认接口服务类
 *
 * @author: Dm
 */
class Api_Cart_ListGet extends PhalApi_Api {
	
	public function getRules() {
		return array (
				 'Go' => array(
                     'customerId' => array('name' => 'bbc_customer_id', 'type' => 'int', 'min' => 1, 'require' => true, 'desc' => '客户ID'),
                     'page' => array('name' => 'page', 'type' => 'int', 'min' => 1, 'default'=>1,'require' => true, 'desc' => '页码'),
                     'pageSize' => array('name' => 'page_size', 'type' => 'int', 'min' => 1,'default'=>20, 'require' => true, 'desc' => '每页显示'),
                     'orderby' => array('name' => 'orderby','type' => 'enum','range'=>array('id:asc','id:desc'), 'default'=>'id:asc','require' => true, 'desc' => '排序方式'),
            ),
		);
 	}

  /**
     * 获取购物车列表
     * #desc 用于获取购物车列表
     * #return int code 操作码，0表示成功
     */
    public function Go() {
        $rs = array('code' => 0, 'msg' => '', 'info' => array());
        //判断客户是否存在
        $domain = new Domain_Customer();
        $info = $domain->getCustomerInfo($this->customerId);
        if ( !$info) {
            $rs['code'] = 160;
            $rs['msg'] = T('Customer not exists');
            return $rs;
        }

        $cartDomain = new Domain_ServiceCart();
        $filter = array(
            'customer_id' => $this->customerId,
            'page' => $this->page,
            'page_size' => $this->pageSize,
            'orderby' => $this->orderby,
        );
        $result = $cartDomain->getAllCart($filter);
        $list = $result['list'];
        $total = $result['count'];

        $rs['list'] = $list;
        $rs['total'] = $total;

        return $rs;
    }

}
