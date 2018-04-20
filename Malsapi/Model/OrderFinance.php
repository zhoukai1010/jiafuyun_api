<?php

class Model_OrderFinance extends PhalApi_Model_NotORM {

    protected function getTableName($id) {
        return 'jfy_finance';
    }
}
