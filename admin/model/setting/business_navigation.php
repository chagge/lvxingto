<?php
class ModelSettingBusinessnavigation extends Model {
	public function getbusinessnavigationparent() {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "business_navigation WHERE last_id = '" . '0' . "' AND language_id = '" . (int)$this->config->get('config_language_id') . "' AND status = '1'" ."ORDER BY sort_order ASC");

		return $query->rows;
	}
	
	public function getbusinessnavigationchildlastid() {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "business_navigation WHERE last_id > " . 0 . " AND status = '" . '1' . "'");
	
			return $query->rows;
	}
	
	public function getbusinessnavigationchild($last_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "business_navigation WHERE last_id = '" . $this->db->escape($last_id) . "'AND status = '" . '1' . "'");
	
			return $query->rows;
	}
}