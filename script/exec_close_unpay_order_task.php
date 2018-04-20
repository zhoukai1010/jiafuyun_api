<?php
/**
 *
 * 每天凌晨一点结算
 *
 */

define('IN_SYS', true);

$_REQUEST['service'] = 'Task_CloseUnPay.Go';

require_once((dirname(__FILE__)) . '/script.php');