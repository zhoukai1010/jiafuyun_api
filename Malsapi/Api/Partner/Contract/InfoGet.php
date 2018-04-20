<?php
/**
 * 默认接口服务类
 *
 * @author: Dm
 */
class Api_Partner_Contract_InfoGet extends PhalApi_Api {

    public function getRules() {
        return array (
            'Go' => array(
                'contractId' => array('name' => 'contract_id', 'type' => 'int', 'min' => 1, 'require' => true, 'desc' => '合同ID'),
            ),
        );
    }


    /**
     * 获取合作人的合同详情
     * #desc 用于获取合作人的合同详情
     * #return int code 操作码，0表示成功
     * #return int partner_id 合作人ID
     */
    public function Go() {
        $rs = array('code' => 0, 'msg' => '', 'info' => array());
        $domain = new Domain_PartnerContract();
        $id = $domain->getBaseInfo($this->contractId);
        if(!$id){
            $rs['code'] = 104;
            $rs['msg'] = T('Update failed');
            return $rs;
        }

        $rs['info']['contract_info'] = $id;

        return $rs;
    }

}
