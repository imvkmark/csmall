<?php defined('IN_WSLM') or exit('Access Denied'); ?>  <div id="left">
    <div id="treemenu">
      <h5>短消息</h5>
      <ul>   	
<li><a href="<?php echo $M['url'];?>send.php">发送短消息</a></li>
        <li><a href="<?php echo $M['url'];?>inbox.php">收件箱<?php if($_message && $new_message) { ?><strong class="c_orange">(<?php echo $new_message;?>)</strong><?php } ?></a></li>
        <li><a href="<?php echo $M['url'];?>outbox.php">发件箱<?php if($_message && $new_out_message) { ?><strong class="c_orange">(<?php echo $new_out_message;?>)</strong><?php } ?></a></li>
      </ul>
    </div>
    <ol>
      <li class="local"><a href="<?php echo SITE_URL;?>">返回网站首页</a></li>
      <li class="exit"><a href="<?php echo $MODULE['member']['url'];?>logout.php">退出登录</a></li>
    </ol>
  </div>
  <?php if($_message) { ?><bgsound src="images/message.wav" id="message_sound" ><?php } ?>