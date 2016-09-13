<?php
/*
 * @support
 * http://www.opensourcetechnologies.com/contactus.html
 * sales@opensourcetechnologies.com
* */
class ModelPricingtablePricingtable extends Model {
	public function getPricingtable($pricetable_id) {
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "pricetable` WHERE pricetable_id = '".$pricetable_id."'");
		if(empty($query->row)) return null;

		$data['pricetable_name'] = $query->row['pricetable_name'];
		$data['email'] = $query->row['email'];
		$data['label'] = $query->row['label'];
		$data['enabled'] = $query->row['enabled'];
		$data['data'] = unserialize($query->row['data']);
		$data['feature_list'] = unserialize($query->row['feature_list']);
		return $data;
	}

	public function getPricingtableProducts() {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "pricetable_product WHERE status_product = 0");
		$result = $query->rows;
		$products = array();
		foreach($result as $row){
			$products[] = $row['product_id'];
		}
		return $products;
	}

	public function getPricingtables($data = array()) {
		$sql = "SELECT * FROM " . DB_PREFIX . "pricetable WHERE enabled = 1 ";
		
		if (isset($data['sort'])) {
			$sql .= " ORDER BY ".$data['sort'];
		} else {
			$sql .= " ORDER BY date_added";	
		}
			
		if (isset($data['order']) && ($data['order'] == 'DESC')) {
			$sql .= " DESC";
		} else {
			$sql .= " ASC";
		}
		
		if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}			

			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}	
			
			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}
			
		$query = $this->db->query($sql);
		
		return $query->rows;
	}
}
?>
