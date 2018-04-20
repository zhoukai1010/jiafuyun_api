<?php
class Domain_Channel {
	var $model;

	public function __construct() 
    {
		$this->model = new Model_Channel ();
	}
    /*
     * 获取渠道商详情
     * @by zh
     * @id int 渠道商id
     * @cols string 要获取的字段
     * @return 渠道商详情
     **/
    public function getBaseInfo($id, $cols = '*')
    {
        $rs = $this->model->get($id, $cols);
        return $rs;
    }
    /*
     * 获取渠道商列表
     * @by zh
     * @filter array 条件
     * @page int 页码
     * @page_size int 一页显示条数
     * @orderby string 排序规则
     * @return 渠道商详情
     **/
    public function getAllByPage($filter, $page = 1, $page_size = 20, $orderby = '')
    {
        $rs = $this->model->getAll ( '*', $filter, $page, $page_size, $orderby );
        return $rs;
    }
    /*
     * 获取渠道商数量
     * @by zh
     * @filter array 条件
     * @return 渠道商数量
     **/
    public function getCount($filter) 
    {
        return $this->model->getCount ( $filter );
    }
    /*
     * 渠道商用户密码加盐加密
     * @by zh
     * @passwordinput string 密码
     * @salt string 盐
     * @return 加密后的字符串
     **/
    public function user_hash($passwordinput, $salt)
    {
        $passwordinput = "{$passwordinput}-{$salt}-" . DI ()->config->get ( 'sys.user.pwd_salt' );

        return sha1 ( $passwordinput );
    }      
    /*
     * 获取渠道商用户内容
     * @by zh
     * @userId int 渠道商id
     * @return 渠道商信息
     **/
    public function getLoginUserInfo($userId){
    $rs = $this->model->get($userId);
    // 删除登陆密码
    unset ( $rs ['login_password'] );
    unset ( $rs ['salt'] );
    $rs['create_time'] = date('Y-m-d H:i:s',$rs['create_time']);
    return $rs;
    }
    /*
     * @禁用渠道商
     * @by zh
     * @id int 渠道商id
     * @return 禁用渠道商的结果
     **/
    public function ban($id){
        $data = array('is_enable' => 'n');
        $rs = $this->model->update($id,$data);
        return $rs;
    }
    /*
     * @启用渠道商
     * @by zh
     * @id int 渠道商id
     * @return 启用渠道商的结果
     **/
    public function unBan($id){
    $data = array('is_enable' => 'y');
    $rs = $this->model->update($id,$data);
    return $rs;
    }
    /*
     * @渠道商找回密码
     * @by zh
     * @id int 渠道商id
     * @newPwd string 新密码
     * @return 修改渠道商密码
     **/
    public function findPwd($id,$newPwd){
        $salt = PhalApi_Tool::createRandStr ( 8 );
        $loginPwd = $this->user_hash ( $newPwd, $salt );
        $data = array('login_password' => $loginPwd,'salt' => $salt);
        $rs = $this->model->update($id,$data);
        return $rs;
    }
    /*
     * @添加渠道商
     * @by zh
     * @data array 添加的数据
     * @return 渠道商id
     **/
    public function add($data)
    {
        $loginPwd = $data['login_password'];
        $amount = $data['amount'];unset($data['amount']);
        $salt = PhalApi_Tool::createRandStr ( 6 );
        $loginPwd = $this->user_hash ( $loginPwd, $salt );
        $data ['login_password'] = $loginPwd;
        $data['salt'] = $salt;
        $partnerId = $this->model->insert($data);
        if(! $partnerId){
            throw new LogicException ( T ( 'Channel add failed' ), 192 );
        }
        $contractModel = new Model_ChannelContract();
        $contractData = array(
            'partner_id' => $partnerId,
            'bn' => $this->gen_id(),
            'status' => 'active',
            'amount' => $amount,
            'create_time' => time(),
            'last_modify' => time()
        );
        $contractId = $contractModel->insert($contractData);
        //添加合同日志
        $contractDomain = new Domain_ChannelContract();
        $logId = $contractDomain->addLog($contractId,'创建合同!');
        if(! $logId){
            throw new LogicException ( T ( 'Log Add failed' ), 193 );
        }
        return $partnerId;
    }
        //生成订单编号
    function gen_id() {
        $orderModel = new Model_ChannelContract();
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
    /*
     * @修改渠道商信息
     * @by zh
     * @data array 修改的信息
     * @return 渠道商id
     **/
    public function update($id,$data){
        $rs = $this->model->update($id,$data);
        if(! $rs){
            return false;
        }
        return $rs;
    }

}
