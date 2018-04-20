<?php
/**
 * 默认接口服务类
 *
 * @author: Dm
 */
class Api_Company_User_ChangePwd extends PhalApi_Api {
	
	public function getRules() {
		return array (
				 'Go' => array(
                     'loginName' => array('name' => 'login_name', 'type' => 'string', 'min' => 11, 'max' => 11 , 'require' => true, 'desc' => '用户名'),
                     'oldLoginPwd' => array('name' => 'old_login_password', 'type' => 'string', 'min' => 6, 'max' => 20 , 'require' => true, 'desc' => '旧密码'),
                     'newLoginPwd' => array('name' => 'new_login_password', 'type' => 'string', 'min' => 6, 'max' => 20 , 'require' => true, 'desc' => '新密码'),
            ),
		);
 	}

  
  /**
     * 服务商修改密码
     * #desc 用于服务商修改密码
     * return string user_id 用户ID
     */
    public function Go() {
        $rs = array('code' => 0, 'msg' => '', 'info' => array());

        //获取用户名
        $domain = new Domain_Company_User();
        $info = $domain->checkRegister($this->loginName);
        if(empty($info)){
            DI()->logger->debug('user not found', $this->loginName);

            $rs['code'] = 106;
            $rs['msg'] = T('user not exists');
            return $rs;
        }

        try {
            DI ()->notorm->beginTransaction ( 'db_api' );
            $domain->changePwd($info,$this->oldLoginPwd,$this->newLoginPwd);
            DI ()->notorm->commit( 'db_api' );
        } catch ( Exception $e ) {
            DI ()->notorm->rollback ( 'db_api' );
            $rs ['code'] = $e->getCode ();
            $rs ['msg'] = $e->getMessage ();
            return $rs;
        }

        $rs['login_name'] = $this->loginName;
        return $rs;
    }

}

