<?php
defined('IN_WSLM') or exit('Access Denied');
if($dosubmit)
{
	$head['title'] = '网站地图 - '.$WSLM['sitename'];
	$head['keywords'] = $WSLM['sitename'];
	ob_start();
	include template('wslm', 'sitemap');
	$file = WSLM_ROOT.'sitemap.html';
	createhtml($file);
	showmessage('更新完成',$forward);
}
else
{
	include admin_tpl('sitemap');
}
?>