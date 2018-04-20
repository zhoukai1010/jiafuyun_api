<?php
class Domain_Partner {
	var $model;

	public function __construct() {
		$this->model = new Model_Partner ();
	}

	//获取详情
    public function getBaseInfo($id, $cols = '*'){
        $rs = $this->model->get ( $id);
        return $rs;
    }
    //获取用户详情
    public function getBaseInfoByMobile($mobile, $cols = '*'){
        $filter = array('login_name' => $mobile);
        $rs = $this->model->getByWhere($filter,$cols);
        return $rs;
    }
    //添加
    public function add($data){
        $loginPwd = $data['login_password'];
        $amount = $data['amount'];unset($data['amount']);
        $salt = PhalApi_Tool::createRandStr ( 8 );
        $loginPwd = $this->user_hash ( $loginPwd, $salt );
        $data ['login_password'] = $loginPwd;
        $data['salt'] = $salt;
        $partnerId = $this->model->insert($data);
        if(! $partnerId){
            throw new LogicException ( T ( 'Add failed' ), 101 );
        }
        $contractModel = new Model_PartnerContract();
        $contractData = array(
            'partner_id' => $partnerId,
            'bn' => $this->gen_id(),
            'status' => 'active',
            'amount' => $amount,
            'create_time' => time(),
            'last_modify' => time()
        );
        $contractId = $contractModel->insert($contractData);
        if(! $contractId){
            throw new LogicException ( T ( 'Add failed' ), 101 );
        }
        //添加合同日志
        $contractDomain = new Domain_PartnerContract();
        $logId = $contractDomain->addLog($contractId,'创建合同!');
        if(! $logId){
            throw new LogicException ( T ( 'Add failed' ), 101 );
        }
        return $partnerId;
    }
    //更新
    public function update($id,$data){
        $rs = $this->model->update($id,$data);
        if(! $rs){
           return false;
        }
        return $rs;
    }
    //删除
    public function delete($id){
        $rs = $this->model->delete($id);
        return $rs;
    }
    //获取列表
	public function getAllByPage($filter, $page = 1, $page_size = 20, $orderby = ''){
		$rs = $this->model->getAll ( '*', $filter, $page, $page_size, $orderby );
		return $rs;
	}
	//获取数量
	public function getCount($filter) {
		return $this->model->getCount ( $filter );
	}
    //生成订单编号
    function gen_id() {
        $orderModel = new Model_PartnerContract();
        $i = rand ( 0, 99999 );
        do {
            if (99999 == $i) {
                $i = 0;
            }
            $i ++;
            $return_bn = 'O'.date ( 'ymdHi' ) . str_pad ( $i, 5, '0', STR_PAD_LEFT );
            $row = $orderModel->getByWhere ( array (
                'bn' => $return_bn
            ), 'id' );
        } while ( $row );
        return $return_bn;
    }
    public function user_hash($passwordinput, $salt) {
        $passwordinput = "{$passwordinput}-{$salt}-" . DI ()->config->get ( 'sys.user.pwd_salt' );

        return sha1 ( $passwordinput );
    }
    //合作人登录
    public function login($user){
        $rs = $this->model->getByWhere ( array('login_name' => $user ['login_name']), 'id,salt,login_password' );
        if (empty ( $rs )) {
            throw new LogicException ( T ( 'Username or password error' ), 106 );
        }
        $checkLoginPwd = $this->user_hash ( $user ['login_password'], $rs ['salt'] );
        if ($checkLoginPwd != $rs ['login_password']) {
            throw new LogicException ( T ( 'Username or password error' ), 106 );
        }
        $user = $this->getLoginUserInfo($rs['id']);
        //判断是否禁用
        if($user['is_enable'] == 'n'){
            throw new LogicException ( T ( 'User is already ban' ), 107 );
        }
        //更新登录信息
        $time = time();
        $ip = PhalApi_Tool::getClientIp();
        $data = array(
            'last_visit_time' => $time,
            'last_visit_ip' => $ip,
        );
        $updateRs = $this->model->update($user['id'],$data);
        if(! $updateRs){
            throw new LogicException ( T ( 'Username or password error' ), 106 );
        }


        //添加登录日志
        $logModel = new Model_PartnerLoginLog();
        $log_data = array(
            'partner_id' => $user['id'],
            'login_name' => $user['login_name'],
            'name' => $user['name'],
            'last_visit_time' => $user['last_visit_time'],
            'last_visit_ip' => $user['last_visit_ip']
        );
        $log = $logModel->insert($log_data);
        if($log){
            //更新登录统计数据
            $this->userLoginData($log_data);
        }

        //生成session
        $sessionDomain = new Domain_PartnerSession();
        $session =  $sessionDomain->makeSession($user ['id']);
        $user['session'] = $session;
        return $user;
    }
    public function getLoginUserInfo($userId){
        $rs = $this->model->get($userId);
        // 删除登陆密码
        unset ( $rs ['login_password'] );
        unset ( $rs ['salt'] );
        $rs['create_time'] = date('Y-m-d H:i:s',$rs['create_time']);
        return $rs;
    }

    private function userLoginData($data){
        $logDataModel = new Model_PartnerLoginData();
        $filter = array(
            'partner_id' => $data['partner_id'],
            'login_name' => $data['login_name']
        );
        $info = $logDataModel->getByWhere($filter,'*');
        if(empty($info)){
            $log_data = array(
                'partner_id' => $data['partner_id'],
                'login_name' => $data['login_name'],
                'times' => '1',
                'last_visit_time' => $data['last_visit_time']
            );
            $logDataModel->insert($log_data);
        }else{
            $log_data = array(
                'times' => ++$info['times']
            );
            $logDataModel->update($info['id'],$log_data);
        }
    }
    //禁用合作人
    public function ban($id){
        $data = array('is_enable' => 'n');
        $rs = $this->model->update($id,$data);
        return $rs;
    }
    //启用合作人
    public function unBan($id){
        $data = array('is_enable' => 'y');
        $rs = $this->model->update($id,$data);
        return $rs;
    }
    //商户找回密码
    public function findPwd($id,$newPwd){
        $salt = PhalApi_Tool::createRandStr ( 8 );
        $loginPwd = $this->user_hash ( $newPwd, $salt );
        $data = array('login_password' => $loginPwd,'salt' => $salt);
        $rs = $this->model->update($id,$data);
        return $rs;
    }

}
