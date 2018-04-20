<?php

class Model_UserLoginError extends PhalApi_Model_NotORM {
    protected function getTableName($id) {
        return 'jfy_user_login_error';
    }
}
