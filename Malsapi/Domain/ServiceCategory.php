<?php
class Domain_ServiceCategory {
    var $model;

    public function __construct() {
        $this->model = new Model_ServiceCategory ();
    }

    //获取所有开启的保洁服务 不需要排序只获取所有的分类
    public function getAll($cols='*',$filter,$page=1,$page_size=-1,$orderby=''){
        $rs = $this->model->getAll($cols, $filter,$page,$page_size,$orderby);
        return $rs;
    }
    //获取一条数据
    public function getOne($filter){
        $rs = $this->model->getOne($filter, $fields = '*');
        return $rs;
    }
    //添加一条数据
    public function AddData($data, $id){

        $rs = $this->model->insert($data, $id);
        return $rs;
    }
    //修改一条数据
    public function EditData($data, $filter){

        $rs = $this->model->updateByWhere($filter, $data);
        return $rs;
    }
    //获取数量
    public function getCount($filter) {
        return $this->model->getCount ( $filter );
    }
    //删除数据
    public function deleteData($filter){
        return $this->model->delete($filter);
    }
}
