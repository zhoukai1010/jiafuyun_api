<?php

class Model_ChannelContract extends PhalApi_Model_NotORM {

    protected function getTableName($id) {
        return 'jfy_channel_contract';
    }
}
