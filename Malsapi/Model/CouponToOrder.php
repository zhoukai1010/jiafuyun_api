<?php

class Model_CouponToOrder extends PhalApi_Model_NotORM {

    protected function getTableName($id) {
        return 'jfy_coupon_to_order';
    }
}
