<?php

class Model_User extends PhalApi_Model_NotORM {

    protected function getTableName($id) {
        return 'jfy_user';
    }
}
