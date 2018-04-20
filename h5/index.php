<?php
/**
 *
 * 神铺商户管理后台入口
 *
 */

require_once dirname(__FILE__) . '/init.php';

$isWxApp = DI()->cookie->get('isWxApp');
$debug = DI ()->config->get ( 'sys.debug' );
if($debug){

}else{
    @header('Access-Control-Allow-Credentials : true');
    if($isWxApp == 'wxApp'){
        @header('Access-Control-Allow-Origin : https://h5.jiafuyun.com');
    }else{
        @header('Access-Control-Allow-Origin : http://h5.jiafuyun.com');
    }
}

//装载你的接口
DI()->loader->addDirs(array('Malsapi','Library'));
DI()->pay = new Pay_Lite();
$api = new PhalApi();

checkPermission();
if(isset($_REQUEST['service']))$_REQUEST['service'] = $_REQUEST['service'].'.Go';
$rs = $api->response();
$rs->output();
/** ---------------- 响应接口请求 ---------------- **/

function checkPermission()
{
    $rs = DI()->response;
    $noneedApiList = array('Customer_MiniSoft_Openid_Get','Customer_Wechat_Login','Customer_Login','Notify','Wechat_WebAuth_FansInfoGet','Wechat_WebAuth_CodeGet','Customer_WeChat_Login','Area_AllListGet','Area_ListGet','Sms_SendCode','Service_Add','Service_Delete','Service_Edit','Service_ListGet','Service_GetInfo');//无需登录的接口
    if(in_array($_REQUEST['service'],$noneedApiList)){
        return true;
    }

    $jfyCsId = DI()->cookie->get('jfy_csid');

    //判断接口是否有权限
    $whiteApiList = array('Customer_Wechat_Check','MiniPay','Pay','Customer_InfoGet','Company_Order_Appraise_Add','Customer_Order_Cancel','Customer_Order_ListGet','Customer_Order_InfoGet','Customer_Address_Default','Customer_Address_InfoGet','Customer_Address_Delete','Customer_Address_Update','Customer_Address_Add','Customer_Online_Add','Customer_Customer_InfoGet','Customer_Customer_Session','Sms_SendCode','Order_GetTime', 'Customer_Address_ListGet', 'Order_Create', 'Order_Confirm', 'Service_GetOne'); //接口权限
    if (!in_array($_REQUEST['service'], $whiteApiList)) {
        $rs->setRet(200);
        $rs->setData(array('code'=>20,'msg'=>T('Api No permissions')));
        $rs->output();
        exit;
    }
    if($_REQUEST['service'] == 'MiniPay'){
        $jfyCsId = $_REQUEST['jfy_csid'];
    }

    if( empty($jfyCsId)){
        //未登录
        $rs->setRet(200);
        $rs->setData(array('code'=>105,'msg'=>T('Please login first')));
        $rs->output();
        exit;
    }else{
        //检测session是否正确
        $sessionDomain = new Domain_CustomerSession();
        $sessionInfo = $sessionDomain->checkSession($jfyCsId);

        if (!empty($sessionInfo)) {
            $_REQUEST['customer_id'] = $sessionInfo['customer_id'];
        } else {
            DI()->cookie->delete('jfy_csid');
            $rs->setRet(200);
            $rs->setData(array('code'=>105,'msg'=>T ('Please login first')));
            $rs->output();
            exit;
        }
    }

}



