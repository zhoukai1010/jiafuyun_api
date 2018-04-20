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
    @header('Access-Control-Allow-Origin : http://userh5.jiafuyun.com');
}

//装载你的接口
DI()->loader->addDirs(array('Malsapi','Library'));

$api = new PhalApi();

checkLogin();

/** ---------------- 响应接口请求 ---------------- **/
if(isset($_REQUEST['service']))$_REQUEST['service'] = $_REQUEST['service'].'.Go';
$rs = $api->response();
$rs->output();

function checkLogin(){
    //无需登录的接口
    $noNeedApiList = array('Company_User_Login','Area_AllListGet','Area_ListGet');
    if(in_array($_REQUEST['service'],$noNeedApiList)){
        return true;
    }

    $rs = DI()->response;
    $jfySid = DI()->cookie->get('jfy_sid');
    if (empty($jfySid)) {
        $rs->setRet(200);
        $rs->setData(array('code'=>129,'msg'=>T('Please login first')));
        $rs->output();
        exit;
    }else{
        $domain = new Domain_Company_UserSession();
        $sessionData = $domain->checkSession($jfySid);
//        print_r($sessionData);exit;
        if($sessionData){
            //判断服务商状态
            if($sessionData['is_enable'] == 'n'){
                $rs->setRet(200);
                $rs->setData(array('code'=>109,'msg'=>T('User is already ban')));
                $rs->output();
                exit;
            }
            $_REQUEST['user_id'] = $sessionData['user_id'];
            $whiteApiList = array( 'Company_Order_Close','Company_Order_Cancel','Company_Order_ChangeStaff','Company_Order_Finish','Company_Order_Work','Company_Order_TestPass','Company_Order_TestClose','Company_Order_Test','Company_Order_Confirm','Company_Order_InfoGet','Company_Order_ListGet','Company_Information_Update','Company_Information_InfoGet','Company_Image_Update','Company_Image_ListGet','Company_Image_Delete','Company_Image_Add','Company_ImageCat_Update','Company_ImageCat_ListGet','Company_ImageCat_Delete','Company_ImageCat_Add','Company_Insurance_Update','Company_Insurance_Add','Company_Insurance_InfoGet','Company_Insurance_ListGet','Company_HealthRecord_Update','Company_HealthRecord_Add','Company_HealthRecord_InfoGet','Company_HealthRecord_ListGet','Company_HouseStaff_Update','Company_HouseStaff_Add','Company_HouseStaff_InfoGet','Company_HouseStaff_ListGet','Company_User_ChangePwd','Company_User_InfoGet','Company_User_Logout','Company_User_SessionCheck');
            if (!in_array($_REQUEST['service'], $whiteApiList)) {
                $rs->setRet(200);
                $rs->setData(array('code'=>20,'msg'=>'Api No permissions'));
                $rs->output();
                exit;
            }
        }else{
            DI()->cookie->delete('jfy_uid');
            $rs->setRet(200);
            $rs->setData(array('code'=>129,'msg'=>T ('Please login first')));
            $rs->output();
            exit;
        }
    }

}


