<?php defined('IN_WSLM') or exit('Access Denied'); ?><?php include template('member','header'); ?>
<div id="main">
<?php include template("member","left"); ?>
  <div id="right">
    <div id="box">
      <div class="box_l">您好，<strong><?php echo $_username;?></strong>| <a href="<?php echo $M['url'];?>logout.php" class="orange">退出登录</a><br />
   类型：<strong><?php echo $MODEL[$_modelid]['name'];?></strong><?php if($MODULE[message]) { ?>您有 <a href="<?php echo $MODULE['message']['url'];?>inbox.php" class="orange"><?php echo $msg_num;?></a> 条短消息<?php if($_message) { ?>，<a href="<?php echo $MODULE['message']['url'];?>inbox.php" class="orange email">收件箱</a><?php } ?><?php } ?> 
  可用点数：<strong><?php echo $_point;?>点</strong>可用资金：<strong><?php echo $_amount;?>元</strong></div>
      {tag_会员中心公告}
    </div>
    <div class="clear"></div>
<?php $menuid = $m->menuid('member_1');$menus = menu($menuid);?>
    <div id="quick_menu">
      <h3>控制面板</h3>
  <?php if(is_array($menus)) foreach($menus AS $menu) { ?>
  <?php $i++; ?>
<a href="<?php echo $menu['url'];?>"><img src="<?php if($menu[image]) { ?><?php echo $menu['image'];?><?php } else { ?>images/icon_<?php echo $i;?>.jpg<?php } ?>" alt="<?php echo $menu['name'];?>" /><br /><?php echo $menu['name'];?></a>
  <?php } ?>
        <div class="clear"></div>
      </div>
    <div class="clear"></div>
  </div>
</div>
<?php if($_message) { ?><bgsound src="images/message.wav" id="message_sound" ><?php } ?>
<?php include template('wslm','footer'); ?>