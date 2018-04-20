<?php
/**
 * 默认接口服务类
 *
 * @author: Dm
 */
class Api_Company_User_Register extends PhalApi_Api {

    public function getRules() {
        return array (
				 'Go' => array(
                     'loginName' => array('name' => 'login_name', 'type' => 'string', 'min' => 11,'max'=> 11, 'require' => true, 'desc' => '用户名'),
                     'loginPwd' => array('name' => 'login_password', 'type' => 'string', 'min' => 6,'max'=> 20, 'require' => true, 'desc' => '密码'),
                     'name' => array('name' => 'name', 'type' => 'string', 'min' => 1, 'require' => true, 'desc' => '商户名称'),
                     'mobile' => array('name' => 'mobile', 'type'=>'string', 'min' => 11, 'max' => 11,  'require'=> true,'desc'=> '联系方式'),
                     'country' => array('name' => 'country','type'=>'int', 'min'=>'1', 'require'=> true,'desc'=> '国家'),
                     'province' => array('name' => 'province','type'=>'int', 'min'=>'1', 'require'=> true,'desc'=> '省份'),
                     'city' => array('name' => 'city', 'type'=>'int', 'min'=>'1','require'=> true,'desc'=> '城市'),
                     'district' => array('name' => 'district', 'type' => 'int', 'min'=>'1', 'require' => true, 'desc' => '区县'),
                     'address' => array('name' => 'address', 'type' => 'string', 'require' => false, 'desc' => '地址'),
        ),
        );
    }


    /**
     * 服务商注册
     * #desc 用于服务商注册
     * @return string login_name 商户名
     * @return string sessionKey 商户凭证
     */
    public function Go() {
        $rs = array('code' => 0, 'msg' => '', 'info' => array());

        //查询商户名是否注册
        $domain = new Domain_Company_User();
        $info = $domain->checkRegister($this->loginName);
        if(! empty($info)){
            $rs['code'] = 103;
            $rs['msg'] = T('User exists');
            return $rs;
        }

        try {
            DI ()->notorm->beginTransaction ( 'db_api' );
            $data = array(
                'login_name' => $this->loginName,
                'login_password' => $this->loginPwd,
                'name' => $this->name,
                'mobile' => $this->mobile,
                'type' => 'jfb',
                'country' => $this->country,
                'province' => $this->province,
                'city' => $this->city,
                'district' => $this->district,
                'address' => $this->address,
                'create_time' => time(),
                'last_modify' => time(),
            );
            $userId = $domain->register($data);

            DI ()->notorm->commit( 'db_api' );
        } catch ( Exception $e ) {

            DI ()->notorm->rollback ( 'db_api' );
            $rs ['code'] = $e->getCode ();
            $rs ['msg'] = $e->getMessage ();
        }
        $rs['user_id'] = $userId;

        return $rs;
    }

}

