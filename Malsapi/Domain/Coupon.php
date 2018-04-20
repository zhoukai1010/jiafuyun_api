<?php
class Domain_Coupon {
	var $model;

	public function __construct() {
		$this->model = new Model_CustomerToCoupon();
	}

    //获取列表
	public function getAllByPage($filter, $page = 1, $page_size = 20, $orderby = ''){
		$rs = array();
        $couponModel = new Model_PartnerCoupon();
        $couponDetailsModel = new Model_PartnerCouponDetails();
        $status = $filter['status'];
        unset($filter['status']);
        $coupon_list = $this->model->getAll ( '*', $filter);
        $detailsIds = array();
        foreach ($coupon_list as $key=>$value){
            $detailsIds[] = $value['coupon_details_id'];
        }
        if($status == 'all'){
            $all_filter = array( 'id' => $detailsIds);
            $all_filter['customer_id'] = $filter['customer_id'];
            $list = $couponDetailsModel->getAll ( '*', $all_filter, $page, $page_size, $orderby);
            foreach ($list as $key => $value){
                $coupon = $couponModel->get($value['partner_coupon_id']);
                if($coupon){
                    $rs[$key]['coupon_id'] = $coupon['id'];
                    $rs[$key]['coupon_name'] = $coupon['name'];
                    $rs[$key]['face_value'] = $coupon['face_value'];
                    $rs[$key]['begin_time'] = date("Y-m-d H:i:s", $coupon['begin_time']);
                    $rs[$key]['fail_time'] = date("Y-m-d H:i:s", $coupon['fail_time']);
                }
                $rs[$key]['coupon_details_id'] = $value['id'];
                $rs[$key]['cdk'] = $value['cdk'];
            }
        }
        //已领取
        if($status == 'get'){
            $get_filter = array( 'id' => $detailsIds);
            $get_filter['customer_id'] = $filter['customer_id'];
            $get_filter['status'] = 'get';
            $list = $couponDetailsModel->getAll ( '*', $get_filter, $page, $page_size, $orderby);
            foreach ($list as $key => $value){
                $coupon = $couponModel->get($value['partner_coupon_id']);
                if($coupon){
                    $rs[$key]['coupon_id'] = $coupon['id'];
                    $rs[$key]['coupon_name'] = $coupon['name'];
                    $rs[$key]['face_value'] = $coupon['face_value'];
                    $rs[$key]['begin_time'] = date("Y-m-d H:i:s", $coupon['begin_time']);
                    $rs[$key]['fail_time'] = date("Y-m-d H:i:s", $coupon['fail_time']);
                }
                $rs[$key]['coupon_details_id'] = $value['id'];
                $rs[$key]['cdk'] = $value['cdk'];
            }
        }
        //已使用
        if($status == 'used'){
            $used_filter = array( 'id' => $detailsIds);
            $used_filter['customer_id'] = $filter['customer_id'];
            $used_filter['status'] = 'used';
            $list = $couponDetailsModel->getAll ( '*', $used_filter, $page, $page_size, $orderby);
            foreach ($list as $key => $value){
                $coupon = $couponModel->get($value['partner_coupon_id']);
                if($coupon){
                    $rs[$key]['coupon_id'] = $coupon['id'];
                    $rs[$key]['coupon_name'] = $coupon['name'];
                    $rs[$key]['face_value'] = $coupon['face_value'];
                    $rs[$key]['begin_time'] = date("Y-m-d H:i:s", $coupon['begin_time']);
                    $rs[$key]['fail_time'] = date("Y-m-d H:i:s", $coupon['fail_time']);
                }
                $rs[$key]['coupon_details_id'] = $value['id'];
                $rs[$key]['cdk'] = $value['cdk'];
            }
        }
        //已失效
        if($status == 'n'){
            $n_filter = array( 'id' => $detailsIds);
            $n_filter['customer_id'] = $filter['customer_id'];
            $n_filter['status'] = 'n';
            $list = $couponDetailsModel->getAll ( '*', $n_filter, $page, $page_size, $orderby);
            foreach ($list as $key => $value){
                $coupon = $couponModel->get($value['partner_coupon_id']);
                if($coupon){
                    $rs[$key]['coupon_id'] = $coupon['id'];
                    $rs[$key]['coupon_name'] = $coupon['name'];
                    $rs[$key]['face_value'] = $coupon['face_value'];
                    $rs[$key]['begin_time'] = date("Y-m-d H:i:s", $coupon['begin_time']);
                    $rs[$key]['fail_time'] = date("Y-m-d H:i:s", $coupon['fail_time']);
                }
                $rs[$key]['coupon_details_id'] = $value['id'];
                $rs[$key]['cdk'] = $value['cdk'];
            }
        }

		return $rs;
	}
	//获取数量
	public function getCount($filter){
        $status = $filter['status'];
        $couponDetailsModel = new Model_PartnerCouponDetails();
        if($status == 'all'){
            unset($filter['status']);
            return $this->model->getCount ( $filter );
        }
        if($status == 'get'){
            return $couponDetailsModel->getCount ( $filter );
        }
        if($status == 'used'){
            return $couponDetailsModel->getCount ( $filter );
        }
        if($status == 'n'){
            return $couponDetailsModel->getCount ( $filter );
        }

	}

