<?php defined('IN_WSLM') or exit('Access Denied'); ?><?php include template('wslm','header'); ?>

<!--begin main-->
<div id="main">
  <div id="main_l" class="bdr_1">
    <!--位置导航-->
    <div id="position"><a href="">首页</a><a href="type.php">类别首页</a><a><?php echo $T['name'];?></a></div>
    <div class="bdr_2">
      <ul class="pic_list">
{tag_类别列表页最新图片}
      </ul>
    </div>
{tag_类别列表页标题列表}
  </div>
  <div id="main_r">
    <!--广告位-->
    <div class="ad_side"><script language="javascript" src="data/js.php?id=5"></script></div>
    <h4>类别导航</h4>
<div id="area">
<?php if(is_array($TYPE)) foreach($TYPE AS $type) { ?>
<a href="type.php?typeid=<?php echo $type['typeid'];?>"><?php echo $type['name'];?></a>
<?php } ?>
</div>
  </div>
</div>
<!--end main-->
<?php include template('wslm','footer'); ?>