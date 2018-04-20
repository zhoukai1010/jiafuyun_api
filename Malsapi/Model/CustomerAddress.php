<?php

class Model_CustomerAddress extends PhalApi_Model_NotORM {

    protected function getTableName($id) {
        return 'jfy_customer_address';
    }
}
