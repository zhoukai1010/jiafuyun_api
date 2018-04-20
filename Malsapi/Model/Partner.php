<?php

class Model_Partner extends PhalApi_Model_NotORM {

    protected function getTableName($id) {
        return 'jfy_partner';
    }
}
