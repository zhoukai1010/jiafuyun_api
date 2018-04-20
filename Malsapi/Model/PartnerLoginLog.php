<?php

class Model_PartnerLoginLog extends PhalApi_Model_NotORM {

    protected function getTableName($id) {
        return 'jfy_partner_login_log';
    }
}
