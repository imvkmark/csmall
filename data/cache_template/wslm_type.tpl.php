<?php defined('IN_WSLM') or exit('Access Denied'); ?><?php include template('wslm','header'); ?>
<!--begin main-->
<div id="main">
  <div id="main_l" class="bdr_1">
    <!--位置导航-->
    <div id="position"><a href="">首页</a><a>类别首页</a></div>
    <?php if(is_array($TYPE)) foreach($TYPE AS $cid => $c) { ?>
    <div class="cat">
      <div class="cat_title_1"><a href="type.php?typeid=<?php echo $c['typeid'];?>"><img src="images/more.gif" alt="更多" /></a>
        <h3><?php echo $c['name'];?></h3>
      </div>
      <div class="cat_left"> {tag_类别页图片标题} </div>
      <div class="cat_right">
        <ul class="text_list">
          {tag_类别页信息列表}
        </ul>
      </div>
    </div>
    <?php } ?>
</div>
  <div id="main_r">
    <!--广告位-->
    <div class="ad_side">
      <script language="javascript" src="data/js.php?id=5"></script>
    </div>
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