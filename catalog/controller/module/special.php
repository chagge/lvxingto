<?php
class ControllerModuleSpecial extends Controller {
	public function index($setting) {
		$this->load->language('module/special');

		$data['heading_title'] = $this->language->get('heading_title');

		$data['button_cart'] = $this->language->get('button_cart');
		$data['button_wishlist'] = $this->language->get('button_wishlist');

		$this->load->model('catalog/product');

		$this->load->model('tool/image');

		$data['products'] = array();

		$filter_data = array(
			'sort'  => 'pd.name',
			'order' => 'ASC',
			'start' => 0,
			'limit' => $setting['limit']
		);

		$results = $this->model_catalog_product->getProductSpecials($filter_data);

		if ($results) {
			foreach ($results as $result) {
				if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height']);
				} else {
					$image = $this->model_tool_image->resize('tools/placeholder.png', $setting['width'], $setting['height']);
				}

				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($result['price']);
				} else {
					$price = false;
				}

				if ((float)$result['special']) {
					$special = $this->currency->format($result['special']);
				} else {
					$special = false;
				}

				//if ($this->config->get('config_review_status')) {
					//$rating = $result['rating'];
				//} else {
					//$rating = false;
				//}

				$this->load->model('account/order');
				$product_payment_total=$this->model_account_order->product_payment_total($result['product_id']);
				
				$store_info=$this->model_catalog_product->getproductstoreinfo($result['product_id']);
				
				if (isset($store_info['store_id'])) {
					$store_id=$store_info['store_id'];
				}else {
					$store_id='0';
				}
				
				$data['products'][] = array(
					'product_id'  => $result['product_id'],
					'thumb'       => $image,
					'product_payment_total'=>sprintf($this->language->get('text_product_payment_total'), (isset($product_payment_total) ? $product_payment_total : 0)),
					'name'        => $result['name'],
					//'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('config_product_description_length')) . '..',
					'price'       => $price,
					'special'     => $special,
					//'rating'      => $rating,
					'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id'] . '&store_id=' . $store_id)
				);
			}

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/special.tpl')) {
				return $this->load->view($this->config->get('config_template') . '/template/module/special.tpl', $data);
			} else {
				return $this->load->view('default/template/module/special.tpl', $data);
			}
		}
	}
}