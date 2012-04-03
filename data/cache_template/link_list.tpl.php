<?php defined('IN_WSLM') or exit('Access Denied'); ?><?php include template('wslm','header'); ?>
<!--begin main-->
<div id="main">
  <div id="main_l" class="bdr_1">
    <!--位置导航-->
    <div id="position"><a href="">首页</a><a href="<?php echo $M['url'];?>index.php">友情链接</a><?php echo $link_name;?></div>
    <div class="cat_1">
      <h3><?php echo $link_name;?></h3>
    </div>
    <div class="logo_list">
      <?php if(is_array($link_logo)) foreach($link_logo AS $i => $link) { ?>
      <a href="<?php echo $link['url'];?>" target="_blank" title="<?php echo $link['name'];?>" onclick="$.get('<?php echo $M['url'];?>count.php?linkid=<?php echo $link['linkid'];?>')"><img src="<?php echo $link['logo'];?>" width="88" height="31" alt="<?php echo $link['name'];?>"></a> <?php if($link[showhits]) { ?>[<?php echo $link['hits'];?>]<?php } ?>
      <?php } ?>
    </div>
    <div class="textlogo_list">
      <?php if(is_array($link_word)) foreach($link_word AS $i => $link) { ?>
      <a href="<?php echo $link['url'];?>" target="_blank" title="<?php echo $link['name'];?>" onclick="$.get('<?php echo $M['url'];?>count.php?linkid=<?php echo $link['linkid'];?>')"><?php echo $link['name'];?></a> <?php if($link[showhits]) { ?>[<?php echo $link['hits'];?>]<?php } ?>
      <?php } ?>
    </div>
  </div>
  <div id="main_r">
    <h4>友情链接分类</h4>
    <div id="link_cat"> <?php if(is_array($datas)) foreach($datas AS $i => $type) { ?> <a href="<?php echo $M['url'];?>index.php?typeid=<?php echo $type['typeid'];?>"><?php echo $type['name'];?></a> <?php } ?> </div>
    <div id="link_apply">
      <input type="submit" value="我要申请链接" onclick="redirect('<?php echo $M['url'];?>register.php')"/>
    </div>
  </div>
</div>
<!--end main-->
<?php include template('wslm','footer'); ?>