<?php defined('IN_WSLM') or exit('Access Denied'); ?><?php include template('member','header'); ?>
<script type="text/javascript" src="images/js/form.js"></script>
<script type="text/javascript" src="images/js/validator.js"></script>

<div id="main">
  <div id="left">
    <div id="treemenu">
      <h5>信息管理</h5>
      <ul>
        <li><a href="manage.php?action=add&catid=<?php echo $catid;?>">发布信息</a></li>
<?php if(is_array($STATUS)) foreach($STATUS AS $k => $name) { ?>
        <li><a href="manage.php?status=<?php echo $k;?>"><?php echo $name;?></a></li>
<?php } ?>
      </ul>
    </div>
    <ol>
      <li class="local"><a href="">返回网站首页</a></li>
      <li class="exit"><a href="<?php echo $MODULE['member']['url'];?>logout.php">退出登录</a></li>
    </ol>
  </div>
  <div id="right">

<p id="position"><strong>当前位置：</strong><a href="<?php echo $MODULE['member']['url'];?>">会员中心</a><a href="manage.php">信息管理</a><?php echo $position;?></p>
<div class="clear"></div>
<div class="clear"></div>
<?php if($action == 'add') { ?>
<form action="manage.php?action=<?php echo $action;?>&catid=<?php echo $catid;?>&modelid=<?php echo $modelid;?>" method="post" name="myform"  enctype="multipart/form-data">
<table cellpadding="0" cellspacing="1" class="table_form">
<caption>发布信息</caption>
    <?php if(is_array($forminfos)) foreach($forminfos AS $field => $info) { ?>
<tr> 
      <th width="20%"> <?php if($info['star']) { ?> <font color="red">*</font><?php } ?> <strong><?php echo $info['name'];?></strong><br />
  <?php echo $info['tips'];?>
  </th>
      <td><?php echo $info['form'];?> </td>
    </tr>
<?php } ?>
    <tr> 
      <td></td>
      <td> 
  <input type="hidden" name="forward" value="<?php echo $forward;?>"> 
  <input type="submit" name="dosubmit" value=" 确定 "> 
      <input type="reset" name="reset" value=" 清除 ">
  <input type="button" name="preview" value=" 预览 " onclick="preview_content();">
  </td>
    </tr>
</table>
</form>

<?php } elseif ($action == 'edit') { ?>
<form action="manage.php?action=<?php echo $action;?>&catid=<?php echo $catid;?>&modelid=<?php echo $modelid;?>&contentid=<?php echo $contentid;?>" method="post" name="myform"  enctype="multipart/form-data">
<table cellpadding="0" cellspacing="1" class="table_form">
<caption>修改信息</caption>
    <?php if(is_array($forminfos)) foreach($forminfos AS $field => $info) { ?>
<tr> 
      <th width="20%"><?php if($info['star']) { ?> <font color="red">*</font><?php } ?> <strong><?php echo $info['name'];?></strong><br />
  <?php echo $info['tips'];?>
  </th>
      <td><?php echo $info['form'];?> </td>
    </tr>
<?php } ?>
    <tr> 
      <td></td>
      <td> 
  <input type="hidden" name="forward" value="<?php echo $forward;?>"> 
  <input type="submit" name="dosubmit" value=" 确定 "> 
      <input type="reset" name="reset" value=" 清除 ">
  <input type="button" name="preview" value=" 预览 " onclick="preview_content();">
  </td>
    </tr>
</table>
</form>

<?php } elseif ($action == 'preview') { ?>

 <table cellpadding="0" cellspacing="1" class="table_form">
  <caption>预览信息</caption>
    <?php if(is_array($info)) foreach($info AS $k => $v) { ?>
<tr> 
      <th width="25%"><b><?php echo $fields[$k]['name'];?>：</b></th>
      <td><?php echo $v;?></td>
    </tr>
    <?php } ?>
</table>

<?php } else { ?>

<?php if(!$catid || $child) { ?>

<table cellpadding="0" cellspacing="1" class="table_list">
  <caption>信息管理</caption>
 <tr>
<th>栏目</th>
<th>信息数</th>
<th>管理操作</th>
 </tr>
 <?php echo $categorys;?>
</table>

<?php } else { ?>

<form name="myform" method="post" action="manage.php?action=delete" >
<table cellpadding="0" cellspacing="1" class="table_list">
  <caption>管理信息</caption>
<tr>
<?php if($status!=99) { ?>
    <th width="40">选中</th>
    <?php } ?>
<th width="45">ID</th>
<th>标题</th>
<th width="70">更新时间</th>
<th width="120">管理操作</th>
</tr>
    <?php if(is_array($data)) foreach($data AS $r) { ?>
<tr>
    <?php if($status!=99) { ?>
<td><input type="checkbox" name="contentid[]" value="<?php echo $r['contentid'];?>" id="content_<?php echo $r['contentid'];?>" /></td>
    <?php } ?>
<td><?php echo $r['contentid'];?></td>
<td class="align_left"><a href="<?php echo $r['url'];?>" target="_blank"><?php echo output::style($r['title'], $r['style']);?></a></td>
<td class="align_c"><?php echo date('Y-m-d',$r[updatetime]);?></td>
<td class="align_c">
<a href="manage.php?action=preview&contentid=<?php echo $r['contentid'];?>">预览</a> 
<?php if($status!=99) { ?>
| <a href="manage.php?action=edit&contentid=<?php echo $r['contentid'];?>">修改</a> | 
    <a href="javascript:if(confirm('确定要删除吗？')) location='manage.php?action=delete&contentid=<?php echo $r['contentid'];?>'">删除</a> 
<?php } else { ?>
    | <a href="<?php echo $MODULE['comment']['url'];?>?keyid=wslm-content-title-<?php echo $r['contentid'];?>&verify=<?php echo md5('wslm-content-title-'.$r[contentid].AUTH_KEY);?>">评论</a>
    <?php } ?>
    </td>
</tr>
    <?php } ?>
</table>
    <div class="button_box">
    <?php if($status!=99) { ?><input type="submit" name="button2" id="button" value="删除信息" /><?php } ?>
    </div>
</form>
<div id="pages"><?=$c->pages?></div>

<?php } ?>

<?php } ?>
  </div>
</div>
<script LANGUAGE="javascript">
<!--
function preview_content()
{
myform.action = "preview.php";
myform.target = "_blank"; 
myform.submit(); 
myform.action = "manage.php?action=<?php echo $action;?>&catid=<?php echo $catid;?>&modelid=<?php echo $modelid;?>&contentid=<?php echo $contentid;?>";
myform.target="_self";
}
$().ready(function() {
$('form').checkForm(1);
<?php if(is_array($member_detail)) foreach($member_detail AS $field => $detail) { ?>
$('#<?php echo $field;?>').val('<?php echo $detail;?>');
<?php } ?>
});
//-->
</script>
<?php include template('wslm','footer'); ?>