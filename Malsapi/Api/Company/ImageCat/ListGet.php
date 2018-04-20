<?php
/**
 * 默认接口服务类
 *
 * @author: Dm
 */
class Api_Company_ImageCat_ListGet extends PhalApi_Api {
	
	public function getRules() {
		return array (
				 'Go' => array(
                     'userId' => array('name' => 'user_id','type'=>'int', 'min' => 1, 'require'=> true,'desc'=> '服务商ID'),
            ),
		);
 	}
	
  
  /**
     * 获取图片分类列表
     * #desc 用于获取图片分类列表
     * #return int code 操作码，0表示成功
     * #return int id 分组ID
     * #return string name 分组名称
     * #return int name 分组名称
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

        $domain = new Domain_Company_ImageCat();
        $list = $domain->getCatList($this->userId);
        $rs['list'] = $list;

        return $rs;
    }
	
}
