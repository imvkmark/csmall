<?php
define('MOD_ROOT', substr(dirname(__FILE__), 0, -8));
$mod = 'pay';
require substr(MOD_ROOT, 0, -strlen($mod)).'/include/common.inc.php';
require_once MOD_ROOT.'/include/pay.func.php';
require_once WSLM_ROOT.'/include/form.class.php';
if(!$_userid) showmessage('请登陆', $MODULE['member']['url']."login.php?forward=".urlencode(URL));
$head['title'] = $WSLM['sitename'].'-财务中心';
$head['keywords'] = $WSLM['keywords'];
$head['description'] = $WSLM['description'];
?>