<?php

class Model_Channel extends PhalApi_Model_NotORM {

    protected function getTableName($id) {
        return 'jfy_channel';
    }
}
