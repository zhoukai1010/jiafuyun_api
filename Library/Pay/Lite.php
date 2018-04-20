<?php
/*
 * +----------------------------------------------------------------------
 * | 支付接口
 * +----------------------------------------------------------------------
 * | Copyright (c) 2015 summer All rights reserved.
 * +----------------------------------------------------------------------
 * | Author: summer <aer_c@qq.com> <qq7579476>
 * +----------------------------------------------------------------------
 * | This is not a free software, unauthorized no use and dissemination.
 * +----------------------------------------------------------------------
 * | Date
 * +----------------------------------------------------------------------
 */

class Pay_Lite {

    /**
     * 支付驱动实例
     * @var Object
     */
    private $payer;

    /**
     * 配置参数
     * @var type 
     */
    private $config;

    /**
     * 获取引擎
     * @var string
     */
    private $engine;

    /**
     * 获取错误
     * @var string
     */
    public $error = '';

    public function __call($method, $arguments) {
        if (method_exists($this, $method)) {
            return call_user_func_array(array(&$this, $method), $arguments);
        } elseif (!empty($this->payer) && $this->payer && method_exists($this->payer, $method)) {
            return call_user_func_array(array(&$this->payer, $method), $arguments);
        }
    }

    /**
     * 设置配置信息
     * @param string $engine 要使用的支付引擎
     * @param array  $config 配置
     */
    public function set($engine,$isMiniSoft = false) {
        /* 配置 */
        $this->engine = strtolower($engine);
        $this->config = array();

        $this->config['notify_url'] = DI()->config->get('app.Pay.notify_url') . $this->engine . '/notify.php';
        $this->config['return_url'] = DI()->config->get('app.Pay.notify_url') . $this->engine . '/return.php';
        if(! $isMiniSoft) {
            $config = DI()->config->get('app.Pay.' . $this->engine);
        }else{
            //获取小程序信息
            //小程序的支付设置
            $config =   array(
                //公众号的唯一标识
                'appid' => 'wx7f33ee6ec60e8306',
                //商户号
                'mchid' => '1501328721',

                //公众号的appsecret
                //  'appsecret' => '776419cef6cc67013a1adab1463598c9',

                //微信支付Key
                'key' => 'FjSbWaO7P4J1zEHDwKojJyl3yhNci1jb'
            );
        }

        if(!$config){
            $config = DI()->config->get('app.Pay.' . $this->engine);
        }

        if(!$config){
          DI()->logger->log('payError','No engine config', $this->engine);
          return false;
        }

        //合并配置
        $this->config = array_merge($this->config, $config);

        //设置引擎
        $engine = 'Pay_Engine_' . ucfirst(strtolower($this->engine));
        $this->payer = new $engine($this->config);
        if (!$this->payer) {
            DI()->logger->log('payError','No engine class', $engine);
            return false;
        }
        
        return true;
    }
}
