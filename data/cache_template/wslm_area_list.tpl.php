<?php defined('IN_WSLM') or exit('Access Denied'); ?><?php include template('wslm','header'); ?>
<!--begin main-->
<div id="main">
  <div id="main_l" class="bdr_1">
    <!--位置导航-->
    <div id="position"><a href="">首页</a><?php echo areapos($A[areaid],"area.php?areaid=\$areaid&catid=$catid");?></div>
    <div class="bdr_2">
      <ul class="pic_list">
{tag_信息地区页面图文列表}
      </ul>
    </div>
<ul class="text_list text_list_f14">
<?php $arrchildid = $CATEGORY[$catid][arrchildid]?>
<?php if($arrchildid) { ?>
<?php $ARRAY = get("SELECT contentid,catid,typeid,areaid,title,style,thumb,keywords,description,userid,updatetime,inputtime,url FROM `wslm_content` WHERE status=99 AND `areaid`='$areaid' AND `catid` IN ($arrchildid) ORDER BY contentid DESC", 10, $page, "", "", "","","0");$DATA=$ARRAY['data'];$total=$ARRAY['total'];$count=$ARRAY['count'];$pages=$ARRAY['pages'];unset($ARRAY);foreach($DATA AS $n=>$r){$n++;?>
<li><span class="date"><?php echo date('Y-m-d',$r[updatetime]);?></span>
<a href="<?php echo $CATEGORY[$r['catid']]['url'];?>" class="catname">[<?php echo $CATEGORY[$r['catid']]['catname'];?>]</a>
<a href="<?php echo $r['url'];?>" target="_blank"><?php if($r[style]) { ?><span class="<?php echo $r['style'];?>"><?php echo str_cut($r[title], 60);?></span><?php } else { ?><?php echo str_cut($r[title], 60);?><?php } ?></a></li>
<?php } unset($DATA); ?>
</ul>
<?php if($pages) { ?><div id="pages"><?php echo $pages;?></div><?php } ?>
<?php } ?>
  </div>
  <div id="main_r">
    <!--广告位-->
    <div class="ad_side"><script language="javascript" src="data/js.php?id=5"></script></div>
    <h4>周DIGG排行</h4>
    <div>
      <ul class="digg_text_list">
      <?php $DATA = get("select d.contentid,d.supports,c.title,c.style,c.url from wslm_digg d left join wslm_content c on d.contentid=c.contentid where c.status=99 AND c.areaid='$areaid' order by d.supports_week desc", 10, 0, "", "");foreach($DATA AS $n => $r) { $n++;?>
<li><span><?php echo $r['supports'];?></span><a href="<?php echo $r['url'];?>" target="_blank" class="<?php echo $r['style'];?>"><?php echo str_cut($r[title], 44);?></a></li>
<?php } unset($DATA); ?>
      </ul>
    </div>
  </div>
</div>
<!--end main-->
<?php include template('wslm','footer'); ?>