<?php defined('IN_WSLM') or exit('Access Denied'); ?><div class="titles" id="xinqing">
  <h3><span style="float:right;width:100px;"><a href="<?php echo SITE_URL;?>mood/rank.php?moodid=<?php echo $r['moodid'];?>">查看心情排行</a></span>您看到此<?php echo $moodtitle;?>时的感受是：</h3>
  <ul>
  <?php if(is_array($infos)) foreach($infos AS $info) { ?>
    <li><img src="<?php echo $info['img'];?>" alt="<?php echo $info['title'];?>"/><br>
<?php echo $info['title'];?>
<br><input type='radio' value="1" name='moodradio' onClick="javascript:vote(<?php echo $info['id'];?>);return false;"></li>
  <?php } ?>
  </ul>
</div>