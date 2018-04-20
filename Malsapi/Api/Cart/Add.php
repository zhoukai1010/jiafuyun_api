<?php
/**
 * 默认接口服务类
 *
 * @author: Dm
 */
class Api_Cart_Add extends PhalApi_Api {

    public function getRules() {
        return array (
            'Go' => array(
                'customerId' => array('name' => 'bbc_customer_id', 'type' => 'int', 'min' => 1, 'require' => true, 'desc' => '会员ID'),
                'serviceType' => array('name' => 'service_type' , 'type' => 'enum' , 'range' => array('tempClean','quickClean','longHours','nanny','careElderly','careBaby','matron','depthClean'),'require' => true, 'desc' => '服务类型 tempClean:临时保洁,quickClean:宅速洁,longHours:长期钟点工,nanny:保姆,careElderly:看护老人,careBaby:育儿嫂,matron:月嫂,depthClean:开荒保洁'),
                'content' => array('name' => 'content', 'type'=>'array','format' => 'json', 'min' => 1, 'require'=> true,'desc'=> '服务内容 json类型 array(
   "serviceTimeType" => "",//服务时间类型，shor短期,long长期
   "serviceBeginTime" => "",//服务开始时间
   "serviceEndTime" => "",//服务结束时间
   "serviceTime" => "",//服务时间 x小时
   "liveHome" => "",//是否住家 y/n
   "hasPet" => "",//是否有宠物 none:没有,smallDog:小型犬,bigDog:大型犬,cat:猫,other:其他
   "homeArea" => "",//房屋面积
   "cookieTaste" => "",//做饭口味
   "weekServiceTime" => "",//每周服务时间
   "dayServiceBeginTime" => "",//每天服务开始时间
   "dayServiceEndTime" => "",//每天服务结束时间
   "oldManSex" => "",//老人性别
   "oldManAge" => "",//老人年龄
   "independLive" => "",//生活自理 all:全自理,half:半自理,cant:不能自理
   "needDrug" => "",//用药情况 y:需要用药,n:不需要用药
   "babyCount" => "",//宝宝数量
   "babySex" => "",//宝宝性别
   "dueDate" => "",//预产期
   "extRequire" => "",//其他需求
 ); 
            '),
            ),
        );
    }


    /**
     * 添加服务到购物车
     * #desc 用于添加服务到购物车
     * #return int code 操作码，0表示成功
     * #return int cart_id 购物车ID
     */
    public function Go() {
        $rs = array('code' => 0, 'msg' => '', 'info' => array());
        //判断客户是否存在
        $domain = new Domain_Customer();
        $info = $domain->getCustomerInfo($this->customerId);
        if ( !$info) {
            $rs['code'] = 160;
            $rs['msg'] = T('Customer not exists');
            return $rs;
        }

        $data = array();
        $data['customer_id'] = $this->customerId;
        $data['service_type'] = $this->serviceType;
        $data['content'] = $this->content;

        $cartDomain = new Domain_ServiceCart();
        $cartId = $cartDomain->addCart($data);
        if(! $cartId){
            $rs['code'] = 289;
            $rs['msg'] = T('You have not settle service');
            return $rs;
        }
        $rs['info']['cart_id'] = $cartId;

        return $rs;
    }

}
