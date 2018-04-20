<?php

class Model_Jiafuyun_UserGroup extends PhalApi_Model_NotORM {

    protected function getTableName($id) {
//        return 'zab_user_group';
        return 'jfy_user_group';
    }
}
