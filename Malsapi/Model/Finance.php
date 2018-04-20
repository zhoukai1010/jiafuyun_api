<?php

class Model_Finance extends PhalApi_Model_NotORM {

    protected function getTableName($id) {
        return 'jfy_finance';
    }
}
