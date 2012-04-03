<?php defined('IN_WSLM') or exit('Access Denied'); ?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><?php echo $data['title'];?></title>
</head>

<body>
<table width="100%" border="0" cellpadding="5" cellspacing="1" bgcolor="#CCCCCC">
<?php if(is_array($data)) foreach($data AS $k => $v) { ?>
  <tr>
    <td bgcolor="#FFFFFF" width="20%"><?=$this->coutput->fields[$k][name]?></td>
    <td bgcolor="#FFFFFF"><?php echo $v;?></td>
  </tr>
<?php } ?>
</table>
</body>
</html>