<?php defined('IN_WSLM') or exit('Access Denied'); ?><?php include template('wslm','header'); ?> 
<script type="text/javascript">
function set_type(type)
{
$('#type').val(type);
q = $('#q').val();
    if(q)
{
    $('#search').submit();
}
else
{
$('#search_form>span').removeClass('selected');
$('#type_'+type).addClass('selected');
}
}
$(function(){
$('#type_<?php echo $type;?>').addClass('selected');
});
</script>
<!--begin main-->
<div id="main">
  <!--位置导航-->
  <div id="position"><a href="">首页</a><a href="<?php echo $M['url'];?>">搜索</a></div>
  <!--搜索条件-->
<div class="search_box">
    <form name="search" id="search">
  <ul>
<li id="search_form">
    <span id="type_all" onclick="set_type('all')">全部</span>
<?php if(is_array($types)) foreach($types AS $k => $name) { ?>
<span id="type_<?php echo $k;?>" onclick="set_type('<?php echo $k;?>')"><?php echo $name;?></span>
<?php } ?>
</li>
<li>
  <input type="hidden" name="type" value="<?php echo $type;?>" id="type"/>
  <input type="text" name="q" size="48" value="<?php echo $q;?>" id="q"/>
  <input type="submit" name="s" id="button" value="搜索" />
</li>
  </ul>
    </form>
</div>
  <!--搜索结果-->
<div class="search_res">
<span class="f_r">
<?php if($order) { ?>
<a href="<?php echo $M['url'];?>?q=<?php echo urlencode($q);?>&type=<?php echo $type;?>&page=<?php echo $page;?>&order=0">按相似度排序</a> | 按更新时间排序
<?php } else { ?>
按相似度排序 | <a href="<?php echo $M['url'];?>?q=<?php echo urlencode($q);?>&type=<?php echo $type;?>&page=<?php echo $page;?>&order=1">按更新时间排序</a>
<?php } ?>
</span>
找到相关网页约<span style="color:red"><?php echo $total;?></span>篇，用时<span style="color:red"><?php echo $usedtime;?></span>秒</div>
<?php if(is_array($data)) foreach($data AS $i => $r) { ?>
  <dl class="search_list">
    <dt><a href="<?php echo $r['url'];?>"><?php echo $r['title'];?></a></dt>
    <dd class="search_txt"><?php echo $r['content'];?></dd>
    <dd class="search_attribute"><?php echo url($r[url], 1);?>　<?php echo $r['date'];?></dd>
  </dl>
<?php } ?>
  <!--分页-->
  <div id="pages"><?php echo $pages;?></div>
</div>
<!--end main-->
<?php include template('wslm','footer'); ?>