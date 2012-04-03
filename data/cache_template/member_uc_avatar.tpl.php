<?php defined('IN_WSLM') or exit('Access Denied'); ?><?php include template('member','header'); ?>
<div id="main">
<?php include template("member","left"); ?>
<div id="right">
<p id="position"> <strong>当前位置：</strong><a href="<?php echo $M['url'];?>index.php">会员中心</a>修改资料</p>
<table cellpadding="0" cellspacing="1" class="table_form">
<?php echo $uc_html;?>
</table>
</div>
</div>
<?php include template('member','footer'); ?>