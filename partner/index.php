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
    @header('Access-Control-Allow-Origin : http://zabreguh5.mshenpu.com');
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
    $noneedApiList = array('Partner_Login');
    if(in_array($_REQUEST['service'],$noneedApiList)){
        return true;
    }
    $rs = DI()->response;
    if(isset($_REQUEST['jfy_pid'])){
        $jfyPid = $_REQUEST['jfy_pid'];//partner_session
        $sessionDomain = new Domain_PartnerSession();
        $sessionData = $sessionDomain->checkSession($jfyPid);
        if (!empty($sessionData)) {
            $_REQUEST['partner_id'] = $sessionData['partner_id'];
        } else {
            $rs->setRet(200);
            $rs->setData(array('code'=>108,'msg'=>T('Please login first')));
            $rs->output();
            exit;
        }
    }else{
        $rs->setRet(200);
        $rs->setData(array('code'=>108,'msg'=>T('Please login first')));
        $rs->output();
        exit;
    }
}



