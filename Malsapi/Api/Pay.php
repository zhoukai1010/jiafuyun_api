<?php
/*
 * +----------------------------------------------------------------------
 * | 支付
 * +----------------------------------------------------------------------
 * | Copyright (c) 2015 summer All rights reserved.
 * +----------------------------------------------------------------------
 * | Author: summer <aer_c@qq.com> <qq7579476>
 * +----------------------------------------------------------------------
 * | This is not a free software, unauthorized no use and dissemination.
 * +----------------------------------------------------------------------
 * | Date
 * +----------------------------------------------------------------------
 */

class Api_Pay extends PhalApi_Api {

	public function getRules() {
        return array(
            'Go' => array(
                'orderId' 	=> array('name' => 'order_id', 'type' =>'string', 'require' => true,  'desc' => '订单支付记录ID'),
                'type' 	=> array('name' => 'type', 'type' =>'enum', 'require' => true, 'range' => array('aliwap', 'WeChat'), 'desc' => '引擎类型，比如aliwap')
            ),
        );
	}

	/**
	 * 支付接口
	 * @return [type] [description]
	 */
	public function Go(){
        $rs = array('code' => 0, 'msg' => '', 'info' => array());
        //查询订单支付记录信息
        $payDomain = new Domain_Pay();
        $orderInfo = $payDomain->getOrderPay($this->orderId);
        if (empty($orderInfo)) {
            DI()->logger->debug('Order not found', $this->orderId);

            $rs['code'] = 143;
            $rs['msg'] = T('Order not exists');
            return $rs;
        }
        //判断订单记录是否支付
        if($orderInfo['pay_status'] == 'succ'){
            DI()->logger->debug('Order is already pay', $this->orderId);

            $rs['code'] = 144;
            $rs['msg'] = T('Order is already pay');
            return $rs;
        }
        //判断订单状态
        $order = $payDomain->orderInfo($orderInfo['about_id']);
        if($order['service_status'] != 'wait'){
            $rs['code'] = 145;
            $rs['msg'] = T('The order is can not pay');
            return $rs;
        }

        //获取付款的openid
//        $agentInfo = DI ()->cookie->get('jfy_ci');
//        $agentInfo = json_decode($agentInfo,true);
        $customerWeChatModel = new Model_CustomerWechat();
        $agentInfo = $customerWeChatModel->getByWhere(array('customer_id' => $order['customer_id'], 'openid'));
        if(isset($agentInfo)){
            $openId = $agentInfo['openid'];
        }else{
            $openId = false;
        }
        if(! $openId){
            DI()->logger->debug('Get OpenId false', $this->orderId);

            $rs['code'] = 146;
            $rs['msg'] = T('Get OpenId false');
            return $rs;
        }

		//获取对应的支付引擎
        $type = ucfirst(strtolower($this->type));
        DI()->pay->set($type,false);

        $data = array();
        $data['order_no'] = $orderInfo['item_bn'];
        $data['title'] = '家服云消费';
        $data['body'] = '家服云消费';
        $data['price'] = $orderInfo['price'];
        $data['openid'] = $openId;
        $rs['info'] =  DI()->pay->buildRequestForm($data);

        return $rs;
	}
}