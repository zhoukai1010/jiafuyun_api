<?php

class Model_CustomerSession extends PhalApi_Model_NotORM {

    protected function getTableName($id) {
        return 'jfy_customer_session';
    }
}
