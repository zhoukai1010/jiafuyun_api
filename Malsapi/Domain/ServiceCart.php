<?php
class Domain_ServiceCart {

    //添加购物车
    public function addCart($data){
        $params = array(
            'customer_id' => $data['customer_id'],
            'shop_id' => 0,
            'service_type' => $data['service_type'],
            'content' => json_encode($data['content'], JSON_UNESCAPED_UNICODE),
        );

        $result = sp_request('Shenpu_ServiceCart_Add.Go',$params);
        if($result['ret'] == 200 && $result['data']['code'] == 0){
            $result = $result['data']['info']['cart_id'];
        }else{
            return false;
        }

        return $result;
    }

    //删除购物车
    public function deleteCart($cartIds){
        $params = array(
            'cart_id' => $cartIds
        );

        $result = sp_request('Shenpu_ServiceCart_Delete.Go',$params);
        if($result['ret'] == 200 && $result['data']['code'] == 0){
            $result = $result['data']['info']['cart_id'];
        }else{
            return false;
        }

        return $result;
    }

    //购物车列表
    public function getAllCart($params){
        $serviceModel = new Model_Service();
        $rs = array();
        $result = sp_request('Shenpu_ServiceCart_Jfy_ListGet.Go',$params);
        if($result['ret'] == 200 && $result['data']['code'] == 0){
            $list = $result['data']['list'];
            foreach ($list as $key=>$value){
                $info = $serviceModel->getByWhere(array('service_type' => $value['service_type']),'*');
                $list[$key]['price'] = $info['price'];
            }
            $rs['list'] = $list;
            $rs['count'] = $result['data']['count'];
        }else{
            $rs['list'] = array();
            $rs['count'] = 0;
        }
        return $rs;
    }
    //获取购物车信息
    public function checkCart($customerId){
        $params = array(
            'customer_id' => $customerId,
        );
        $result = sp_request('Shenpu_ServiceCart_Jfy_Get.Go',$params);
        if($result['ret'] == 200 && $result['data']['code'] == 0){
            $result = $result['data']['info']['status'];
        }else{
            return false;
        }
        return $result;
    }
    //检测购物车是否存在
    public function getCartInfo($customerId,$cartId){
        $params = array(
            'customer_id' => $customerId,
            'cart_id' => $cartId,
        );

        $result = sp_request('Shenpu_ServiceCart_Jfy_InfoGet.Go',$params);
        if($result['ret'] == 200 && $result['data']['code'] == 0){
            $result = $result['data']['info'];
        }else{
            return false;
        }
        return $result;
    }

}
