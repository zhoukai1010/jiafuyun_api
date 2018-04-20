<?php
/**
 *
 * 神铺商户管理后台入口
 *
 */

require_once dirname(__FILE__) . '/init.php';

$debug = DI ()->config->get ( 'sys.debug' );
if($debug){

}else{
    @header('Access-Control-Allow-Credentials : true');
    @header('Access-Control-Allow-Origin : http://jfbuserh5.mshenpu.com');
}

//装载你的接口
DI()->loader->addDirs(array('Malsapi','Library'));

$api = new PhalApi();

checkLogin();
if(isset($_REQUEST['service']))$_REQUEST['service'] = $_REQUEST['service'].'.Go';
$rs = $api->response();
$rs->output();
/** ---------------- 响应接口请求 ---------------- **/

function checkLogin(){

    $rs = DI()->response;
    if(isset($_REQUEST['sp_csid'])){
        $session = $_REQUEST['sp_csid'];//customer_session
    }

    //不需要登录权限的接口
    $noneedApiList = array('MiniSoft_Openid_Get','MiniSoft_Login','MiniSoft_WeChat_Login','Customer_Customer_Session','Service_ListGet','Sms_SendCode','Customer_Customer_Login','Customer_Customer_Register');
    if(in_array($_REQUEST['service'],$noneedApiList)){
        return true;
    }

    if( empty($session)) {
        $rs->setRet(200);
        $rs->setData(array('code'=>178,'msg'=>T ('Please login first')));
        $rs->output();
        exit;
    }else{
        $domain = new Domain_Customer();
        $sessionData = $domain->checkSession($session);
        if ( $sessionData) {
            $_REQUEST['bbc_customer_id'] = $sessionData['customer_id'];

        } else {
            $rs->setRet(200);
            $rs->setData(array('code'=>178,'msg'=>T ('Please login first')));
            $rs->output();
            exit;
        }

    }

}



