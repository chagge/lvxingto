<?php
class ControllerModuleCategory extends Controller {
	public function index() {
		$this->load->language('module/category');

		$data['heading_title'] = $this->language->get('heading_title');

		if (isset($this->request->get['path'])) {
			$parts = explode('_', (string)$this->request->get['path']);
		} else {
			$parts = array();
		}

		if (isset($parts[0])) {
			$data['category_id'] = $parts[0];
		} else {
			$data['category_id'] = 0;
		}

		if (isset($parts[1])) {
			$data['child_id'] = $parts[1];
		} else {
			$data['child_id'] = 0;
		}

		$this->load->model('catalog/category');

		$this->load->model('catalog/product');

		$data['categories'] = array();

		$categories = $this->model_catalog_category->getCategories(0);

		foreach ($categories as $category) {
			
		//判断是否在导航上显示
			$whethers=unserialize($category['whether']);
			$whether=$this->model_catalog_category->array_merge_rec($whethers);//合并数组
			if (@$this->request->get['route']=='common/home' || !@$this->request->get['route']) {
			if (in_array("2",$whether,TRUE)){
				$name=$category['name'];
				//判断分类是否存在url
				if ($category['url']){
					$category_href=$category['url'];
				}else {
					$category_href=$this->url->link('product/category', 'path=' . $category['category_id']);
				}
			}else {
				$name='';
				$category_href='';
			}
			}elseif (strpos(@$this->request->get['route'], 'seller') !== false){
			if (in_array("5",$whether,TRUE)){
				$name=$category['name'];
				//判断分类是否存在url
				if ($category['url']){
					$category_href=$category['url'];
				}else {
					$category_href=$this->url->link('product/category', 'path=' . $category['category_id']);
				}
			}else {
				$name='';
				$category_href='';
			}
			}elseif (strpos(@$this->request->get['route'], 'account') !== false){
				if (in_array("7",$whether,TRUE)){
					$name=$category['name'];
					//判断分类是否存在url
					if ($category['url']){
						$category_href=$category['url'];
					}else {
						$category_href=$this->url->link('product/category', 'path=' . $category['category_id']);
					}
				}else {
					$name='';
					$category_href='';
				}
			}elseif (strpos(@$this->request->get['route'], 'store') !== false){
				if (in_array("9",$whether,TRUE)){
					$name=$category['name'];
					//判断分类是否存在url
					if ($category['url']){
						$category_href=$category['url'];
					}else {
						$category_href=$this->url->link('product/category', 'path=' . $category['category_id']);
					}
				}else {
					$name='';
					$category_href='';
				}
			}else {
				if (in_array("3",$whether,TRUE)){
					$name=$category['name'];
					//判断分类是否存在url
					if ($category['url']){
						$category_href=$category['url'];
					}else {
						$category_href=$this->url->link('product/category', 'path=' . $category['category_id']);
					}
				}else {
					$name='';
					$category_href='';
				}
			}
			$children_data = array();

			$children = $this->model_catalog_category->getCategories($category['category_id']);

			foreach($children as $child) {
				$filter_data = array('filter_category_id' => $child['category_id'], 'filter_sub_category' => true);

				//判断子分类url 是否存在
				if ($child['url']) {
					$child_href=$child['url'];
				}else {
					$child_href=$this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id']);
				}
				$children_data[] = array(
					'category_id' => $child['category_id'],
					'name' => $child['name'],
					'href' => $child_href
				);
			}

			$filter_data = array(
				'filter_category_id'  => $category['category_id'],
				'filter_sub_category' => true
			);

			$data['categories'][] = array(
				'category_id' => $category['category_id'],
				'name'        => $name,
				'children'    => $children_data,
				'href'        => $category_href
			);
		}

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/category.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/module/category.tpl', $data);
		} else {
			return $this->load->view('default/template/module/category.tpl', $data);
		}
	}
}