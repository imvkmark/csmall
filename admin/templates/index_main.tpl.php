<?php 
defined('IN_WSLM') or exit('Access Denied');
include admin_tpl('header');
?>
<style type="text/css">
<!--
* { padding:0; margin:0;}
body { padding:0; font-size:12px; color: black;	line-height: 150%; background-color: white;}
a:link, a:visited { text-decoration:none; color:#819E42;}
a:hover, a:active { text-decoration:underline;}
a.orange:link, a.orange:visited { text-decoration:none;	color:orange;}
a.orange:hover, a.orange:active { text-decoration:underline;}
ul li {	list-style:none; margin:5px 0;}
img { border-width:0;}
.font_arial { font-family:Arial, Helvetica;}
.bdr{border:1px solid #819E42; clear:both;}
#admin_main{ padding:0 10px;}
caption{*margin-top:10px; line-height:25px; height:25px; text-align:left; padding-left:14px;}
caption,#admin_main h3 { border:1px solid #819E42; border-bottom-width:0; color:#819E42; background:url(admin/skin/images/bg_table.jpg) repeat-x 0 0; height:27px; line-height:27px; margin:10px auto 0; font-size:12px; font-family:"宋体"}
caption{border-bottom:1px solid #819E42 !important; border:1px solid #819E42; border-bottom-width:0; font-weight:bold; }
caption span{float:right; padding-right:10px;}
table{background:#819E42; margin-top:-5px !important; margin-top:10px; width:100%;}
td{background:#fff;}
th,td{line-height:24px; text-align:center; color:#819E42;}
th{ font-size:12px; background: url(admin/skin/images/bg_table.jpg) repeat-x 0 -26px; line-height:22px; height:24px !important; height:22px; font-weight:bold;}
#admin_main_2_1 {width:48%; float:left;}
#admin_main_2_1 p { border-bottom:1px dotted #b4d3ef; margin:10px auto;	text-align:left; padding:0 10px 10px; color:#819E42;	line-height:22px;}
#admin_main_2_2 { float:left; margin-left:1.5%; width:48%;}
#admin_main_2_2 li,#admin_main_2_1 li { background:#fff url(admin/skin/images/list_bg.gif) no-repeat 5px 8px;}
#admin_main_2_2 { float:left; margin-left:1.5%; width:48%;}
.ad { text-align:center; margin:10px auto;}
.c_orange { color:orange;}
-->
</style>
<body onLoad="$.get('?mod=wslm&file=memo&action=get', function(data){$('#memo_mtime').html(data.substring(0, 19));$('#memo_data').val(data.substring(19));}); ">
<div id="admin_main">
  <div id="admin_main_2_1">
    <h3>我的个人信息</h3>
    <div class="bdr">
		<!--管理员基本信息-->
		<p>您好，<a href="<?=space_url($_userid)?>"><strong><span class="font_arial" style="color:#690"><?=$_username?></span></strong></a><br />
		   角色：<?php foreach($_roleid as $roleid) echo $ROLE[$roleid].' ';?><br />
		 
		<p>
		  登录时间：<?=date('Y-m-d H:i:s')?><br />
		  登 录 IP：<?=$lastloginip?> <br />
		  登录次数：<?=$logintimes?> 次
		</p>
    </div>

  </div>
  <div id="admin_main_2_2">
    <h3><span id="memo_mtime" style="float:right; padding-right:10px;"></span>我的备忘录</h3>
    <div class="bdr"><textarea name="data" id="memo_data" class="inputtext" style="height:173px;width:99%;margin:5px; padding:5px" onblur='$.post("?mod=wslm&file=memo&action=set", { data: this.value }, function(data){$("#memo_mtime").html(data);});'></textarea></div>




  </div>
</div>
<?php 
if($_message) 
{
?> 
	<bgsound src="images/message.wav" id="message_sound" > 
<?php }
?>
<script type="text/javascript" src="<?=$notice_url?>"></script>
</body>
</html>