<?php 
defined('IN_WSLM') or exit('Access Denied');
include admin_tpl('header');
?>
<table cellpadding="0" cellspacing="1" class="table_form">
  <caption>稿件统计</caption>
  <tr>
    <td><a href='?mod=wslm&file=statistics&action=show_users&userid=<?=$userid?>' >按栏目查看</a> | <a href='?mod=wslm&file=admin&action=view&userid=<?=$userid?>'><font color="#ff0000">按月份查看</font></a></td>
  </tr>
</table>
<table width="95%" cellpadding="0" cellspacing="1" class="table_list">
<caption>稿件统计搜索</caption>
<tr>
<form action="?mod=wslm&file=<?=$file?>&action=search" method="POST">
<td class="align_c">
栏目：<select name="catid"><option value="">请选择</option><?php echo $selected?></select> <input type="hidden" name="userid" value="<?=$userid?>">开始时间：<?php echo form::date('starttime')?> 结束时间：<?php echo form::date('stoptime')?>  <input type="submit" name="dosubmit" value="查询">
</td>
</form>
</tr>
</table>
<table width="95%" cellpadding="0" cellspacing="1" class="table_list">
<caption><?php echo $user['username']?>稿件统计详情</caption>
<tr>
<th>栏目</th>
<th>今天</th>
<th>昨天</th>
<th>本周</th>
<th>本月</th>
<th>总量</th>
</tr>
<?php echo $html?>
</table>