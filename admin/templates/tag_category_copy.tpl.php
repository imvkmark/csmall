<?php 
defined('IN_WSLM') or exit('Access Denied');
include admin_tpl('header');
?>
<script type="text/javascript">
function doCheck()
{
	if($('#tagname').val()=='')
	{
		alert('标签名称不能为空');
		$('#tagname').focus();
		return false;
	}
	return true;
}
var i = <?=array_search(end($var_name),$var_name)?> + 1;
function var_add()
{
	var data = '<div id="var'+i+'"><span style="width:150px"><input name="tag_config[var_description]['+i+']" type="text" size="18"></span><span style="width:100px"><input name="tag_config[var_name]['+i+']" type="text" size="10"> => </span><span style="width:120px"><input name="tag_config[var_value]['+i+']" type="text" size="15"></span> <span> <a href="###" onclick="var_del('+i+')">删除</a></span></div>';
	$('#var_define').append(data);
	i++;
	return true;
}
function var_del(i)
{
	$('#var'+i).remove();
	return true;
}

$().ready(function() {
	  $('form').checkForm(1);
	});
</script>
<body>
<form name="myform" method="post" action="?" >
<input name="mod" type="hidden" value="<?=$mod?>">
<input name="file" type="hidden" value="<?=$file?>">
<input name="action" type="hidden" value="update">
<input name="module" type="hidden" value="<?=$_GET['module']?>">
<input name="type" type="hidden" value="<?=$type?>">
<input type="hidden" name="isadd" value="1">
<input name="forward" type="hidden" value="<?=$forward?>">
<table cellpadding="0" cellspacing="1" class="table_form">
    <caption>复制<?=$types[$type]?>标签</caption>
    <tr> 
      <th width="30%"><font color="red">*</font> <strong>标签名称</strong><br/>可用中文，不得包含特殊字符 ' " $ { } ( ) \ / , ;</th>
      <td>
	  <input name="tagname" id="tagname" type="text" size="30" value="" require="true" datatype="require|ajax" url="?mod=<?=$mod?>&file=<?=$file?>&action=checktag" msg="标签名称必填|"><br/>
	  </td>
    </tr>
    <tr> 
      <th><strong>标签说明</strong><br/>例如：首页最新推荐产品，10篇</th>
      <td><input name="tag_config[introduce]" id="introduce" type="text" size="60" value="<?=$introduce?>"/></td>
    </tr>
    <tr> 
      <td class="tablerowhighlight" colspan=2 align="center"><strong>数据调用条件</strong></td>
    </tr>
	<tr> 
      <th><strong>所属模块</strong><br />
	  常用变量表示：<a href="###" onClick="javascript:$('#themodule').val('$mod')" style="color:blue">$mod</a>
	  </th>
      <td><input type="text" name="tag_config[module]" id="themodule" size="15" value="<?=$tag_config['module']?>" onBlur="$('#category').load('?mod=wslm&file=tag&action=ajax_category&module='+this.value);"> <?=form::select_module('select_module', '', '请选择', '', 'onchange="myform.themodule.value=this.value;$(\'#category\').load(\'?mod=wslm&file=tag&action=ajax_category&module=\'+this.value);"')?></td>
    </tr>
	<tr> 
      <th><strong>所属栏目ID</strong><br />
	  常用变量表示：<a href="###" onClick="javascript:$('#catid').val('$catid')" style="color:blue">$catid</a>
	  </th>
      <td><input type="text" name="tag_config[catid]" id="catid" size="15" value="<?=$catid?>"><span id="category"></span></td>
    </tr>
    <tr> 
      <td class="tablerowhighlight" colspan=2 align="center"><strong>数据显示方式</strong></td>
    </tr>
    <tr> 
      <th><strong>调用条数</strong></th>
      <td><input type="text" name="tag_config[number]" size="10" value="<?=$number?>"> 条</td>
    </tr>
    <tr> 
      <th><strong>标签模板</strong></th>
      <td><?=form::select_template('wslm', 'tag_config[template]', 'template', $template, '', 'tag_category')?>&nbsp;<input type="button" value="修改选中模板" title="修改选中模板" onClick="location.href='?mod=wslm&file=template&action=edit&template='+ $('#template').val()+'&module=<?=$mod?>&forward=<?=urlencode(URL)?>'"></td>
    </tr>
    <tr> 
      <th><strong>自定义变量</strong>（<a href="###" onClick="javascript:var_add();" style="color:red">+</a>）</th>
      <td>
	  <div id="var_define">
	  <div id="var_define_head"><span style="width:150px"><strong>变量描述</strong></span><span style="width:100px"><strong>变量名</strong></span><span style="width:150px"><strong>变量值</strong></span></div>
	  <?php foreach($var_name as $k=>$v)
	  {
	  ?>
	  <div id="var<?=$k?>"><span style="width:150px"><input name="tag_config[var_description][<?=$k?>]" type="text" size="18" value="<?=$var_description[$k]?>"></span><span style="width:100px"><input name="tag_config[var_name][<?=$k?>]" type="text" size="10" value="<?=$var_name[$k]?>"> => </span><span style="width:120px"><input name="tag_config[var_value][<?=$k?>]" type="text" size="15" value="<?=$var_value[$k]?>"></span><span> <a href="###" onClick="var_del(1)">删除</a><span></div>
      <?php 
	  } 
	  ?>
	  </div>
	  </td>
    </tr>
    <tr>
      <td></td>
      <td>
<input type="submit" name="dosubmit" value=" 保存 " onClick="$('#action').val('update');">
&nbsp;
<input type="submit" name="preview" value=" 预览 " onClick="$('#action').val('preview');">
     </td>
    </tr>
</table>
</form>
</body>
</html>