	//判断优惠券是否存在
    public function checkCustomerCoupon($customerId,$couponDetailsId){
        $filter = array(
            'customer_id' => $customerId,
            'coupon_details_id' => $couponDetailsId,
        );
        $rs = $this->model->getByWhere($filter,'*');
        return $rs;
    }

    //领取优惠券
    public function addCoupon($customerInfo,$couponCode){
        $customerId = $customerInfo['id'];
        $couponModel = new Model_PartnerCoupon();
        $couponDetailsModel = new Model_PartnerCouponDetails();
        //查询优惠券
        $filter = array('cdk' => $couponCode);
        $couponDetails = $couponDetailsModel->getByWhere($filter,'*');
        if( !$couponDetails){
            throw new LogicException ( T ( 'Coupon not exists' ), 230 );
        }
        //判断cdk是否有效
        if($couponDetails['status'] !=  'y'){
             throw new LogicException ( T ( 'Coupon has expired' ), 231 );
        }
        $couponId = $couponDetails['partner_coupon_id'];
        $couponInfo = $couponModel->get($couponId);
        //判断优惠券状态
        if($couponInfo['status'] == 'n'){
            throw new LogicException ( T ( 'Coupon has expired' ), 231 );
        }
        //判断优惠券有效时间（0 永久有效）
        if($couponInfo['fail_time'] != 0 ){
            if( $couponInfo['fail_time'] < time() ){
                throw new LogicException ( T ( 'Coupon has expired' ), 231 );
            }
        }
        //判断可领取优惠券数量
        if($couponInfo['lave_num'] == '0'){
            throw new LogicException ( T ( 'Coupons have been finished' ), 236 );
        }
        //判断优惠券是否限制领取
        if($couponInfo['limit_num'] != '0'){
            //判断优惠券领取数量是否已达上限
            $cx_filter = array( 'customer_id' => $customerId, 'coupon_id'=> $couponId);
            $total = $this->model->getCount($cx_filter);
            if($total >= $couponInfo['limit_num']){
                throw new LogicException ( T ( 'The number of coupons has been reached' ), 237 );
            }
        }
        //领取客户优惠券
        $data = array(
            'customer_id' => $customerId,
            'coupon_id' => $couponId,
            'coupon_details_id' => $couponDetails['id'],
            'create_time' => time(),
        );
        $rs = $this->model->insert($data);
        if( $rs ){
            //更新领取记录
            $details_data = array(
                'customer_id' => $customerId,
                'mobile' => $customerInfo['mobile'],
                'status' => 'get',
                'last_modify' => time(),
            );
            $res = $couponDetailsModel->update($couponDetails['id'],$details_data);
            if(!$res){
                throw new LogicException ( T ( 'Coupon failed to receive' ), 234 );
            }

            //更新优惠券数量
            $update_data = array(
                'receive_num' => ++$couponInfo['receive_num'],
                'lave_num' => $couponInfo['lave_num'] - 1,
                'last_modify' => time(),
            );
            $res = $couponModel->update($couponId,$update_data);
            if(!$res){
                throw new LogicException ( T ( 'Coupon failed to receive' ), 234 );
            }
        }else{
            throw new LogicException ( T ( 'Coupon failed to receive' ), 234 );
        }
        return $rs;
    }

}
