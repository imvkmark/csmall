<?php defined('IN_WSLM') or exit('Access Denied'); ?><?php include template('member','header'); ?>
<div id="main">
<div id="left">
    <div id="space">
      <h5><?php echo $username;?>的个人空间</h5>
      <img src="<?php echo $avatar;?>" alt="<?php echo $username;?>" height="150" width="150"/>
      <p><?php if($is_host) { ?><a href="<?php echo $MODULE['message']['url'];?>inbox.php" class="msg">查看短消息</a> |<?php } ?> <a href="<?php echo $MODULE['message']['url'];?>send.php?userid=<?php echo $userid;?>" class="edit">写短消息</a></p>
      <div class="clear"></div>
    </div>
    <ol>
      <li class="local"><a href="<?php echo SITE_URL;?>">返回网站首页</a></li>
      <?php if($is_host) { ?><li class="exit"><a href="<?php echo $MODULE['member']['url'];?>logout.php">退出登录</a></li><?php } ?>
    </ol>
    </div>
<div id="right">
    	  <p id="position">
      		<strong>当前位置：</strong><a href="<?php echo $M['url'];?>">会员中心</a><a href="<?php echo $M['url'];?>view.php?userid=<?php echo $userid;?>">查看会员资料</a>
          </p>
          <table cellpadding="0" cellspacing="1" class="table_form">
          	<caption>
            	<?php echo $username;?>的资料
            </caption>
            <tr>
            	<th width="25%"><strong>用户名：</strong></th><td width="*"><?php echo $username;?></td>
            </tr>
<?php if($userid==$_userid) { ?>
<tr>
            	<th><strong>E-mail：</strong></th>
                <td><?php echo $email;?></td>
            </tr>
<?php } ?>
<tr>
            	<th><strong>用户组：</strong></th><td><?php echo $GROUP[$groupid];?></td>
            </tr>
<tr>
            	<th><strong>所在地区：</strong></th><td><?php echo $AREA[$areaid]['name'];?></td>
            </tr>
<tr>
            	<th><strong>积分：</strong></th><td><?php echo $point;?></td>
            </tr>
<tr>
            	<th><strong>最后登录时间：</strong></th><td><?php echo $lastlogintime;?></td>
            </tr>
            <tr>
            	<th><strong>注册时间：</strong></th><td><?php echo $regtime;?></td>
            </tr>
            <?php if(is_array($forminfos) && !empty($forminfos)) { ?>
            <?php if(is_array($forminfos)) foreach($forminfos AS $k => $forminfo) { ?>
            <tr>
            	<th><strong><?php echo $k;?>：</strong></th><td><?php echo $forminfo;?></td>
            </tr>
            <?php } ?>
            <?php } ?>
          </table>
    </div>
    <div class="clear"></div>
  </div>
</div>
<?php include template('wslm','footer'); ?>