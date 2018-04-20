<?php
class Domain_UserStaff{
    var $model;
    public function __construct()
    {
        $this->model = new Model_UserStaff();
    }
    //获取所有符合条件的阿姨
    public function getAll($cols='*',$filter,$page=1,$page_size=-1,$orderby=''){
        $rs = $this->model->getAll($cols,$filter,$page,$page_size,$orderby);
        return $rs;
    }
}