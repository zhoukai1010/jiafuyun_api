<?php

class Model_Jiafuyun_SmsCheckCode extends PhalApi_Model_NotORM {

    protected function getTableName($id) {
//        return 'zab_sms_checkcode';
        return 'jfy_sms_checkcode';
    }
}
