<?php

class Model_UserStaffInsurance extends PhalApi_Model_NotORM {

    protected function getTableName($id) {
        return 'jfy_user_staff_insurance';
    }
}
