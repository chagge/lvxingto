<?php 
class ModelToolSearch extends Model {
	public function addSearchkey($search_key) {
		if ($this->customer->isLogged()) {
			$customer_id =$this->customer->getId();
		}else {
			$customer_id ='0';
		}
		
		$this->addkey($search_key,$customer_id);
	}
	
	public function getSearchkey() {
		$query = $this->db->query("SELECT search_key FROM " . DB_PREFIX . "search_key group by search_key order by count(*) DESC limit 10");
		
		return $query->rows;
	}
	
	public function addkey($search_key,$customer_id) {//写入搜索关键词
				if(is_array($search_key)){//是数组
			foreach($search_key as $search_keys){
				$search_keys=trim($search_keys);//去掉两端空格
				if(!strlen($search_keys)=='0'){
					$this->db->query("INSERT INTO `" . DB_PREFIX . "search_key` SET `search_key` = '" . $this->db->escape($search_keys) . "',`account_id` = '" . $this->db->escape($customer_id) . "', `search_date` = NOW()");
				}
			}
		}else{//不是数组
			$this->db->query("INSERT INTO `" . DB_PREFIX . "search_key` SET `search_key` = '" . $this->db->escape($search_key) . "',`account_id` = '" . $this->db->escape($customer_id) . "', `search_date` = NOW()");
		}
	}
}