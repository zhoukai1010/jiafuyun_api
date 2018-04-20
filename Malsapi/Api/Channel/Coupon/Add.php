<?php
/**
 * 添加家服卡
 *
 * @author: Zh
 */
class Api_Channel_Coupon_Add extends PhalApi_Api {

    public function getRules() {
        return array (
            'Go' => array(
                'contractId' => array('name' => 'contract_id', 'type' => 'int', 'min' => 1, 'require' => true, 'desc' => '合同ID'),
                'name' => array('name' => 'name', 'type' => 'string', 'min' => 1, 'require' => true, 'desc' => '家服卡名称'),
                'total' => array('name' => 'total', 'type' => 'int', 'min' => 1,'default' => 0, 'require' => true, 'desc' => '家服卡数量'),
                'faceValue' => array('name' => 'face_value', 'type' => 'int', 'min' => 0,'default' => 0, 'require' => true, 'desc' => '家服卡面额'),
                'failTime' => array('name' => 'fail_time', 'type' => 'string',  'require' => true, 'desc' => '家服卡失效时间'),
                'attributeType' => array('name' => 'attribute_type', 'type' => 'string',  'require' => true, 'desc' => '适用的服务'),
                'description' => array('name' => 'description', 'type' => 'string',  'require' => true, 'desc' => '使用说明'),
                'country' => array('name' => 'country', 'type' => 'int', 'min' => 1, 'require' => true, 'desc' => '国家'),
                'province' => array('name' => 'province', 'type' => 'int', 'min' => 1, 'require' => true, 'desc' => '省份'),
                'city' => array('name' => 'city', 'type' => 'int', 'min' => 1, 'require' => true, 'desc' => '城市'),
                'district' => array('name' => 'district', 'type' => 'int', 'min' => 1, 'require' => true, 'desc' => '区县'),
                'address' => array('name' => 'address', 'type' => 'string', 'require' => true, 'desc' => '详细地址'),
                'limitType' => array('name' => 'limit_type', 'type' => 'enum', 'range' => array('all', 'day', 'month') , 'require' => true, 'desc' => '领取限制 all同批次限制领取 day同批次每天限制领取 month 同批次每月限制领取'),
                'cartType' => array('name' => 'cart_type', 'type' => 'enum', 'range' => array('number', 'money'), 'require' => true, 'desc' => '家服卡类型 num 按次数服务 money 按钱服务'),
                'serviceNum' => array('name' => 'service_num', 'type' => 'int','min' => 0, 'require' => true, 'desc' => '一张家服卡服务多少次'),
                'limitNum' => array('name' => 'limit_num', 'type' => 'int', 'min' => 0, 'require' => true, 'desc' => '每个用户限制领的次数'),
            ),
        );
    }


    /**
     * 添加家服卡
     * #desc 添加家服卡
     * #return int code 操作码，0表示成功
     * #return int coupon_id 优惠券ID
     */
    public function Go() {
        $rs = array('code' => 0, 'msg' => '', 'info' => array());
        $contractDomain = new Domain_ChannelContract();
        $contractInfo = $contractDomain->getBaseInfo($this->contractId);
        if(! $contractInfo){
            $rs['code'] = 200;
            $rs['msg'] = T('Channel Contract not exists');
            return $rs;
        }
        if($contractInfo['status'] == 'finish'){
            $rs['code'] = 201;
            $rs['msg'] = T('The contract service has been completed');
            return $rs;
        }
        if($contractInfo['status'] == 'finish'){
            $rs['code'] = 202;
            $rs['msg'] = T('The contract service has been closed');
            return $rs;
        }
        $domain = new Domain_ChannelCoupon();
        $data = array(
            'partner_id' => $contractInfo['partner_id'],
            'contract_id' => $this->contractId,
            'name' => $this->name,
            'total' => $this->total,
            'receive_num' => 0,
            'lave_num' => $this->total,
            'face_value' => $this->faceValue,
            'limit_num' => $this->limitNum,
            'begin_time' => time(),
            'end_time' => 0,
            'status' => 'y',
            'fail_time' => strtotime($this->failTime),
            'attribute_type' => $this->attributeType,
            'description' => $this->description,
            'is_delete' => 'n',
            'country' => $this->country,
            'province' => $this->province,
            'city' => $this->city,
            'district' => $this->district,
            'address' => $this->address,
            'create_time' => time(),
            'last_modify' => time(),
            'limit_type' => $this->limitType,
            'cart_type' => $this->cartType,
            'service_num' => $this->serviceNum
        );
        try {
            DI ()->notorm->beginTransaction ( 'db_api' );
            $id = $domain->add($data);
            DI ()->notorm->commit( 'db_api' );

        } catch ( Exception $e ) {

            DI ()->notorm->rollback ( 'db_api' );
            $rs ['code'] = $e->getCode ();
            $rs ['msg'] = $e->getMessage ();
            return $rs;
        }

        $rs['info']['coupon_id'] = $id;

        return $rs;
    }

}
