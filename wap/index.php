<?php
include '../include/common.inc.php';
include './include/global.func.php';
$lang = include './include/lang.inc.php';
if(preg_match('/(mozilla|m3gate|winwap|openwave)/i', $_SERVER['HTTP_USER_AGENT'])) 
{
	header('location:../');
}
wmlHeader($WSLM['sitename']);
if(preg_match('/([^a-z_]+)/i',$action)) exit;
$action = isset($action) && !empty($action) ? $action : 'index';
if($action)
{
	include './include/'.$action.'.inc.php';
}

$html =  CHARSET != 'utf-8' ? iconv(CHARSET, 'utf-8', $html) : $html;
echo str_replace('<br/>', "<br/>\n", $html);
wmlFooter();
?>