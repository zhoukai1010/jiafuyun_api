<?php
/**
 * 请在下面放置任何您需要的应用配置
 */
return array (

    /**
     * 应用接口层的统一参数
     */
    'apiCommonRules' => array (
        'sign' => array (
            'name' => 'sign',
            'require' => false
        )
    ),
    'login' => array (
        'user_session_time' => 86400,
        'customer_session_time' => 86400 * 3650,//10年
    ),
    'sms' => array (
        'qcloud_sms_appid' => '1400013841',
        'qcloud_sms_appkey' => 'f4516f241ab96f8c25c0020975f4f855',
        'diyang_sms_yx_user' => 'miaoshenyx',
        'diyang_sms_yx_pwd' => 'miaoshenyx',
        'diyang_sms_yzm_user' => 'miaoshenyzm',
        'diyang_sms_yzm_pwd' => 'miaoshenyzm',
        'diyang_sms_wl_user' => 'miaoshenwl',
        'diyang_sms_wl_pwd' => 'miaoshenwl',
    ),
    'api' => array (
        'sign_token' => 'BaNyx2U8j1'
    ),
    'jfy' => array(
        'get_api_url' => 'api.jiafuyun.com',
    ),
    'wechat' => array (
        'get_web_authorizer_code_url' => 'https://open.weixin.qq.com/connect/oauth2/authorize?appid=%s&redirect_uri=%s&response_type=code&scope=snsapi_userinfo&state=STATE#wechat_redirect',
        'get_web_base_authorizer_code_url' => 'https://open.weixin.qq.com/connect/oauth2/authorize?appid=%s&redirect_uri=%s&response_type=code&scope=snsapi_base&state=STATE#wechat_redirect',
        'get_web_authorizer_change_token_url' => 'https://api.weixin.qq.com/sns/oauth2/access_token?appid=%s&secret=%s&code=%s&grant_type=authorization_code',
        'get_web_authorizer_user_info_url' => 'https://api.weixin.qq.com/sns/userinfo?access_token=%s&openid=%s&lang=zh_CN',
        'mp_appid'=>'',
        'mp_appsecret'=>'',
        'mp_token'=>'',
        'mp_key'=>'',
    ),
    'Pay' => array(
        //异步/同步地址
        'notify_url' => 'http://api.jiafuyun.com/h5/pay/',
        //微信支付设置
        'wechat' => array(
            //公众号的唯一标识
            'appid' => '',
            //商户号
            'mchid' => '',
            //公众号的appsecret
            'appsecret' => '',
            //微信支付Key
            'key' => ''
        ),
    ),
);