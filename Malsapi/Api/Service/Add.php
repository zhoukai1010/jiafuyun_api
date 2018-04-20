<?php
/**
 * 添加服务分类
 *
 * @author: Zh
 */
class Api_Service_Add extends PhalApi_Api {
    public function getRules(){
        return array(
            'Go' => array(
                'pid' => array(
                    'name' => 'pid',
                    'type' => 'int',
                    'require' => true,
                    'desc' => '父类id'
                ),
                'name' => array(
                    'name' => 'name',
                    'type' => 'string',
                    'require' => true,
                    'desc' => '服务名称'
                ),
                'price'    => array(
                    'name' => 'price',
                    'type' => 'float',
                    'min'  => 0.01,
                    'require' => true,
                    'desc' => '服务价格'
                ),
                'content'  => array(
                    'name' => 'content',
                    'type' => 'string',
                    'desc' => '服务内容'
                ),
                'status' =>  array(
                    'name' => 'status',
                    'type' => 'int',
                    'min'  => 1,
                    'require' => true,
                    'desc' => '服务状态1开启 2关闭'
                ),
                'img_src' => array(
                    'name' => 'img_src',
                    'type' => 'string',
                    'desc' => '图片地址'
                ),
                'config' => array(
                    'name' => 'config',
                    'type' => 'string',
                    'desc' => '配置项'
                ),
                'service_hours' => array(
                    'name' => 'service_hours',
                    'type' => 'int',
                    'min' => 0,
                    'require' => true,
                    'desc' => '服务时长'
                ),
                'service_start_time' => array(
                    'name' => 'service_start_time',
                    'type' => 'int',
                    'min' => 0,
                    'max' => 23,
                    'desc' => '服务开始的时间段0-23 不填写为0'
                ),
                'service_end_time' => array(
                    'name' => 'service_end_time',
                    'type' => 'int',
                    'min' => 0,
                    'max' => 23,
                    'desc' => '服务结束的时间段0-23 不填写为0'
                ),
                'code' => array(
                    'name' => 'code',
                    'type' => 'string',
                    'require' => true,
                    'desc' => '服务标识码'
                ),
                'isNeedTime' => array(
                    'name' => 'is_need_time',
                    'type' => 'string',
                    'default' => '0',
                    'min' => 0,
                    'max' => 2,
                    'desc' => '是否需要时间 0不需要 1需要并且显示为时间段 2需要并且显示为时间',
                ),
            ),
        );
    }

    /**
     * 修改服务分类
     * #desc 用于修改服务分类
     */
    public function Go(){
        $rs = array(
            'code' => 0,
            'msg' => '',
            'info' => array()
        );
        $data = array();
        if(isset($this->pid) && $this->pid >= 0){
            $data['pid'] = $this->pid;
        } else {
            $rs['code'] = 111;
            $rs['msg'] = T('Please set up pid');
            return $rs;
        }

        if (isset($this->price) && $this->price >= 0) {
            $data['price'] = $this->price;
        } else {
            $rs['code'] = 112;
            $rs['msg'] = T('Please set up price');
            return $rs;
        }

        if(empty($this->status)){
            $rs['code'] = 113;
            $rs['msg'] = T('Please set up status');
            return $rs;
        } else {
            $data['status'] = $this->status;
        }
        if (empty($this->name)){
            $rs['code'] = 115;
            $rs['msg'] = T('Please set up name');
            return $rs;
        }else{
            $data['name'] = $this->name;
        }
        if(empty($this->config)){
            $rs['code'] = 121;
            $rs['msg'] = T('Please set up config');
            return $rs;
        } else {
            $data['config'] = $this->config;
        }
        //查询服务标识码是否为空
        if(empty($this->code)){
            $rs['code'] = 142;
            $rs['msg'] = T('Please set up code');
        }
        $data['content'] = $this->content;
        $data['status'] = $this->status;
        $data['config'] = $this->config;
        $data['service_start_time'] = $this->service_start_time;
        $data['service_end_time'] = $this->service_end_time;
        $data['is_need_time'] = $this->isNeedTime;
        $serviceCategoryDomain = new Domain_ServiceCategory();
        $list = $serviceCategoryDomain->AddData($data, NULL);
        if(!empty($list)){
            return $rs;
        }else{
            $rs['code'] = 114;
            $rs['msg'] = T('Service classification add failure');
            return $rs;
        }
    }
}
