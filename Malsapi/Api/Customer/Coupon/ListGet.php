<?php
/**
 * 默认接口服务类
 *
 * @author: Dm
 */
class Api_Customer_Coupon_ListGet extends PhalApi_Api {
	
	public function getRules() {
		return array (
				 'Go' => array(
                     'customerId' => array('name' => 'bbc_customer_id', 'type' => 'int', 'min' => 1, 'require' => true, 'desc' => '客户ID'),
                     'status' => array('name' => 'status', 'type' => 'enum', 'range'=>array('get','used','n','all'), 'default'=>'all', 'require' => true, 'desc' => '状态：get 已领取 used 已使用 n 失效 all 全部'),
                     'page' => array('name' => 'page', 'type' => 'int', 'min' => 1, 'default'=>1,'require' => true, 'desc' => '页码'),
                     'pageSize' => array('name' => 'page_size', 'type' => 'int', 'min' => 1,'default'=>20, 'require' => true, 'desc' => '每页显示'),
                     'orderby' => array('name' => 'orderby','type' => 'enum','range'=>array('id:asc','id:desc'), 'default'=>'id:asc','require' => true, 'desc' => '排序方式'),
            ),
		);
 	}

  /**
     * 获取客户优惠券列表
     * #desc 用于获取客户优惠券列表
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

        $filter = array(
            'customer_id' => $this->customerId,
            'status' => $this->status,
        );
        $couponDomain = new Domain_Coupon();
        $list = $couponDomain->getAllByPage($filter,$this->page,$this->pageSize,$this->orderby);
        $total = $couponDomain->getCount($filter);

        $rs['list'] = $list;
        $rs['total'] = $total;

        return $rs;
    }

}
