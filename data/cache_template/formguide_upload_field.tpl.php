<?php defined('IN_WSLM') or exit('Access Denied'); ?><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>文件上传</title>
<base href="<?php echo SITE_URL;?>" />
<link href="admin/skin/system.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="data/config.js"></script>
<script type="text/javaScript" src="images/js/jquery.min.js"></script>
<script language="JavaScript" src="images/js/css.js"></script>
<script type="text/javaScript" src="images/js/common.js"></script>
</head>
<body>
<script type="text/javascript">
function doCheck() 
{
if(upload.uploadfile.value == '') {
alert('请选择文件!');
return false;
}
return true;
}

function previewimage()
{
if(upload.<?php echo $uploadtext;?>.value) $("#previewpic").attr("src", upload.<?php echo $uploadtext;?>.value);
}
</script>
<form name="upload" method="post" action="<?php echo $M['url'];?>upload_field.php" enctype="multipart/form-data" onSubmit="return doCheck();">
<table cellpadding="2" cellspacing="1" class="table_form">
  <tr>
    <th>图片上传</th>
  </tr>
  <tr>
     <td  height="30">
         <input type="hidden" name="formid" value="<?php echo $formid;?>">
         <input type="hidden" name="fieldid" value="<?php echo $fieldid;?>">
             <input name="<?php echo $uploadtext;?>" type="file" size="15" onChange="previewimage()">
             <input type="hidden" name="oldname">
             <input type="hidden" name="uploadtext" value="<?php echo $uploadtext;?>">
             <input type="hidden" name="rename" value="<?php echo $rename;?>">
             <input type="hidden" name="MAX_FILE_SIZE" value="<?php echo $upload_maxsize;?>"> 
             <input type="submit" name="dosubmit" value=" 上传 ">
 </td>
   </tr>
  <tr>
     <td  height="30">
 允许上传类型：<?php echo $upload_allowext;?><br />
 允许上传大小：<?php echo $upload_maxsize;?><br />
 缩略图大小：宽 <input type="text" name="width" value="<?php echo $thumb_width;?>" size="3"> px，高 <input type="text" name="height" value="<?php echo $thumb_height;?>" size="3"> px
 </td>
   </tr>
  <tr>
     <td>
<img id="previewpic" onload="setpicWH(this,300,300)" src="images/nopic.gif">
<script type="text/javascript">
if(window.opener.myform.<?php echo $uploadtext;?>.value)
{
$("#previewpic").attr("src", window.opener.myform.<?php echo $uploadtext;?>.value); 
}
else
{
$("#previewpic").attr("src","images/nopic.gif"); 
}
</script>
 </td>
   </tr>
</table>
</form>

</body>
</html>