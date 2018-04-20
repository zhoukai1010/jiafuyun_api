<?php

class Model_Order extends PhalApi_Model_NotORM {

    protected function getTableName($id) {
        return 'jfy_orders';
    }
}
