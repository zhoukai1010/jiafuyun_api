<?php
class Domain_CustomerWechat {
    public function __construct(){
        $this->model = new Model_CustomerWechat();
    }
    //获取会员信息
    public function getBaseInfo($id,$cols = '*'){
        $info = $this->model->get($id,$cols);
        return $info;
    }
    //获取会员信息
    public function getInfo($filter, $fields = '*'){
        $info = $this->model->getByWhere($filter,$fields);
        return $info;
    }
}
