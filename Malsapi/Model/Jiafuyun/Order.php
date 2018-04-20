<?php

class Model_Jiafuyun_Order extends PhalApi_Model_NotORM {

    protected function getTableName($id) {
//        return 'jfb_orders';
        return 'jfy_orders_2';
    }
}
