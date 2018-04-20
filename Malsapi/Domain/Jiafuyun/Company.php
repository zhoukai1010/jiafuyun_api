<?php
class Domain_Jiafuyun_Company {
	var $model;

	//当Domian_Zhianbao_Company.php被实例化时利用__construct实例化模型类
	public function __construct() {
//		$this->model = new Model_Zhianbao_Company ();
        $this->model = new Model_Jiafuyun_Company ();
	}
	//获取分类列表
	public function getCatList($filter){
		$rs = $this->model->getAll ( '*', $filter);
		return $rs;
	}
	//获取数量
	public function getCount($filter) {
		return $this->model->getCount ( $filter );
	}
	//获取分类详情
	public function getBaseInfo($id, $cols = '*') {
		$rs = $this->model->get($id,$cols);
		return $rs;
	}
	//获取公司信息
    public function getBaseByUserId($userId){
	    //指定user_id 为变量 $userId 以数组形式保存
        $filter = array('user_id'=>$userId);
        //根据user_id字段查询用户信息
        $info = $this->model->getByWhere($filter);
        //为什么指定新变量二次实例化，直接$this->model调用不行吗？
//        $companyModel = new Model_Zhianbao_Company();
        $companyModel = new Model_Jiafuyun_Company();
        //两次查出来的信息有什么不同？
        $companyInfo = $companyModel->getByWhere($filter);
        $info['company_info'] = $companyInfo;
        return $info;
    }

    //获取公司信息
//    public function getBaseByUserId($userId)
//    {
//        $filter = array('user_id'=>$userId);
//        $info = $this->model->getByWhere($filter);
//        $companyModel = new Model_Zhianbao_Company();
//        $companyInfo = $companyModel->getByWhere($filter);
//        $info['company_info'] = $companyInfo;
//        return $info;
//    }

    //创建公司
    public function register($data){
        $province = $data['province']; //省
        $city = $data['city']; //市
        $district = $data['district']; //地区
        //销毁变量 执行完毕自动销毁
        unset($data['province']);
        unset($data['city']);
        unset($data['district']);
        //插入数据 实例化模型类中的表根本没有这个字段 如何插入的？
        $rs = $this->model->insert($data);
        if( !$rs){
            //抛出异常 添加失败
            throw new LogicException ( T ( 'Add failed' ) , 102 );
        }else{
            //添加公司地址
//            $companyInfoModel = new Model_Jiafubao_Company();
            $companyInfoModel = new Model_Jiafuyun_Company();
            //公司信息 用数组保存数据
            $company_data = array(
                //公司ID
                'company_id' => $rs,
                //国家
                'country' => 1,
                //省
                'province' => $province,
                //市
                'city' => $city,
                //地区
                'district' => $district,
                'create_time' => time(),
                'last_modify' => time(),
            );
            $res = $companyInfoModel->insert($company_data);
            if( !$res){
                throw new LogicException ( T ( 'Add failed' ) , 102 );
            }
        }
        return $rs;
    }

}
