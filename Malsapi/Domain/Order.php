<?php
class Domain_Order {

    //获取列表
    public function getAllOrder($filter){
        $result = jfb_request('Jiafubao_Order_Jfy_ListGet',$filter);
        if($result['ret'] == 200 && $result['data']['code'] == 0){
            $order['list'] = $result['data']['list'];
            $order['count'] = $result['data']['total'];
        }else{
            $order['list'] = array();
            $order['count'] = 0;
        }
        return $order;
    }

    //获取订单详情
    public function getOrderInfo($orderId){
        $filter = array(
            'order_id' => $orderId,
            'source' => 'shenpu',
        );
        $result = jfb_request('Jiafubao_Order_InfoGet',$filter);
        if($result['ret'] == 200 && $result['data']['code'] == 0){
            $order = $result['data']['info'];
        }else{
            $order = array();
        }
        return $order;
    }
    //获取订单和优惠券的关系Check.php
    public function getCouponInfo($customerId,$orderId){
        $rs = array();
        $orderToCouponModel = new Model_CouponToOrder();
        $filter = array('customer_id' => $customerId, 'order_id' => $orderId );
        $info = $orderToCouponModel->getByWhere($filter,'*');
        if($info['coupon_id'] != 0 && $info['coupon_details_id'] != 0){
            //获取优惠券信息
            $couponModel = new Model_PartnerCoupon ();
            $couponDetailsModel = new Model_PartnerCouponDetails();
            $coupon = $couponModel->get($info['coupon_id']);
            $couponDetails = $couponDetailsModel->get($info['coupon_details_id']);
            $rs['coupon_id'] = $info['coupon_id'];
            $rs['coupon_details_id'] = $info['coupon_details_id'];
            $rs['coupon_name'] = $coupon['name'];
            $rs['coupon_face_value'] = $coupon['face_value'];
            $rs['coupon_cdk'] = $couponDetails['cdk'];
        }
        return $rs;
    }

//    //订单确认页
//    public function confirm($data,$cart){
//        $rs = array();
//        $customerId = $data['customer_id'];
//        $couponDetailsId = $data['coupon_details_id'];
//        $addressId = $data['address_id'];
//        //收货地址
//        $address = array();
//        $address['consignee'] = '';
//        $address['mobile'] = '';
//        $address['zipcode'] = '';
//        $address['country'] = '';
//        $address['province'] = '';
//        $address['city'] = '';
//        $address['district'] = '';
//        $address['address'] = '';
//
//        //判断收货地址是否存在
//        if(isset($addressId) && $addressId > 0){
//            $customerDomain = new Domain_Customer();
//            $addressInfo = $customerDomain->getAddressInfo($customerId,$addressId);
//            if( ! $addressInfo){
//                throw new LogicException ( T ( 'Address not exists' ), 164 );
//            }
//            $address['consignee'] = $addressInfo['consignee'];
//            $address['mobile'] = $addressInfo['mobile'];
//            $address['zipcode'] = $addressInfo['zipcode'];
//            $address['country'] = $addressInfo['country'];
//            $address['province'] = $addressInfo['province'];
//            $address['city'] = $addressInfo['city'];
//            $address['district'] = $addressInfo['district'];
//            $address['country_name'] = $addressInfo['country_name'];
//            $address['province_name'] = $addressInfo['province_name'];
//            $address['city_name'] = $addressInfo['city_name'];
//            $address['district_name'] = $addressInfo['district_name'];
//            $address['address'] = $addressInfo['address'];
//            $address['address_details'] = $addressInfo['address_details'];
//        }
////        print_r($address);exit;
//        //获取服务信息
//        $serviceModel = new Model_Service();
//        $type_filter = array('service_type' => $cart['service_type']);
//        $serviceInfo = $serviceModel->getByWhere($type_filter,'*');
        //优惠价格、实付价格
//        $coupon_amount = 0.00;
//        $total_amount = $serviceInfo['price'];
//        $rs['coupon_name'] = '';
//        //判断优惠券是否存在
//        if(isset($couponDetailsId) && $couponDetailsId > 0){
//            $couponDomain = new Domain_Coupon();
//            $couponModel = new Model_PartnerCoupon ();
//            $couponDetailsModel = new Model_PartnerCouponDetails();
//            //判断是否领取优惠券
//            $coupon = $couponDomain->checkCustomerCoupon($customerId,$couponDetailsId);
//            if(!$coupon){
//                throw new LogicException ( T ( 'Coupon not exists' ), 230 );
//            }
//            //获取优惠券详情状态
//            $couponDetailsInfo = $couponDetailsModel->getByWhere(array('customer_id' => $customerId, 'id' => $couponDetailsId),'*');
//            if($couponDetailsInfo['status'] != 'get'){
//                throw new LogicException ( T ( 'Coupon has expired' ), 231 );
//            }
//            //获取优惠券类型详情
//            $couponInfo = $couponModel->get($coupon['coupon_id']);
//            //判断优惠券有效时间（0 永久有效）
//            if($couponInfo['fail_time'] != 0 ){
//                if( $couponInfo['fail_time'] < time() ){
//                    throw new LogicException ( T ( 'Coupon has expired' ), 231 );
//                }
//            }
////            //判断针对的服务
////            if($couponInfo['attribute_type'] != 'all'){
////
////            }
//            //判断优惠券服务地址
//            $address['country'] = $couponInfo['country'];
//            $address['province'] = $couponInfo['province'];
//            $address['city'] = $couponInfo['city'];
//            $address['district'] = $couponInfo['district'];
//            $address['address'] = $couponInfo['address'];
//            if($couponInfo['country'] > 0 && $couponInfo['province']> 0 && $couponInfo['city']> 0 && $couponInfo['district']> 0){
//                $domainArea = new Domain_Area();
//                $country = $domainArea->getAreaNameById($couponInfo['country']);
//                $province = $domainArea->getAreaNameById($couponInfo['province']);
//                $city = $domainArea->getAreaNameById($couponInfo['city']);
//                $district = $domainArea->getAreaNameById($couponInfo['district']);
//            }else{
//                throw new LogicException ( T ( 'Address not exists' ), 164 );
//            }
//            $address['country_name'] = $country;
//            $address['province_name'] = $province;
//            $address['city_name'] = $city;
//            $address['district_name'] = $district;
//            $address['address_details'] = $country.$province.$city.$district.$address['address'];
//
//            //计算优惠金额
//            $coupon_amount = $couponInfo['face_value'];
//            $total_amount = $serviceInfo['price'] - $couponInfo['face_value'];
//            if($total_amount < 0){
//                $total_amount = 0.00;
//            }
//            $rs['coupon_id'] = $couponInfo['id'];
//            $rs['coupon_name'] = $couponInfo['name'];
//            $rs['coupon_cdk'] = $couponDetailsInfo['cdk'];
//        }
//        $rs['customer_id'] = $customerId;
//        $rs['service_type'] = $cart['service_type'];
//        $rs['coupon_details_id'] = $couponDetailsId;
//        $rs['service_amount'] = $serviceInfo['price'];
//        $rs['coupon_amount'] = $coupon_amount;
//        $rs['total_amount'] = $total_amount;
//        $rs['address'] = $address;
//        $rs['cart'] = $cart;
//
//        return $rs;
//    }
    //订单确认页
    public function confirm($data)
    {
        $rs = array();
        $customerId = $data['customerId'];
        $addressId = $data['addressId'];
        //收货地址
        $address = array();
        $address['consignee'] = '';
        $address['mobile'] = '';
        $address['zipcode'] = '';
        $address['country'] = '';
        $address['province'] = '';
        $address['city'] = '';
        $address['district'] = '';
        $address['address'] = '';
        //判断收货地址是否存在
        if(isset($addressId) && $addressId > 0){
            $customerAddressDomain = new Domain_CustomerAddress();
            $addressInfo = $customerAddressDomain->getBaseInfo(
                $addressId,
                'id, customer_id, consignee, mobile, zipcode, country, province, city, district, address, is_default, create_time, last_modify
            ');
            if(!$addressInfo){
                throw new LogicException ( T ( 'Failure to obtain address information after a single failure' ), 156 );
            }
            $address['consignee'] = $addressInfo['consignee'];
            $address['mobile'] = $addressInfo['mobile'];
            $address['zipcode'] = $addressInfo['zipcode'];
            $address['country'] = $addressInfo['country'];
            $address['province'] = $addressInfo['province'];
            $address['city'] = $addressInfo['city'];
            $address['district'] = $addressInfo['district'];
            $address['country_name'] = $addressInfo['country_name'];
            $address['province_name'] = $addressInfo['province_name'];
            $address['city_name'] = $addressInfo['city_name'];
            $address['district_name'] = $addressInfo['district_name'];
            $address['address'] = $addressInfo['address'];
            $address['address_details'] = $addressInfo['address_details'];
        }
        //获取服务信息
        $serviceCategoryModel = new Model_ServiceCategory();
        $type_filter = array(
            'code' => $data['serviceType'],
            'pid != ?' => 0
        );
        $serviceInfo = $serviceCategoryModel->getByWhere($type_filter,'id, pid, name, price, content, status, img_src, config, service_hours, service_start_time, service_end_time, code, is_need_time, lower_single_type,payment_method,default_img');
        if(empty($serviceInfo)){
            throw new LogicException (
                T ( 'Unable to obtain service content in an order' ), 160 );
        }
        //进行服务的内容计算价钱
        $systemServiceInfo = json_decode($serviceInfo['config'], true);
        $customerServiceInfo = json_decode($data['serviceContent'], true);
        if($serviceInfo['lower_single_type'] == 'ordinary'){
            //是否是套餐
            if($data['serviceType'] == 'set_dinner' || $data['serviceType'] == 'health_package'){
                $result = $this->package($systemServiceInfo, $customerServiceInfo);
            }elseif($data['serviceType'] == 'open_wasteland'){//是否是开荒保洁
                $result = $this->open_wasteland($systemServiceInfo, $customerServiceInfo);
            }elseif($data['serviceType'] == 'medals'){ //是否是家庭收纳
                $result = $this->medals($systemServiceInfo, $customerServiceInfo);
            }else{
                $result = $this->ordinary($systemServiceInfo, $customerServiceInfo);
            }
        }elseif($serviceInfo['lower_single_type'] == 'long_term'){
            $result = $this->long_term($systemServiceInfo, $customerServiceInfo);
            $result['money'] = $serviceInfo['price'];
        }else{
            $rs['code'] = 175;
            $rs['msg'] = T('Lower_single_type error');
            return $rs;
        }
        $serviceContent = $result['content'];
        $moneySum = $result['money'];
        $total_amount = $moneySum;
        if($total_amount < 0){
            $total_amount = 0.00;
        }
        //实际需要支付的金额
        if($serviceInfo['lower_single_type'] == 'long_term'){
            $real_amount = 0.00;
        }else{
            $real_amount = $total_amount;
        }
        $rs['customer_id'] = $customerId;
        $rs['service_type'] = $data['serviceType'];
        $rs['service_amount'] = $serviceInfo['price'];
        $rs['address'] = $address;
        $rs['total_amount'] = $total_amount;
        $rs['discount_amount'] = 0.00;
        $rs['real_amount'] = $real_amount;
        $rs['service_content'] = $serviceContent;
        $rs['service_info'] = $serviceInfo;
        $rs['service_time'] = $data['serviceTime'];
        $rs['service_order_type'] = $serviceInfo['lower_single_type'];
        unset($rs['service_info']['config']);
        return $rs;
    }
    //长期订单
    public function long_term($systemServiceInfo, $customerServiceInfo){
        $contentArr = array();
        foreach($systemServiceInfo as $k=>$v){
            foreach($customerServiceInfo as $key=>$value){
                if($v['ename'] == $value['ename']){
                    $v['con'] = $value['con'];
                }
            }
            $contentArr[$k] = $v;
        }
        $moneySum = 0.00;
        $rs['money'] = $moneySum;
        $rs['content'] = $contentArr;
        return $rs;
    }
    //普通逻辑
    public function ordinary($systemServiceInfo, $customerServiceInfo){
        $moneyArr = array();
        $contentArr = array();
        foreach($systemServiceInfo as $k=>$v){
            foreach($customerServiceInfo as $key=>$value){
                if($v['ename'] == $value['ename']){
                    $v['con'] = $value['con'];
                    if(isset($v['value']) && isset($value['value']))
                    {
                        $v['value'] = $value['value'];
                    }
                    if(array_key_exists('price', $v) && !empty($value['con'])){
                        $moneyArr[] = number_format($v['price'] * $value['con'], 2,".","") ;
                    }
                }
            }
            $contentArr[$k] = $v;
        }
        $moneySum = number_format(array_sum($moneyArr),2,".","");
        $rs['money'] = $moneySum;
        $rs['content'] = $contentArr;
        return $rs;
    }
    //套餐处理逻辑
    public function package($systemServiceInfo, $customerServiceInfo){
        $moneyArr = array();
        $contentArr = array();
        foreach($systemServiceInfo as $k=>$v){
            foreach($customerServiceInfo as $key=>$value){
                if($v['ename'] == $value['ename']){
                    if(!array_key_exists((int)$value['index'], $v['tup'])){
                        throw new LogicException ( T ( 'The price is not in the array' ), 183);
                    }
                    $v['con'] = $value['con'];
                    $v['index'] = $value['index'];
                    $moneyArr[] = $v['tup'][$v['index']];
                }else{
                    throw new LogicException ( T ( 'Ename does not exist' ), 177);
                }
            }
            $contentArr[$k] = $v;
        }
        $moneySum = number_format(array_sum($moneyArr),2,".","");
        $rs['money'] = $moneySum;
        $rs['content'] = $contentArr;
        return $rs;
    }
    //开荒处理
    public function  open_wasteland($systemServiceInfo, $customerServiceInfo){
        $moneyArr = array();
        $contentArr = array();
        $dataKey = '';//tup中的键
        $dataValue = ''; //tup中的值
        foreach($systemServiceInfo as $k=>$v){
            foreach($customerServiceInfo as $key=>$value){
                if($v['ename'] == $value['ename']){
                    $v['con'] = $value['con'];
                    //处理键名和值
                    switch($v['ename']){
                        case 'home_area'://房屋面积
                            //匹配平方数量
                            if(preg_match('/^[0-9]+(.[0-9]{1})?$/', $value['con'])){
                                if($value['con'] > 0 && $value['con'] < 80){
                                    $dataValue = '80_down_';
                                }elseif($value['con'] >= 80){
                                    $dataValue = '80_up_';
                                }else{
                                    throw new LogicException ( T ( 'Housing area is not correct' ), 184);
                                }
                            }else{
                                throw new LogicException ( T ( 'Unsuccessful matching of housing area' ), 185);
                            }
                            break;
                        case 'furniture'://家具
                            switch($value['con']){
                                case '有家具':
                                    $dataValue .= 'yes';
                                    break;
                                case '无家具':
                                    $dataValue .= 'no';
                                    break;
                                default :
                                    throw new LogicException ( T ( 'Furniture type error' ), 186);
                            }
                            break;
                        case 'renovation'://装修
                            switch($value['con']){
                                case '新装修':
                                    $dataKey = 'new_decoration';
                                    break;
                                case '旧装修':
                                    $dataKey = 'old_decoration';
                                    break;
                                case '别墅/阁楼':
                                    $dataKey = 'villa';
                                    break;
                                default :
                                    throw new LogicException ( T ( 'Decoration type error' ), 187);
                            }
                            break;
                        default :
                            throw new LogicException ( T ( 'The Ename is not correct' ), 188);
                    }
                    //求具体总价
                    if($dataKey == 'new_decoration' || $dataKey == 'old_decoration' || $dataKey == 'villa'){
                        if(array_key_exists('sum', $v['tup'][$dataKey][$dataValue])){
                            $moneyArr[] = number_format($v['tup'][$dataKey][$dataValue]['sum'], 2,".","") ;
                        }elseif(array_key_exists('price', $v['tup'][$dataKey][$dataValue])){
                            $moneyArr[] = number_format(((float)$v['tup'][$dataKey][$dataValue]['price'] * (float)$customerServiceInfo[0]['con']), 2,".","") ;
                        }else{
                            throw new LogicException ( T ( 'Key decoration price is not correct' ), 189);
                        }
                    }
                }
            }
            $contentArr[$k] = $v;
        }
        $moneySum = number_format(array_sum($moneyArr),2,".","");
        $rs['money'] = $moneySum;
        $rs['content'] = $contentArr;
        return $rs;
    }
    //收纳处理
    public function medals($systemServiceInfo, $customerServiceInfo){
        $moneyArr = array();
        $contentArr = array();
        foreach($systemServiceInfo as $k=>$v){
            foreach($customerServiceInfo as $key=>$value){
                if($v['ename'] == $value['ename']){
                    $v['con'] = $value['con'];
                    if(isset($v['value']) && isset($value['value']))
                    {
                        $v['value'] = $value['value'];
                    }
                    $moneyArr[] = $v['price'];
                }else{
                    throw new LogicException ( T ( 'Storage ename does not exist' ), 190);
                }
            }
            unset($v['price']);
            $contentArr[$k] = $v;
        }
        $moneySum = number_format(array_sum($moneyArr),2,".","");
        $rs['money'] = $moneySum;
        $rs['content'] = $contentArr;
        return $rs;
    }
        //添加订单
    public function addOrder($data)
    {
        $rs = array();
        $confirm = $this->confirm($data);

        $orderParams = array(
            'user_id' => 0,
            'accept_user_id' => 0,
            'customer_id' => $confirm['customer_id'],
            'staff_id' => 0,
            'order_bn' => 'O'.date('Ymd').substr(time(),-5).substr(microtime(),4,6).sprintf('%02d',rand(0,99)),
            'total_amount' => $confirm['total_amount'],
            'service_amount' => $confirm['service_amount'],
            'discount_amount' => $confirm['discount_amount'],
            'real_amount' => $confirm['real_amount'],//实际需要支付金额
            'service_type' => $confirm['service_type'],
            'service_status' => 'wait',
            'custom_mark_text' => $data['customMarkText'],
            'admin_mark_text' => '',
            'create_time' => time(),
            'last_modify' => time(),
            'service_content' => json_encode($confirm['service_content'], JSON_UNESCAPED_UNICODE),
            'service_time' => strtotime($confirm['service_time']),
            'consignee' => $confirm['address']['consignee'],
            'address' => $confirm['address']['address'],
            'mobile' => $confirm['address']['mobile'],
            'country' => $confirm['address']['country'],
            'province' => $confirm['address']['province'],
            'city' => $confirm['address']['city'],
            'district' => $confirm['address']['district'],
            'publish' => 'n',
            'change_time' => 0,
            'source' => 'online',
            'pay_notice' => 'n',
            'visit_notice' => 'n',
            'goods_order_id' => 0,
            'supplement_mark_text' => '',
            'is_check' => 'n',
            'send_count' => 0,
            'payment_deadline' => strtotime('+15 Minute', time()),
            'order_type' => $confirm['service_order_type']
        );
        //创建订单
            $orderModel = new Model_Order();
            $orderId = $orderModel->insert($orderParams);
            if(! $orderId){
                throw new LogicException(T('Order create error'), 162);
            }

            //获取用户的openid
            $customerWechatDomain = new Domain_CustomerWechat();
            $userinfo = $customerWechatDomain->getInfo(array('customer_id'=>$confirm['customer_id']), 'openid');
            if(empty($userinfo)){
                throw new LogicException(T('Order create error'), 162);
            }

            //财务参数
            $financeParams = array(
                'about_id' => $orderId,
                'item_bn' => $orderParams['order_bn'],
                'price' => $orderParams['real_amount'],
                'serial_bn' => '',
                'openid' => $userinfo['openid'],
                'type' => 1,
                'is_coupon' => 0,
                'coupon_price' => 0.00,
                'status' => 'active',
                'customer_id' => $confirm['customer_id'],
                'pay_status' => 'wait',
                'pay_time' => 0,
                'pay_end_time' => strtotime('+15 Minutes', time()),
                'create_time' => time(),
                'last_modify' => time(),
                'remark' => '',
            );

            //添加财务信息
            $financeModel = new Model_Finance();
            $financeId = $financeModel->insert($financeParams);
            if(empty($financeId)){
                throw new LogicException(T('Order create error'), 162);
            }

            //订单日志数据
            $orderLogParmas = array(
                'order_id' => $orderId,
                'content' => '用户id为:'.$confirm['customer_id'].'的用户进行下单,订单号为:'.$orderId.'.订单总金额为'.$orderParams['total_amount'].'元，订单金额为.'.$orderParams['real_amount'].'元.',
                'create_time' => time(),
            );
            //添加日志
            $orderLogModel = new Model_OrderLog();
            $orderLogId = $orderLogModel->insert($orderLogParmas);
            if(! $orderLogId ){
                throw new LogicException(T('Order create error'), 162);
            }
            $rs['order_id'] = $orderId;
            $rs['finance_id'] = $financeId;
            $rs['order_bn'] = $orderParams['order_bn'];
            $rs['sum'] = $orderParams['total_amount'];
            $rs['timestamp'] = $orderParams['payment_deadline'];

        return $rs;
    }
    //添加订单
//    public function addOrder($data,$cart){
//        $rs = array();
//        $confirm = $this->confirm($data,$cart);
//
//        $params = array(
//            'bbc_customer_id' => $confirm['customer_id'],
//            'service_type' => $confirm['service_type'],
//            'content' => $cart['content'],
//            'total_amount' => $confirm['total_amount'],
//            'discount_amount' => $confirm['coupon_amount'],
//            'service_amount' => $confirm['service_amount'],
//            'consignee' => $confirm['address']['consignee'],
//            'ship_mobile' => $confirm['address']['mobile'],
//            'country' => $confirm['address']['country'],
//            'province' => $confirm['address']['province'],
//            'city' => $confirm['address']['city'],
//            'district' => $confirm['address']['district'],
//            'address' => $confirm['address']['address'],
//            'source' => 'online',
//            'goods_order_id' => 0,
//            'is_jfy' => 'y',
//        );
//        //判断是否使用优惠券
//        $couponDetailsId = $confirm['coupon_details_id'];
//        if(isset($couponDetailsId) && $couponDetailsId > 0){
//            $params['consignee'] = $data['consignee'];
//            $params['ship_mobile'] = $data['mobile'];
//            $params['address'] = $params['address'].$data['number'];
//            $params['mark'] = $data['mark'];
//        }
//        //清空购物车
//        $cartDomain = new Domain_ServiceCart();
//        $cartInfo = $cartDomain->deleteCart($cart['id']);
//        if( !$cartInfo){
//            throw new LogicException ( T ( 'Add failed' ), 101 );
//        }
//        //添加订单
//        $result = jfb_request('Jiafubao_Order_Jfy_Add',$params);
//        if($result['ret'] == 200 && $result['data']['code'] == 0){
//            $orderId = $result['data']['info']['order_id'];
//            $orderBn = $result['data']['info']['order_bn'];
//            $couponToOrderModel = new Model_CouponToOrder();
//            $couponDetailsModel = new Model_PartnerCouponDetails();
//            //判断是否使用优惠券
//            if(isset($couponDetailsId) && $couponDetailsId > 0){
//                //插入订单和优惠券关系
//                $data = array(
//                    'customer_id' => $confirm['customer_id'],
//                    'order_id' => $orderId,
//                    'coupon_id' => $confirm['coupon_id'],
//                    'coupon_details_id' => $couponDetailsId,
//                    'create_time' => time(),
//                );
//                $res = $couponToOrderModel->insert($data);
//                if( !$res){
//                    throw new LogicException ( T ( 'Add failed' ), 101 );
//                }
//                //更新优惠券使用
//                $confirm['coupon_cdk'];
//                $use_data = array(
//                    'status' => 'used',
//                    'last_modify' => time(),
//                );
//                $use = $couponDetailsModel->update($couponDetailsId,$use_data);
//                if( !$use){
//                    throw new LogicException ( T ( 'Add failed' ), 101 );
//                }
//            }else{
//                //插入订单
//                $data = array(
//                    'customer_id' => $confirm['customer_id'],
//                    'order_id' => $orderId,
//                    'create_time' => time(),
//                );
//                $res = $couponToOrderModel->insert($data);
//                if( !$res){
//                    throw new LogicException ( T ( 'Add failed' ), 101 );
//                }
//            }
//            $rs['order_id'] = $orderId;
//            $rs['order_bn'] = $orderBn;
//        }else{
//            throw new LogicException ( T ( 'Add failed' ), 101 );
//        }
//
//        return $rs;
//    }
//
//    //添加订单评价
//    public function addAppraise($data){
//        //查询用户和订单的关系
//        $orderToCouponModel = new Model_CouponToOrder();
//        $filter = array('order_id' => $data['order_id'], 'customer_id' => $data['customer_id']);
//        $info = $orderToCouponModel->getByWhere($filter, '*');
//        if(empty($info)){
//            throw new LogicException ( T ( 'Add failed' ), 101 );
//        }
//
//        $result = jfb_request('Jiafubao_Order_Appraise_Add',$data);
//        if($result['ret'] == 200 && $result['data']['code'] == 0){
//            $rs = $result['data']['info']['appraise_id'];
//            if( $rs){
//                return $rs;
//            }else{
//                return false;
//            }
//        }else{
//            return false;
//        }
//
//    }
}
