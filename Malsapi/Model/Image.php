<?php

class Model_Image extends PhalApi_Model_NotORM {

    protected function getTableName($id) {
        return 'jfy_img';
    }
}
