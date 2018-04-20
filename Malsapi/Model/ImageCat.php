<?php

class Model_ImageCat extends PhalApi_Model_NotORM {

    protected function getTableName($id) {
        return 'jfy_img_cat';
    }
}
