<?php

class Model_Jiafuyun_UserAuthRole extends PhalApi_Model_NotORM {

    protected function getTableName($id) {
        //返回数据表中数据
//        return 'jfb_user_auth_role';
        return 'jfy_user_auth_role';
    }
}
