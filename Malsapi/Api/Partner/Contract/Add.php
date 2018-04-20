<?php
/**
 * 默认接口服务类
 *
 * @author: Dm
 */
class Api_Partner_Contract_Add extends PhalApi_Api {

    public function getRules() {
        return array (
            'Go' => array(
                'partnerId' => array('name' => 'partner_id', 'type' => 'int', 'min' => 1, 'require' => true, 'desc' => '合作人ID'),
                'price' => array('name' => 'price', 'type' => 'float', 'default' => 0.00, 'require' => true, 'desc' => '金额'),
                'mark' => array('name' => 'mark', 'type' => 'string', 'require' => false, 'desc' => '备注'),
            ),
        );
    }


    /**
     * 添加合作人的合同
     * #desc 用于添加合作人的合同
     * #return int code 操作码，0表示成功
     * #return int partner_id 合作人ID
     */
    public function Go() {
        $rs = array('code' => 0, 'msg' => '', 'info' => array());
        $data = array(
            'partner_id' => $this->partnerId,
            'amount' => $this->price,
            'status' => 'active',
            'create_time' => time(),
            'last_modify' => time(),
        );
        if(isset($this->mark)){
            $data['mark'] = $this->mark;
        }

        $domain = new Domain_PartnerContract();
        $id = $domain->add($data);
        if(!$id){
            $rs['code'] = 101;
            $rs['msg'] = T('Add failed');
            return $rs;
        }

        $rs['info']['contract_id'] = $id;

        return $rs;
    }

}
