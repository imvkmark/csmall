<?php defined('IN_WSLM') or exit('Access Denied'); ?><!DOCTYPE HTML>
<html lang="en-US">
<head>
    <meta charset="UTF-8">
    <meta content="<?php echo $head['keywords'];?>" name="keywords" />
<meta content="<?php echo $head['description'];?>" name="description" />
<meta name="Author" content="麦谷网络 www.zgweb.com" />
<meta name="copyright"content="麦谷网络0531-62320000 87155088" />
<!-- 栏目关键字关键词-->
<?php if($catid) { ?>
<?php $cus_file = "category_$catid.php"; ?>
<?php $cus_meta = cache_read($cus_file); ?>
<meta content="<?php echo $cus_meta['meta_keywords'];?>" name="keywords" />
<meta content="<?php echo $cus_meta['meta_description'];?>" name="description" />
<?php } ?>
    <title><?php echo $head['title'];?></title>
    <!-- topid 和 result判断 -->
    <?php $topid = get_topid($catid); ?>
    <?php if($topid == 0 && isset($result)): ?>
        <?php $is_result = true; ?>
    <?php elseif ($topid == 0): ?>
        <?php $is_index = true; ?>
    <?php endif; ?>
    <!-- end topid and result 判断 -->
    <link rel="stylesheet" type="text/css" href="<?php echo CSS_PATH;?>yui3reset.css" media="all">
    <link rel="stylesheet" type="text/css" href="<?php echo CSS_PATH;?>yaml/core/base.css" media="all">
    <link rel="stylesheet/less" type="text/css" href="<?php echo SKIN_PATH;?>css/common.less">
    <?php if(defined('TPL_INDEX')) { ?>
    <link rel="stylesheet/less" type="text/css" href="<?php echo SKIN_PATH;?>css/index.less">
    <?php } ?>
    <?php if(defined('TPL_CATEGORY')) { ?>
    <link rel="stylesheet/less" type="text/css" href="<?php echo SKIN_PATH;?>css/category.less">
    <?php } ?>
    <?php if(defined('TPL_LIST')) { ?>
    <link rel="stylesheet/less" type="text/css" href="<?php echo SKIN_PATH;?>css/list.less">
    <?php } ?>
    <?php if(defined('TPL_SHOW')) { ?>
    <link rel="stylesheet/less" type="text/css" href="<?php echo SKIN_PATH;?>css/show.less">
    <?php } ?>
    <script type="text/javascript" src="<?php echo JS_PATH;?>jquery-1.7.1.min.js"></script>
    <script type="text/javascript" src="<?php echo JS_PATH;?>add-ons/jquery.effects.core.js"></script>
    <script type="text/javascript" src="<?php echo JS_PATH;?>add-ons/jquery.cycle.all.js"></script>
    <script type="text/javascript" src="<?php echo JS_PATH;?>add-ons/jquery.bgpos.js"></script>
    <script type="text/javascript" src="<?php echo JS_PATH;?>less-1.3.0.min.js"></script>
    <script type="text/javascript" src="<?php echo SKIN_PATH;?>js/affect.js"></script>
    <!--[if lte IE 7]>
    <link href="<?php echo CSS_PATH;?>yaml/core/iehacks.css" rel="stylesheet" type="text/css" />
    <![endif]-->

    <!--[if lt IE 9]>
    <script src="<?php echo JS_PATH;?>html5.js"></script>
    <link href="<?php echo SKIN_PATH;?>css/iehacks.css" rel="stylesheet" type="text/css" />
    <![endif]-->
    <!-- login area for js -->
<script type="text/javascript">
window.domain = location.host;
</script>
<!-- end for login area -->
</head>
<body>
    <div class="ym-wrapper">
        <div class="ym-wbox">
            <!-- header start -->
            <div class="header">
                <div class="logo">
                    <a href="<?php echo SITE_URL;?>" title="<?php echo $WLSL['sitename'];?>">
                        <img src="<?php echo SKIN_PATH;?>images/insert/logo.jpg" alt="" />
                    </a>
                </div>
                <div id="nav" class="nav">
                    <ul>
                        <li class="hover"><a class="s-nav-us" href="" title=""></a><span class="s-nav-line"></span></li>
                        <li><a class="s-nav-news" href="" title=""></a><span class="s-nav-line"></span></li>
                        <li><a class="s-nav-ser" href="" title=""></a><span class="s-nav-line"></span></li>
                        <li><a class="s-nav-culture" href="" title=""></a><span class="s-nav-line"></span></li>
                        <li><a class="s-nav-products" href="" title=""></a><span class="s-nav-line"></span></li>
                        <li><a class="s-nav-case" href="" title=""></a><span class="s-nav-line"></span></li>
                        <li><a class="s-nav-invest" href="" title=""></a><span class="s-nav-line"></span></li>
                        <li><a class="s-nav-contact" href="" title=""></a></li>
                    </ul>
                </div>
                <div class="tel">
                	<?php echo block_edit('tel',1);?>
                </div>
            </div>
            <!-- header end -->