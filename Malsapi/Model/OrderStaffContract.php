<?php

class Model_OrderStaffContract extends PhalApi_Model_NotORM {

    protected function getTableName($id) {
        return 'jfy_order_staff_contract';
    }
}
