<?php
/**
 * 默认接口服务类
 *
 * @author: Dm
 */
class Api_Customer_Customer_Session extends PhalApi_Api {
    
    public function getRules() {
        return array (
                 'Go' => array(
                    'session' => array('name' => 'session', 'type' => 'string', 'min' => 1, 'require' => true, 'desc' => 'session'),
            ),
        );
    }
  
  /**
     * 验证session
     * #desc 用于验证session
     * #return int code 操作码，0表示成功
     * #return string status 状态 0 无效 1 有效
  */
    public function Go() {
        $rs = array('code' => 0, 'msg' => '', 'info' => array());
        
        $domain = new Domain_Customer();
        $sessionData = $domain->checkSession($this->session);
        if( !$sessionData){
            $status = 0;
        }else{
            $status = 1;
        }

        $rs['status'] = $status;

        return $rs;
    }
    
}
