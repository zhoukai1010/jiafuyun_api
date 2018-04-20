<?php
/**
 * 默认接口服务类
 *
 * @author: Dm
 */
class Api_Partner_UnBan extends PhalApi_Api {
    
    public function getRules() {
        return array (
                 'Go' => array(
                     'partnerId' => array('name' => 'partner_id', 'type' => 'int', 'min' => 1, 'require' => true, 'desc' => '合作人ID'),
            ),
        );
    }
  
  /**
     * 启用合作人
     * #desc 用于启用合作人
     * #return int code 操作码，0表示成功
  */
    public function Go() {
        $rs = array('code' => 0, 'msg' => '', 'info' => array());
        $domain = new Domain_Partner();
        $info = $domain->unBan($this->partnerId);
        if(! $info){
            $rs['code'] = 104;
            $rs['msg'] = T('Update failed');
            return $rs;
        }
        $rs['info']['partner_id'] = $this->partnerId;

        return $rs;
    }
    
}
