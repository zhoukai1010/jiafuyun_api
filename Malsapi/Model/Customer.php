<?php

class Model_Customer extends PhalApi_Model_NotORM {

    protected function getTableName($id) {
        return 'jfy_customer';
    }
}
