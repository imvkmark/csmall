<?php defined('IN_WSLM') or exit('Access Denied'); ?><?php include template('wslm','header'); ?>
<style>
.logo_list a{
width:88px;
height:31px;
display:block;
float:left;
overflow:hidden;
border:3px solid #FFF;
margin:10px 12px 2px 8px;
}
.logo_list a:hover{
border:3px solid #535353;
}
.logo_list a img{
width:88px;
height:31px;
}
</style>
<!--begin main-->
<div id="main">
  <div id="main_l" class="bdr_1">
    <!--位置导航-->
    <div id="position"><a href="">首页</a><a href="<?php echo $M['url'];?>index.php">友情链接</a></div>
    <?php if(is_array($datas)) foreach($datas AS $i => $type) { ?>
    <div class="cat_1"><a href="<?php echo $MODULE['link']['url'];?>index.php?typeid=<?php echo $type['typeid'];?>"><img alt="更多" src="images/more.gif"/></a>
      <h3><?php echo $type['name'];?></h3>
    </div>
    <div class="logo_list">
    <?php if(is_array($link_logos[$type[typeid]])) foreach($link_logos[$type[typeid]] AS $k => $logo) { ?>
    <a href="<?php echo $logo['url'];?>" target="_blank" title="<?php echo $logo['introduce'];?>" onclick="$.get('<?php echo $M['url'];?>count.php?linkid=<?php echo $logo['linkid'];?>')" ><img src="<?php echo $logo['logo'];?>" width="88" height="31" alt="<?php echo $logo['name'];?>"><?php echo $logo['name'];?></a>
    <?php } ?>
    </div>
    <div class="textlogo_list">
    <?php if(is_array($link_words[$type[typeid]])) foreach($link_words[$type[typeid]] AS $k => $word) { ?>
    <a href="<?php echo $word['url'];?>" target="_blank" title="<?php echo $word['introduce'];?>" onclick="$.get('<?php echo $M['url'];?>count.php?linkid=<?php echo $word['linkid'];?>')" ><?php echo $word['name'];?></a>
    <?php } ?>
    </div>
    <?php } ?>
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
