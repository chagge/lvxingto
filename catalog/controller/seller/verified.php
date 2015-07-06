<?php
class ControllerSellerVerified extends Controller {
	public function index() {
		$this->load->model('seller/seller_verified');
		$seller_info=$this->model_seller_seller_verified->getsellerverifiedinfo();

	if (!$this->customer->isLogged()) {
			$this->response->redirect($this->url->link('account/login', '', 'SSL'));
		} elseif (@$seller_info['customer_id'] == $this->customer->getID() && @$seller_info['verified_type'] == '1'){
			$this->response->redirect($this->url->link('seller/verified/personal', '', 'SSL'));
		} elseif (@$seller_info['customer_id'] == $this->customer->getID() && @$seller_info['verified_type'] == '2'){
			$this->response->redirect($this->url->link('seller/verified/business', '', 'SSL'));
		}

		$this->document->addStyle('catalog/view/javascript/ystep-master/css/ystep.css');
		$this->document->addScript('catalog/view/javascript/ystep-master/js/ystep.js');
		
		$this->load->language('seller/verified');
		
		$data['breadcrumbs'] = array();
		
		$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_home'),
				'href' => $this->url->link('common/home')
		);
		
		$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_sealler'),
				'href' => $this->url->link('sealler/verified')
		);
		
		$this->document->setTitle($this->language->get('heading_title_stype1'));
		$this->document->setDescription($this->config->get('config_meta_description'));
		$this->document->setKeywords($this->config->get('config_meta_keyword'));

		$data['text_personal_verified']=$this->language->get('text_personal_verified');
		$data['text_business_verified']=$this->language->get('text_business_verified');
		$data['text_personal_explanation']=$this->language->get('text_personal_explanation');
		$data['text_business_explanation']=$this->language->get('text_business_explanation');
		$data['text_personal_content']=$this->language->get('text_personal_content');
		$data['text_businese_content']=$this->language->get('text_businese_content');
		$data['text_continue']=$this->language->get('text_businese_content');
		
		if (isset($this->request->get['route'])) {
			$this->document->addLink(HTTP_SERVER, 'canonical');
		}
		
		$data['verified_action']=$this->url->link('seller/verified','','ssl');

	if (@$seller_info['customer_id']!== $this->customer->getID()) {
			if (isset($this->request->post['verified_type'])) {
			$data['verified_type']=$this->request->post['verified_type'];
			$this->model_seller_seller_verified->addverifiedtype($data);
			
			if ($this->request->post['verified_type'] == '1') {
				$this->response->redirect($this->url->link('seller/verified/personal', '', 'SSL'));
			}elseif ($this->request->post['verified_type'] == '2'){
				$this->response->redirect($this->url->link('seller/verified/business', '', 'SSL'));
			}
			}
		}
		
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/a_footer');
		$data['header'] = $this->load->controller('common/a_header');
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/seller/verified_step1.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/seller/verified_step1.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/seller/verified_step1.tpl', $data));
		}
	}
	
	public function personal() {
		$this->load->model('seller/seller_verified');
		$seller_info=$this->model_seller_seller_verified->getsellerverifiedinfo();
		
		$this->document->addScript('catalog/view/javascript/jquery-validation/jquery.validate.js');
		$this->document->addScript('catalog/view/javascript/jquery-validation/common.validate.js');
		$this->document->addScript('catalog/view/javascript/jquery/datetimepicker/moment.js');
		$this->document->addScript('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js');
		$this->document->addStyle('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css');
		
		if (!$this->customer->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('seller/verified', '', 'SSL');
			$this->response->redirect($this->url->link('account/login', '', 'SSL'));
		}
		
		$this->document->addStyle('catalog/view/javascript/ystep-master/css/ystep.css');
		$this->document->addScript('catalog/view/javascript/ystep-master/js/ystep.js');
		
		$this->load->language('seller/verified');
		
		$data['breadcrumbs'] = array();
		
		$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_home'),
				'href' => $this->url->link('common/home')
		);
		
		$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_sealler'),
				'href' => $this->url->link('sealler/verified')
		);
		
		$this->document->setTitle($this->language->get('heading_title_stype2'));
		$this->document->setDescription($this->config->get('config_meta_description'));
		$this->document->setKeywords($this->config->get('config_meta_keyword'));
		
		if (isset($this->request->get['route'])) {
			$this->document->addLink(HTTP_SERVER, 'canonical');
		}
		
		$data['verified_action']=$this->url->link('seller/verified/personal','','ssl');//提交链接
		
		$data['personal_verified_url']=$this->url->link('seller/verified/personal','','ssl');
		$data['business_verified_url']=$this->url->link('seller/verified/business','','ssl');
		
		//text
		$data['text_personal_class']=$this->language->get('text_personal_class');
		$data['text_select_paperwork_type']=$this->language->get('text_select_paperwork_type');
		$data['text_userinfo']=$this->language->get('text_userinfo');
		$data['text_bankinfo']=$this->language->get('text_bankinfo');
		$data['text_captcha'] = $this->language->get('text_captcha');
		$data['text_loading'] = $this->language->get('text_loading');
		
		
		//entry
		$data['entry_name']=$this->language->get('entry_name');
		$data['entry_paperwork_number']=$this->language->get('entry_paperwork_number');
		$data['entry_paperwork_type']=$this->language->get('entry_paperwork_type');
		$data['entry_validity']=$this->language->get('entry_validity');
		$data['entry_validity_start']=$this->language->get('entry_validity_start');
		$data['entry_validity_end']=$this->language->get('entry_validity_end');
		$data['entry_positive_card']=$this->language->get('entry_positive_card');
		$data['entry_back_card']=$this->language->get('entry_back_card');
		$data['entry_bank']=$this->language->get('entry_bank');
		$data['entry_bank_address']=$this->language->get('entry_bank_address');
		$data['entry_bank_number']=$this->language->get('entry_bank_number');
		$data['entry_holding_card']=$this->language->get('entry_holding_card');
		
		//Url
		$data['captcha_url'] = $this->url->link('tool/captcha', '', 'SSL');
		
		//button
		$data['button_submit']=$this->language->get('button_submit');
		
		//data
		$data['select_paperwork_types']=array(
			'id_card'=>array(
				'name'=>'身份证',
				'value'=>'1'
			),
			'police_certificate'=>array(
				'name'=>'警官证',
				'value'=>'2'
			),
			'pass'=>array(
				'name'=>'港奥台通行证',
				'value'=>'3'
			)
		);

		if (isset($this->request->post['name'])) {
			$data['name']=$this->request->post['name'];
		} elseif (isset($seller_info['name'])) {
			$data['name']=$seller_info['name'];
		}else {
			$data['name']='';
		}
		
		if (isset($this->request->post['paperwork_type'])) {
			$data['paperwork_type']=$this->request->post['paperwork_type'];
		} elseif (isset($seller_info['paperwork_type'])) {
			$data['paperwork_type']=$seller_info['paperwork_type'];
		}else {
			$data['paperwork_type']='';
		}
		
		if (isset($this->request->post['paperwork_number'])) {
			$data['paperwork_number']=$this->request->post['paperwork_number'];
		} elseif (isset($seller_info['paperwork_number'])) {
			$data['paperwork_number']=$seller_info['paperwork_number'];
		}else {
			$data['paperwork_number']='';
		}
		
		if (isset($this->request->post['validity_start'])) {
			$data['validity_start']=$this->request->post['validity_start'];
		} elseif (isset($seller_info['paperwork_number'])) {
			$data['validity_start']=$seller_info['validity_start'];
		}else {
			$data['validity_start']='';
		}
		
		if (isset($this->request->post['validity_end'])) {
			$data['validity_end']=$this->request->post['validity_end'];
		} elseif (isset($seller_info['validity_end'])) {
			$data['validity_end']=$seller_info['validity_end'];
		}else {
			$data['validity_end']='';
		}
		
		$this->load->model('tool/image');
		
		//接收图片
		if (isset($this->request->files['positive_card'])) {
			$positive_card=$this->request->files['positive_card'];//身份证正面图
		}

		if (isset($this->request->files['back_card'])) {
			$back_card=$this->request->files['back_card'];//身份证背面图
		}
		
		if (isset($this->request->files['holding_card'])) {
			$holding_card=$this->request->files['holding_card'];//手持身份证图
		}
		
		//图片验证
		
		
		if (isset($this->request->files['positive_card'])) {
			$data['positive_card']=$this->request->files['positive_card'];
		} elseif (isset($seller_info['positive_card']) && is_file(DIR_IMAGE . $seller_info['positive_card'])) {
			$data['positive_card']=$seller_info['positive_card'];
		}else {
			$data['positive_card_img']=$this->model_tool_image->resize('tools/no_image.png', 100, 100);
			$data['positive_card']='';
		}
		
		if (isset($this->request->files['back_card'])) {
			$data['back_card']=$this->model_tool_image->resize($this->request->files['back_card'], 100, 100);
		} elseif (isset($seller_info['back_card']) && is_file(DIR_IMAGE . $seller_info['back_card'])) {
			$data['back_card']=$this->model_tool_image->resize($seller_info['back_card'], 100, 100);
		}else {
			$data['back_card']=$this->model_tool_image->resize('tools/no_image.png', 100, 100);
		}
		
		if (isset($this->request->files['holding_card'])) {
			$data['holding_card']=$this->model_tool_image->resize($this->request->files['holding_card'], 100, 100);
		} elseif (isset($seller_info['holding']) && is_file(DIR_IMAGE . $seller_info['holding_card'])) {
			$data['holding_card']=$this->model_tool_image->resize($seller_info['holding_card'], 100, 100);
		}else {
			$data['holding_card']=$this->model_tool_image->resize('tools/no_image.png', 100, 100);
		}
		
		if (isset($this->request->post['bank'])) {
			$data['bank']=$this->request->post['bank'];
		} elseif (isset($seller_info['bank'])) {
			$data['bank']=$seller_info['bank'];
		}else {
			$data['bank']='';
		}
		
		if (isset($this->request->post['bank_address'])) {
			$data['bank_address']=$this->request->post['bank_address'];
		} elseif (isset($seller_info['bank_address'])) {
			$data['bank_address']=$seller_info['bank_address'];
		}else {
			$data['bank_address']='';
		}
		
		if (isset($this->request->post['bank_number'])) {
			$data['bank_number']=$this->request->post['bank_number'];
		} elseif (isset($seller_info['bank_number'])) {
			$data['bank_number']=$seller_info['bank_number'];
		}else {
			$data['bank_number']='';
		}
		
		if (isset($this->request->post['captcha'])) {
			$data['captcha'] = $this->request->post['captcha'];
		} else {
			$data['captcha'] = '';
		}
		
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/a_footer');
		$data['header'] = $this->load->controller('common/a_header');
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/seller/verified_personal_step2.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/seller/verified_personal_step2.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/seller/verified_personal_step2.tpl', $data));
		}
	}
	
	public function business() {
		if (!$this->customer->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('seller/verified', '', 'SSL');
			$this->response->redirect($this->url->link('account/login', '', 'SSL'));
		}
	
		$this->document->addStyle('catalog/view/javascript/ystep-master/css/ystep.css');
		$this->document->addScript('catalog/view/javascript/ystep-master/js/ystep.js');
	
		$this->load->language('seller/verified');
	
		$data['breadcrumbs'] = array();
	
		$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_home'),
				'href' => $this->url->link('common/home')
		);
	
		$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_sealler'),
				'href' => $this->url->link('sealler/verified')
		);
	
		$this->document->setTitle($this->language->get('heading_title_stype3'));
		$this->document->setDescription($this->config->get('config_meta_description'));
		$this->document->setKeywords($this->config->get('config_meta_keyword'));
	
		if (isset($this->request->get['route'])) {
			$this->document->addLink(HTTP_SERVER, 'canonical');
		}
	
		$data['personal_verified_url']=$this->url->link('seller/verified/personal','','ssl');
		$data['business_verified_url']=$this->url->link('seller/verified/business','','ssl');
	
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/a_footer');
		$data['header'] = $this->load->controller('common/a_header');
	
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/seller/verified_business_step2.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/seller/verified_business_step2.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/seller/verified_business_step2.tpl', $data));
		}
	}
	
	public function checklist() {
		if (!$this->customer->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('seller/verified', '', 'SSL');
			$this->response->redirect($this->url->link('account/login', '', 'SSL'));
		}
	
		$this->document->addStyle('catalog/view/javascript/ystep-master/css/ystep.css');
		$this->document->addScript('catalog/view/javascript/ystep-master/js/ystep.js');
	
		$this->load->language('seller/verified');
	
		$data['breadcrumbs'] = array();
	
		$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_home'),
				'href' => $this->url->link('common/home')
		);
	
		$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_sealler'),
				'href' => $this->url->link('sealler/verified')
		);
	
		$this->document->setTitle($this->language->get('heading_title_stype4'));
		$this->document->setDescription($this->config->get('config_meta_description'));
		$this->document->setKeywords($this->config->get('config_meta_keyword'));
	
		if (isset($this->request->get['route'])) {
			$this->document->addLink(HTTP_SERVER, 'canonical');
		}
	
		$data['personal_verified_url']=$this->url->link('seller/verified/personal','','ssl');
		$data['business_verified_url']=$this->url->link('seller/verified/business','','ssl');
	
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/a_footer');
		$data['header'] = $this->load->controller('common/a_header');
	
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/seller/verified_step3.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/seller/verified_step3.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/seller/verified_step3.tpl', $data));
		}
	}
	
	public function finish() {
		if (!$this->customer->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('seller/verified', '', 'SSL');
			$this->response->redirect($this->url->link('account/login', '', 'SSL'));
		}
	
		$this->document->addStyle('catalog/view/javascript/ystep-master/css/ystep.css');
		$this->document->addScript('catalog/view/javascript/ystep-master/js/ystep.js');
	
		$this->load->language('seller/verified');
	
		$data['breadcrumbs'] = array();
	
		$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_home'),
				'href' => $this->url->link('common/home')
		);
	
		$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_sealler'),
				'href' => $this->url->link('sealler/verified')
		);
	
		$this->document->setTitle($this->language->get('heading_title_stype5'));
		$this->document->setDescription($this->config->get('config_meta_description'));
		$this->document->setKeywords($this->config->get('config_meta_keyword'));
	
		if (isset($this->request->get['route'])) {
			$this->document->addLink(HTTP_SERVER, 'canonical');
		}
	
		$data['personal_verified_url']=$this->url->link('seller/verified/personal','','ssl');
		$data['business_verified_url']=$this->url->link('seller/verified/business','','ssl');
	
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/a_footer');
		$data['header'] = $this->load->controller('common/a_header');
	
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/seller/verified_step4.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/seller/verified_step4.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/seller/verified_step4.tpl', $data));
		}
	}
	
	protected function validatefrom() {
		if(preg_match('/^[\x{4e00}-\x{9fa5}]+$/u',$this->request->post['name'])){//验证姓名是否是中文
			$this->error['warning'] = $this->language->get('error_warning');
		}

		if (utf8_strlen($this->request->post['name'])<2 || utf8_strlen($this->request->post['name'])>4) {//姓名2——4位
			$this->error['warning'] = $this->language->get('error_warning');
		}
		
		if (isset($this->request->post['paperwork_type'])) {//身份证类型不为空
			$this->error['warning'] = $this->language->get('error_warning');
		}
		
		if (preg_match("/^\d{15}(\d{2}[A-Za-z0-9])?$/", $this->request->post['paperwork_number'])) {//验证是否是身份证号码
			$this->error['warning'] = $this->language->get('error_warning');
		}

		if (isset($this->request->post['validity_start']) && isset($this->request->post['validity_end'])) {//如果两个时间不为空
			if(preg_match("/^d{4}-d{2}-d{2}$/s",$this->request->post['validity_start']) && preg_match("/^d{4}-d{2}-d{2}$/s",$this->request->post['validity_end'])){//验证两个日期格式
				if (strtotime($this->request->post['validity_start']) < strtotime($this->request->post['validity_end'])) {//如果开始时间小于结束时间
					$this->error['warning'] = $this->language->get('error_warning');
				}
			}
		}
		
		//验证图片
		$yes_type=array("image/jpeg","image/png","image/jpeg");//支持的图片类型
	if (isset($this->request->files['positive_card'])) {//正面图不为空并且类型是图片，大小在4m内
			if (in_array($this->request->files['positive_card']['type'], $yes_type) && $this->request->files['positive_card']['size'] < '4194304') {//类型对，大小对
				$this->error['warning'] = $this->language->get('error_warning');
			}
		}
		
		return !$this->error;
	}
}