<?php
/**
 * 获取服务列表
 *
 * @author: Zh
 */
class Api_Service_ListGet extends PhalApi_Api {
	public function getRules(){
	    return array(
            'Go' => array(
                'type' => array(
                    'name' => 'type',
                    'type' => 'int',
                    'require' => true,
                    'desc' => '1查询所有 2查询所有父类 3查询所有子类'
                ),
                'name' => array(
                    'name' => 'name',
                    'type' => 'string',
                    'desc' => '服务名称'
                ),
                'pid' => array(
                    'name' => 'pid',
                    'type' => 'int',
                    'desc' => '父类id 查询分类下的子类时需要'
                ),
            ),
        );
    }

    /**
     * 获取开启中的服务列表
     * #desc 用于获取服务列表
     * #return int code 操作码，0表示成功
     * #return int id 服务id
     * #return int pid 服务父级id 0表示第一级分类
     * #return string name 服务名称
     * #return double price 服务价格
     * #return string content 服务描述或内容
     * #return int status 服务状态 1开启 2关闭
     * #return string img_src 服务状态 1开启 2关闭
     */
    public function Go(){
        $rs = array(
            'code' => 0,
            'msg' => '',
            'info' => array()
        );
        $filter = array(
            'status' => 1
        );

        if($this->type == 2){
            $filter['pid'] = 0;
        } elseif ($this->type == 3) {
            if(!empty($this->pid)){
                $filter['pid'] = $this->pid;
            }else{
                $filter['pid != ?'] = 0;
            }
        }
        if(!empty($this->name)){
            $filter['name LIKE ?'] = "%$this->name%";
        }
        $serviceCategoryDomain = new Domain_ServiceCategory();
        $list = $serviceCategoryDomain->getAll('id, pid, name, price, content, status, img_src, config, service_hours, service_start_time, service_end_time, code, is_need_time, lower_single_type,payment_method,default_img',$filter);
        $rs['list'] = $list;
        return $rs;
    }
}
