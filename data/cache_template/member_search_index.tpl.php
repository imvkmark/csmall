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
<link href="<?php echo SKIN_PATH;?>search.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="data/config.js"></script>
<script language="JavaScript" src="images/js/jquery.min.js"></script>
<script language="JavaScript" src="images/js/css.js"></script>
<script language="JavaScript" src="images/js/common.js"></script>
<script language="JavaScript" src="images/js/login.js"></script>
</head>
<body onload="menu_selected('<?php echo $catid ? $catid : $mod;?>')">
<div id="top">
<?php if(isset($MODULE['search'])) { ?>
<?php $types = include WSLM_ROOT.$MODULE['search']['path'].'include/type.inc.php';?>
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
<form action="<?php echo $MODULE['member']['url'];?>login.php" method="post" name="login" onsubmit="return loginSubmit(this);">
用户名：<input type="text" name="username" size="12"/>
密码：<input type="password" name="password" size="12"/>
  <input type="submit" name="dosubmit" value="登录" />
  <input type="button" name="register" value="注册" onclick="redirect('<?php echo $MODULE['member']['url'];?>register.php')"/>
  <input type="hidden" name="cookietime" value="0"/>
</form>
</div>
    <div id="div_logined" style="display:none">
<span id="logined_username" class="b"></span>，<a href="<?php echo $MODULE['member']['url'];?>">会员中心</a> | <a href="javascript:logout('<?php echo $MODULE['member']['url'];?>logout.php?action=ajax');">退出登录</a>
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
  <li><a href="<?php echo $MODULE['member']['url'];?>search.php" id="menu_search"><span>搜索</span></a></li>
</ul>
</div>
<div id="submenu">
<a href="<?php echo $M['url'];?>search.php">基本搜索</a>
<?php if(is_array($submenu)) foreach($submenu AS $sub) { ?>
<a href="<?php echo $M['url'];?>search.php?modelid=<?php echo $sub['modelid'];?>">搜索<?php echo $sub['name'];?></a>
<?php } ?>
</div>
<!--begin main-->
<div id="main_full">
  <!--位置导航-->
  <div id="position"><a href="">网站首页</a><?php echo $modelname;?>用户搜索</div>
  <!--搜索条件-->
<form name="myform" method="GET" action="">
  <table cellpadding="0" cellspacing="1" class="search_term">
  <?php if($modelid) { ?>
  <?php if(is_array($where)) foreach($where AS $field => $r) { ?>
    <tr>
      <th width="30%"><?php echo $r['name'];?></th>
      <td><?php echo $r['form'];?></td>
    </tr>
  <?php } ?>
  <?php if($order) { ?>
    <tr>
      <th>排序方式</th>
      <td><?=form::select($order, 'orderby', 'orderby', 'a.userid DESC', 1)?></td>
    </tr>
  <?php } ?>
  <?php } else { ?>
  <tr>
<th width="30%">用户名</th>
<td><input type="text" name="username" value="<?php echo $username;?>" ></td>
  </tr>
  <?php } ?>
<tr>
      <th></th>
      <td><input type="submit" name="dosubmit" value="立即搜索" />
        <input type="reset" value="重新填写" /></td>
    </tr>
  </table>
  <input type="hidden" name="mod" value="<?php echo $mod;?>"> 
  <input type="hidden" name="file" value="<?php echo $file;?>"> 
  <input type="hidden" name="action" value="<?php echo $action;?>"> 
  <?php if($modelid) { ?><input type="hidden" name="modelid" value="<?php echo $modelid;?>"><?php } ?>
</form>
  <!--搜索结果-->
<?php if($data) { ?><div class="search_res">共找到到符合条件的结果 <span style="color:red"><?php echo $total;?></span> 条</div><?php } ?>
<?php if(is_array($data)) foreach($data AS $i => $r) { ?>
  <dl class="search_member">
<dt><img src="<?php if($r[avatar]) { ?><?php echo $r['avatar'];?><?php } else { ?>images/nophoto.gif<?php } ?>" alt="<?php echo $r['username'];?>" /></dt>
<dd><a href="<?php echo url($MODULE[member][url], 1);?>view.php?userid=<?php echo $r['userid'];?>" class="name"><span style="color:red"><?php echo $r['username'];?></span></a> <em>所在地区： <?php echo $AREA[$r[areaid]][name]?$AREA[$r[areaid]][name]:'未知'?></em></dd>
<dd>
联系方式：<em><?php echo $r['email'];?></em>
</dd>
    <dd>个人空间：<a href="<?php echo url($MODULE[space][url], 1);?>?username=<?php echo $r['username'];?>" class="green"><?php echo url($MODULE[space][url], 1);?>?username=<?php echo $r['username'];?></a></dd></dl>
  </dl>
<?php } ?>
  <!--分页-->
  <div id="pages"><?php echo $pages;?></div>
</div>
<!--end main-->
<!--begin foot-->
<?php include template('wslm','footer'); ?>
<script language="javascript">
$('#modelid').change(function(){
location="?modelid="+this.value;
});
</script>
