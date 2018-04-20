<?php
class Domain_Wechat {
	var $model;

	public function __construct() {
//		$this->model = new Model_Service ();
	}

    //获取列表
	public function getAllByPage($filter, $page = 1, $page_size = 20, $orderby = ''){
		$rs = $this->model->getAll ( '*', $filter, $page, $page_size, $orderby );

		return $rs;
	}
	//获取数量
	public function getCount($filter) {
		return $this->model->getCount ( $filter );
	}
	//获取AccessToken
    public function getAccessToken(){

    }
    //获取粉丝信息
    public function getFansInfo($code){
        //code换token
        $changeTokenUrl = DI ()->config->get ( 'app.wechat.get_web_authorizer_change_token_url' );
        $appid = DI ()->config->get ( 'app.wechat.mp_appid' );
        $secret = DI ()->config->get ( 'app.wechat.mp_appsecret' );
        $changeTokenUrl = sprintf($changeTokenUrl,$appid,$secret,$code);
        $accessTokenRs = $this->send_post($changeTokenUrl);
        $accessTokenInfo = json_decode($accessTokenRs,true);
        if((!$accessTokenInfo) || !empty($accessTokenInfo['errcode'])){
            throw new LogicException ( T ( 'Get failed' ), 100 );
        }
        //token获取信息
        $userInfoUrl = DI ()->config->get ( 'app.wechat.get_web_authorizer_user_info_url' );
        $userInfoUrl = sprintf($userInfoUrl,$accessTokenInfo['access_token'],$accessTokenInfo['openid']);
        $userInfoRs = $this->send_post($userInfoUrl);
        $userInfo = json_decode($userInfoRs,true);
        return $userInfo;
    }


    private function send_post($url, $post_data = '') {
        $options = array(
            'http' => array(
                'method' => 'POST',
                'header' => 'Content-type:application/x-www-form-urlencoded',
                'content' => $post_data,
                'timeout' => 15 * 60 // 超时时间（单位:s）
            )
        );
        $context = stream_context_create($options);
        $result = file_get_contents($url, false, $context);

        return $result;
    }
    private function send_get($url, $post_data = '') {
        $options = array(
            'http' => array(
                'method' => 'GET',
                'header' => 'Content-type:application/x-www-form-urlencoded',
                'content' => $post_data,
                'timeout' => 15 * 60 // 超时时间（单位:s）
            )
        );
        $context = stream_context_create($options);
        $result = file_get_contents($url, false, $context);

        return $result;
    }

}
