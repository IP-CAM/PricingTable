<?php  
/*
 * @support
 * http://www.opensourcetechnologies.com/contactus.html
 * sales@opensourcetechnologies.com
* */
class ControllerPricingtablepricingtable extends Controller {  
	private $error = array();
   
  	public function index() {
    	$this->load->language('pricingtable/pricingtable');

    	$this->document->setTitle($this->language->get('heading_title'));
	
		$this->load->model('pricingtable/pricingtable');


		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
    		$data = $this->request->post['data'];
    		
    		$this->model_pricingtable_pricingtable->editpricingtable($data, $this->request->get['pricetable_id']);
			
			$this->session->data['success'] = $this->language->get('text_success');
			
			$this->response->redirect($this->url->link('pricingtable/manage', 'token=' . $this->session->data['token']));
    	}

    	$this->getForm();
  	}


	private function getForm() {
    	$data['heading_title'] = $this->language->get('heading_title');
		
    	$data['entry_description'] = $this->language->get('entry_description');
    	$data['entry_email'] = $this->language->get('entry_email');
    	$data['entry_del'] = $this->language->get('entry_del');
    	$data['entry_add'] = $this->language->get('entry_add');
    	$data['entry_disable'] = $this->language->get('entry_disable');
    	$data['entry_enable'] = $this->language->get('entry_enable');
    	$data['entry_disable_product'] = $this->language->get('entry_disable_product');
    	$data['entry_enable_product'] = $this->language->get('entry_enable_product');
    	$data['entry_name'] = $this->language->get('entry_name');
    	$data['entry_url'] = $this->language->get('entry_url');
$data['text_edit'] = $this->language->get('text_edit');
    	$data['button_addcart'] = $this->language->get('button_addcart');
		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
    
 		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}
			
		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];
		
			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

  		$data['breadcrumbs'] = array();

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title_list'),
			'href'      => $this->url->link('pricingtable/manage', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		$data['action'] = $this->url->link('pricingtable/pricingtable', 'token=' . $this->session->data['token'].'&pricetable_id='. $this->request->get['pricetable_id'], 'SSL');
		  
    	$data['cancel'] = $this->url->link('pricingtable/manage', 'token=' . $this->session->data['token'], 'SSL');

      	$pricingtable_info = $this->model_pricingtable_pricingtable->getpricingtable($this->request->get['pricetable_id']);

    	if (isset($this->request->post['data'])) {
      		$data['data'] = $this->request->post['data'];
    	} elseif (!empty($pricingtable_info)) {
			$data['data'] = $pricingtable_info;
		} else {
      		$data['data'] = '';
    	}
 		$data['token'] = $this->session->data['token'];
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');
		$this->response->setOutput($this->load->view('pricingtable/pricingtable_form.tpl', $data));
  	} 	 	
	
	private function validate() {
		if (!$this->user->hasPermission('modify', 'pricingtable/pricingtable')) {
      		$this->error['warning'] = $this->language->get('error_permission');
    	} 
						
		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}

}
?>
