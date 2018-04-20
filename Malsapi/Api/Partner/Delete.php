<?php
/**
 * 默认接口服务类
 *
 * @author: Dm
 */
class Api_Partner_Delete extends PhalApi_Api {
    
    public function getRules() {
        return array (
                 'Go' => array(
                     'partnerId' => array('name' => 'partner_id', 'type' => 'int', 'min' => 1, 'require' => true, 'desc' => '合作人ID'),
            ),
        );
    }
  
  /**
     * 删除合作人
     * #desc 用于删除合作人
     * #return int code 操作码，0表示成功
  */
    public function Go() {
        $rs = array('code' => 0, 'msg' => '', 'info' => array());
        $domain = new Domain_Partner();
        $info = $domain->delete($this->partnerId);
        if(! $info){
            $rs['code'] = 102;
            $rs['msg'] = T('Delete failed');
            return $rs;
        }
        $rs['info']['partner_id'] = $this->partnerId;

        return $rs;
    }
    
}
