<?php defined('IN_WSLM') or exit('Access Denied'); ?><?php include template('wslm','header'); ?>
<div id="main_full">
<div id="position"><a href="">首页</a>网站地图</div>
  <div id="sitemap">
<?php if(is_array($CATEGORY)) foreach($CATEGORY AS $catid => $cat) { ?>
<?php if($cat[module]=='main' && !$cat[parentid] && !strpos($cat[url], 'ask')) { ?>  
    <h3><a href="<?php echo $cat['url'];?>"><?php echo $cat['catname'];?></a></h3>
    <p>
<?php if(is_array($CATEGORY)) foreach($CATEGORY AS $childid => $c) { ?>
<?php $arrcats = explode(',',$c[arrparentid]);?>
<?php if(in_array($catid,$arrcats)) { ?><span style="width:100px"><a href="<?php echo $c['url'];?>"><?php echo $c['catname'];?></a></span><?php } ?>
<?php } ?>
</p>
<?php } ?>
<?php } ?>
  </div>
</div>
<?php include template('wslm','footer'); ?>