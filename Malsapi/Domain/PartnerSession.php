<?php
class Domain_PartnerSession {
	var $model;

	public function __construct() {
		$this->model = new Model_PartnerSession ();
	}

    public function makeSession($id,$sessionData = array()){

        $this->deleteSession($id);

        $session = $this->genSessionId();
        $data = array(
            'partner_id' => $id,
            'session' => $session,
            'data'=>json_encode($sessionData),
            'create_time' => time(),
        );

        $this->model->insert($data);

        return $session;
    }

    public function deleteSession($id) {
        $filter = array('partner_id'=>$id);
        $this->model->deleteByWhere($filter);
    }

    private function genSessionId() {
        return md5(uniqid('', true).PhalApi_Tool::getClientIp().microtime(true).mt_rand(0,9999));
    }
    public function checkSession($session){

        $filter = array('session'=>$session);
        $sessionRow = $this->model->getByWhere($filter);

        if(!empty($sessionRow)){
            $expireTime = intval($sessionRow['create_time']) + DI ()->config->get ( 'app.login.customer_session_time' );
            if( $expireTime < time() ){
                $this->deleteSession($sessionRow['partner_id']);
                return false;
            }else{

                $sessionRow['data'] = $sessionRow;
                return $sessionRow;
            }

        }else{
            return false;
        }
    }

}
