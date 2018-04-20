<?php
/**
 * 完成渠道商合同
 *
 * @author: Zh
 */
class Api_Channel_Contract_Finish extends PhalApi_Api {

    public function getRules() {
        return array (
            'Go' => array(
                'contractId' => array('name' => 'contract_id', 'type' => 'int', 'min' => 1, 'require' => true, 'desc' => '渠道商合同ID'),
            ),
        );
    }


    /**
     * 完成渠道商合同
     * #desc 用于完成渠道商合同
     * #return int code 操作码，0表示成功
     * #return int partner_id 合作人ID
     */
    public function Go() {
        $rs = array('code' => 0, 'msg' => '', 'info' => array());
        $domain = new Domain_ChannelContract();
        $id = $domain->finish($this->contractId);
        if(!$id){
            $rs['code'] = 205;
            $rs['msg'] = T('The failure of the channel business contract');
            return $rs;
        }

        $rs['info']['contract_id'] = $id;

        return $rs;
    }

}
