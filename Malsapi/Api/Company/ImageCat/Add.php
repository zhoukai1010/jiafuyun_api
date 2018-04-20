<?php
/**
 * 默认接口服务类
 *
 * @author: Dm
 */
class Api_Company_ImageCat_Add extends PhalApi_Api {
	
	public function getRules() {
		return array (
				 'Go' => array(
                     'userId' => array('name' => 'user_id','type'=>'int', 'min' => 1, 'require'=> true,'desc'=> '服务商ID'),
                     'imgCatName' => array('name' => 'img_cat_name', 'type' => 'string', 'min' => 1, 'require' => true,  'desc' => '分类名称'),
            ),
		);
 	}
	
  
  /**
     * 添加图片分类
     * #desc 用于添加图片分类
     * #return int code 操作码，0表示成功
     * #return int img_cat_id 分组ID
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

        $data = array(
            'user_id' =>$this->userId,
            'name' =>$this->imgCatName,
            'create_time' => time(),
        );

        $domain = new Domain_Company_ImageCat();

        try {

            DI ()->notorm->beginTransaction ( 'db_api' );
            $imgId = $domain->addImageCat($data);
            DI ()->notorm->commit( 'db_api' );

        } catch ( Exception $e ) {

            DI ()->notorm->rollback ( 'db_api' );
            $rs ['code'] = $e->getCode ();
            $rs ['msg'] = $e->getMessage ();
        }


        $rs['info']['img_cat_id'] = $imgId;

        return $rs;
    }
	
}
