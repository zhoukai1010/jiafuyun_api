<?php

class Model_UserInformation extends PhalApi_Model_NotORM {

    protected function getTableName($id) {
        return 'jfy_user_information';
    }
}
