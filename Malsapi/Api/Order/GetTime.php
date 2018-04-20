<?php
/**
 *  获取可以下单的时间段
 *
 * @author: Zh
 */
class Api_Order_GetTime extends PhalApi_Api {
    public function getRules(){
        return array(
            'Go' => array(
                'customerId' => array(
                    'name' => 'customer_id',
                    'type' => 'int',
                    'min' => 1,
                    'require' => true,
                    'desc' => '会员ID'
                ),
                'code' => array(
                    'name' => 'code',
                    'type' => 'string',
                    'require' => true,
                    'desc' => '服务标识码'
                ),
                'hours' => array(
                    'name' => 'hours',
                    'type' => 'int',
                    'desc' => '服务时长 备注:小时数 只有type参数为hours时才可以用'
                ),
                'startTime' => array(
                    'name' => 'start_time',
                    'type' => 'string',
                    'require' => true,
                    'desc' => '服务时间 备注:2017-03-29 只用传年-月-日'
                ),
                'type' => array(
                    'name' => 'type',
                    'type' => 'string',
                    'require' => true,
                    'desc' => '显示分段  minutes 半小时一段 hours 一个小时到一个小时的时间段',
                ),
                'addressId' => array(
                    'name' => 'address_id',
                    'type' => 'int',
                    'desc' => '地址id'
                ),
            ),
        );
    }

    /**
     * 获取可以下单的时间段
     * #desc 用于获取可以下单的时间段
     * #return string time 时间段
     * #return bool is_service 时间段内是否有阿姨可以进行服务 true/false
     * #return string address_detail 用户设置的默认地址详情
     */
    public function Go(){
        $rs = array(
            'code' => 0,
            'msg' => '',
            'info' => array()
        );
        if(empty($this->code)){
            $rs['code'] = 131;
            $rs['msg'] = T('Service identification code is empty');
            return $rs;
        }
        if(empty($this->startTime)){
            $rs['code'] = 130;
            $rs['msg'] = T('Service time is empty');
            return $rs;
        }
        //获取服务详情
        $serviceCategoryDomain = new Domain_ServiceCategory();
        $serviceInfo = $data = $serviceCategoryDomain->getOne(
            array(
                'code' => $this->code,
                'pid > ?' => 0
            ),
            'id, pid, name, price, content, status, img_src, config, service_hours, service_start_time, service_end_time, code, is_need_time, lower_single_type,payment_method,default_img');
        if(empty($serviceInfo)){
            $rs['code'] = 125;
            $rs['msg'] = T('The service information was not found');
            return $rs;
        }
        $arr = array();
        //进行服务时间段排序
        $serviceTimeHours = $serviceInfo['service_end_time'] - $serviceInfo['service_start_time'];
        $time = $serviceInfo['service_start_time'];
        //判断是否传入时间类型
        if($this->type == 'minutes'){
            $subsection = $serviceTimeHours * 2;
            for($i = 0; $i <= $subsection; $i++){
                if ($time > 9){
                    $startTime = $time;
                    if(floor($startTime) != $startTime){
                        $arr[$i]['time'] = floor($startTime).':30';
                    }else{
                        $arr[$i]['time'] = $startTime.':00';
                    }
                    $time+=0.5;
                }else{
                    $startTime = $time;
                    if(is_float($startTime)){
                        $arr[$i]['time'] = '0'.floor($startTime).':30';
                    }else{
                        $arr[$i]['time'] = '0'.$startTime.':00';
                    }
                    $time+=0.5;
                }
                $arr[$i]['is_service'] = true;
                //查询每个时间段是否有阿姨
                $serviceStartTime = strtotime($this->startTime.$startTime.':00');
                if($serviceStartTime < time()){
                    $arr[$i]['is_service'] = false;
                }
            }
        }elseif($this->type == 'hours'){
            $subsection = floor($serviceTimeHours / 1);
            for($i = 0; $i < $subsection; $i++){
                if($time > 9){
                    if ($serviceInfo['service_end_time'] > 9){
                        $startTime = $time;
                        $endTime = $time+$this->hours;
                        $arr[$i]['time'] = $startTime.':00-'.$endTime.':00';
                    }else{
                        $startTime = $time;
                        $endTime = $time+$this->hours;
                        $arr[$i]['time'] = $startTime.':00-0'.$endTime.':00';
                    }
                }else{
                    if ($serviceInfo['service_end_time'] > 9){
                        $startTime = $time;
                        $endTime = $time+$this->hours;
                        $arr[$i]['time'] = '0'.$startTime.':00-'.$endTime.':00';
                    }else{
                        $startTime = $time;
                        $endTime = $time+$this->hours;
                        $arr[$i]['time'] = '0'.$startTime.':00-0'.$endTime.':00';
                    }
                }
                $time++;
                //查询每个时间段是否有阿姨
                $serviceStartTime = strtotime($this->startTime.$startTime.':00');
                //查询是否有阿姨可以进行服务
                $arr[$i]['is_service'] = true;
                //查询该时间下是否有阿姨空缺
                if($serviceStartTime < time()){
                    $arr[$i]['is_service'] = false;
                }
                if($startTime > (20-$this->hours-1)){
                    break;
                }
            }
        }else{
            $rs['code'] = 129;
            $rs['msg'] = T('Time type error');
            return $rs;
        }
        //获取用户默认的 地址信息
        $customerAddressDomain = new Domain_CustomerAddress();
        if(isset($this->addressId) && $this->addressId !== 0){
            $userAddress = $customerAddressDomain->getBaseInfo(
                $this->addressId,
                'id, customer_id, consignee, mobile, zipcode, country, province, city, district, address, is_default, create_time, last_modify'
            );
            if(empty($userAddress)){
                $rs['code'] = 150;
                $rs['msg'] = T('You can not find the address information you choose');
            }
        }else{
            $userAddress = $customerAddressDomain->getAddressOne(
                array('is_default' => 'y', 'customer_id' => $this->customerId),
                'id, customer_id, consignee, mobile, zipcode, country, province, city, district, address, is_default, create_time, last_modify'
            );
        }
        $rs['list'] = $arr;
        $rs['address_detail'] = $userAddress;
        return $rs;
    }
}
