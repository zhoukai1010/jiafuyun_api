<?php

class Model_UserStaff extends PhalApi_Model_NotORM {

    protected function getTableName($id) {
        return 'jfy_user_staff';
    }
}
