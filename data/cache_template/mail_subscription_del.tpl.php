<?php defined('IN_WSLM') or exit('Access Denied'); ?><?php include template('member','header'); ?>
<script>
function checkForm() 
{
    if (!confirm('你确定要退订吗？'))
    {
        return false;
    }
}
</script>
<div id="main">
  <?php include template($mod , 'left'); ?>
  <div id="right">
    <p id="position"><strong>当前位置：</strong><a href="">首页</a><a href="<?php echo $M['url'];?>">邮件订阅</a>我要退订</p>
    <div class="clear"></div>	
<form action="<?php echo $MODULE[$mod]['url'];?>subscription.php?action=delall" method="post" name ="thisForm" id="thisForm" onsubmit="return checkForm();">
    <table cellpadding="0" cellspacing="1" class="table_form">
      <caption>订阅退订</caption>
  <tr >
        <th width="20%">类型</th>
        <td>
            <?php echo $data;?>
        </td>
      </tr>
      <tr>
    <th>邮箱</th>
        <td>
            <?php echo $mail['email'];?>
          <input type="hidden" name="email" id="email" value="<?php echo $mail['email'];?>" />
        </td>
      </tr>
    <tr>	
    <td></td>
    <td style="text-align:left;">
      <input type="submit" name="dosubmit" id="dobutton" value="退订" />
    </td>
    </tr>
</table> 
</form>   
  </div>
</div>
<div class="clear"></div>
<?php include template('member','footer'); ?>
