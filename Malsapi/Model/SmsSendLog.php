<?php

class Model_SmsSendLog extends PhalApi_Model_NotORM {

    protected function getTableName($id) {
        return 'jfy_sms_send_log';
    }
}
