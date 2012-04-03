<?php defined('IN_WSLM') or exit('Access Denied'); ?><?php include template("member","header"); ?>
<div id="main">
<?php include template("message","left"); ?>
<div id="right">
<p id="position"><strong>当前位置：</strong><a href="<?php echo $M['url'];?>index.php">短消息</a>收件箱</p>
        <form name="myform" id="myform" method="post" action="<?php echo $M['url'];?>inbox.php">
    	 <table cellpadding="0" cellspacing="1" class="table_list">
         <caption>
      		<?php echo $anoucement;?>
      	  </caption>
        <tr>
        	<th width="5%">选中</th>
         	<th width="*">标题</th>
<th width="10%">回复数</th>
           	<th width="10%">发件人</th>
<th width="20%">发送时间</th>
        </tr>
        <?php if(is_array($arr_message)) foreach($arr_message AS $msg) { ?>
        <tr>
        	<td><input type="checkbox" name="arr_msgid[]" class="input_1" id="checkbox" value="<?php echo $msg['messageid'];?>" /></td>
            <td  class="align_left"><a href="<?php echo $M['url'];?>read.php?userid=<?php echo $_userid;?>&msgid=<?php echo $msg['messageid'];?>"><?php if($msg['status'] == 1) { ?><strong class="c_orange"><?php echo $msg['subject'];?></strong><?php } else { ?><?php echo $msg['subject'];?><?php } ?></a></td>
<td><?php echo $msg['num_reply'];?></td>
            <td><a href="<?=space_url($msg['send_from_id'])?>" target="_blank"><?php echo username($msg['send_from_id']);?></a></td>
<td><?php echo $msg['date'];?></td>
        </tr>
        <?php } ?>
<tr>
<td colspan="5" style="text-align:left;">
<input type="hidden" id="action" name="action" value="delete" />
&nbsp;&nbsp; &nbsp;&nbsp;
<input type="button" name="arr_msgid" onclick='checkall()' value="全选" />
&nbsp;
<input type="button" name="export" id="export" value="导出" />
&nbsp;
<input type="button" name="dosubmit" id="delete" value="删除" onClick="if(confirm('确认批量删除这些消息吗？')) $('form').submit();return false;" />
</td>
</tr>
</table>
</form>
<div id="pages"><?php echo $pages;?></div>
<?php if($url == 'inbox.php') { ?>
<table cellpadding="0" cellspacing="1" class="table_info">
<caption>提示信息</caption>
<tr>
<td>可保存<?php echo $G['allowmessage'];?>条短消息</td>
</tr>
</table>
<?php } ?>
</div>
</div>
<div class="clear"></div>
<div id="toogle_panel"></div>
<?php include template("member","footer"); ?>
<script language="javascript">
$("#export").click(function(){
$('#action').val('export');
$('form').submit();
});
</script>