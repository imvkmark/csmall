<?php defined('IN_WSLM') or exit('Access Denied'); ?><?php echo $memberinfo['username'];?>，您好！<br/>
&nbsp;&nbsp;&nbsp;&nbsp;欢迎您注册<?php echo $WSLM['sitename'];?>，请点击下面的链接验证您的E-mail：<br/>
<a href="<?php echo $authurl;?>" target="_blank"><?php echo $authurl;?></a>