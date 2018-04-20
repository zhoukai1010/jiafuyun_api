<?php
/**
 * 默认接口服务类
 *
 * @author: Dm
 */
class Api_Wechat_WebAuth_FansInfoGet extends PhalApi_Api {
    
    public function getRules() {
        return array (
                 'Go' => array(
                     'code' => array('name' => 'code' , 'type' => 'string' , 'require' => true, 'desc' => 'CODE'),
                     'state' => array('name' => 'state' , 'type' => 'string' , 'require' => true, 'desc' => '附加参数'),
//                     'appid' => array('name' => 'appid', 'type' => 'string', 'require' => true, 'desc' => '公众号appid'),
                     'redirectUrl' => array('name' => 'redirect_url', 'type' => 'string', 'require' => true, 'desc' => '跳转地址'),
            ),
        );
    }
  
  /**
     * 获取粉丝信息
     * #desc 用于获取当前粉丝信息
     * #return int code 操作码，0表示成功
     * #return string openid 粉丝openid
     * #return int subscribe 是否关注 0:未关注 1:已关注
     * #return string nickname 粉丝昵称
     * #return int sex 粉丝性别 1:男 2:女
     * #return string country 国家
     * #return string province 省份
     * #return string city 城市
     * #return string language 语言编码
     * #return string headimgurl 语言编码
     * #return string subscribe_time 关注时间
  */
    public function Go() {
        $rs = array('code' => 0, 'msg' => '', 'info' => array());
        $domain = new Domain_Wechat();
        $code = $this->code;
        try {
          $fansInfo = $domain->getFansInfo($code);
        } catch ( Exception $e ) {
            $rs ['code'] = $e->getCode ();
            $rs ['msg'] = $e->getMessage ();
            return $rs;
        }
        $fansInfo = json_encode($fansInfo);
        DI()->cookie->set('jfy_ci',$fansInfo);
        header("Location:".$this->redirectUrl);
        exit();
    }
    
}
