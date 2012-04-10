<?php 
require './include/common.inc.php';
if (isset($_REQUEST['normal'])) {
	$normal = true;
	$type = $_REQUEST['type'];
	$proid = (int) $_REQUEST['proid'];
	if(isset($q)) $q = $search->strip($q);
	include template($mod, 'list');
} else {
	$types = $search->get_type();
	if(isset($q)) $q = $search->strip($q);

if($q)
{
	$order = isset($order) ? intval($order) : 0;
	$page = max(intval($page), 1);
	$search->set($M['titlelen'], $M['descriptionlen'], 'red');
	$type = safe_replace($type);
	$search->set_type($type);
	$q = safe_replace($q);
	$q = new_htmlspecialchars(strip_tags($q));
	$data = $search->q($q, $order, $page, $WSLM['search_pagesize']);
	$pages = $search->pages;
	$total = $search->total;
	$usedtime = usedtime();
	$template = 'list';
	$head['title'] = $q.'-'.$WSLM['sitename'];
	$head['keywords'] = $q.','.$WSLM['keywords'];
	$head['description'] = $q.','.$WSLM['description'];
}
else
{
	$template = 'index';
	$head['title'] = '搜索首页-'.$WSLM['sitename'];
	$head['keywords'] = $WSLM['keywords'];
	$head['description'] = $WSLM['description'];
}
include template($mod, $template);
}
?>