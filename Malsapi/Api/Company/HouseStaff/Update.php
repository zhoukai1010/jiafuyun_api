<?php
/**
 * 默认接口服务类
 *
 * @author: Dm
 */
class Api_Company_HouseStaff_Update extends PhalApi_Api {
	
	public function getRules() {
		return array (
				 'Go' => array(
                     'userId' => array('name' => 'user_id', 'type' => 'int', 'min' => 1, 'require' => true, 'desc' => '服务商ID'),
                     'staffId' => array('name' => 'staff_id', 'type' => 'string', 'min' => 1, 'require' => true, 'desc' => '员工ID'),
                     'name' => array('name' => 'name', 'type'=>'string', 'min' => 1, 'require'=> true,'desc'=> '员工姓名'),
                     'mobile' => array('name' => 'mobile', 'type'=>'string','max' => 11, 'min' => 11,  'require'=> true,'desc'=> '联系方式'),
                     'cardID' => array('name' => 'card_id', 'type'=>'string', 'min' => 15, 'max' => 18, 'require'=> true,'desc'=> '身份证号码'),
                     'cardImgP' => array('name' => 'cardImgP', 'type' => 'array', 'format'=>'json', 'require' => false, 'desc' => '身份证正面照片'),
                     'cardImgN' => array('name' => 'cardImgN', 'type' => 'array', 'format'=>'json', 'require' => false, 'desc' => '身份证反面照片'),
                     'birthday' => array('name' => 'birthday', 'type'=>'string', 'min' => 1,  'require'=> true,'desc'=> '出生日期'),
                     'sex' => array('name' => 'sex', 'type'=>'enum','range' => array('boy','girl'), 'default' => 'girl', 'require'=> true,'desc'=> '员工性别'),
                     'avatar' => array('name' => 'avatar', 'type' => 'array', 'format'=>'json', 'require' => false, 'desc' => '员工照片'),
                     'nation' => array('name' => 'nation', 'type' => 'string', 'min' => 1, 'require' => false, 'desc' => '民族'),
                     'industry' => array('name' => 'industry', 'type'=>'string', 'require'=> false,'desc'=> '专业'),
                     'nativePlace' => array('name' => 'native_place', 'type'=>'int', 'min' => 0, 'require'=> false, 'desc' => '籍贯'),
                     'nativePlaceDistrict' => array('name' => 'native_place_district', 'type' => 'array', 'format'=>'json', 'require' => false, 'desc' => '户籍地区'),
                     'nativePlaceAddress' => array('name' => 'native_place_address', 'type'=>'string', 'require'=> false, 'desc' => '户籍详细地址'),
                     'isDormitory' => array('name' => 'is_dormitory', 'type'=>'enum','range' => array('y','n','unknown'), 'default' => 'unknown', 'require'=> true,'desc'=> '是否住店:y 是, n 否, unknown 未知'),
                     'nowDistrict' => array('name' => 'now_district', 'type' => 'array', 'format'=>'json', 'require' => false, 'desc' => '现居住省市区'),
                     'address' => array('name' => 'address','type'=>'string', 'require'=> false,'desc'=> '现居住详细地址'),
                     'education' => array('name' => 'education', 'type' => 'string', 'min' => 1, 'require' => false, 'desc' => '文化程度'),
                     'marriage' => array('name' => 'marriage', 'type' => 'string', 'min' => 1, 'require' => false, 'desc' => '婚姻情况'),
                     'crimeExperience' => array('name' => 'crime_experience', 'type' => 'array', 'format'=>'json', 'require' => false, 'desc' => '犯罪经历'),
                     'demand' => array('name' => 'demand', 'type'=>'array', 'format'=>'json', 'require'=> false,'desc'=> '工作范围'),
                     'salary' => array('name' => 'salary', 'type'=>'string',  'require'=> false,'desc'=> '期望薪酬'),
                     'goodCuisine' => array('name' => 'good_cuisine', 'type' => 'array', 'format'=>'json',  'require'=> false,'desc'=> '擅长菜系'),
                     'cookTaste' => array('name' => 'cook_taste', 'type'=>'string', 'require'=> false,'desc'=> '做饭口味'),
                     'isHome' => array('name' => 'is_home', 'type'=>'enum','range' => array('y','n'), 'default' => 'n', 'require'=> false,'desc'=> '是否住家:y 住家 n 不住家'),
                     'workTime' => array('name' => 'work_time', 'type' => 'array', 'format'=>'json', 'require' => false, 'desc' => '是否全职、兼职（时间段）'),
                     'workPicture' => array('name' => 'work_picture', 'type' => 'array', 'format'=>'json', 'require' => false, 'desc' => '工作照'),
                     'workExperience' => array('name' => 'work_experience', 'type' => 'string', 'require' => false, 'desc' => '家政经验'),
                     'height' => array('name' => 'height', 'type'=>'string',   'require'=> false,'desc'=> '身高'),
                     'weight' => array('name' => 'weight', 'type'=>'string',   'require'=> false,'desc'=> '体重'),
                     'workTimeRange' => array('name' => 'work_time_range', 'type'=>'string', 'min' => 1, 'require'=> true,'desc'=> '工作时间范围'),
                     'workArea' => array('name' => 'work_area', 'type' => 'array', 'format'=>'json', 'require' => true, 'desc' => '工作地区'),
            ),
		);
 	}
	
  
  /**
     * 更新家政员工信息
     * #desc 用于更新家政员工信息
     * #return int code 操作码，0表示成功
     * #return int status 状态 0 成功, 1 失败
     */
    public function Go() {
        $rs = array('code' => 0, 'msg' => '', 'info' => array());
        //判断服务商是否存在
        $domain = new Domain_Company_User();
        $userInfo = $domain->getBaseInfo($this->userId);
        if(empty($userInfo)){
            DI()->logger->debug('User not found', $this->userId);

            $rs['code'] = 106;
            $rs['msg'] = T('User not exists');
            return $rs;
        }

        //判断家政人员是否存在
        $houseStaffDomain = new Domain_Company_Staff();
        $staffInfo = $houseStaffDomain->getBaseInfo($this->staffId);
        if( !$staffInfo) {
            $rs['code'] = 126;
            $rs['msg'] = T('Staff not exists');
            return $rs;
        }

        $cardID = $this->cardID;
        if($staffInfo['cardID'] != $cardID){
            //检测身份证号码是否存在
            $cardInfo = $houseStaffDomain->hashCardID($this->userId,$this->cardID);
            if (!empty($cardInfo)) {
                $rs['code'] = 111;
                $rs['msg'] = T('CardID exist');
                return $rs;
            }
        }

        $data = array(
            'staff_id' => $this->staffId,
            'name' => $this->name,
            'birthday' => strtotime($this->birthday),
            'sex' => $this->sex,
            'mobile' => $this->mobile,
            'create_time' => time(),
            'last_modify' => time(),
            'nation' => $this->nation,
            'education' => $this->education,
            'marriage' => $this->marriage,
            'industry' => $this->industry,
            'native_place_address' => $this->nativePlaceAddress,
            'is_dormitory' => $this->isDormitory,
            'address' => $this->address,
            'work_experience' => $this->workExperience,
            'height' => $this->height,
            'weight' => $this->weight,
            'work_time_range' => $this->workTimeRange,
            'work_area' => json_encode($this->workArea),
        );
        if(! empty($this->avatar)){
            $data['avatar'] = json_encode($this->avatar);
        }
        if(!empty($this->nativePlace)){
            $data['native_place'] = $this->nativePlace;
        }else{
            $data['native_place'] = 0;
        }
        if(! empty($this->crimeExperience)){
            $data['crime_experience'] = json_encode($this->crimeExperience);
        }
        if(empty($this->nowDistrict)){
            $data['now_district'] = '';
        }
        if(! empty($this->cardImgP)){
            $data['idcard_p'] = json_encode($this->cardImgP);
        }
        if(! empty($this->cardImgN)){
            $data['idcard_n'] = json_encode($this->cardImgN);
        }
        if($data['is_dormitory'] == 'y' || $data['is_dormitory'] == 'unknown'){
            $data['now_district'] = '';
            $data['address'] = '';
        }
        //业务需求
        $demand_data = array();
        $demand_data['expected_salary'] = $this->salary;
        $demand_data['cook_taste'] = $this->cookTaste;
        $demand_data['is_home'] = $this->isHome;
//        if(! empty($this->demand)){
//            $demand_data['demand'] = json_encode($this->demand);
//        }
//        if(! empty($this->goodCuisine)){
//            $demand_data['good_cuisine'] = json_encode($this->goodCuisine);
//        }
//        if(empty($this->workTime)){
//            $demand_data['work_time'] = json_encode($this->workTime);
//        }
//        if(empty($this->workPicture)){
//            $demand_data['work_picture'] = json_encode($this->workPicture);
//        }

        try {
            DI ()->notorm->beginTransaction ( 'db_api' );
            $result = $houseStaffDomain->updateHouseStaff($data,$demand_data);
            if( $result){
                $status = 0;
            }else{
                $status = 1;
            }
            DI ()->notorm->commit( 'db_api' );

        } catch ( Exception $e ) {

            DI ()->notorm->rollback ( 'db_api' );
            $rs ['code'] = $e->getCode ();
            $rs ['msg'] = $e->getMessage ();
        }

        $rs['info']['status'] = $status;

        return $rs;
    }
	
}
