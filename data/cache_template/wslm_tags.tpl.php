<?php defined('IN_WSLM') or exit('Access Denied'); ?><?php include template('wslm','header'); ?>
<div id="main_full">
  <div id="position"><a href="">首页</a><a href="tags.php">热门标签</a></div>
  <div id="content">
    <ul id="tag_list">
  <?php $ARRAY = get("select tag,hits from wslm_keyword order by listorder desc,hits desc", 100, $page, "", "", "","","0");$DATA=$ARRAY['data'];$total=$ARRAY['total'];$count=$ARRAY['count'];$pages=$ARRAY['pages'];unset($ARRAY);foreach($DATA AS $n=>$r){$n++;?>
        <li><a href="tag.php?tag=<?php echo urlencode($r[tag]);?>"><?php echo $r['tag'];?></a>(<?php echo $r['hits'];?>)</li>
  <?php } unset($DATA); ?> 
    </ul>
    <div id="pages"><?php echo $pages;?></div>
    <div class="clear"></div>
  </div>
</div>
<?php include template('wslm','footer'); ?>