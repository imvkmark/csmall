<?php defined('IN_WSLM') or exit('Access Denied'); ?><div id="left">
    <div id="treemenu">
      <h5>订阅管理</h5>
      <ul>
      <?php if($_userid) { ?>
        <?php if($state == 1) { ?>
        <li><a href="<?php echo $MODULE[$mod]['url'];?>subscription.php?action=send&state=1">我要订阅</a></li>
        <?php } else { ?>
        <li><a href="<?php echo $MODULE[$mod]['url'];?>subscription.php?action=do">我的订阅</a></li>        
        <li><a href="<?php echo $MODULE[$mod]['url'];?>subscription.php?action=delall">我要退订</a></li>
        <?php } ?>
      <?php } else { ?>
       <li><a href="<?php echo $MODULE[$mod]['url'];?>nosubscription.php?action=del">订阅退订</a></li>
       <li><a href="<?php echo $MODULE[$mod]['url'];?>nosubscription.php?action=do">我要订阅</a></li>
      <?php } ?>
        
      </ul>
    </div>
    <ol>
      <li class="local"><a href="<?php echo SITE_URL;?>">返回网站首页</a></li>
      <?php if($_userid) { ?>
        <li class="exit"><a href="<?php echo $MODULE['member']['url'];?>logout.php">退出登录</a></li>
      <?php } ?>
    </ol>
</div>