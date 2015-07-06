<?php
class ModelSellerSellerVerified extends Model {
	public function addverifiedtype($data) {
		$query = $this->db->query("INSERT INTO " . DB_PREFIX . "seller_verified SET customer_id = '" . (int)$this->customer->getID() . "', verified_type = '" . (int)$data['verified_type'] . "' , add_date = NOW()");

	}
	
	public function getsellerverifiedinfo() {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "seller_verified WHERE customer_id = '" . (int)$this->customer->getID() . "'");
	
			return $query->row;
	}
	
	public function getbusinessnavigationchild($last_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "business_navigation WHERE last_id = '" . $this->db->escape($last_id) . "'AND status = '" . '1' . "'");
	
			return $query->rows;
	}
}