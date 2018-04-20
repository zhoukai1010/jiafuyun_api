<?php
/**
 * 默认接口服务类
 *
 * @author: Dm
 */
class Api_Partner_InfoGet extends PhalApi_Api {
    
    public function getRules() {
        return array (
                 'Go' => array(
                     'partnerId' => array('name' => 'partner_id', 'type' => 'int', 'min' => 1, 'require' => true, 'desc' => '合作人ID'),
                 ),
        );
    }
  
  /**
     * 获取合伙人详情
     * #desc 用于获取合伙人详情
     * #return int code 操作码，0表示成功
     * #return int id 合伙人ID
     * #return string login_name 登录名
     * #return string name 名称
     * #return string create_time 创建时间
     * #return string last_modify  最后更新时间
  */
    public function Go() {
        $rs = array('code' => 0, 'msg' => '', 'info' => array());
        $domain = new Domain_Partner();
        $info = $domain->getBaseInfo($this->partnerId);
        if(! $info){
            $rs['code'] = 103;
            $rs['msg'] = T('Partner not exists');
            return $rs;
        }
        $info['create_time'] = date('Y-m-d H:i:s',$info['create_time']);
        $info['last_modify'] = date('Y-m-d H:i:s',$info['last_modify']);
        $rs['info'] = $info;

        return $rs;
    }
    
}
