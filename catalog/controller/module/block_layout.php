<?php
class ControllerModuleBlockLayout extends Controller {
	public function index($setting) {
		$this->load->model('design/layout');
		$this->load->model('extension/module');
		
		if (isset($setting['title'])) {
			$data['heading_title']=html_entity_decode($setting['title'] , ENT_QUOTES, 'UTF-8');
		}else {
			$data['heading_title']='';
		}
		

		$layout_modules=$setting['layout_module'];
		$data['modules'] = array();
		$data['modules']['top_modules']=array();
		$data['modules']['left_modules']=array();
		$data['modules']['right_modules']=array();
		foreach ($layout_modules as $layout_module){
			$part = explode('.', $layout_module['code']);
			if ($layout_module['position']=='column_right'){
				if (isset($part[0]) && $this->config->get($part[0] . '_status')) {
					$data['modules']['right_modules'][] = $this->load->controller('module/' . $part[0]);
				}
	
				if (isset($part[1])) {
					$setting_info = $this->model_extension_module->getModule($part[1]);
	
					if ($setting_info && $setting_info['status']) {
						$data['modules']['right_modules'][] = $this->load->controller('module/' . $part[0], $setting_info);
					}
				}
			}
			
			if ($layout_module['position']=='column_left'){
				if (isset($part[0]) && $this->config->get($part[0] . '_status')) {
					$data['modules']['left_modules'][] = $this->load->controller('module/' . $part[0]);
				}
				
				if (isset($part[1])) {
					$setting_info = $this->model_extension_module->getModule($part[1]);
				
					if ($setting_info && $setting_info['status']) {
						$data['modules']['left_modules'][] = $this->load->controller('module/' . $part[0], $setting_info);
					}
				}
			}
				
				if($layout_module['position']=='content_top'){
				if (isset($part[0]) && $this->config->get($part[0] . '_status')) {
					$data['modules']['top_modules'][] = $this->load->controller('module/' . $part[0]);
				}
				
				if (isset($part[1])) {
					$setting_info = $this->model_extension_module->getModule($part[1]);
				
					if ($setting_info && $setting_info['status']) {
						$data['modules']['top_modules'][] = $this->load->controller('module/' . $part[0], $setting_info);
					}
				}
			}
		}
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/block_layout.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/module/block_layout.tpl', $data);
		} else {
			return $this->load->view('default/template/module/block_layout.tpl', $data);
		}

	}
}