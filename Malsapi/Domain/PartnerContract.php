<?php
class Domain_PartnerContract {
	var $model;

	public function __construct() {
		$this->model = new Model_PartnerContract ();
	}

	//获取详情
    public function getBaseInfo($id, $cols = '*'){
        $rs = $this->model->get ( $id , $cols);
        $couponModel = new Model_PartnerCoupon();
        $logModel = new Model_PartnerContractLog();
        $filter = array('contract_id' => $id,'status' => 'y');
        $couponList = $couponModel->getAll('*',$filter);
        $rs['coupon_list'] = $couponList;
        $logFilter = array('contract_id' => $id);
        $logList = $logModel->getAll('*',$logFilter);
        $rs['log_list'] = $logList;
        return $rs;
    }
    //添加
    public function add($data){
        $data['bn'] = $this->gen_id();
        $contractId = $this->model->insert($data);
        if(! $contractId){
           return false;
        }
        $this->addLog($contractId,'创建合同!');
        return $contractId;
    }
//    //更新
//    public function update($id,$data){
//        $rs = $this->model->update($id,$data);
//        if(! $rs){
//           return false;
//        }
//        return $rs;
//    }
//    //删除
//    public function delete($id){
//        $rs = $this->model->delete($id);
//        return $rs;
//    }
    //完成合同
    public function finish($id){
        $data = array('status' => 'finish','last_modify' => time());
        $rs = $this->model->update($id,$data);
        if(! $rs){
           return false;
        }
        $this->addLog($id,'完成合同!');
        return $rs;
    }
    //关闭合同
    public function close($id){
        $data = array('status' => 'close','last_modify' => time());
        $rs = $this->model->update($id,$data);
        if(! $rs){
            return false;
        }
        $this->addLog($id,'作废合同!');
        return $rs;
    }
    //获取列表
	public function getAllByPage($filter, $page = 1, $page_size = 20, $orderby = ''){
		$rs = $this->model->getAll ( '*', $filter, $page, $page_size, $orderby );
		$couponModel = new Model_PartnerCoupon();
		//获取优惠券类型列表
        foreach ( $rs as $key => $value){
            $filter = array('contract_id' => $value['id']);
            $couponList = $couponModel->getAll('*',$filter);
            $rs[$key]['coupon_list'] = $couponList;
        }

		return $rs;
	}
	//获取数量
	public function getCount($filter) {
		return $this->model->getCount ( $filter );
	}
    public function getCouponDetailsCount($filter,$isUsed) {
        $detailsModel = new Model_PartnerCouponDetails();
        if($isUsed == 'y'){
            $filter['customer_id > ?'] = 0;
        }
        return $detailsModel->getCount ( $filter );
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
    //添加日志
    public function addLog($id,$content){
        $logModel = new Model_PartnerContractLog();
	    $data = array(
	        'contract_id' => $id,
            'content' => $content,
            'create_time' => time(),
            );
	    $logId = $logModel->insert($data);
	    return $logId;
    }
    //获取优惠券使用详情
    public function getUseDetails($couponId,$page = 1, $page_size = 20, $orderby = '',$isUsed){
        $couponModel = new Model_PartnerCoupon();
        $couponInfo = $couponModel->get($couponId);
        $detailsModel = new Model_PartnerCouponDetails();
        $filter = array('partner_coupon_id' => $couponId);
        if($isUsed == 'y'){
            $filter['customer_id > ?'] = 0;
        }
        $list = $detailsModel->getAll('id,bn,cdk,status,customer_id,mobile,last_modify',$filter,$page, $page_size, $orderby);
        $couponInfo['details_list'] = $list;
        return $couponInfo;
    }
}
