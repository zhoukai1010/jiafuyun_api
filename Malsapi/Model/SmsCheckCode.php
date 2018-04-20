<?php

class Model_SmsCheckCode extends PhalApi_Model_NotORM {

    protected function getTableName($id) {
        return 'jfy_sms_checkcode';
    }
}
