<?php defined('IN_WSLM') or exit('Access Denied'); ?><?php include template('member','header'); ?>
<script type="text/javascript" src="images/js/validator.js"></script>
<div id="main">
  <?php include template($mod , 'left'); ?>
  <div id="right">
    <p id="position"><strong>当前位置：</strong><a href="">首页</a><a href="<?php echo $M['url'];?>">邮件订阅</a><?php echo $title;?></p>
    <div class="clear"></div>
<?php if($action == send) { ?>
<form action="<?php echo $MODULE[$mod]['url'];?>subscription.php?action=add" method="post" name ="thisForm" id="thisForm" >
<table cellpadding="0" cellspacing="1" class="table_form">
  <caption>我要订阅</caption>
   <tr>
    <th width="20%">订阅类型：</th>
    <td><?php echo $box;?></td>
  </tr>
  <tr>
    <th>订阅邮箱：</th>
    <td><input type="hidden" name="mail" id="mail" value="<?php echo $mail['email'];?>" />
      <input type="text" name="newmail" id="mail" value="<?php echo $mail['newemail'];?>" size="35" require="true" datatype="email" msg="填写正确的邮箱"/>
    </td>
  </tr>
<tr>
<td></td>
<td>
  <input type="submit" name="dosubmit" id="dobutton" value="订阅" /></td>
</tr>
</table>
</form>
<?php } else { ?>
<form action="<?php echo $MODULE[$mod]['url'];?>subscription.php?action=add" method="post" name ="thisForm" id="thisForm" >
    <table cellpadding="0" cellspacing="1" class="table_form">
      <caption>我的订阅</caption>
   <tr>
    <th>订阅类型：</th>
        <td style="text-align:left;">
        <?php echo $box;?>
        </td>
      </tr>
  <tr>
    <th width="20%">订阅邮箱：</th>
        <td>
  <input type="hidden" name="mail" id="mail" value="<?php echo $mail['email'];?>" />
          <input type="text" name="newmail" id="newmail" value="<?php echo $mail['email'];?>" size="35" require="true" datatype="email" msg="填写正确的邮箱"/>
        </td>
      </tr>
    <tr>
    <td></td>
    <td>
      <input type="submit" name="dosubmit" id="dobutton" value="修改" /></td>
    </tr>
</table></form>
    <?php } ?>
  </div>
</div>
<div class="clear"></div>
<script language="javascript" type="text/javascript">
$().ready(function() {
  $('form').checkForm(1);
});
</script>
<?php include template('member','footer'); ?>
