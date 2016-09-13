<?php   
/*
 * @support
 * http://www.opensourcetechnologies.com/contactus.html
 * sales@opensourcetechnologies.com
* */
class ControllerPricingtablePricingtable extends Controller {
	private $error;
	
	public function index() {
    	$this->load->model('pricingtable/pricingtable');
    	
    	$this->language->load('pricingtable/pricingtable');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$data['breadcrumbs'] = array();
 
      	$data['breadcrumbs'][] = array(
        	'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home'),
        	'separator' => false
      	);		
		
		if (isset($this->request->get['route'])) {
       		$data['breadcrumbs'][] = array(
        		'text'      => $this->language->get('heading_title'),
				'href'      => $this->url->link($this->request->get['route'],'pricetable_id='. $this->request->get['pricetable_id'], 'SSL'),
        		'separator' => $this->language->get('text_separator')
      		);	   	
		}
		
		$data['heading_title'] = $this->language->get('heading_title');
		$data['entry_description'] = $this->language->get('entry_description');
		$data['entry_empty'] = $this->language->get('entry_empty');
		
    	$data['button_addcart'] = $this->language->get('button_addcart');

    	$pricingtable_info = $this->model_pricingtable_pricingtable->getPricingtable($this->request->get['pricetable_id']);
    	if (!empty($pricingtable_info)) {
			$data['data'] = $pricingtable_info;
		} else {
      		$data['data'] = '';
    	}
        if($pricingtable_info['enabled']==0) $this->response->redirect($this->url->link('common/home'));
    	$columns = 1;
    	foreach($pricingtable_info['data'] as $row){
    		if($row['status']!=0) $columns++;
    	}
    	switch ($columns) {
    		case 2:
    			$data['columns'] = 'pricing_two';
    			break;
    		case 3:
    			$data['columns'] = 'pricing_three';
    			break;
    		case 4:
    			$data['columns'] = 'pricing_four';
    			break;
    		case 5:
    			$data['columns'] = 'pricing_five';
    			break;
    		case 6:
    			$data['columns'] = 'pricing_six';
    			break;
    		default:
    			$data['columns'] = 'pricing_seven';
    			break;
    	}

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/pricingtable/pricingtable.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/pricingtable/pricingtable.tpl',$data));
		} else {
			
			$this->response->setOutput($this->load->view('default/template/pricingtable/pricingtable.tpl',$data));
		}

  	}
}
?>
