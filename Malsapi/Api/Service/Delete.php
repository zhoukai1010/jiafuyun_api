<?php
/**
 * 删除服务分类
 *
 * @author: Zh
 */
class Api_Service_Delete extends PhalApi_Api {
    public function getRules(){
        return array(
            'Go' => array(
                'id' => array(
                    'name' => 'id',
                    'type' => 'int',
                    'require' => true,
                    'desc' => '分类id'
                ),
            ),
        );
    }

    /**
     * 删除服务分类
     * #desc 用于删除服务分类
     */
    public function Go(){
        $rs = array(
            'code' => 0,
            'msg' => '',
            'info' => array()
        );
        $filter['pid'] = $this->id;
        $serviceCategoryDomain = new Domain_ServiceCategory();
        //获取该分类数据
        $info = $serviceCategoryDomain->getOne($filter, NULL);
        if (!empty($info)) {
            $rs['code'] = 116;
            $rs['msg'] = T('Please delete the subclass first');
            return $rs;
        }
        //如果不存在子类就删除该数据
        $result = $serviceCategoryDomain->deleteData($this->id);
        if (empty($result)){
            $rs['code'] = 117;
            $rs['msg'] = T('Service categorization deleting failure');
        }
        return $rs;
    }
}
