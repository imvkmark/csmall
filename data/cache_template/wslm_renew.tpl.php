<?php defined('IN_WSLM') or exit('Access Denied'); ?><?php include template('wslm','header'); ?>

<!--begin main-->
<div id="main">
  <div id="main_l" class="bdr_1">
    <!--位置导航-->
    <div id="position"><a href="">首页</a><?php if($catid) { ?><a href="<?php echo $url;?>"><?php echo $catname;?></a><?php } ?>最新更新 <font color="red"><?php echo $number;?></font> 条 </div>
<div class="mar_10">
<ul class="text_list text_list_f14">
<?php if(is_array($datas)) foreach($datas AS $r) { ?>
<li><span class="date"><?php if($r[updatetime]>$updatetime) { ?><font color="red"><?php echo date('Y-m-d',$r[updatetime]);?><?php } else { ?> <?php echo date('Y-m-d',$r[updatetime]);?><?php } ?></span>
  <a href="<?php echo $CATEGORY[$r['catid']]['url'];?>" target="_blank">[<?php echo $CATEGORY[$r['catid']]['catname'];?>]</a> <a href="<?php echo $r['url'];?>" target="_blank" class="url"><?php echo $r['title'];?></a>
</li>
<?php } ?>
</ul>
</div>
  </div>
  <div id="main_r">
    <!--广告位-->
    <div class="ad_side"><script language="javascript" src="data/js.php?id=5"></script></div>
    <h4>推荐图片文章</h4>
    <div>
      <ul class="pic_list">
        {tag_栏目页图片文章}
      </ul>
    </div>
<?php echo block("list_article", 1);?>
    <h4>热点文章</h4>
    <div>
      <ul class="text_list">
       {tag_栏目页热点}
      </ul>
    </div>
<?php echo block("list_$catid", 2);?>
  </div>
</div>
<!--end main-->
<?php include template('wslm','footer'); ?>