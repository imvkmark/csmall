<?php defined('IN_WSLM') or exit('Access Denied'); ?><?php include template('wslm','header'); ?>
<script language="JavaScript">
<!--
function killerrors() { 
return true; 
}
window.onerror = killerrors;
//-->
</script>
<style type="text/css" >
#bimg img { 
vertical-align: middle;
max-width:600px;   /* FF IE7 */
width:expression(this.width > 600 && this.width > this.height ? 600 : true);
overflow:hidden;
}
</style>
<!--begin main-->
<div id="main">
  <!--begin left-->
  <div id="main_l" class="bdr_1">
    <!--位置导航-->
<div id="position"><a href="">首页</a><?php echo catpos($r['catid']);?>组图展示</div>
    <div id="content">
    <div id="content_head">
      <!--文章标题-->
      <h1><a href="<?php echo $url;?>"><?php echo $title;?></a></h1>
      <!--基本属性-->
      <div id="text"><span><?php echo $updatetime;?></span> 作者：<?php echo $userid;?> 来源：<a href="<?php echo $copyfromurl;?>"><?php echo $copyfromname;?></a> 浏览次数：<span id="hits">0</span></div></div>
      <!--begin 图片浏览-->

<div id="ArticleCnt">
  <a id="p" name="p"></a>
  <div id="lantern">
  <!--播放工具-->
    <div id="tool">
      <div class="f_l">
        <select id="cSpeed" onchange="SaveTime()" style="display: none;">
          <option value="6" selected="selected">中</option>
        </select>
        <input style="display: inline;" id="startplay" title="播放/暂停" src="images/picture/9423081.gif" onclick="playpic()" align="absmiddle" type="image">
        <input id="stopplay" title="播放/暂停" src="images/picture/9423085.gif" style="display: none;" onclick="stop()" align="absmiddle" type="image">
<?php if($page==1) { ?><img src="images/picture/9423087.gif" align="absmiddle" width="48" height="22">
<?php } else { ?><a href="javascript:changeUrl(<?php echo max(intval($page-1),1);?>)"><img src="images/picture/9423087.gif" alt="上一张" align="absmiddle" width="48" height="22"></a><?php } ?>
<?php if($page==$images_number) { ?>&nbsp;
<img src="images/picture/9423077.gif" align="absmiddle" width="48" height="22">
<?php } else { ?>
<a href="javascript:changeUrl(<?php echo min(intval($page+1),$images_number);?>)"><img src="images/picture/9423077.gif" alt="下一张" align="absmiddle" width="48" height="22"></a>
<?php } ?>
        <select id="pagejump" onchange="changeUrl(this.value)">
<?php if(is_array($array_images)) foreach($array_images AS $j => $img) { ?>
          <option value="<?php echo $j;?>" <?php if($j==$page) { ?>selected<?php } ?>><?php echo $j;?>/<?php echo $images_number;?>张</option>
<?php } ?>
        </select>
      </div>
      <div class="f_r"> <a href="<?php echo $array_images[$page]['filepath'];?>" target="_blank"><img src="images/picture/9423079.gif" border="0" width="60" height="22"></a> </div>
      <div class="clear"></div>
    </div>
    <!--正中大图-->
    <div id="bimg"><a href="javascript:changeUrl(<?php echo min($page+1,$images_number);?>)"><img style="cursor: pointer;" src="<?php echo $array_images[$page]['filepath'];?>" alt="点击浏览下一张" ></a>
      <div id="Explain" align="center">
        <p></p>
      </div>
    </div>

    <div id="simg">
      <div class="p"><a href="javascript:changeUrl(<?php echo intval(floor($page/6)*6-5);?>)"><img src="images/picture/9423218.gif" alt="上一组"></a></div>
      <div id="sImage">
  
<?php if(is_array($array_images)) foreach($array_images AS $k => $r) { ?>
<?php if(($k<ceil($page/6)*6-5) || ($k>ceil($page/6)*6)) continue;?>
 <div><a href="javascript:changeUrl(<?php echo $k;?>)"><img src="<?php echo thumb($r[filepath], 60, 60);?>" alt="点击浏览大图" width="60" height="60" <?php if($k==$page) { ?>class="s"<?php } ?>/></a></div>
<?php } ?>
      </div>

      <div class="n"><a href="javascript:changeUrl(<?php echo min(ceil($page/6)*6+1,$images_number);?>)"><img src="images/picture/9423216.gif" alt="下一组"></a></div>
    </div>
  </div>
  <div id="hdcnt"></div>
