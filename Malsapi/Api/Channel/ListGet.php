<?php
///**
// * 获取渠道商列表
// *
// * @author: Zh
// */
class Api_Channel_ListGet extends PhalApi_Api{
    public function getRules()
    {
        return array(
            'Go' => array(
                'id' => array(
                    'name' => 'id',
                    'type' => 'int',
                    'min' => 1,
                    'require' => false,
                    'desc' => '渠道商id'
                ),
                'name' => array(
                    'name' => 'name',
                    'type' => 'string',
                    'require' => false,
                    'desc' => '渠道商名称'
                ),
                'phone' => array(
                    'name' => 'phone',
                    'type' => 'string',
                    'require' => false,
                    'desc' => '渠道商联系电话'
                ),
                'loginName' => array(
                    'name' => 'login_name',
                    'type' => 'string',
                    'require' => false,
                    'desc' => '渠道商账号'
                ),
                'isEnable' => array(
                    'name' => 'is_enable',
                    'type' => 'enum',
                    'range' => array('y','n'),
                    'require' => false,
                    'desc' => '是否被禁用'
                ),
                'startTime' => array(
                    'name' => 'start_time',
                    'type' => 'string',
                    'require' => false,
                    'desc' => '注册的开始时间'
                ),
                'endTime' => array(
                    'name' => 'end_time',
                    'type' => 'string',
                    'require' => false,
                    'desc' => '注册的截止时间'
                ),
                'page' => array(
                    'name' => 'page',
                    'type' => 'int',
                    'min' => 1,
                    'default' => 1,
                    'require' => true,
                    'desc' => '页码'
                ),
                'pageSize' => array(
                    'name' => 'page_size',
                    'type' => 'int',
                    'min' => 1,
                    'default' => 20,
                    'desc' => '每页显示条数'
                ),
                'orderby' => array(
                    'name' => 'orderby',
                    'type' => 'enum',
                    'range' => array('id:desc', 'id:asc'),
                    'default' => 'id:desc',
                    'require' => true,
                    'desc' => '排序方式'
                ),
            ),
        );
    }
    /*
     * 获取渠道商列表
     * #desc 用户运营后台获取渠道商列表
    */
    public function Go()
    {
        $rs = array('code' => 0, 'msg' => '', 'info' => array());
        $filter = [];
        $channelDomain = new Domain_Channel();
        if(isset($this->loginName)){
            $filter['login_name = ?'] = '%'.$this->loginName.'%'; 
        }
        if(isset($this->name)){
            $filter['name = ?'] = '%'.$this->name.'%';
        }
        if(isset($this->phone)){
            $filter['mobile = ?'] = '%'.$this->phone.'%'; 
        }
        if(isset($this->id)){
            $filter['id'] = $this->id; 
        }
        if(isset($this->isEnable)){
            $filter['is_enable'] = $this->isEnable;
        }
        if(isset($this->startTime) && !isset($this->endTime)){
            $filter['create_time >= ?'] = strtotime($this->startTime);
        }elseif(isset($this->endTime) && !isset($this->startTime)){
            $filter['create_time >= ?'] = strtotime($this->endTime);
        }elseif(isset($this->startTime) && isset($this->endTime)){
            $filter['create_time >= ? AND  create_time <= ?'] = array(strtotime($this->startTime),strtotime($this->endTime));
        }
        $list = $channelDomain->getAllByPage($filter,$this->page,$this->pageSize,$this->orderby);
        $total = $channelDomain->getCount($filter);
        $rs['list'] = $list;
        $rs['total'] = $total;
        return $rs;
    }
}