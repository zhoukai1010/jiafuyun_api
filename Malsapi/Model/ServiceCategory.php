<?php

class Model_ServiceCategory extends PhalApi_Model_NotORM {

    protected function getTableName($id) {
        return 'jfy_service_category';
    }
}
