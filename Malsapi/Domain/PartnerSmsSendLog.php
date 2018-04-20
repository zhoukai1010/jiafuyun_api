<?php
class Domain_PartnerSmsSendLog {
    var $model;

    public function __construct() {
        $this->model = new Model_SmsSendLog ();
    }
    //短信发送日志列表
    public function getAllSendyPage($filter, $page = 1, $page_size = 20, $orderby = '') {

        $rs = $this->model->getAll ( '*', $filter, $page, $page_size, $orderby );

        return $rs;
    }
    public function getSendCount($filter) {
        return $this->model->getCount ( $filter );
    }

    //生成发送日志
    public function addSendLog( $mobile, $content) {
        $rs = array ('code' => 0, 'msg' => '', 'info' => array ());

        $sendLog = new Model_SmsSendLog ();
        $data = array(
            'mobile' => $mobile,
            'content' => $content,
            'send_time' => time (),
        );
        $id = $sendLog->insert ( $data );
        if (! $id) {
            throw new LogicException ( T ( 'Create failed' ), 102 );
        }
        return $rs;
    }


}
