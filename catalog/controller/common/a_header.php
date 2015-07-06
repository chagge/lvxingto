<?php
class ControllerCommonAheader extends Controller {
	public function index() {
		$data['title'] = $this->document->getTitle();

		if ($this->request->server['HTTPS']) {
			$server = $this->config->get('config_ssl');
		} else {
			$server = $this->config->get('config_url');
		}

		$data['base'] = $server;
		$data['description'] = $this->document->getDescription();
		$data['keywords'] = $this->document->getKeywords();
		$data['links'] = $this->document->getLinks();
		$data['styles'] = $this->document->getStyles();
		$data['scripts'] = $this->document->getScripts();
		$data['lang'] = $this->language->get('code');
		$data['direction'] = $this->language->get('direction');

		$data['name'] = $this->config->get('config_name');

		if (is_file(DIR_IMAGE . $this->config->get('config_icon'))) {
			$data['icon'] = $server . 'image/' . $this->config->get('config_icon');
		} else {
			$data['icon'] = '';
		}

		if (is_file(DIR_IMAGE . $this->config->get('config_logo'))) {
			$data['logo'] = $server . 'image/' . $this->config->get('config_logo');
		} else {
			$data['logo'] = '';
		}

		$this->load->language('common/a_header');

		$data['text_home'] = $this->language->get('text_home');
		$data['text_wishlist'] = sprintf($this->language->get('text_wishlist'), (isset($this->session->data['wishlist']) ? count($this->session->data['wishlist']) : 0));
		$data['text_shopping_cart'] = $this->language->get('text_shopping_cart');
		$data['text_logged'] = sprintf($this->language->get('text_logged'), $this->url->link('seller/admin', '', 'SSL'), $this->customer->getFirstName(), $this->url->link('account/logout', '', 'SSL'));

		$data['text_account'] = $this->language->get('text_account');
		$data['text_my_account'] = $this->language->get('text_my_account');
		$data['text_order'] = $this->language->get('text_order');
		$data['text_contact_us'] = $this->language->get('text_contact_us');
		$data['text_businesses'] = $this->language->get('text_businesses');
		$data['text_transaction'] = $this->language->get('text_transaction');
		$data['text_download'] = $this->language->get('text_download');
		$data['text_logout'] = $this->language->get('text_logout');
		$data['text_checkout'] = $this->language->get('text_checkout');
		$data['text_category'] = $this->language->get('text_category');
		$data['text_all'] = $this->language->get('text_all');
		$data['text_welcome'] = $this->language->get('text_welcome');
		$data['text_or'] = $this->language->get('text_or');
		$data['text_map'] = $this->language->get('text_map');
		$data['text_search_key'] = $this->language->get('text_search_key');

		$data['home'] = $this->url->link('seller/admin');
		$data['wishlist'] = $this->url->link('account/wishlist', '', 'SSL');
		$data['logged'] = $this->customer->isLogged();
		$data['account'] = $this->url->link('account/account', '', 'SSL');
		$data['order'] = $this->url->link('account/order', '', 'SSL');
		$data['transaction'] = $this->url->link('account/transaction', '', 'SSL');
		$data['download'] = $this->url->link('account/download', '', 'SSL');
		$data['logout'] = $this->url->link('account/logout', '', 'SSL');
		$data['shopping_cart'] = $this->url->link('checkout/cart');
		$data['checkout'] = $this->url->link('checkout/checkout', '', 'SSL');
		$data['contact'] = $this->url->link('information/contact');
		$data['telephone'] = $this->config->get('config_telephone');
		$data['businesses'] = $this->url->link('seller/admin', '', 'SSL');
		$data['search_url'] = $this->url->link('product/search');

		$status = true;
		
		if (isset($this->request->server['HTTP_USER_AGENT'])) {
			$robots = explode("\n", str_replace(array("\r\n", "\r"), "\n", trim($this->config->get('config_robots'))));

			foreach ($robots as $robot) {
				if ($robot && strpos($this->request->server['HTTP_USER_AGENT'], trim($robot)) !== false) {
					$status = false;

					break;
				}
			}
		}

		// Menu
		$this->load->model('catalog/category');

		$this->load->model('catalog/product');

		$data['categories'] = array();

		$categories = $this->model_catalog_category->getCategories(0);

		foreach ($categories as $category) {
			if ($category['top']) {
			//判断是否在导航上显示
				$whethers=unserialize($category['whether']);
				$whether=$this->model_catalog_category->array_merge_rec($whethers);//合并数组
				if (in_array("4",$whether,TRUE)){
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
				// Level 2
				$children_data = array();

				$children = $this->model_catalog_category->getCategories($category['category_id']);

				foreach ($children as $child) {
					//判断子分类url 是否存在
					if ($child['url']) {
						$child_href=$child['url'];
					}else {
						$child_href=$this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id']);
					}
					$filter_data = array(
						'filter_category_id'  => $child['category_id'],
						'filter_sub_category' => true
					);

					$children_data[] = array(
						'name'  => $child['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
						'href'  => $child_href
					);
				}

				// Level 1
				$data['categories'][] = array(
					'name'     => $name,
					'children' => $children_data,
					'column'   => $category['column'] ? $category['column'] : 1,
					'href'     => $category_href
				);
			}
		}

		$data['language'] = $this->load->controller('common/language');
		$data['currency'] = $this->load->controller('common/currency');
		$data['search'] = $this->load->controller('common/search');
		$data['cart'] = $this->load->controller('common/cart');

		// For page specific css
		if (isset($this->request->get['route'])) {
			if (isset($this->request->get['product_id'])) {
				$class = '-' . $this->request->get['product_id'];
			} elseif (isset($this->request->get['path'])) {
				$class = '-' . $this->request->get['path'];
			} elseif (isset($this->request->get['manufacturer_id'])) {
				$class = '-' . $this->request->get['manufacturer_id'];
			} else {
				$class = '';
			}

			$data['class'] = str_replace('/', '-', $this->request->get['route']) . $class;
		} else {
			$data['class'] = 'common-home';
		}

		//生成二维码用在右侧导航上
		if (is_file(DIR_IMAGE . $this->config->get('config_mbqr'))) {
			$data['mbqr'] = $server . 'image/' . $this->config->get('config_mbqr');
		} else {
			$data['mbqr'] = '';
		}
		
		//左侧导航显示微信二维码
		if (is_file(DIR_IMAGE . $this->config->get('config_wxqr'))) {
			$data['wxqr'] = $server . 'image/' . $this->config->get('config_wxqr');
		} else {
			$data['wxqr'] = '';
		}
		
		$this->load->model('tool/search');
		$data['search_key']=$this->model_tool_search->getSearchkey();
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/a_header.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/common/a_header.tpl', $data);
		} else {
			return $this->load->view('default/template/common/a_header.tpl', $data);
		}
	}
}