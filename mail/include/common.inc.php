<?php
define('MOD_ROOT', substr(dirname(__FILE__), 0, -8));
$mod = 'mail';
require substr(MOD_ROOT, 0, -strlen($mod)).'include/common.inc.php';
require MOD_ROOT.'/include/global.func.php';

$head['title'] = $WSLM['sitename'].'-邮箱订阅';
$head['keywords'] = $WSLM['keywords'];
$head['description'] = $WSLM['description'];
?>