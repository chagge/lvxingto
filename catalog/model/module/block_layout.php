<?php
class ModelModuleBlockLayout extends Model {
	public function getblocklayoutsetting() {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "module WHERE code = 'block_layout'");
		
		if ($query->row) {
			return unserialize($query->row['setting']);
		} else {
			return array();	
		}
	}
}