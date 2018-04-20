<?php
/**
 * 默认接口服务类
 *
 * @author: Dm
 */
class Api_Partner_ChangePwd extends PhalApi_Api {
    
    public function getRules() {
        return array (
                 'Go' => array(
                     'loginName' => array('name' => 'login_name', 'type' => 'string', 'min' => 11, 'max' => 11 , 'require' => true, 'desc' => '用户名'),
                     'loginPwd' => array('name' => 'login_password', 'type' => 'string', 'min' => 6, 'max' => 20 , 'require' => true, 'desc' => '密码'),
                     'code' => array ('name' => 'code', 'type' => 'string', 'require' => true, 'min' => 6, 'desc' => '验证码'),
            ),
        );
    }
  
  /**
     * 找回密码
     * #desc 用于找回密码
     * #return int code 操作码，0表示成功
  */
    public function Go() {
        $rs = array('code' => 0, 'msg' => '', 'info' => array());
        $domain = new Domain_Partner();
        $info = $domain->getBaseInfoByMobile($this->loginName);
        if(! $info){
            $rs['code'] = 103;
            $rs['msg'] = T('Partner not exists');
            return $rs;
        }
        $domainSms = new Domain_PartnerSms();
        try {
            DI ()->notorm->beginTransaction ( 'db_api' );
            $domainSms->checkCode($this->loginName,$this->code);
            $domain->findPwd($info['id'],$this->loginPwd);
            DI ()->notorm->commit( 'db_api' );
        } catch ( Exception $e ) {

            DI ()->notorm->rollback ( 'db_api' );
            $rs ['code'] = $e->getCode ();
            $rs ['msg'] = $e->getMessage ();
            return $rs;
        }
        $rs['info']['partner_id'] = $info['id'];

        return $rs;
    }
    
}
