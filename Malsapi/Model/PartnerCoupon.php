<?php

class Model_PartnerCoupon extends PhalApi_Model_NotORM {

    protected function getTableName($id) {
        return 'jfy_partner_coupon';
    }
}
