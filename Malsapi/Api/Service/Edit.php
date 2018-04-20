<?php
/**
 * 修改服务分类
 *
 * @author: Zh
 */
class Api_Service_Edit extends PhalApi_Api {
    public function getRules(){
        return array(
            'Go' => array(
                'id' => array(
                    'name' => 'id',
                    'type' => 'int',
                    'require' => true,
                    'desc' => '服务id'
                ),
                'pid' => array(
                    'name' => 'pid',
                    'type' => 'int',
                    'desc' => '父类id'
                ),
                'name' => array(
                    'name' => 'name',
                    'type' => 'string',
                    'desc' => '服务名称'
                ),
                'price'    => array(
                    'name' => 'price',
                    'type' => 'float',
                    'min'  => 0.01,
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

        if(empty($this->id)){
            $rs['code'] = 122;
            $rs['msg'] = T('Please select the service ID that you want to modify');
            return $rs;
        }

        $data = array();

        if(isset($this->pid) && $this->pid >= 0){
            $data['pid'] = $this->pid;
        }

        if (isset($this->price) && $this->price >= 0) {
            $data['price'] = $this->price;
        }

        if(isset($this->status) && $this->status >= 0){
            $data['status'] = $this->status;
        }

        if (!empty($this->name)){
            $data['name'] = $this->name;
        }

        if(!empty($this->config)){
            $data['config'] = $this->config;
        }

        if(!empty($this->content)){
            $data['content'] = $this->content;
        }

        if(!empty($this->status)){
            $data['status'] = $this->status;
        }

        if(!empty($this->config)){
            $data['config'] = $this->config;
        }

        if(!empty($this->code)){
            $data['code'] = $this->code;
        }

        if(isset($this->service_start_time) && $this->service_start_time >= 0){
            $data['service_start_time'] = $this->service_start_time;
        }

        if(isset($this->service_end_time) && $this->service_end_time >= 0){
            $data['service_end_time'] = $this->service_end_time;
        }
        if(!empty($this->isNeedTime)){
            $data['is_need_time'] = $this->isNeedTime;
        }
        $serviceCategoryDomain = new Domain_ServiceCategory();
        $result = $serviceCategoryDomain->EditData($data, array('id'=>$this->id));
        if(empty($result)){
            $rs['code'] = 127;
            $rs['msg'] = T('Failure of service configuration modification');
            return $rs;
        } else {
            return $rs;
        }

    }
}
