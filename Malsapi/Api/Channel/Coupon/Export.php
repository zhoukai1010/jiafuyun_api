<?php
/**
 * 导出家服卡详情
 *
 * @author: Zh
 */
class Api_Channel_Coupon_Export extends PhalApi_Api {

    public function getRules() {
        return array (
            'Go' => array(
                'couponId' => array('name' => 'coupon_id', 'type' => 'int', 'min' => 1, 'require' => true, 'desc' => '优惠券类型ID'),
            ),
        );
    }

    /**
     * 获取导出家服卡详情
     * #desc 用于获取导出家服卡详情
     * #return int code 操作码，0表示成功
     */
    public function Go() {
        $rs = array('code' => 0, 'msg' => '', 'info' => array());
        $domain = new Domain_ChannelCoupon();
        $couponList = $domain->exportDetails($this->couponId);
        $rs['list'] = $couponList;
        return $rs;
    }

}
