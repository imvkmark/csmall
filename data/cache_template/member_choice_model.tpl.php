<?php defined('IN_WSLM') or exit('Access Denied'); ?><?php include template('member','header'); ?>
<div id="login">
<form method="post" action="<?php echo $M['url'];?>choice_model.php" name="myform">
<div class="model-reg">
<h3>请选择你要注册的类型</h3>
<dl class="model-reg">
<?php if(is_array($model)) foreach($model AS $k => $v) { ?>
<dt><input name="modelid" type="radio" value="<?php echo $v['modelid'];?>" <?php if($k == 10) { ?>checked<?php } ?> /><?php echo $v['name'];?></dt>
<dd><?php echo $v['description'];?></dd>
<?php } ?>
</dl>
<input name="dosubmit" type="submit" value="下一步" /></div>
</form>
</div>
<?php include template('member','footer'); ?>