<?php

class Model_Jiafuyun_SmsSendLog extends PhalApi_Model_NotORM {

    protected function getTableName($id) {
//        return 'zab_sms_send_log';
        return 'jfy_sms_send_log';
    }
}
