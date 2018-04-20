<?php

class Model_OrderPayLog extends PhalApi_Model_NotORM {

    protected function getTableName($id) {
        return 'jfy_order_pay_log';
    }
}
