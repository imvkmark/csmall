<?php defined('IN_WSLM') or exit('Access Denied'); ?><?php include template("member","header"); ?>
<form action="<?php echo $M['url'];?>login.php" method="post" name="login_form" id="login_form" onsubmit="return loginCheck(this);">
<div id="login">
  <div id="login_l">
    <div id="login_t"></div>
    <ul>
      <li>用户名：<input name="username" type="text" id="username" size="15" /></li>
      <li>密　码：<input name="password" type="password" id="password" size="15" /></li>
<?php if($check->check()) { ?>
      <li>验证码：<?php echo form::checkcode('checkcodestr', 6);?></li>
<?php } ?>
      <li>Cookie：<select name="cookietime" id="cookietime">
          <option value="0">不保存</option>
          <option value="86400" >保存一天</option>
          <option value="2592000" >保存一月</option>
          <option value="31536000" >保存一年</option>
        </select>
      </li>
      <li>　　　
<input name="forward" type="hidden" id="forward" value="<?php echo $forward;?>">
        <input name="dosubmit" type="submit" value="登 录" />　
      	<a href="<?php echo $M['url'];?>getpwd.php" class="orange">忘记密码?</a>
　    </li>

  <?php if($M['enablemailcheck']) { ?>
  <li><a href="<?php echo $M['url'];?>email.php">长时间未收到激活邮件点击这里</a></li>
      <?php } ?>
    </ul>
    <div id="login_b"></div>
  </div>

  <div id="login_r"> <a href="<?php echo $M['url'];?>register.php"><img src="images/register.jpg" alt="" width="144" height="48" /></a>
    <p>点击上面的按钮,您将注册成为本站会员。</p>
  </div>
  <div class="clear"></div>
   <br/>
</div>
</form>
<?php include template("member","footer"); ?>