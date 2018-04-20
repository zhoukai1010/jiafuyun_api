<?php
/**
 * 默认接口服务类
 *
 * @author: Dm
 */
class Api_Order_Confirm extends PhalApi_Api {
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
                'serviceCode' => array(
                    'name' => 'service_code',
                    'type' => 'string',
                    'require' => true,
                    'desc' => '分类标识码'
                ),
                'serviceTime' => array(
                    'name' => 'service_time',
                    'type' => 'string',
                    'require' => true,
                    'desc' => '选择的服务时间 2018-01-01 12:00'
                ),
                'serviceContent' => array(
                    'name' => 'service_content',
                    'type' => 'string',
                    'require' => true,
                    'desc' =>'服务的内容 例:冰箱2台 空调2台 json数据 {"bingxiang":{"num": 2, "type" : "双门"}, "kt":2,}'
                ),
                'addressId' => array(
                    'name' => 'address_id',
                    'type' => 'int',
                    'require' => true,
                    'desc' => '地址id'
                ),
            ),
        );
    }
  /**
     * 确认订单以及页面需要展示的内容
     * #desc 用于获取订单确认页面的信息
     * #return int code 操作码，0表示成功
     * #return int return customer_id 用户id
     * #return string service_type 服务code码
     * #return double service_amount 服务价格
     * #return string address 地址信息
     * #return double total_amount 订单总金额//总金额
     * #return string service_content 服务内容
     * #return string service_info 服务的所有字段
     * #return string service_time 约定的服务时间
     * #return double discount_amount 优惠金额
     * #return double real_amount 实际需要支付的金额
   */
    public function Go() {
        $rs = array('code' => 0, 'msg' => '', 'info' => array());
        //参数过滤
        if(empty($this->serviceCode)){
            $rs['code'] = 131;
            $rs['msg'] = T('Service identification code is empty');
            return $rs;
        }
        if(empty($this->serviceTime)){
            $rs['code'] = 148;
            $rs['msg'] = T('Service time parameters can not be empty');
            return $rs;
        }
        if(empty($this->serviceContent)){
            $rs['code'] = 149;
            $rs['msg'] = T('You have not selected the service content, please select the service content.');
            return $rs;
        }
        if(empty($this->addressId)){
            $rs['code'] = 166;
            $rs['msg'] = T('You have not selected the addressID, please select the addressID.');
            return $rs;
        }
        if(strtotime($this->serviceTime) -time() < 0){
            $rs['code'] = 167;
            $rs['msg'] = T('Appointed service time error');
            return $rs;
        }
        $data = array(
            'customerId' => $this->customerId,
            'serviceType' => $this->serviceCode,
            'serviceContent' => $this->serviceContent,
            'addressId' => $this->addressId,
            'serviceTime' => $this->serviceTime,
        );
        try {
            $orderDomain = new Domain_Order();
            $result = $orderDomain->confirm($data);

        }catch ( Exception $e ) {
            $rs ['code'] = $e->getCode ();
            $rs ['msg'] = $e->getMessage ();
            return $rs;
        }

        $rs['confirm'] = $result;
        return $rs;
    }
}
