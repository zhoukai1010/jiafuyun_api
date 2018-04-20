<?php
/**
 * 默认接口服务类
 *
 * @author: Dm
 */
class Api_Partner_Coupon_Disabled extends PhalApi_Api {

    public function getRules() {
        return array (
            'Go' => array(
                'couponId' => array('name' => 'coupon_id', 'type' => 'int', 'min' => 1, 'require' => true, 'desc' => '优惠券详情ID'),
            ),
        );
    }


    /**
     * 禁用优惠券
     * #desc 用于禁用优惠券
     * #return int code 操作码，0表示成功
     * #return int coupon_id 优惠券ID
     */
    public function Go() {
        $rs = array('code' => 0, 'msg' => '', 'info' => array());

        $domain = new Domain_PartnerCoupon();
        $data = array(
            'status' => 'n',
            'last_modify' => time(),
        );
        $id = $domain->updateDetails($this->couponId,$data);
        $rs['info']['status'] = $id;

        return $rs;
    }

}
