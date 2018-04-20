<?php
/**
 * 增加服务商
 *
 * @author: Zh
 */
class Api_Channel_Add extends PhalApi_Api{
	public function getRules(){
		return array(
			'Go' => array(
                'mobile' => array('name' => 'mobile', 'type' => 'string',  'require' => true, 'desc' => '手机号码'),
                'loginPwd' => array('name' => 'login_password', 'type' => 'string', 'min' => 6, 'max' => 20 , 'require' => true, 'desc' => '密码'),
                'name' => array('name' => 'name', 'type' => 'string', 'min' => 1, 'require' => true, 'desc' => '渠道商名称'),
                'price' => array('name' => 'price', 'type' => 'float', 'default' => 0.00, 'require' => true, 'desc' => '金额'),
			),
		);
	}
	/**
     * 添加渠道商
     * #desc 用于添加合作人
     * #return int code 操作码，0表示成功
     * #return int partner_id 渠道商id
     */
    public function Go(){
		$rs = array('code' => 0, 'msg' => '', 'info' => array());
        $data = array(
            'login_name' => $this->mobile,
            'login_password' => $this->loginPwd,
            'name' => $this->name,
            'mobile' => $this->mobile,
            'amount' => $this->price,
            'create_time' => time(),
            'last_modify' => time(),
        );
        $domain = new Domain_Channel();
        try {
            DI ()->notorm->beginTransaction ( 'db_api' );
            $id = $domain->add($data);
            DI ()->notorm->commit( 'db_api' );
			$rs ['code'] = '1';
            $rs ['msg'] = '添加渠道商成功';
        } catch ( Exception $e ) {
            DI ()->notorm->rollback ( 'db_api' );
            $rs ['code'] = $e->getCode ();
            $rs ['msg'] = $e->getMessage ();
            return $rs;
        }
        $rs['info']['partner_id'] = $id;
        return $rs;
    }
}