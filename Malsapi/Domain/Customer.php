<?php
class Domain_Customer {
    public function __construct(){
        $this->model = new Model_Customer();
    }

//    //发送短信
//    public function SmsCode($mobile){
//        $params= array(
//            'mobile' => $mobile
//        );
//
//        $result = sp_request('Shenpu_Sms_SendCode.Go',$params);
//        $result = $result['data'];
//        return $result;
//    }

//    //客户注册
//    public function Register($mobile,$code,$loginPwd){
//        $params = array(
//            'login_pwd' => $loginPwd,
//            'mobile' => $mobile,
//            'code' => $code,
//            'source' => 'h5',
//        );
//
//        $result = sp_request('Bbc_Customer_Register.Go',$params);
//        if($result['ret'] == 200 && $result['data']['code'] == 0){
//            $info = $result['data']['info'];
//            unset($info['login_pwd']);
//            $result = array('code' => 0, 'msg' => '', 'info' => $info);
//        }else{
//            $result = $result['data'];
//        }
//        return $result;
//    }
//
//    //客户登录
//    public function userLogin($mobile,$code,$loginPwd){
//        $params = array(
//            'mobile' => $mobile,
//        );
//        if(isset($code)){
//            $params['code'] = $code;
//        }else{
//            $params['login_pwd'] = $loginPwd;
//        }
//
//        $result = sp_request('Bbc_Customer_Login.Go',$params);
//        if($result['ret'] == 200 && $result['data']['code'] == 0){
//            $info = $result['data']['info'];
//            unset($info['salt']); unset($info['login_pwd']);
//            $result = array('code' => 0, 'msg' => '', 'info' => $info);
//        }else{
//            $result = $result['data'];
//        }
//        return $result;
//    }

