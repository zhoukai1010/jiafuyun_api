<?php

class Model_PartnerSession extends PhalApi_Model_NotORM {

    protected function getTableName($id) {
        return 'jfy_partner_session';
    }
}
