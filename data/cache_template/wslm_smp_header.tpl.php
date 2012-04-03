<?php defined('IN_WSLM') or exit('Access Denied'); ?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><?php echo $head['title'];?></title>
<meta content="<?php echo $WLSL['meta_keywords'];?>" name="keywords" />
<meta content="<?php echo $WLSL['meta_description'];?>" name="description" />
<meta name="Author" content="麦谷网络 www.zgweb.com" />
<meta name="copyright"content="麦谷网络0531-62320000 87155088" />
<!-- 栏目关键字关键词-->
<?php if($catid) { ?>
<?php $cus_file = "category_$catid.php"; ?>
<?php $cus_meta = cache_read($cus_file); ?>
<meta content="<?php echo $cus_meta['meta_keywords'];?>" name="keywords" />
<meta content="<?php echo $cus_meta['meta_description'];?>" name="description" />
<?php } ?>

<!-- topid 和 result判断 -->
<?php $topid = get_topid($catid); ?>
<?php if($topid == 0 && isset($result)): ?>
<?php $is_result = true; ?>
<?php elseif ($topid == 0): ?>
<?php $is_index = true; ?>
<?php endif; ?>

<base href="<?php echo SITE_URL;?>" />
<!-- *css styles -->
<link rel="stylesheet" type="text/css" href="images/css/reset.css" />
<link rel="stylesheet" type="text/css" href="images/css/style.css" />
<!-- #css styles -->
<!-- *script files -->
<script type="text/javascript" src="images/js/jquery.min-1.4.4.js"></script>
<script type="text/javascript" src="images/js/js.js"></script>
<script type="text/javascript" src="images/js/f_js.js"></script>
<script type="text/javascript" src="images/js/collection.js"></script>
<!-- 设置安全域 -->
<script type="text/javascript">
window.domain = location.host;
</script>
<!-- #script files -->
</head>
<body>