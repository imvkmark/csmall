<?php defined('IN_WSLM') or exit('Access Denied'); ?><?php include template('wslm','header'); ?>
<div id="main">
  <!--位置导航-->
  <div id="position"><a href="">首页</a>留言板</div>
  <!--留言按钮，搜索-->
  <div class="search_box"><form method="get" name="search" action="<?php echo $M['url'];?>index.php">
    关键字：
<input name='keyword' type='text' size='30' value='<?php echo $keyword;?>'>&nbsp;
<input type="radio" name="srchtype" value="0" <?php if((!$srchtype)) { ?> checked <?php } ?>> 标题 	
<input type="radio" name="srchtype" value="1" <?php if(($srchtype==1)) { ?> checked <?php } ?>> 内容	
<input type="radio" name="srchtype" value="2" <?php if(($srchtype==2)) { ?> checked <?php } ?>> 会员
<input name='submit' type='submit' value='留言搜索'></form>
  </div>
  <div class="tag_menu">
    <ul>
      <li class="selected"><a href="<?php echo $M['url'];?>index.php">留言板首页</a></li>
      <li><a href="<?php echo $M['url'];?>post.php">签写留言</a></li>
    </ul>
  </div>
  <!--begin 留言列表-->
  <?php if(is_array($data)) foreach($data AS $n => $r) { ?>
  <div class="guestbook_list">
    <h3><sup class="f_r"></sup><span><?php echo $r['title'];?></span><span class="date">—<?php echo $r['addtime'];?></span></h3>
    <ul>
      <li class="guestbook_person">
        <ol>
          <li><img src="images/face/<?php echo $r['head'];?>.gif" /><br />
            <?php echo $r['username'];?></li>
          <li><a class="mysite" href="<?php echo $r['homepage'];?>" title="访问主页">主页</a>&nbsp;<a class="email" href="mailto:<?php echo $r['email'];?>" title="登录邮箱">信箱</a>&nbsp;<a class="qq" href="http://wpa.qq.com/msgrd?V=1&Uin=<?php echo $r['qq'];?>&Site=<?php echo $_SERVER['HTTP_HOST'];?>&Menu=yes" title="点击对话">QQ</a></li>
        </ol>
      </li>
  <?php if(!$r['hidden'] || $_groupid==1 || ($_userid && $_userid == $r['userid'])) { ?>
      <li class="guestbook_text"><?php echo $r['content'];?></li>
  <li class="guestbook_text">
  <?php if($r['reply']) { ?><b>管理员 [ <font color="red"><?php echo $r['replyer'];?></font> ] 于 <font color="red"><?php echo $r['replytime'];?></font> <br>回复：</b><?php echo $r['reply'];?>
  <?php } ?></li>
  <?php } else { ?>
<li class="guestbook_text" style="color:red">此信息管理员可见</li>
<?php } ?>
    </ul>
  </div>
  <?php } ?>


<?php if($pages) { ?>
<div id="pages"><?php echo $pages;?></div>
<?php } ?>
</div>
<?php include template('wslm','footer'); ?>