</div>
      <!--end 图片浏览-->
      <!--快速链接-->
<div class="clear"></div>
      <?php if(isset($MODULE[mail])) { ?>
      <form action="<?php echo $MODULE['mail']['url'];?>sendmail.php" name="sendmail" id="sendmail">
        <input type="hidden" name="title" value="推荐：<?php echo $title;?>" />
        <input type="hidden" name="content" value=" <a href='<?php echo SITE_URL;?><?php echo $url;?>' target='_blank'><?php echo $title;?></a><br/>" />
      </form>
      <?php } ?>
      <?php if(isset($MODULE[error_report])) { ?>
      <form action="<?php echo $MODULE['error_report']['url'];?>error_report.php" name="errors" id="errors">
        <input type="hidden" name="title" value="<?php echo $title;?>" />
      </form>
      <?php } ?>      
      <h3 class="align_r"><?php if(isset($MODULE[error_report])) { ?><a href="javascript:$('#errors').submit();">[错误报告]</a><?php } ?> <?php if(isset($MODULE[mail])) { ?><a href="javascript:$('#sendmail').submit();">[推荐]</a><?php } ?> <a href="javascript:myAddPanel('<?php echo $title;?>',window.location.href)">[收藏]</a> <a href="javascript:window.print();">[打印]</a> <a href="javascript:window.close();">[关闭]</a> <a href="<?php echo SITE_URL;?><?php echo $url;?>#top">[返回顶部]</a> </h3>
      <!--评论-->
      <?php if(isset($MODULE[comment])) { ?>
      <?php list($keyid, $verify) = keyid_make('wslm', 'content', 'title', $contentid);?>
      <div id="commnent_tag"><a href="<?php echo $MODULE['comment']['url'];?>?keyid=<?php echo $keyid;?>&verify=<?php echo $verify;?>"><img src="images/comment.gif" alt=""/></a> 当前共有<strong class="c_red"><span id="comments">0</span></strong>人发表了评论.</div>
      <?php } ?> </div>
    <div class="clear"></div>    
    </div>
  <!--end left-->
  <!--begin right-->
  <div id="main_r">
    <h4>推荐<?php echo $CATEGORY[$catid]['catname'];?></h4>
    <div>
      <ul class="pic_list">
        {tag_组图图片列表页推荐}
      </ul>
    </div>
    <h4>最新<?php echo $CATEGORY[$catid]['catname'];?>信息</h4>
    <div>
      <ul class="text_list">
        {tag_组图图片列表页最新}
      </ul>
    </div>
  </div>
  <!--end right-->
</div>
<!--end main-->
<script language="JavaScript">
<!--
function changeUrl(id)
{
redirect("<?php echo SCRIPT_NAME;?>?contentid=<?php echo $contentid;?>&page="+id);
}
var autoplay=false;
if(getcookie("autoplay") != null)
{
  if(getcookie("autoplay")=="1")
  {
   autoplay=true;
   $('#startplay').css('display','none');
   $('#stopplay').css('display','inline');
  }
  else
  {
$('#startplay').css('display','inline');
$('#stopplay').css('display','none');
  }
}
else
{
stop();
}
if(autoplay)
{
setInterval("play()",6000);
}
function playpic()
{ 

   $('#startplay').css('display','none');
   $('#stopplay').css('display','inline');
   setcookie("autoplay",1);
   play();
}
function play()
{
var t = <?php echo $images_number;?>;
var page = <?php echo $page;?>;
if(t==page)
{
stop();
}
else
{
setInterval("changeUrl(<?php echo min(intval($page+1),$images_number);?>)",6000);
}
}
function stop()
{
setcookie("autoplay",0);
$('#startplay').css('display','inline');
$('#stopplay').css('display','none');
}
//-->
</script>
<script language="JavaScript" src="count.php?contentid=<?php echo $contentid;?>"></script>
<?php include template('wslm','footer'); ?>