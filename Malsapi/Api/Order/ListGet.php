<?php
///**
// * 默认接口服务类
// *
// * @author: Dm
// */
//class Api_Order_ListGet extends PhalApi_Api {
//
//	public function getRules() {
//		return array (
//				 'Go' => array(
//                     'customerId' => array('name' => 'bbc_customer_id', 'type' => 'int', 'min' => 1, 'require' => true, 'desc' => '客户ID'),
//                     'orderStatus' => array('name' => 'order_status', 'type' => 'enum','range' => array('noPay','work','close','finish','all'), 'require' => true, 'desc' => '订单状态: noPay 未支付 work 工作中 close 关闭 finish 完成 all 全部'),
//                     'page' => array('name' => 'page', 'type' => 'int', 'min' => 1, 'default'=>1,'require' => true, 'desc' => '页码'),
//                     'pageSize' => array('name' => 'page_size', 'type' => 'int', 'min' => 1,'default'=>20, 'require' => true, 'desc' => '每页显示'),
//                     'orderby' => array('name' => 'orderby','type' => 'enum','range'=>array('id:asc','id:desc'), 'default'=>'id:asc','require' => true, 'desc' => '排序方式'),
//            ),
//		);
// 	}
//
//  /**
//     * 获取客户订单列表
//     * #desc 用于获取客户订单列表
//     * #return int code 操作码，0表示成功
//     */
//    public function Go() {
//        $rs = array('code' => 0, 'msg' => '', 'info' => array());
//        //判断客户是否存在
//        $domain = new Domain_Customer();
//        $info = $domain->getCustomerInfo($this->customerId);
//        if ( !$info) {
//            $rs['code'] = 160;
//            $rs['msg'] = T('Customer not exists');
//            return $rs;
//        }
//
//        $orderDomain = new Domain_Order();
//        $filter = array(
//            'bbc_customer_id' => $this->customerId,
//            'order_status' => $this->orderStatus,
//            'is_jfy' => 'y',
//            'page' => $this->page,
//            'page_size' => $this->pageSize,
//            'orderby' => $this->orderby,
//        );
//        $result = $orderDomain->getAllOrder($filter);
//        $list = $result['list'];
//        $total = $result['count'];
//
//        $rs['list'] = $list;
//        $rs['total'] = $total;
//
//        return $rs;
//    }
//
//}
