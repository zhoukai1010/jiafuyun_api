<?php
/**
 * 启用渠道商
 *
 * @author: Zh
 */
class Api_Channel_UnBan extends PhalApi_Api {

    public function getRules() {
        return array (
            'Go' => array(
                'partnerId' => array('name' => 'partner_id', 'type' => 'int', 'min' => 1, 'require' => true, 'desc' => '合作人ID'),
            ),
        );
    }

    /**
     * 启用渠道商
     * #desc 用于启用渠道商
     * #return int code 操作码，0表示成功
     */
    public function Go() {
        $rs = array('code' => 0, 'msg' => '', 'info' => array());
        $domain = new Domain_Channel();
        $info = $domain->unBan($this->partnerId);
        if(! $info){
            $rs['code'] = 197;
            $rs['msg'] = T('Enable channel business failure');
            return $rs;
        }
        $rs['info']['partner_id'] = $this->partnerId;

        return $rs;
    }

}
