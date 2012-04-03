<?php defined('IN_WSLM') or exit('Access Denied'); ?><?php include template('formguide','header'); ?>
<div id="main_full">
<form name="myform" action="<?php echo $M['url'];?>index.php" method="post" enctype="multipart/form-data">
<table cellpadding="0" cellspacing="1" class="table_form">
<caption><?php echo $formname;?>表单</caption>
<?php if(is_array($forminfos)) foreach($forminfos AS $form) { ?>
<tr>
    	<th><strong><?php echo $form['name'];?></strong></th>
    	<td><?php echo $form['form'];?></td>
    </tr>
<?php } ?>
<tr>
    	<th></th>
        <td>
        <input type="hidden" name="dataid" value="<?php echo $dataid;?>" />
        <input type="hidden" name="formid" value="<?php echo $formid;?>" />
        <input type="submit" name="dosubmit" value="确定" />
        <input type="reset" name="reset" value="取消" />
        </td>
    </tr>
</table>
</form>
</div>
<?php include template('wslm','footer'); ?>
<script LANGUAGE="javascript">
<!--
$().ready(function() {
  $('form').checkForm(1);
});
//-->
</script>