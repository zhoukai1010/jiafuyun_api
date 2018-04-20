<?php

class Model_OnlineSignUp extends PhalApi_Model_NotORM {

    protected function getTableName($id) {
        return 'jfy_customer_online_signup';
    }
}
