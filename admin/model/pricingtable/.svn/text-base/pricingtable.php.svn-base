<?php
/*
 * @support
 * http://www.opensourcetechnologies.com/contactus.html
 * sales@opensourcetechnologies.com
* */
class ModelPricingtablePricingtable extends Model {
	public function deletePricingtable($pricetable_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "pricetable WHERE pricetable_id = '" . (int)$pricetable_id . "'");
	}

	public function statusPricingtable($pricetable_id, $status) {
		$this->db->query("UPDATE `" . DB_PREFIX . "pricetable` SET enabled = '".$status."' WHERE pricetable_id = '" . (int)$pricetable_id . "'");
	}

	public function editPricingtable($data = array(), $pricetable_id) {
		$product = array();
		$i=0;
		foreach ($data['product_id'] as $row) {
			$text = array();
			$type = array();
			if(isset($data['data'][$i]['type'])){
				foreach($data['data'][$i]['type'] as $value){
					$type[] = $value;
				}
			}
			if(isset($data['data'][$i]['text'])) $text = $data['data'][$i]['text'];
			$product[] = array(
				'product_id' => $data['product_id'][$i],
				'price' => $data['price'][$i],
				'name' => $data['name'][$i],
				'description' => $data['description'][$i],
				'status_product' => $data['status_product'][$i],
				'status' => $data['status'][$i],
				'type' => $type,
				'text' => $text,
				);
			$i++;
		}
		$i=0;
		if(isset($data['feature_list']))
		{
			foreach($data['feature_list'] as $row){
				$feature_list[] = array(
					'feature' => $data['feature_list'][$i],
					'tooltip' => $data['tooltip'][$i],
					);
				$i++;
			}

			$data['feature_list'] = serialize($feature_list);
		}
		else
		$data['feature_list']=serialize(array());	
		$data['data'] = serialize($product);
		$data['date_added'] = time();
		$this->db->query("UPDATE `" . DB_PREFIX . "pricetable` SET 
			pricetable_name = '" . $data['pricetable_name'] . "' ,
			pricetable_url = '".$data['pricetable_url']."',
			email = '" . $data['email'] . "' ,
			label = '" . $data['label'] . "' ,
			feature_list = '".$data['feature_list']."',
			data = '".$data['data']."'
			WHERE pricetable_id = '".$pricetable_id."'");

		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'pricetable_id=" . (int) $pricetable_id . "'");
        if (!empty($data['pricetable_url'])) {
            $this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'pricetable_id=" . (int) $pricetable_id . "', keyword = '" . $this->db->escape($data['pricetable_url']) . "'");
        }

        $this->db->query("DELETE FROM " . DB_PREFIX . "pricetable_product WHERE pricetable_id = '".$pricetable_id."'");
        foreach($product as $row){
        	$this->db->query("INSERT INTO " . DB_PREFIX . "pricetable_product SET 
        	pricetable_id = '".$pricetable_id."', 
        	status_product = '" . $row['status_product'] . "', 
        	product_id = '" . $row['product_id'] . "'");
        }
	}
		
	public function addPricingtable() {
		$feature_list = array();
		$product = array();
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) LIMIT 0,5");
		foreach ($query->rows as $row) {
			$product[] = array(
				'product_id' => $row['product_id'],
				'price' => $row['price'],
				'name' => $row['name'],
				'description' => '',
				'status_product' => 0,
				'status' => 1,
				'type' => array(),
				'text' => array(),
				);
		}

		$data['email'] = '';
		$data['date_added'] = time();
		$data['feature_list'] = serialize($feature_list);
		$data['data'] = serialize($product);
		$this->db->query("INSERT INTO `" . DB_PREFIX . "pricetable` SET 
			pricetable_name = 'New Price Table',
			pricetable_url = '',
			email = '".$data['email']."',
			feature_list = '".$data['feature_list']."',
			label = 'Description',
			enabled = 1,
			data = '".$data['data']."',
			date_added = ".$data['date_added']);

		$pricetable_id = $this->db->getLastId();
		foreach($product as $row){
        	$this->db->query("INSERT INTO " . DB_PREFIX . "pricetable_product SET 
        	pricetable_id = '".$pricetable_id."', 
        	status_product = '" . $row['status_product'] . "', 
        	product_id = '" . $row['product_id'] . "'");
        }
	}

	public function getPricingtable($pricetable_id) {
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "pricetable` WHERE pricetable_id = '".$pricetable_id."'");
		if(empty($query->row)) return null;

		$data['pricetable_name'] = $query->row['pricetable_name'];
		$data['pricetable_url'] = $query->row['pricetable_url'];
		$data['email'] = $query->row['email'];
		$data['label'] = $query->row['label'];
		$data['enabled'] = $query->row['enabled'];
		$data['data'] = unserialize($query->row['data']);
		$data['feature_list'] = unserialize($query->row['feature_list']);
		return $data;
	}
	
	public function getPricingtables($data = array()) {
		$sql = "SELECT * FROM " . DB_PREFIX . "pricetable";
		
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
	
	public function getTotalPricingtables() {
      	$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "pricetable");
		
		return $query->row['total'];
	}	
}
?>
