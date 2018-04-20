<?php

class Model_CustomerToCoupon extends PhalApi_Model_NotORM {

    protected function getTableName($id) {
        return 'jfy_customer_to_coupon';
    }
}
