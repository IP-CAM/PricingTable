<!--
/*
 * @support
 * http://www.opensourcetechnologies.com/contactus.html
 * sales@opensourcetechnologies.com
* */
-->
<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
<link rel="stylesheet" id="wppt-frontend-css" href="view/stylesheet/pricingtable.css" type="text/css" media="all" />
<link rel="stylesheet" id="skeleton-css" href="view/stylesheet/skeleton.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" id="theme-css" href="view/stylesheet/style.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" id="layout-css" href="view/stylesheet/layout.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" id="formalize-css" href="view/stylesheet/formalize.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" id="superfish-css" href="view/stylesheet/superfish.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" id="superfish-css" href="view/stylesheet/custom.css" type="text/css" media="screen, projection" /> 

	<div class="page-header">
	<div class="container-fluid">
	  <div class="pull-right">
		<button type="submit" onclick="$('form').submit();" class="btn btn-primary" title="<?php echo $button_save; ?>" data-toggle="tooltip" ><i class="fa fa-save"></i></button>
		<a onclick="location = '<?php echo $cancel; ?>';" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_cancel; ?>"><i class="fa fa-reply"></i></a>
	  </div>
	  <h1><?php echo $heading_title; ?></h1>
	  <ul class="breadcrumb">
		<?php foreach ($breadcrumbs as $breadcrumb) { ?>
			<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
		<?php } ?>
	  </ul>
	</div>
  </div>
  <div class="container-fluid">
	<?php if ($error_warning) { ?>
		<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
		  <button type="button" class="close" data-dismiss="alert">&times;</button>
		</div>
	<?php } ?>
    <?php if ($success) { ?>
		<div class="alert alert-info"><i class="fa fa-exclamation-circle"></i> <?php echo $success; ?>
		  <button type="button" class="close" data-dismiss="alert">&times;</button>
		</div>	
    <?php } ?>
  
  <div class="panel panel-default">
	  <div class="panel-heading">
		<h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
	  </div>
	  <div class="panel-body">
    <form id="form" method="post" action="<?php echo $action; ?>">
    	<div id="wrap" class="container price_module" style="margin: 0 auto;">
	      <div id="content" class="sixteen columns">
	      	  <div style="margin:15px;text-align: center;">
	    	  	<span style="width:100px;display:inline-block;"><?php echo $entry_name; ?></span>
	    	  	<input type="text" name="data[pricetable_name]" size="60" value="<?php echo $data['pricetable_name']; ?>" />
	    	  </div>
	    	  <div style="margin:15px;text-align: center;display:none;">
	    	  	<span style="width:100px;display:inline-block;"><?php echo $entry_email; ?></span>
	    	  	<input type="text" name="data[email]" size="60" value="<?php echo $data['email']; ?>" />
	    	  </div>
	    	  <div style="margin:15px;text-align: center;">
	    	  	<span style="width:100px;display:inline-block;"><?php echo $entry_url; ?></span>
	    	  	<input type="text" name="data[pricetable_url]" size="60" value="<?php echo $data['pricetable_url']; ?>" />
	    	  </div>
	          <div class="entry-content">
	            <div class="pricing_table pricing_seven">
	              <!-- BEGIN TABLE CONTAINER -->
	              <ul class="pricing_column_first f_w">
	                <!-- BEGIN DESCRIPTION COLUMN -->
	                <li class="pricing_header1"></li>
	                <li class="pricing_header2"><input type="text" name="data[label]" size="20" value="<?php echo $data['label']; ?>" placeholder="Label..." style="margin-left: 7px;" /></li>
	                <li style="border-radius: 0;" class="pricing_header2 price"></li>
	                <li class="odd"></li>
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
	                <ul class="pricing_column <?php echo $color; ?> f_w">
	                  <li class="pricing_header1"><input type="text" value="<?php echo $row['name']; ?>" name="product" />
	                  	<input type="hidden" value="<?php echo $row['name']; ?>" name="data[name][]" />
	                  	<input type="hidden" value="<?php echo $row['price']; ?>" name="data[price][]" />
	                  	<input type="hidden" value="<?php echo $row['product_id']; ?>" name="data[product_id][]" />
	                  	<select name="data[status][]">
	                  		<option value="1"><?php echo $entry_enable; ?></option>
	                  		<option <?php if($row['status']==0) echo 'selected=""'; ?> value="0"><?php echo $entry_disable; ?></option>
	                  	</select>
	                  	<select name="data[status_product][]">
	                  		<option value="1"><?php echo $entry_enable_product; ?></option>
	                  		<option <?php if($row['status_product']==0) echo 'selected=""'; ?> value="0"><?php echo $entry_disable_product; ?></option>
	                  	</select>
	                  </li>
	                  <li class="pricing_header2"><input type="text" name="data[description][]" size="20" value="<?php echo $row['description']; ?>" placeholder="<?php echo $entry_description; ?>..." /></li>
	                  <li class="pricing_header2 price">$<?php echo number_format($row['price'],2); ?></li>
	                  <li class="odd"></li>
	                </ul>
	                <!-- END CONTENT COLUMN -->
	              </div>
	              <!-- END HOVER AREA -->
	              <?php $i++; } ?>

	              <div class="pricing_hover_area" style="float:left;">
	                <!-- BEGIN CONTENT COLUMN -->
	                <ul class="f_w" style="width:40px;">
	                  <li class="pricing_header1"></li>
	                  <li class="pricing_header2"></li>
	                  <li class="pricing_header2 price"></li>
	                  <li class="odd">
	                    <a class="pricing_add" data-toggle="tooltip" title="<?php echo $entry_add; ?>"></a>
	                  </li>
	                </ul>
	                <!-- END CONTENT COLUMN -->
	              </div>

	            </div>
	            <!-- END TABLE CONTAINER -->
	            <p></p>
	          </div>
	          <!-- .entry-content -->

	        <!-- #post-## -->
	      </div>
	      <!-- /.columns (#content) -->
	      <script type="text/javascript" src="view/javascript/app.js"></script>
	      <script type="text/javascript" src="view/javascript/superfish.js"></script>
	      <script type="text/javascript" src="view/javascript/jquery.formalize.min.js"></script>
	      <script type="text/javascript" src="view/javascript/jquery.number.min.js"></script>
	      <script type="text/javascript">
	      	var order = 0;
		      <?php $i=0; 
		      if(is_array($data['feature_list']))
		      foreach($data['feature_list'] as $feature_list){ ?>
		      	var row_text = ['','','','',''];
		      	var row_type = [0,0,0,0,0];
		      	var i=0;
		        <?php foreach($data['data'] as $row){ ?>
		        	row_text[i] = '<?php echo $row['text'][$i]; ?>';
		        	row_type[i] = <?php echo $row['type'][$i]; ?>;
		      		i=i+1;
		      	<?php } ?>
		         add_row('<?php echo $feature_list['feature']; ?>','<?php echo $feature_list['tooltip']; ?>',row_text,row_type);
	      	  <?php $i++; } ?>
	      	var order = $('.pricing_table > ul.f_w:first-child li').length;
	      	$('.pricing_add').click(function(){
	      		add_row('','',['','','','',''],[0,0,0,0,0]);
	      	});
	      	function valueIcon(e){
	      		e.parent().next().next().attr('readonly','');
	      		e.parent().next().next().attr('style','background-color:silver;');
	      		e.parent().next().next().val('');
	      	}
	      	function valueText(e){
	      		e.next().removeAttr('readonly');
	      		e.next().attr('style','');
	      	}
	       $('input[name=product]').autocomplete({
				delay: 0,
				autoFocus: true,
				source: function(request, response) {
					$.ajax({
						url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
						dataType: 'json',
						success: function(json) {
							response($.map(json, function(item) {
								return {
									label: item.name,
									price: item.price,
									value: item.product_id
								}
							}));
						}
					});
				}, 
				select: function(item) {
					// $(this).parent().next().html('$'+jQuery.number(ui.item.price,2));
					$(this).parent().parent().find('.pricing_header2.price').html('$'+jQuery.number(item.price,2));
					$(this).val(item.label);
					$(this).next().next().val(item.label);
					$(this).next().next().next().val(item.price);
					$(this).next().next().next().next().val(item.value);
					return false;
				},
				focus: function(event) {
			      	return false;
			   	}
			});
	      	function add_row(feature, tooltip, info, radio){
	      		var feature_html = '<input value="'+feature+'" placeholder="Feature..." class="feature" type="text" name="data[feature_list][]" />\
	      		<input value="'+tooltip+'" placeholder="Tooltip..." class="feature" type="text" name="data[tooltip][]" />';
	      		var info_html = [];
	      		for(var i=0;i<5;i++){
	      			var radio_0 = '';
	      			var radio_1 = '';
	      			var radio_2 = '';
	      			var disabled = '';
	      			if(radio[i]==0) {radio_0 = 'checked=""'; disabled = 'readonly="" style="background-color:silver;"';}
	      			if(radio[i]==1) {radio_1 = 'checked=""'; disabled = 'readonly="" style="background-color:silver;"';}
	      			if(radio[i]==2) radio_2 = 'checked=""';
		      		info_html[i] = '<p>\
		      		<input class="value_icon" '+radio_0+' type="radio" value="0" name="data[data]['+i+'][type]['+order+']" onclick="valueIcon($(this));"/>\
		      		<span class="pricing_no"></span>\
		      		<input class="value_icon" '+radio_1+' type="radio" value="1" name="data[data]['+i+'][type]['+order+']" onclick="valueIcon($(this));"/>\
		      		<span class="pricing_yes"></span>\
		      		</p>\
		      		<input class="value_text" '+radio_2+' type="radio" value="2" name="data[data]['+i+'][type]['+order+']" onclick="valueText($(this));"/>\
		      		<input value="'+info[i]+'" '+disabled+' placeholder="Value..." type="text" name="data[data]['+i+'][text][]" />';
		      	}

	      		var class_li = 'odd';
	      		if(order%2==1) class_li = 'even';
	      		var feature = '<li data="'+order+'" style="display:none;" class="'+class_li+'">'+feature_html+'</li>';
	      		var del = '<li style="display:none;" class="'+class_li+'"><a data="'+order+'" class="pricing_del" onclick="del_row($(this));" data-toggle="tooltip" title="<?php echo $entry_del; ?>"></a></li>';
	      		var insert_before = '.pricing_header2.price';
	      		// var insert_before = 'li:last-child';
	      		$('ul.f_w').each(function(index){
	      			if(index==0) {
	      				$(feature).insertBefore($(this).find(insert_before));
	      			}else if(index<$('ul.f_w').length-1) {
	      				var data = '<li data="'+order+'" style="display:none;" class="'+class_li+'">'+info_html[index-1]+'</li>';
	      				$(data).insertBefore($(this).find(insert_before));
	      			}else{
	      				$(del).insertBefore($(this).find(insert_before));
	      			}
	      			$(this).find(insert_before).prev().fadeIn(400);
	      		});
	      		order=order+1;
	      	}

	      	function del_row(e){
	      		var row = e.attr('data');
	      		e.parent().fadeOut(200);
	      		e.remove();
	      		$('ul.f_w li').each(function(){
	      			if($(this).attr('data')==row) {
	      				$(this).fadeOut(200,function(){
	      					$(this).remove();
	      				});
	      			}
	      		});
	      	}
	      </script>
	    </div>
    </form>
  </div>
</div>

<?php echo $footer; ?> 
