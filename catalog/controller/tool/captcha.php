<?php
class ControllerToolCaptcha extends Controller {
	public function index() {
		if ($this->request->get['zoom']){
			$zoom=$this->request->get['zoom'];
		}else{
			$zoom=3;
		}
		//验证码相关参数
		$this->captcha->set(array(
		    'length' => 4,
			'zoom'=>$zoom,
			'density'=>9,
			'noise'=>2,
			'type' => 0
		));
		$this->captcha->output();
	}
}