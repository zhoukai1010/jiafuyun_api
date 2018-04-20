<?php

class Model_UserSession extends PhalApi_Model_NotORM {
    
    protected function getTableName($id) {
        return 'jfy_user_session';
    }
}
