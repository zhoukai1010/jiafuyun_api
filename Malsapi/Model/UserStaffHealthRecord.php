<?php

class Model_UserStaffHealthRecord extends PhalApi_Model_NotORM {

    protected function getTableName($id) {
        return 'jfy_user_staff_health_record';
    }
}
