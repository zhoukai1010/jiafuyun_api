<?php

class Model_ChannelCoupon extends PhalApi_Model_NotORM {

    protected function getTableName($id) {
        return 'jfy_channel_coupon';
    }
}
