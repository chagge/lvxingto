<?php
class ControllerSellerAdmin extends Controller {
	public function index() {
		if (!$this->customer->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('account/account', '', 'SSL');
			$this->response->redirect($this->url->link('account/login', '', 'SSL'));
		}elseif (!$this->customer->hasPermission('modify', 'seller/admin')){
			$this->response->redirect($this->url->link('seller/verified', '', 'SSL'));
		}
		
		$this->load->language('seller/admin');
		
		$this->document->setTitle($this->language->get('heading_title'));
		$this->document->setDescription($this->config->get('config_meta_description'));
		$this->document->setKeywords($this->config->get('config_meta_keyword'));

		if (isset($this->request->get['route'])) {
			$this->document->addLink(HTTP_SERVER, 'canonical');
		}

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/a_footer');
		$data['header'] = $this->load->controller('common/a_header');
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/seller/admin.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/seller/admin.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/seller/admin.tpl', $data));
		}
	}
}