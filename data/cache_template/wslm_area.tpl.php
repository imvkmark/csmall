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
<?php $ARRAY = get("SELECT contentid,catid,typeid,areaid,title,style,thumb,keywords,description,userid,updatetime,inputtime,url FROM `wslm_content` WHERE status=99 AND `areaid` IN ($arr_areaid) AND `catid` IN ($arrchildid) ORDER BY contentid DESC", 10, $page, "", "", "","","0");$DATA=$ARRAY['data'];$total=$ARRAY['total'];$count=$ARRAY['count'];$pages=$ARRAY['pages'];unset($ARRAY);foreach($DATA AS $n=>$r){$n++;?>
<li><?php if($showdate) { ?><span class="date"><?php echo date('Y-m-d',$r[updatetime]);?></span><?php } ?>
<a href="<?php echo $CATEGORY[$r['catid']]['url'];?>" class="catname">[<?php echo $CATEGORY[$r['catid']]['catname'];?>]</a>
<a href="<?php echo $r['url'];?>" target="<?php echo $target;?>"><?php if($r[style]) { ?><span class="<?php echo $r['style'];?>"><?php echo str_cut($r[title], 60);?></span><?php } else { ?><?php echo str_cut($r[title], 60);?><?php } ?></a></li>
<?php } unset($DATA); ?>
</ul>
<?php if($pages) { ?><div id="pages"><?php echo $pages;?></div><?php } ?>
<?php } ?>
  </div>
  <div id="main_r">
    <h4>按子地区浏览</h4>
    <div id="area">
<?php if(is_array($areas)) foreach($areas AS $a) { ?><a href="area.php?areaid=<?php echo $a['areaid'];?>&catid=<?php echo $catid;?>"><?php echo $a['name'];?></a><?php } ?>
</div>
   <h4>信息分类</h4>
    <div id="info_nav">
<?php if(is_array($catlist)) foreach($catlist AS $c) { ?>
      <dl><?php $cols=1;?>
        <?php if($c[parentid]==$catid) { ?><dt><a href="<?php echo $c['url'];?>"><?php echo $c['catname'];?></a></dt>
<dd><?php if(is_array($catlist)) foreach($catlist AS $cat) { ?>
<?php if($cols<4 && $cat[parentid]==$c[catid]) { ?><a href="<?php echo $c['url'];?>"><?php echo $c['catname'];?></a><?php } ?>
<?php $cols++;?>
<?php } ?><a href="<?php echo $c['url'];?>">>></a></dd>
<?php } ?>
      </dl>
<?php } ?>
    </div>
    
  </div>
</div>
<!--end main-->

<?php include template('wslm','footer'); ?>