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
<table cellpadding="0" cellspacing="1" class="table_form">
  <caption>文件上传</caption>
  </tr>
<form name="upload" method="post" action="<?php echo $M['url'];?>upload_field.php" enctype="multipart/form-data">
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
 </td>
   </tr>
  <tr>
     <td>
<script>
if(window.opener.myform.<?=$uploadtext?>.value!="")
{
upload.oldname.value = window.opener.myform.<?=$uploadtext?>.value;
upload.oldaid.value = window.opener.myform.<?=$uploadtext?>_aid.value;
}
</script>
 </td>
   </tr>
</form>
</table>

</body>
</html>