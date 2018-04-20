<?php
/**
 * 修改渠道商信息
 *
 * @author: Zh
 */
class Api_Channel_Update extends PhalApi_Api {

    public function getRules() {
        return array (
            'Go' => array(
                'partnerId' => array('name' => 'partner_id', 'type' => 'int', 'min' => 1, 'require' => true, 'desc' => '合作人ID'),
                'name' => array('name' => 'name', 'type' => 'string', 'min' => 1, 'require' => true, 'desc' => '伙伴名称'),
            ),
        );
    }


    /**
     * 更新渠道商信息
     * #desc 用于更新渠道商信息
     * #return int code 操作码，0表示成功
     * #return string status 状态 0 成功 1 失败
     */
    public function Go() {
        $rs = array('code' => 0, 'msg' => '', 'info' => array());

        $data = array(
            'name' => $this->name,
            'last_modify' => time(),
        );

        $domain = new Domain_Channel();
        $result = $domain->update($this->partnerId,$data);
        if(!$result){
            $rs['code'] = 194;
            $rs['msg'] = T('Channel Update failed');
            return $rs;
        }

        $rs['info']['partner_id'] = $this->partnerId;

        return $rs;
    }

}
