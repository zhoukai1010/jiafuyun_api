<?php
/**
 * 获取家服卡使用详情
 *
 * @author: Zh
 */
class Api_Channel_Coupon_InfoGet extends PhalApi_Api {

    public function getRules() {
        return array (
            'Go' => array(
                'couponId' => array('name' => 'coupon_id', 'type' => 'int', 'min' => 1, 'require' => true, 'desc' => '家服卡类型ID'),
                'isUsed' => array('name' => 'is_used','type' => 'enum','range'=>array('y','n'), 'default'=>'y','require' => true, 'desc' => '查询的家服卡详情是否使用'),
                'page' => array('name' => 'page', 'type' => 'int', 'min' => 1, 'default'=>1,'require' => true, 'desc' => '页码'),
                'pageSize' => array('name' => 'page_size', 'type' => 'int', 'min' => 1,'default'=>20, 'require' => true, 'desc' => '每页显示'),
                'orderby' => array('name' => 'orderby','type' => 'enum','range'=>array('id:asc','id:desc'), 'default'=>'id:asc','require' => true, 'desc' => '排序方式'),
            ),
        );
    }

    /**
     * 获取家服卡使用详情
     * #desc 用于获取家服卡使用详情
     * #return int code 操作码，0表示成功
     */
    public function Go() {
        $rs = array('code' => 0, 'msg' => '', 'info' => array());
        $domain = new Domain_ChannelContract();
        $list = $domain->getUseDetails($this->couponId,$this->page,$this->pageSize,$this->orderby,$this->isUsed);
        $filter = array('partner_coupon_id' => $this->couponId);
        $count = $domain->getCouponDetailsCount($filter,$this->isUsed);
        $rs['list'] = $list;
        $rs['count'] = $count;
        return $rs;
    }

}
