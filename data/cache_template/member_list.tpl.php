<?php defined('IN_WSLM') or exit('Access Denied'); ?><?php include template('wslm','header'); ?>
<style type="text/css">
<!--
body {text-align:left; background:#FFF url(<?php echo SKIN_PATH;?>images/bg_2.jpg) repeat-x 0 -94px;}
#head{ margin-top:10px; height:60px;}
#logo { float:left; width:200px; height:60px; position:static; top:0;}
-->
</style>
<div id="main">
    <div id="left">
    <div id="treemenu">
      <h5>会员类型</h5>
      <ul>
<?php if(is_array($member_model)) foreach($member_model AS $model) { ?>
<li><a href="<?php echo $M['url'];?>list.php?modelid=<?php echo $model['modelid'];?>"><?php echo $model['name'];?></a></li>
      	<?php } ?>
<li><a href="<?php echo $M['url'];?>search.php">会员搜索</a></li>
      </ul>
    </div>
    <ol>
      <li class="local"><a href="<?php echo SITE_URL;?>">返回网站首页</a></li>
      <li class="exit"><a href="<?php echo $M['url'];?>logout.php">退出登录</a></li>
    </ol>
  </div>
  <div id="right">
  <div class="modellist_2">
    <h3><?php echo $MODEL[$modelid]['name'];?></h3>
{tag_按模型列出用户} 
 </div>
 </div>
<?php include template('member','footer'); ?>
