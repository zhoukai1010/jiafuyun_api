<?php
/**
 * 默认接口服务类
 *
 * @author: Dm
 */
class Api_Customer_Online_Add extends PhalApi_Api
{

    public function getRules()
    {
        return array(
            'Go' => array(
                'customerId' => array('name' => 'customer_id', 'type' => 'int', 'min' => 1, 'require' => true, 'desc' => '会员ID'),
                'name' => array('name' => 'name', 'type' => 'string', 'min' => 1, 'require' => true, 'desc' => '姓名'),
                'birthday' => array('name' => 'birthday', 'type'=>'string', 'min' => 1,  'require'=> true,'desc'=> '出生日期'),
                'sex' => array('name' => 'sex', 'type'=>'enum','range' => array('boy','girl'), 'default' => 'girl', 'require'=> true,'desc'=> '性别'),
                'mobile' => array('name' => 'mobile', 'type' => 'string', 'min' => 11, 'max' => 11, 'require' => true, 'desc' => '手机号码'),
                'homeArea' => array('name' => 'homeArea', 'type' => 'string', 'min' => 1, 'require' => true, 'desc' => '故乡'),
                'workCity' => array('name' => 'work_city', 'type' => 'string', 'min' => 1, 'require' => true, 'desc' => '意向城市'),
                'workIntention' => array('name' => 'work_intention', 'type' => 'array', 'format'=>'json', 'min' => 1, 'require' => true, 'desc' => '报名意向'),
                'remark' => array('name' => 'remark', 'type' => 'string', 'require' => false, 'desc' => '备注'),
            ),
        );
    }


    /**
     * 添加在线报名
     * #desc 用于添加用户在线报名
     * #return int code 操作码，0表示成功
     */
    public function Go()
    {
        $rs = array('code' => 0, 'msg' => '', 'info' => array());

        $data = array(
            'customer_id' => $this->customerId,
            'name' => $this->name,
            'birthday' => strtotime($this->birthday),
            'sex' => $this->sex,
            'mobile' => $this->mobile,
            'homeArea' => $this->homeArea,
            'work_city' => $this->workCity,
            'work_intention' => json_encode($this->workIntention),
            'remark' => $this->remark,
            'create_time' => time(),
            'last_modify' => time(),
        );
//        print_r($data);exit;
        $customerDomain = new Domain_Customer();
        //检测是否已报名
        $info = $customerDomain->checkOnline($this->customerId);
        if(! empty($info)){
            $rs['code'] = 138;
            $rs['msg'] = T('Registration has been submitted');
            return $rs;
        }
        $customerDomain->addOnlineSignUp($data);

        $rs['info']['customer_id'] = $this->customerId;

        return $rs;
    }

}
