<?php defined('IN_WSLM') or exit('Access Denied'); ?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><?php echo $head['title'];?></title>
<meta content="<?php echo $head['keywords'];?>" name="keywords" />
<meta content="<?php echo $head['description'];?>" name="description" />
<base href="<?php echo SITE_URL;?>" />
<link href="favicon.ico" rel="shortcut icon" />
<link href="<?php echo SKIN_PATH;?>wslm.css" rel="stylesheet" type="text/css" />
<link rel="alternate" type="application/rss+xml" title="<?php echo $head['title'];?>" href="/rss.php?rssid=<?php echo $catid;?>" />
<script language="JavaScript" src="data/config.js"></script>
<script language="JavaScript" src="images/js/jquery.min.js"></script>
<script language="JavaScript" src="images/js/css.js"></script>
<script language="JavaScript" src="images/js/common.js"></script>
<script language="JavaScript" src="images/js/login.js"></script>
<script language="JavaScript" src="images/js/validator.js"></script>
</head>
<body onload="menu_selected('<?php echo $catid ? $catid : $mod;?>')">
<div id="top">
<?php if(isset($MODULE['search'])) { ?>
<?php $types = cache_read('search_type.php');?>
<div class="f_r">
     <form name="site_search" action="<?php echo $MODULE['search']['url'];?>" target="_blank">
  <input type="hidden" name="type" value="all"/>
      <input type="text" name="q" size="20"/>
      <select>
        <option value="all">全部</option>
<?php if(is_array($types)) foreach($types AS $k => $name) { ?>
        <option value="<?php echo $k;?>"><?php echo $name;?></option>
<?php } ?>
      </select>
      <input type="submit" name="s" id="button" value="搜索" />
 </form>
  </div>
<?php } ?>
  <div class="f_l">
    <div id="div_login" style="display:block">
<form action="<?php echo $MODULE['member']['url'];?>login.php" method="post" name="login" onsubmit="return loginSubmit(this, <?php echo $WSLM['uc'];?>);">
用户名：<input type="text" name="username" size="12"/>
密码：<input type="password" name="password" size="12"/>
  <input type="submit" name="dosubmit" value="登录" />
  <input type="button" name="register" value="注册" onclick="redirect('<?php echo $MODULE['member']['url'];?>register.php')"/>
  <input type="hidden" name="cookietime" value="0"/>
</form>
</div>
    <div id="div_logined" style="display:none">
<span id="logined_username" class="b"></span>，<a href="<?php echo $MODULE['member']['url'];?>">会员中心</a> | 
        <a href="<?php if($WSLM['uc']) { ?><?php echo $MODULE['member']['url'];?>logout.php<?php } else { ?>javascript:logout('<?php echo $MODULE['member']['url'];?>logout.php?action=ajax');<?php } ?>">退出登录</a>
</div>
  </div>
</div>
<div id="head">
  <div id="logo">
    <a href="<?php echo SITE_URL;?>"><img src="images/logo.gif" alt="<?php echo $WSLM['sitename'];?>" /></a>
    <a href="<?php echo SITE_URL;?>rss.php" target="_blank"><img src="images/rss.jpg" alt="rss信息聚合" /></a></div>
  <div class="ad" id="topbanner"><script language="javascript" src="data/js.php?id=1"></script></div>
</div>
<div id="menu">
<ul>
  <li><a href="" id="menu_wslm"><span>首页</span></a></li>
  {tag_一级栏目}
  <li><a href="<?php echo $MODULE['special']['url'];?>" id="menu_special"><span>专题</span></a></li>
  <li><a href="<?php echo $MODULE['ask']['url'];?>" id="menu_ask"><span>问吧</span></a></li>
  <li><a href="<?php echo $MODULE['search']['url'];?>" id="menu_search"><span>搜索</span></a></li>
</ul>
</div> 