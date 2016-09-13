<!--
/*
 * @support
 * http://www.opensourcetechnologies.com/contactus.html
 * sales@opensourcetechnologies.com
* */
-->
<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
	<div class="page-header">
	<div class="container-fluid">
	  <div class="pull-right">
		<button type="submit"  data-toggle="tooltip" title="<?php echo $button_add; ?>" class="btn btn-primary" onclick="location = '<?php echo $insert; ?>'"><i class="fa fa-plus"></i></button>
		<a onclick="$('form').submit();" class="btn btn-danger" data-toggle="tooltip" title="<?php echo $button_delete; ?>"><i class="fa fa-trash-o"></i></a>
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
      <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-pricingtable-manage">
        <table class="table table-striped table-bordered table-hover">
          <thead>
            <tr>
              <td width="1" style="text-align: center;"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></td>
              <td class="left"><?php if ($sort == 'name') { ?>
                <a href="<?php echo $sort_name; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_name; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_name; ?>"><?php echo $column_name; ?></a>
                <?php } ?></td>
              <td class="right"><?php echo $column_action; ?></td>
            </tr>
          </thead>
          <tbody>
            <?php if ($pricingtables) { ?>
            <?php foreach ($pricingtables as $pricetable) { ?>
            <tr>
              <td style="text-align: center;"><?php if ($pricetable['selected']) { ?>
                <input type="checkbox" name="selected[]" value="<?php echo $pricetable['pricetable_id']; ?>" checked="checked" />
                <?php } else { ?>
                <input type="checkbox" name="selected[]" value="<?php echo $pricetable['pricetable_id']; ?>" />
                <?php } ?></td>
              <td class="left">
                <?php if($pricetable['enabled']==1){ ?>
                <a target="_blank" href="<?php echo $pricetable['href']; ?>"><?php echo $pricetable['pricetable_name']; ?></a>
                <?php } else { ?>
                <?php echo $pricetable['pricetable_name']; ?>
                <?php } ?>
              </td>
              <td class="right"><?php foreach ($pricetable['action'] as $action) { ?>
                <a href="<?php echo $action['href_status']; ?>" class="btn btn-danger" data-toggle="tooltip" title="<?php echo $action['status']; ?>"><?php echo $action['status']; ?></a> 
                <a href="<?php echo $action['href']; ?>" class="btn btn-primary" title="<?php echo $action['text']; ?>" data-toggle="tooltip">
                <i class="fa fa-pencil"></i></a> 
                <?php } ?></td>
            </tr>
            <?php } ?>
            <?php } else { ?>
            <tr>
              <td class="center" colspan="3"><?php echo $text_no_results; ?></td>
            </tr>
            <?php } ?>
          </tbody>
        </table>
      </form>
      <div class="pagination"><?php echo $pagination; ?></div>
    </div>
  </div>
</div>
<?php echo $footer; ?> 
