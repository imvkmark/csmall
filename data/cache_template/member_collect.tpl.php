<?php defined('IN_WSLM') or exit('Access Denied'); ?><?php include template('member','header'); ?>
<div id="main">
<div id="left">
    <div id="space">
      <h5><?php echo $_username;?>的个人空间</h5>
      <img src="<?php echo $avatar;?>" alt="<?php echo $username;?>" height="150" width="150"/>
      <p><?php if($is_host) { ?><a href="<?php echo $MODULE['message']['url'];?>inbox.php" class="msg">查看短消息</a> |<?php } ?> <a href="<?php echo $MODULE['message']['url'];?>send.php" class="edit">写短消息</a></p>
      <div class="clear"></div>
    </div>
    <ol>
      <li class="local"><a href="<?php echo SITE_URL;?>">返回网站首页</a></li>
      <?php if($is_host) { ?><li class="exit"><a href="<?php echo $MODULE['member']['url'];?>logout.php">退出登录</a></li><?php } ?>
    </ol>
    </div>
<div id="right">
    	  <p id="position">
      		<strong>当前位置：</strong><a href="<?php echo $M['url'];?>">会员中心</a>我的收藏
          </p>
          <table cellpadding="0" cellspacing="1" class="table_list">
          	<caption>
            	<?php echo $_username;?>收藏的信息
            </caption>
            <tr>
            	<th><strong>标题</strong></th><th><strong>栏目</strong></th><th><strong>收藏日期</strong></th><th><strong>删除</strong></th>
            </tr>
<?php if(is_array($data['collect'])) foreach($data['collect'] AS $c) { ?>
<tr>
                <td><?php echo $c['contentid'];?>、<a href="<?php echo $c['url'];?>" target='_blank'><?php echo $c['title'];?></td><td><?php echo $CATEGORY[$c['catid']]['catname'];?></td><td><?php echo date('Y-m-d', $c['addtime']);?></td><td><a href='member/collect.php?action=delete&id=<?php echo $c['id'];?>'>删除</a></td>
            </tr>
<?php } ?>
          </table>
    </div>
    <div id="pages"><?php echo $data['pages'];?></div>
  </div>
</div>
<?php include template('wslm','footer'); ?>