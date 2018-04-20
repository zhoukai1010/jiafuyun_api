<?php
/**
 * 默认接口服务类
 *
 * @author: Dm
 */
class Api_Partner_Coupon_Add extends PhalApi_Api {

    public function getRules() {
        return array (
            'Go' => array(
                'contractId' => array('name' => 'contract_id', 'type' => 'int', 'min' => 1, 'require' => true, 'desc' => '合同ID'),
                'name' => array('name' => 'name', 'type' => 'string', 'min' => 1, 'require' => true, 'desc' => '优惠券名称'),
                'total' => array('name' => 'total', 'type' => 'int', 'min' => 1,'default' => 0, 'require' => true, 'desc' => '优惠券数量'),
                'faceValue' => array('name' => 'face_value', 'type' => 'int', 'min' => 1,'default' => 0, 'require' => true, 'desc' => '优惠券面额'),
                'failTime' => array('name' => 'fail_time', 'type' => 'string',  'require' => true, 'desc' => '优惠券失效时间'),
                'attributeType' => array('name' => 'attribute_type', 'type' => 'enum','range' => array('all'),  'require' => true, 'desc' => '适用的服务'),
                'description' => array('name' => 'description', 'type' => 'string',  'require' => true, 'desc' => '使用说明'),
                'country' => array('name' => 'country', 'type' => 'int', 'min' => 1, 'require' => true, 'desc' => '国家'),
                'province' => array('name' => 'province', 'type' => 'int', 'min' => 1, 'require' => true, 'desc' => '省份'),
                'city' => array('name' => 'city', 'type' => 'int', 'min' => 1, 'require' => true, 'desc' => '城市'),
                'district' => array('name' => 'district', 'type' => 'int', 'min' => 1, 'require' => true, 'desc' => '区县'),
                'address' => array('name' => 'address', 'type' => 'string', 'min' => 1, 'require' => true, 'desc' => '详细地址'),
            ),
        );
    }


    /**
     * 添加合作人优惠券
     * #desc 用于添加合作人优惠券
     * #return int code 操作码，0表示成功
     * #return int coupon_id 优惠券ID
     */
    public function Go() {
        $rs = array('code' => 0, 'msg' => '', 'info' => array());
        $contractDomain = new Domain_PartnerContract();
        $contractInfo = $contractDomain->getBaseInfo($this->contractId);
        if(! $contractInfo){
            $rs['code'] = 105;
            $rs['msg'] = T('Contract not exists');
            return $rs;
        }
        $domain = new Domain_PartnerCoupon();
        $data = array(
            'partner_id' => $contractInfo['partner_id'],
            'contract_id' => $this->contractId,
            'name' => $this->name,
            'total' => $this->total,
            'receive_num' => 0,
            'lave_num' => $this->total,
            'face_value' => $this->faceValue,
            'limit_num' => 0,
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
