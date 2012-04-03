<?php
defined('IN_WSLM') or exit('Access Denied');
include admin_tpl('header');
?>
<script type="text/javascript" src="images/js/form.js"></script>
<script type="text/javascript" src="images/js/jqModal.js"></script>
<script type="text/javascript" src="images/js/jqDnR.js"></script>
<script type="text/javascript" src="yp/images/js/info_add.js"></script>
<body>
<?=$menu?>
<form action="?mod=<?=$mod?>&file=<?=$file?>&action=<?=$action?>&catid=<?=$catid?>&modelid=<?=$modelid?>" method="post" name="myform"  enctype="multipart/form-data">
<table cellpadding="0" cellspacing="1" class="table_form">
  <caption>发布信息</caption>
 <?php
 foreach($forminfos as $field=>$info)
 {
 ?>
	<tr>
      <th width="20%"><?php if($info['star']){ ?> <font color="red">*</font><?php } ?> <strong><?=$info['name']?></strong> <br />
	  <?=$info['tips']?>
	  </th>
      <td><?=$info['form']?> </td>
    </tr>
<?php
}
?>
	<tr>
      <th width="20%"><strong>状态</strong><br />
	  <?=$info['tips']?>
	  </th>
      <td>
	  <?php if($allow_manage){ ?>
	  <input type="radio" name="status" value="99" checked/> 发布
	  <?php } ?>
	  <input type="radio" name="status" value="3" <?=$allow_manage ? '' : 'checked'?>> 审核
	  <input type="radio" name="status" value="2"> 草稿
	  </td>
    </tr>
    <tr>
      <td></td>
      <td>
	  <input type="hidden" name="forward" value="<?=$forward?>">
	  <input type="submit" name="dosubmit" value=" 确定 ">
      &nbsp; <input type="button" name="preview" value=" 预览 " onclick="preview_content();">
	  &nbsp; <input type="reset" name="reset" value=" 清除 ">
	  </td>
    </tr>
</table>

<div class="jqmWindow">
<h5 class="title" style="cursor:move"><a href="#" class="jqmClose"><img src="images/close.gif" alt="" height="16px" width="16px" /></a>同时发布到其他栏目</h5>
<div id="protocol" style="height:300px;overflow:auto;">
<table cellpadding="0" cellspacing="1" class="table_list">
<caption>请选择栏目</caption>
<?=$categorys?>
<tr>
  <td></td><td><input type="button" value="确定" id="ok" onclick="$('.jqmWindow').hide();" style="width:60px"></td>
</tr>
</table>
</div>
</div>
</form>
<script LANGUAGE="javascript">
<!--
function preview_content()
{
	myform.action = "preview.php";
	myform.target = "_blank"; 
	myform.submit(); 
	myform.action = "?mod=<?=$mod?>&file=<?=$file?>&action=<?=$action?>&catid=<?=$catid?>&modelid=<?=$modelid?>";
	myform.target="_self";
}
$().ready(function() {
	$('form').checkForm(1);
	$('.jqmWindow').jqm({overlay: 0	}).jqDrag('.title');
	});

//-->
</script>
</body>
</html>