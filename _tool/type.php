<?php
require dirname(__FILE__).'/include/common.inc.php';

$typeid = intval($typeid);
if(!empty($typeid) && !isset($TYPE[$typeid]))
{
	showmessage('访问的类别不存在！');
}
elseif(isset($TYPE[$typeid]))
{
	$T = cache_read('type_'.$typeid.'.php');
	extract($T);
	$head['title'] = $T['name'].'_'.$WSLM['sitename'];
	$head['keywords'] = $T['name'];
	$head['description'] = strip_tags($description);
}
if(empty($template)) $template = 'type';
$head['title'] = '类别首页_'.$WSLM['sitename'];
$head['keywords'] = $WSLM['meta_keywords'];
$types = array();
foreach($TYPE AS $k=>$v)
{
	if($v['module'] != 'wslm') continue;
	$types[$k] = $v;
}
$TYPE = $types;
$ttl = CACHE_PAGE_LIST_TTL;
header('Last-Modified: '.gmdate('D, d M Y H:i:s', TIME).' GMT');
header('Expires: '.gmdate('D, d M Y H:i:s', TIME + $ttl).' GMT');
header('Cache-Control: max-age='.$ttl.', must-revalidate');
include template('wslm', $template);
cache_page($ttl);
?>