<?php
/**
 *
 *
 * @author: Dm
 */
class Api_Channel_Contract_Close extends PhalApi_Api {

    public function getRules() {
        return array (
            'Go' => array(
                'contractId' => array('name' => 'contract_id', 'type' => 'int', 'min' => 1, 'require' => true, 'desc' => '合同ID'),
            ),
        );
    }


    /**
     * 关闭合作人的合同
     * #desc 用于关闭合作人的合同
     * #return int code 操作码，0表示成功
     * #return int partner_id 合作人ID
     */
    public function Go() {
        $rs = array('code' => 0, 'msg' => '', 'info' => array());
        $domain = new Domain_ChannelContract();
        $id = $domain->close($this->contractId);
        if(!$id){
            $rs['code'] = 206;
            $rs['msg'] = T('Failure of channel dealer contract');
            return $rs;
        }

        $rs['info']['contract_id'] = $id;

        return $rs;
    }

}