    //获取sessionCheck
    public function checkSession($session){
        $params= array(
            'session' => $session,
        );
        $result = sp_request('Bbc_Customer_SessionCheck.Go',$params);
        $result = $result['data'];
        //判断session是否有效
        if( $result['status'] == 1 ){
            $result = $result['info'];
        }else{
            return false;
        }
        return $result;
    }

//    //客户退出
//    public function logout($customerId){
//        $params = array(
//            'customer_id' => $customerId,
//        );
//
//        $result = sp_request('Bbc_Customer_Logout.Go',$params);
//        if($result['ret'] == 200 && $result['data']['code'] == 0){
//            $result = $result['data']['info'];
//        }else{
//            return false;
//        }
//
//        return $result;
//    }

//    //获取客户详情
//    public function getCustomerInfo($customerId){
//        $params = array(
//            'customer_id' => $customerId,
//        );
//
//        $result = sp_request('Bbc_Customer_InfoGet.Go',$params);
//        if($result['ret'] == 200 && $result['data']['code'] == 0){
//            $result = $result['data']['info'];
//        }else{
//            return false;
//        }
//
//        return $result;
//    }

//    //收货地址列表
//    public function getAllAddress($customerId){
//        $params = array(
//            'bbc_customer_id' => $customerId,
//        );
//        $result = sp_request('Shenpu_Customer_Address_ListGet.Go',$params);
//        if($result['ret'] == 200 && $result['data']['code'] == 0){
//            $order['list'] = $result['data']['list'];
//            $order['count'] = $result['data']['count'];
//        }else{
//            $order['list'] = array();
//            $order['count'] = 0;
//        }
//        return $order;
//    }
    //获取详情
//    public function getAddressInfo($customerId,$addressId){
//        $params = array(
//            'bbc_customer_id' => $customerId,
//            'address_id' => $addressId,
//        );
//
//        $result = sp_request('Shenpu_Customer_Address_InfoGet.Go',$params);
//        if($result['ret'] == 200 && $result['data']['code'] == 0){
//            $info = $result['data']['info'];
//        }else{
//            return false;
//        }
//        return $info;
//    }
//    //添加收货地址
//    public function addAddress($data){
//        $params = array(
//            'bbc_customer_id' => $data['customer_id'],
//            'consignee' => $data['consignee'],
//            'mobile' => $data['mobile'],
//            'zipcode' => $data['zipcode'],
//            'country' => 1,
//            'province' => $data['province'],
//            'city' => $data['city'],
//            'district' => $data['district'],
//            'address' => $data['address'],
//            'is_default' => $data['is_default'],
//        );
//
//        $result = sp_request('Shenpu_Customer_Address_Add.Go',$params);
//        return $result;
//    }
//    //更新收货地址
//    public function updateAddress($data){
//        $params = array(
//            'bbc_customer_id' => $data['customer_id'],
//            'address_id' => $data['address_id'],
//            'consignee' => $data['consignee'],
//            'mobile' => $data['mobile'],
//            'zipcode' => $data['zipcode'],
//            'country' => 1,
//            'province' => $data['province'],
//            'city' => $data['city'],
//            'district' => $data['district'],
//            'address' => $data['address'],
//            'is_default' => $data['is_default'],
//        );
//        $result = sp_request('Shenpu_Customer_Address_Update.Go',$params);
//        return $result;
//    }
//    //删除收货地址
//    public function delAddress($filter){
//        $params = array(
//            'bbc_customer_id' => $filter['customer_id'],
//            'address_id' => $filter['address_id']
//        );
//        $result = sp_request('Shenpu_Customer_Address_Delete.Go',$params);
//        return $result;
//    }
//    //设置默认收货地址
//    public function setDefaultAddress($filter){
//        $params = array(
//            'bbc_customer_id' => $filter['customer_id'],
//            'address_id' => $filter['address_id']
//        );
//        $result = sp_request('Shenpu_Customer_Address_Default.Go',$params);
//        return $result;
//    }

//    //小程序微信登录
//    public function minisoftWechatLogin($openId){
//        $params = array(
//            'openid' => $openId,
//        );
//        $result = sp_request('Shenpu_MiniSoft_Customer_WeChat_Login.Go',$params);
//        if($result['ret'] == 200 && $result['data']['code'] == 0){
//            return $result['data']['session'];
//        }else{
//            return false;
//        }
//    }
//    //小程序免登检测
//    public function minisoftWechatLoginCheck($openId, $customerId){
//        $params = array(
//            'openid' => $openId,
//            'bbc_customer_id' => $customerId,
//        );
//        $result = sp_request('Shenpu_MiniSoft_Customer_WeChat_Check.Go',$params);
//        if($result['ret'] == 200 && $result['data']['code'] == 0){
//            return $result['data']['info'];
//        }else{
//            return false;
//        }
//    }
//    //小程序验证码登录
//    public function minisoftCodeLogin($openId, $mobile, $loginPwd, $code){
//        $params = array(
//            'openid' => $openId,
//            'mobile' => $mobile,
//            'login_pwd' => $loginPwd,
//            'code' => $code,
//        );
//        $result = sp_request('Shenpu_MiniSoft_Customer_Login.Go',$params);
//        if($result['ret'] == 200 && $result['data']['code'] == 0){
//            return $result['data']['info'];
//        }else{
//            return false;
//        }
//    }
    //获取会员信息
    public function getBaseInfo($id,$cols = '*'){
        $info = $this->model->get($id,$cols);
        return $info;
    }
    //微信免登检测
    public function wechatCheck($customerId){
        $filter = array();
        $customerInfo = DI ()->cookie->get('jfy_ci');
        $customerInfo = json_decode($customerInfo,true);
        if(isset($customerInfo)){
            $filter['openid'] =  $customerInfo['openid'];
        }else{
            return false;
        }
        $wechatModel = new Model_CustomerWechat();
        $wechatInfo = $wechatModel->getByWhere($filter);
        if($wechatInfo){
            //微信信息存在-匹配是否更新
            if($wechatInfo['customer_id'] != $customerId){
                $updateData ['customer_id'] = $customerId;
            }
            if($wechatInfo['nickname'] != $customerInfo['nickname']){
                $updateData ['nickname'] = $customerInfo['nickname'];
            }
            if($wechatInfo['country'] != $customerInfo['country']){
                $updateData ['country'] = $customerInfo['country'];
            }
            if($wechatInfo['province'] != $customerInfo['province']){
                $updateData ['province'] = $customerInfo['province'];
            }
            if($wechatInfo['city'] != $customerInfo['city']){
                $updateData ['city'] = $customerInfo['city'];
            }
            if($wechatInfo['headimgurl'] != $customerInfo['headimgurl']){
                $updateData ['headimgurl'] = $customerInfo['headimgurl'];
            }
            if(is_array($updateData)){
                $updateData['last_modify'] = time();
                $customerWechatRs = $wechatModel -> update($wechatInfo['id'],$updateData);
                if(! $customerWechatRs){
                    return false;
                }else{
                    return $wechatInfo['id'];
                }
            }
        }else{
            //没有微信信息-添加该会员微信信息
            $data = array(
                'customer_id' => $customerId,
                'openid' => $customerInfo['openid'],
                'nickname' => $customerInfo['nickname'],
                'sex' => $customerInfo['sex'],
                'country' => $customerInfo['country'],
                'province' => $customerInfo['province'],
                'city' => $customerInfo['city'],
                'headimgurl' => $customerInfo['headimgurl'],
                'create_time' => time(),
                'last_modify' => time(),
            );
            $customerWechatId = $wechatModel->insert($data);
            if(! $customerWechatId){
                return false;
            }
            return $customerWechatId;
        }
    }
    //微信免登
    public function wechatLogin(){
        $customerInfo = DI ()->cookie->get('jfy_ci');
        $customerInfo = json_decode($customerInfo,true);
        if(isset($customerInfo)){
            $filter['openid'] =  $customerInfo['openid'];
        }else{
            return false;
        }
        $customerWechatModel = new Model_CustomerWechat();
        $customerWechatInfo = $customerWechatModel->getByWhere($filter);
        if(! $customerWechatInfo){
            return false;
        }
        $customerId = $customerWechatInfo['customer_id'];
        $customerSessionDomain = new Domain_CustomerSession();
        $session = $customerSessionDomain->makeSession($customerId);
        return $session;
    }
    //验证码登录
    public function codeLogin($mobile){
        $rs = array ();
        $filter = array('mobile' => $mobile);
        //获取客户信息c
        $customerModel = new Model_Customer();
        $rs = $customerModel->getByWhere ( $filter );
        if (! $rs){
            //会员不存在---创建会员
            $rs = array(
                'mobile' => $mobile,
                'source' => 'h5',
                'create_time' => time(),
                'last_modify' => time(),
            );
            $rs['id'] = $customerModel->insert($rs);
            if(!  $rs['id']){
                throw new LogicException ( T ( 'Login failed' ), 110 );
            }
        }
        $customerSession = new Domain_CustomerSession();
        $session =  $customerSession->makeSession($rs ['id']);
        //种入COOKIE
        $rs['session'] = $session;
        return $rs;
    }

