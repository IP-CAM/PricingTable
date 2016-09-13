<!--/*
 * @support
 * http://www.opensourcetechnologies.com/contactus.html
 * sales@opensourcetechnologies.com
* */-->
<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <h1><?php echo $data['pricetable_name']; ?></h1>
      <!-- Starting      -->
      <?php if(isset($data['data'])) { ?>
	    <link rel="stylesheet" id="wppt-frontend-css" href="catalog/view/stylesheet/pricingtable.css" type="text/css" media="all" />
		<div id="wrap" class="container price_module" style="margin-bottom:30px;">
	      <div id="content" class="sixteen columns" style="min-height:300px;">
	          <div class="entry-content">
	            <div class="pricing_table <?php echo $columns; ?>">
	              <!-- BEGIN TABLE CONTAINER -->
	              <ul class="pricing_column_first f_w">
	                <!-- BEGIN DESCRIPTION COLUMN -->
	                <li class="pricing_header1"></li>
	                <li class="pricing_header2"><span><?php echo $data['label']; ?></span></li>
	                <li style="border-radius:0;" class="pricing_header2 price"></li>
	                <li class="pricing_footer"></li>
	              </ul>
	              <!-- END DESCRIPTION COLUMN -->
	              <?php $i=0; foreach($data['data'] as $row){ ?>
	              <?php 
	              	if($i==0) $color = 'gradient_blue';
	              	if($i==1) $color = 'gradient_green';
	              	if($i==2) $color = 'gradient_yellow';
	              	if($i==3) $color = 'gradient_orange';
	              	if($i==4) $color = 'gradient_red';
	               ?>
	               <!-- BEGIN HOVER AREA -->
	              <div class="pricing_hover_area">
	                <!-- BEGIN CONTENT COLUMN -->
	                <ul <?php if($row['status']==0) echo 'style="display:none;width:0;"'; ?> class="pricing_column <?php echo $color; ?> f_w">
	                  <li class="pricing_header1"><?php echo $row['name']; ?></li>
	                  <li class="pricing_header2" style="font-size:14px;">
	                  <?php echo $row['description']; ?></li>
	                  <li class="pricing_header2 price">$<?php echo number_format($row['price'],2); ?></li>
	                  <li class="pricing_footer">
	                    <a href="javascript:;" onclick="cart.add('<?php echo $row['product_id']; ?>');" class="pricing_button"><?php echo $button_addcart; ?></a>
	                  </li>
	                </ul>
	                <!-- END CONTENT COLUMN -->
	              </div>
	              <!-- END HOVER AREA -->
	              <?php $i++; } ?>
	            </div>
	            <!-- END TABLE CONTAINER -->
	            <p></p>
	          </div>
	          <!-- .entry-content -->

	        <!-- #post-## -->
	      </div>
	      <!-- /.columns (#content) -->
	      <script type="text/javascript">
	      	var order = 0;
		      <?php $i=0; 
		      if(is_array($data['feature_list']))
		      foreach($data['feature_list'] as $feature_list){ ?>
		      	var row_text = ['','','','',''];
		      	var row_type = [0,0,0,0,0];
		      	var row_status = [1,1,1,1,1];
		      	var row_id = [0,0,0,0,0];
		      	var i=0;
		        <?php foreach($data['data'] as $row){ ?>
		        	row_text[i] = '<?php echo $row['text'][$i]; ?>';
		        	row_type[i] = <?php echo $row['type'][$i]; ?>;
		        	row_status[i] = <?php echo $row['status']; ?>;
		        	row_id[i] = <?php echo $row['product_id']; ?>;
		      		i=i+1;
		      	<?php } ?>
		         add_row('<?php echo $feature_list['feature']; ?>','<?php echo $feature_list['tooltip']; ?>',row_text,row_type,row_status,row_id);
		         order=order+1;
	      	  <?php $i++; } ?>
	      	
	      	function add_row(feature, tooltip, info, radio, status, id){
	      		if(tooltip!=''){
	      			var feature_html = '<a class="tooltip" href="javascript:;">'+feature+'<span>'+tooltip+'</span></a>';
	      		}else{
	      			var feature_html = '<span>'+feature+'</span>';
	      		}
	      		
	      		var info_html = [];
	      		for(var i=0;i<5;i++){
	      			if(radio[i]==0) info_html[i] = '<span class="pricing_no"></span>';
	      			if(radio[i]==1) info_html[i] = '<span class="pricing_yes"></span>';
	      			if(radio[i]==2) info_html[i] = '<span>'+info[i]+'</span>';
		      	}

	      		var class_li = 'odd';
	      		if(order%2==1) class_li = 'even';
	      		var feature = '<li data="'+order+'" style="display:none;" class="'+class_li+'">'+feature_html+'</li>';
	      		var insert_before = '.pricing_header2.price';
	      		// var insert_before = 'li:last-child';
	      		$('ul.f_w').each(function(index){
	      			if(index==0) {
	      				$(feature).insertBefore($(this).find(insert_before));
	      			}else if(status[index-1]==1){
	      				var data = '<li data="'+order+'" style="display:none;" class="'+class_li+'">'+info_html[index-1]+'</li>';
	      				$(data).insertBefore($(this).find(insert_before));
	      			}else{
	      				$(this).hide();
	      				$(this).css('width','0');
	      			}
	      			$(this).find(insert_before).prev().fadeIn(400);
	      		});
	      		order=order+1;
	      	}
	      </script>
	      
	    </div>
	    <?php } else echo $entry_empty; ?>
      <!-- Ending             -->
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>
