<?php

class Model_OrderAppraise extends PhalApi_Model_NotORM {

    protected function getTableName($id) {
        return 'jfy_order_appraise';
    }
}