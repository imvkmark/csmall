<?php defined('IN_WSLM') or exit('Access Denied'); ?><?php include template('member','header'); ?>
<link href="<?php echo SKIN_PATH;?>modal.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="images/js/jqModal.js"></script>
<script language="javascript" src="images/js/ajaxfileupload.js"></script>
<script type="text/javascript" src="images/js/validator.js"></script>
<div id="main">
<?php include template("member","left"); ?>
<div id="right">
<p id="position"> <strong>当前位置：</strong><a href="<?php echo $M['url'];?>index.php">会员中心</a>修改资料</p>
<form name="myform" action="<?php echo $M['url'];?>edit.php" enctype="multipart/form-data" method="post">
  <table cellpadding="0" cellspacing="1" class="table_form">
    <caption>修改资料</caption>
    <tr>
      <th width="20%">用户名：</th>
      <td width="80%"><?php echo $username;?></td>
    <tr>
      <th>E-mail：</th>
      <td><input name="info[email]" type="text" id="email" size="30" require="true" datatype="email"  msg="邮件格式不正确|"  value="<?php echo $email;?>"><span id="email_notice" class="color_1"></span>
      </td>
    </tr>
    <?php if(!$WSLM[uc]) { ?>
<tr>
      <th>用户头像：</th>
      <td><input type="button" value="上传头像" id="avatar"  />
      </td>
    </tr>
<?php } ?>
<tr>
  <th>所在地区：</th>
  <td>
  <?php if($areaid) { ?>
            <input type="hidden" name="info[areaid]" id="areaid" value="<?=$areaid?>">
<span onClick="this.style.display='none';$('#reselect_areaid').show();" style="cursor:pointer;"><?=$AREA[$areaid][name]?> <font color="red">点击重选</font></span>
<span id="reselect_areaid" style="display:none;">
<span id="load_areaid"></span> 
<a href="javascript:areaid_reload();">重选</a>
</span>
  <?php } else { ?>
<input type="hidden" name="info[areaid]" id="areaid" value="<?=$areaid?>">
<span id="load_areaid"></span>
<a href="javascript:areaid_reload();">&nbsp;重选&nbsp;</a>
  <?php } ?>
        </td>
</tr>
<?php if(is_array($forminfos)) foreach($forminfos AS $forminfo) { ?>
    <tr>
    	<th><?php echo $forminfo['name'];?>：</th><td><?php echo $forminfo['form'];?></td>
    </tr>
    <?php } ?>
    <tr>
      <th></th>
      <td><label>
        <input type="submit" name="dosubmit" id="button" value="确 定" />
　
        <input type="reset" name="button2" id="button2" value="重 置" />
        </label></td>
    </tr>
  </table>
</form>  
<span id="toggle_pannel" style="display:none;"></span>
<div class="clear"></div>
</div>
  </div>
<?php include template('member','footer'); ?>
<script language="javascript">
$().ready(function() {
$('form').checkForm(1);
$('#toggle_pannel').jqm({ajax: "<?php echo $M['url'];?>upload.php", modal:true, trigger:'#avatar'});
});

function areaid_load(id)
{
$.get("load.php", { field: 'areaid', id: id },
function(data){
$('#load_areaid').append(data);
  });
}

function areaid_reload()
{
$('#load_areaid').html('');
areaid_load(0);
}
areaid_reload();
</script>
