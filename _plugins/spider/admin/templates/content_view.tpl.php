<?php 
defined('IN_WSLM') or exit('Access Denied');
include admin_tpl('header');
?>
<body>
<table cellpadding="0" cellspacing="0" border="0" width="100%" height="10">
  <tr>
    <td></td>
  </tr>
</table>
<?=$menu?>
<table cellpadding="2" cellspacing="1" class="table_form"><form method="post" name="myform">
<caption>采集内容查看</caption>
<tr align="center">
<td width="10%" class="tablerowhighlight">标签名</td>
<td width="90%" class="tablerowhighlight">标签内容</td>
</tr>
<?php 
if(is_array($labels)){
	foreach($labels as $labelkey=>$labelvalue){
?>
<tr align="center" onmouseout="this.style.backgroundColor='#ffffff'" onmouseover="this.style.backgroundColor='#BFDFFF'" bgColor='#ffffff'>
<td><strong><?=$labelkey?></strong></td>
<td align="left"><?=$labelvalue?></td>
</tr>
<?php 
	}
}
?>
</table>
<table width="100%" height="25" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td align="center"><input type="button" name="submits" value="返回" onClick="history.back(-1);">
 </td>
  </tr>
</table>
</body>
</html>