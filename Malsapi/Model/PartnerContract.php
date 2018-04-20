<?php

class Model_PartnerContract extends PhalApi_Model_NotORM {

    protected function getTableName($id) {
        return 'jfy_partner_contract';
    }
}
