<?php 
defined('IN_WSLM') or exit('Access Denied');
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8>" />
<title>麦谷网络管理系统后台登录</title>
<script language="javascript" src="data/config.js"></script>
<script language="javascript" src="images/js/jquery.min.js"></script>
<script language="javascript" src="images/js/common.js"></script>
<script language="JavaScript" src="images/js/login.js"></script>
<script text='text/javascript'>
if (top.location != self.location)
{
	top.location=self.location;
}
</script>
<style type="text/css">
<!--
*{margin:0; padding:0;}
body {font-family: Arial, Helvetica, sans-serif,"宋体"; font-size: 12px;line-height: 210%;font-weight: normal;color: #333333;text-decoration: none; background:url(images/02.jpg) center top no-repeat;}
li{ list-style:none;}
#main{ width:930px; min-height:600px; height:600px; overflow:hidden; margin:0 auto; position:relative;}
#login_box{ width:278px; height:138px; margin:233px auto 0px; padding-left:50px; padding-top:50px;line-height:138px;}
#login_box ul li{ line-height:32px; height:32px; color:#86A231;}
#login_box ul li input{ border:1px solid #E1EBC6;}

-->
</style>
</head>
<body onload="javascript:document.myform.username.focus();">
<div id="main">
  <div id="login_box">
    <ul>
    <form name="myform" method="post" action="?mod=wslm&file=login" onsubmit="return loginCheck(this);">
      <li>用户名：<input name="username" type="text" size="20" value="<?=$username?>" maxlength="20"></li>
	  <li>密　码：<input name="password" type="password" size="20" value="<?=$password?>" maxlength="32"></li>
<?php if($code->check()){?>
      <li>验证码：<?=form::checkcode('checkcodestr', 8)?></li>
<?php } ?>
      <li style=" padding-left:48px;">
	    <input type="hidden" name="cookietime" value="0" />
	    <input type="hidden" name="forward" value="?">
	    <input type="submit" name="dosubmit" value=" 登录 " class="btn"> 
	    <input type="reset" name="reset" value=" 清除 " class="btn">
      </li>
    </form>
    </ul>
  </div>
</div>
</body>
</html>