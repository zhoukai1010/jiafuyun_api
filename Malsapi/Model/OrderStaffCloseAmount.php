<?php

class Model_OrderStaffCloseAmount extends PhalApi_Model_NotORM {

    protected function getTableName($id) {
        return 'jfy_order_staff_close_amount';
    }
}