<?php

class Model_OrderLog extends PhalApi_Model_NotORM {

    protected function getTableName($id) {
        return 'jfy_order_log';
    }
}
