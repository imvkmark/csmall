<?php defined('IN_WSLM') or exit('Access Denied'); ?><?php include template("member","header"); ?>
<div id="main">
<?php include template("member","left"); ?>
<div id="right">
  <p id="position"> <strong>当前位置：</strong><a href="">首页</a><a href="<?php echo $M['url'];?>index.php">会员中心</a>会员升级</p>
  <form action="<?php echo $M['url'];?>upgrade.php" method="post" name="myform" id="myform">
    <table cellpadding="0" cellspacing="1" class="table_list">
    <caption>会员升级</caption>
      <tr>
        <th width="13%">会员级别</th>
        <th width="50%">会员特权</th>
        <th width="20%">服务期限</th>
        <th width="12%">会员资费</th>
        <th width="5%">操作</th>
      </tr>
<?php if(is_array($data)) foreach($data AS $n => $r) { ?>
      <tr>
        <td><?php echo $r['name'];?></td>
        <td class="align_l"><?php echo str_cut(strip_tags($r[description]), 170);?> <a href="<?php echo $M['url'];?>upgrade.php?action=view&groupid=<?php echo $r['groupid'];?>" style="color:red">了解更多...</a></td>
        <td>
<?php if($r['iscontinue']) { ?>
<span style="color:<?php if($r['isexpired']) { ?>gray<?php } else { ?>blue<?php } ?>"><?php echo $r['startdate'];?> ~ <?php echo $r['enddate'];?></span>
<?php } ?></td>
        <td style="color:orange;font-weight:bold;text-align:left"><?php if($r['price_y']>0) { ?><?php echo $r['price_y'];?>元/年<br /><?php } ?><?php if($r['price_m']>0) { ?><?php echo $r['price_m'];?>元/月<br /><?php } ?><?php if($r['price_d']>0) { ?><?php echo $r['price_d'];?>元/天<?php } ?></td>
        <td>
<?php if($r[disabled] || !$r[allowupgrade]) { ?>
<font color="#cccccc"><?php if($r['iscontinue']) { ?>续费<?php } else { ?>升级<?php } ?></font>
<?php } else { ?>
<?php if($r['iscontinue']) { ?>
<a href="<?php echo $M['url'];?>upgrade.php?action=continue&groupid=<?php echo $r['groupid'];?>" style="color:green">续费</a>
<?php } else { ?>
<a href="<?php echo $M['url'];?>upgrade.php?action=pay&groupid=<?php echo $r['groupid'];?>" style="color:red">升级</a>
<?php } ?>
<?php } ?>
</td>
      </tr>
<?php } ?>
    </table>
  </form>
</div>
</div>
<?php include template("member","footer"); ?>