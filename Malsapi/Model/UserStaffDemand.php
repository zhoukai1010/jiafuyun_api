<?php

class Model_UserStaffDemand extends PhalApi_Model_NotORM {

    protected function getTableName($id) {
        return 'jfy_user_staff_demand';
    }
}
