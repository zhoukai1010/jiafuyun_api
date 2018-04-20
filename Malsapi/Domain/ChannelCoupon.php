<?php
class Domain_ChannelCoupon {
    var $model;

    public function __construct() {
        $this->model = new Model_ChannelCoupon ();
    }
    //获取详情
    public function getBaseInfo($id, $cols = '*'){
        $rs = $this->model->get ( $id);
        return $rs;
    }
    //添加
    public function add($data){
        $detailsModel = new Model_ChannelCouponDetails();
        $couponId = $this->model->insert($data);
        if(! $couponId){
            throw new LogicException ( T ( 'Channel Coupon Add failed' ), 203 );
        }
        //添加优惠券详情
        $total = $data['total'];
        for($i = 0; $i < $total ; $i ++ ){
            $couponData = array(
                'partner_id' => $data['partner_id'],
                'contract_id' => $data['contract_id'],
                'partner_coupon_id' => $couponId,
                'bn' => $this->gen_coupon_bn(),
                'cdk' => $this->gen_coupon_cdk(),
                'status' => 'y',
                'create_time' => time(),
                'last_modify' => time(),
                'service_num' => $data['service_num']
            );
            $couponDetailsId = $detailsModel->insert($couponData);
            if( ! $couponDetailsId){
                throw new LogicException ( T ( 'Channel Coupon Add failed' ), 203 );
            }
        }
        return $couponId;
    }
    //更新
    public function updateDetails($id,$data){
        $detailsModel = new Model_ChannelCouponDetails();
        $rs = $detailsModel->update($id,$data);
        if(! $rs){
            return false;
        }
        return $rs;
    }
    //完成合同
    public function finish($id){
        $data = array('status' => 'finish','last_modify' => time());
        $rs = $this->model->update($id,$data);
        if(! $rs){
            return false;
        }
        return $rs;
    }
    //关闭合同
    public function close($id){
        $data = array('status' => 'close','last_modify' => time());
        $rs = $this->model->update($id,$data);
        if(! $rs){
            return false;
        }
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
    function gen_coupon_cdk(){
        $couponDetailsModel = new Model_ChannelCouponDetails();
        $i = rand ( 0, 99999 );
        do {
            if (99999 == $i) {
                $i = 0;
            }
            $i ++;
            //     $return_bn = 'O'.date ( 'ymdHi' ) . str_pad ( $i, 5, '0', STR_PAD_LEFT );
            $return_bn = PhalApi_Tool::createRandStr ( 9 );
            $row = $couponDetailsModel->getByWhere ( array (
                'cdk' => $return_bn
            ), 'id' );
        } while ( $row );
        return $return_bn;
    }
    function gen_coupon_bn(){
        $couponDetailsModel = new Model_ChannelCouponDetails();
        $couponCount = $couponDetailsModel->getCount(array());
        $i = rand ( 0, 99999 );
        do {
            $couponCount ++;
            if (99999 == $i) {
                $i = 0;
            }
            $i ++;
            $return_bn = 'U'. str_pad ( $couponCount, 9, '0', STR_PAD_LEFT );
            //$return_bn = PhalApi_Tool::createRandStr ( 10 );
            $row = $couponDetailsModel->getByWhere ( array (
                'bn' => $return_bn
            ), 'id' );
        } while ( $row );
        return $return_bn;
    }
    public function exportDetails($couponId){
        $contractInfo = $this->model->get($couponId);
        $domainArea = new Domain_Area();
        $country = $domainArea->getAreaNameById($contractInfo['country']);
        $province = $domainArea->getAreaNameById($contractInfo['province']);
        $city = $domainArea->getAreaNameById($contractInfo['city']);
        $district = $domainArea->getAreaNameById($contractInfo['district']);
        $contractInfo['address_details'] = $country.$province.$city.$district.$contractInfo['address'];
        $filter = array('partner_coupon_id' => $couponId);
        $detailsModel = new Model_ChannelCouponDetails();
        $list = $detailsModel->getAll('*',$filter);
        $contractInfo['details_list'] = $list;
        return $contractInfo;
    }
}