    public function changeOpenId($appId,$secret,$code){
        $url = 'https://api.weixin.qq.com/sns/jscode2session?appid='.$appId.'&secret='.$secret.'&js_code='.$code.'&grant_type=authorization_code';
        $result = $this->send_post($url);
        $result = json_decode($result,true);
        return $result;
    }
    private function send_post($url, $post_data = '') {
        $options = array(
            'http' => array(
                'method' => 'POST',
                'header' => 'Content-type:application/x-www-form-urlencoded',
                'content' => $post_data,
                'timeout' => 15 * 60 // 超时时间（单位:s）
            )
        );
        $context = stream_context_create($options);
        $result = file_get_contents($url, false, $context);

        return $result;
    }

    //获取列表
    public function getAllByPage($filter, $page = 1, $page_size = 20, $orderby = ''){
        $rs = $this->model->getAll ( '*', $filter, $page, $page_size, $orderby );
        $wechatModel = new Model_CustomerWechat();
        foreach ($rs as $key=>$value){
            $wechat = $wechatModel->getByWhere(array('customer_id' => $value['id']), '*');
            if(!empty($wechat)){
                $rs[$key]['wechat'] = $wechat;
            }else{
                $rs[$key]['wechat'] = array();
            }
        }
        return $rs;
    }
    //获取数量
    public function getCount($filter) {
        return $this->model->getCount ( $filter );
    }
    //检测是否已报名
    public function checkOnline($customerId){
        $onlineModel = new Model_OnlineSignUp();
        return $onlineModel->getByWhere(array('customer_id' => $customerId, '*'));
    }
    //添加在线报名
    public function addOnlineSignUp($data){
        $onlineModel = new Model_OnlineSignUp();
        $rs = $onlineModel->insert($data);
        return $rs;
    }
    //获取报名列表
    public function getAllOnline($filter, $page = 1, $page_size = 20, $orderby = ''){
        $onlineModel = new Model_OnlineSignUp();
        $rs = $onlineModel->getAll ( '*', $filter, $page, $page_size, $orderby );
        foreach ($rs as $key=>$value){
            $rs[$key]['birthday'] = date("Y-m-d", $value['birthday']);
            $work_intention = '';
            $workIntention = json_decode($value['work_intention'], true);
            foreach ($workIntention as $_v){
                $work_intention .= $_v.' | ';
            }
            $rs[$key]['work_intention'] = $work_intention;
        }
        return $rs;
    }
    //获取报名数量
    public function getCountOnline($filter) {
        $onlineModel = new Model_OnlineSignUp();
        return $onlineModel->getCount ( $filter );
    }

    //获取微信资料
    public function weChatInfo($customer){
        $weChatModel = new Model_CustomerWechat();
        $weChat = $weChatModel->getByWhere(array('customer_id' => $customer['id']), 'customer_id,nickname,headimgurl');
        $customer['nickname'] = $weChat['nickname'];
        $customer['headimgurl'] = $weChat['headimgurl'];

        return $customer;
    }

}
