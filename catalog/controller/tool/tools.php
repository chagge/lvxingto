<?php
class ControllerToolTools extends Controller {
	//返回延迟加载占位图给js调用
	public function getlazyloadgif(){
		if ($this->request->server['HTTPS']) {
			$server = $this->config->get('config_ssl');
		} else {
			$server = $this->config->get('config_url');
		}
		
		if ($this->request->get['size']='260*260') {
			$laxyloadgif=$server.'catalog/view/theme/default/image/ajax-loader260x260.gif';
		}
		
		if ($this->request->get['size']='130*100') {
			$laxyloadgif=$server.'catalog/view/theme/default/image/ajax-loader130x100.gif';
		}
		//$laxyloadgif=$server.'catalog/view/theme/default/image/ajax-loader.gif';
		echo $laxyloadgif;
	}
}