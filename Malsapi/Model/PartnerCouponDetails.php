<?php

class Model_PartnerCouponDetails extends PhalApi_Model_NotORM {

    protected function getTableName($id) {
        return 'jfy_partner_coupon_details';
    }
}
