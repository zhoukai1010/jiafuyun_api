<?php
/**
 * 默认接口服务类
 *
 * @author: Dm
 */
class Api_Company_User_UnBan extends PhalApi_Api {
	
	public function getRules() {
		return array (
				 'Go' => array(
                     'userId' => array('name' => 'user_id', 'type' => 'int', 'min' => 1, 'require' => true, 'desc' => '用户ID'),
            ),
		);
 	}

  
  /**
     * 服务商解除禁用
     * #desc 用于服务商禁用的解除
     * return string user_id 用户ID
     */
    public function Go() {
        $rs = array('code' => 0, 'msg' => '', 'info' => array());
        //判断服务商是否存在
        $domain = new Domain_Company_User();
        $userInfo = $domain->getBaseInfo($this->userId);
        if(empty($userInfo)){
            DI()->logger->debug('User not found', $this->userId);

            $rs['code'] = 106;
            $rs['msg'] = T('User not exists');
            return $rs;
        }

        $updateRs = $domain->unBanUser($this->userId);
        if(! $updateRs){
            $rs['code'] = 108;
            $rs['msg'] = T('Update failed');
            return $rs;
        }
        $rs['user_id'] = $this->userId;
        return $rs;
    }

}

