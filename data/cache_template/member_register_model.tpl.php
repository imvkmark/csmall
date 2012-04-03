<?php defined('IN_WSLM') or exit('Access Denied'); ?><?php include template('member','header'); ?>
<script type="text/javascript" src="images/js/validator.js"></script>
<div id="main">
<form action="" method="post" name="myform" id="registerform">
    	<table cellpadding="0" cellspacing="1" class="table_reg">
        	<caption><?php echo $MODEL[$_modelid]['name'];?></caption>
            <?php if(is_array($forminfos)) foreach($forminfos AS $forminfo) { ?>
            <tr>
            	<th><strong><?php echo $forminfo['name'];?></strong></th><td><?php echo $forminfo['form'];?></td>
            </tr>
            <?php } ?>
            <tr>
            	<th></th>
                <td><input type="submit" name="dosubmit" id="registerform" value=" 确 定 " /> &nbsp; &nbsp; <input type="reset" name="reset" value=" 重 置 " /></td>
            </tr>
        </table>
    </form>
</div>
<?php include template('member','footer'); ?>
<script language="javascript">
$().ready(function() {
$('form').checkForm(1);
});
</script>
