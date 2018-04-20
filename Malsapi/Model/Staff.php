<?php

class Model_Staff extends PhalApi_Model_NotORM {

    protected function getTableName($id) {
        return 'jfy_staff';
    }
}
