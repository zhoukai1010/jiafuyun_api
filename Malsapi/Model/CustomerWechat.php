<?php

class Model_CustomerWechat extends PhalApi_Model_NotORM {

    protected function getTableName($id) {
        return 'jfy_customer_wechat';
    }
}
