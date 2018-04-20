<?php
/**
 * 启用家服卡
 *
 * @author: Zh
 */
class Api_Channel_Coupon_UnDisabled extends PhalApi_Api {

    public function getRules() {
        return array (
            'Go' => array(
                'couponId' => array('name' => 'coupon_id', 'type' => 'int', 'min' => 1, 'require' => true, 'desc' => '优惠券详情ID'),
            ),
        );
    }


    /**
     * 启用家服卡
     * #desc 用于启用家服卡
     * #return int code 操作码，0表示成功
     * #return int coupon_id 优惠券ID
     */
    public function Go() {
        $rs = array('code' => 0, 'msg' => '', 'info' => array());

        $domain = new Domain_ChannelCoupon();
        $data = array(
            'status' => 'y',
            'last_modify' => time(),
        );
        $id = $domain->updateDetails($this->couponId,$data);
        $rs['info']['status'] = $id;

        return $rs;
    }

}
