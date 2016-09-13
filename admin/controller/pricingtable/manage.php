<?php
/*
 * @support
 * http://www.opensourcetechnologies.com/contactus.html
 * sales@opensourcetechnologies.com
* */
class ControllerPricingtableManage extends Controller {
	private $error = array();
 
	public function index() {
		$this->load->language('pricingtable/manage');
 
		$this->document->setTitle($this->language->get('heading_title'));
 		
		$this->load->model('pricingtable/pricingtable');
		
		// Init
		$pricingtable_info = $this->model_pricingtable_pricingtable->getTotalpricingtables();

		if($pricingtable_info==0){
			$this->model_pricingtable_pricingtable->addpricingtable();
		}


		$this->getList();
	}

	public function insert() {
		$this->load->language('pricingtable/manage');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('pricingtable/pricingtable');
		
		if ($this->validateForm()) {		
			$this->model_pricingtable_pricingtable->addpricingtable();	
			$this->session->data['success'] = $this->language->get('text_success');
			$this->response->redirect($this->url->link('pricingtable/manage', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$this->getList();
	}

	public function delete() { 
		$this->load->language('pricingtable/manage');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('pricingtable/pricingtable');
		
		if (isset($this->request->post['selected']) && $this->validateDelete()) {
      		foreach ($this->request->post['selected'] as $pricetable_id) {
				$this->model_pricingtable_pricingtable->deletepricingtable($pricetable_id);	
			}
						
			$this->session->data['success'] = $this->language->get('text_success');
					
			$this->response->redirect($this->url->link('pricingtable/manage', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$this->getList();
	}

	public function status() { 
		$this->load->language('pricingtable/manage');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('pricingtable/pricingtable');
		
		if (isset($this->request->get['status'])&&isset($this->request->get['pricetable_id'])) {
			$this->model_pricingtable_pricingtable->statuspricingtable($this->request->get['pricetable_id'],($this->request->get['status']+1)%2);	
		
			$this->session->data['success'] = $this->language->get('text_success');
					
			$this->response->redirect($this->url->link('pricingtable/manage', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$this->getList();
	}

	private function getList() { 
		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'date_added';
		}
		 
		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'DESC';
		}
		
		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}
		
		$url = '';
		
		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}	
	
		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}
			
  		$data['breadcrumbs'] = array();

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('pricingtable/manage', 'token=' . $this->session->data['token'] . $url, 'SSL'),
      		'separator' => ' :: '
   		);
							
		$data['insert'] = $this->url->link('pricingtable/manage/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$data['delete'] = $this->url->link('pricingtable/manage/delete', 'token=' . $this->session->data['token'] . $url, 'SSL');	
	
		$data['pricingtables'] = array();

		$filter = array(
			'sort'  => $sort,
			'order' => $order,
			'start' => ($page - 1) * $this->config->get('config_admin_limit'),
			'limit' => $this->config->get('config_admin_limit')
		);
		
		$pricingtable_total = $this->model_pricingtable_pricingtable->getTotalpricingtables();
		
		$results = $this->model_pricingtable_pricingtable->getpricingtables($filter);

		foreach ($results as $result) {
			$action = array();
			$text = $this->language->get('text_enable');
			if($result['enabled']==1) $text = $this->language->get('text_disable');
			$action[] = array(
				'text' => $this->language->get('text_edit'),
				'status' => $text,
				'href_status' => $this->url->link('pricingtable/manage/status', 'token=' . $this->session->data['token'] . '&status='.$result['enabled'].'&pricetable_id=' . $result['pricetable_id'] . $url, 'SSL'),
				'href' => $this->url->link('pricingtable/pricingtable', 'token=' . $this->session->data['token'] . '&pricetable_id=' . $result['pricetable_id'] . $url, 'SSL')
			);		
		
			$data['pricingtables'][] = array(
				'pricetable_id' => $result['pricetable_id'],
				'pricetable_name' => $result['pricetable_name'],
				'selected'      => isset($this->request->post['selected']) && in_array($result['pricetable_id'], $this->request->post['selected']),
				'enabled'        => $result['enabled'],
				'action'        => $action,
				'href' => HTTP_CATALOG.'index.php?route=pricingtable/pricingtable&pricetable_id='.$result['pricetable_id'],
			);
		}	
	
		$data['heading_title'] = $this->language->get('heading_title');
		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_no_results'] = $this->language->get('text_no_results');

		$data['column_name'] = $this->language->get('column_name');
		$data['column_action'] = $this->language->get('column_action');

		$data['button_add'] = $this->language->get('button_add');
		$data['button_delete'] = $this->language->get('button_delete');
 
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
		
		$url = '';

		if ($order == 'ASC') {
			$url .= '&order=DESC';
		} else {
			$url .= '&order=ASC';
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}
		
		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}
												
		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}
				
		$pagination = new Pagination();
		$pagination->total = $pricingtable_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_admin_limit');
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = $this->url->link('pricingtable/manage', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');
		
		$data['pagination'] = $pagination->render();				

		$data['sort'] = $sort; 
		$data['order'] = $order;
		$data['sort_name'] = $this->url->link('pricingtable/manage', 'token=' . $this->session->data['token'] . '&sort=pricetable_name' . $url, 'SSL');

		//$this->template = 'pricingtable/manage.tpl';
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');
		$this->response->setOutput($this->load->view('pricingtable/manage.tpl', $data));
 	}

	
	private function validateForm() {
		if (!$this->user->hasPermission('modify', 'pricingtable/manage')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}

	private function validateDelete() {
		if (!$this->user->hasPermission('modify', 'pricingtable/manage')) {
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
