<?php
/**
 *  创建订单
 *
 * @author: Zh
 */
class Api_Order_Create extends Api_Order_GetTime {
    public function getRules(){
        return array(
            'Go' => array(
                'customerId' => array(
                    'name' => 'customer_id',
                    'type' => "int",
                    'min' => 1,
                    'require' => true,
                    'desc' => '会员id'
                ),
                'customMarkText' => array(
                    'name' => 'custom_mark_text',
                    'type' => 'string',
                    'desc' => '买家订单备注',
                ),
                'serviceType' => array(
                    'name' => 'service_type',
                    'type' => 'string',
                    'require' => true,
                    'desc' => '服务类型'
                ),
                'serviceContent' => array(
                    'name' => 'service_content',
                    'type' => 'string',
                    'require' => true,
                    'desc' => '服务内容',
                ),
                'addressId' => array(
                    'name' => 'address_id',
                    'type' => 'int',
                    'require' => true,
                    'desc' => '地址id'
                ),
                'formType' => array(
                    'name' => 'source',
                    'type' => 'string',
                    'require' => true,
                    'desc' => '订单来源 offline线下 online线上'
                ),
                'serviceTime' => array(
                    'name' => 'service_time',
                    'type' => 'string',
                    'require' => true,
                    'desc' => '选择的服务时间 2018-01-01 08:00'
                ),
            ),
        );
    }

    /**
     * 创建订单
     * #desc 用于创建订单
     * #return int order_id 订单id
     * #return string order_bn 订单编号
     * #return string timestamp 订单截止时间戳
     * #return double sum 订单需要支付的金额
     */
    public function Go(){
        $rs = array(
            'code' => 0,
            'msg' => '',
            'info' => array()
        );
        //参数过滤
        if(empty($this->customerId)){
            $rs['code'] = 151;
            $rs['msg'] = T('customerId is not null');
            return $rs;
        }
        if(empty($this->serviceContent)){
            $rs['code'] = 152;
            $rs['msg'] = T('Service content error');
            return $rs;
        }
        if(empty($this->addressId)){
            $rs['code'] = 153;
            $rs['msg'] = T('AddressId error');
            return $rs;
        }
        if(empty($this->formType)){
            $rs['code'] = 154;
            $rs['msg'] = T('FormType error');
            return $rs;
        }
        if(empty($this->serviceType)){
            $rs['code'] = 155;
            $rs['msg'] = T('Service Type error');
            return $rs;
        }
        if(empty($this->serviceTime)){
            $rs['code'] = 148;
            $rs['msg'] = T('Service time parameters can not be empty');
            return $rs;
        }
        if(strtotime($this->serviceTime) -time() < 0){
            $rs['code'] = 168;
            $rs['msg'] = T('Service time error stipulated in the order');
            return $rs;
        }
//        $info = array();
        try {
            DI ()->notorm->beginTransaction ( 'db_api' );
            $orderInfo = array(
                'customerId' => $this->customerId,
                'customMarkText' => $this->customMarkText,
                'serviceType' => $this->serviceType,
                'serviceContent' => $this->serviceContent,
                'addressId' => $this->addressId,
                'formType' => $this->formType,
                'serviceTime' => $this->serviceTime,
            );
            $orderDomain = new Domain_Order();
            $info = $orderDomain->addOrder($orderInfo);

            DI ()->notorm->commit( 'db_api' );
        } catch ( Exception $e ) {

            DI ()->notorm->rollback ( 'db_api' );
            $rs ['code'] = $e->getCode ();
            $rs ['msg'] = $e->getMessage ();
        }
        $rs['order_info'] = $info;

        return $rs;
    }
}
