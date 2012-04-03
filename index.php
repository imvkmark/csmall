<?php
require dirname(__FILE__).'/include/common.inc.php';
$head['title'] = $WSLM['sitename'].'_'.$WSLM['meta_title'];
$head['keywords'] = $WSLM['meta_keywords'];
$head['description'] = $WSLM['meta_description'];
header('Last-Modified: '.gmdate('D, d M Y H:i:s', TIME).' GMT');
header('Expires: '.gmdate('D, d M Y H:i:s', TIME+CACHE_PAGE_INDEX_TTL).' GMT');
header('Cache-Control: max-age='.CACHE_PAGE_INDEX_TTL.', must-revalidate');

include template('wslm', 'index');
cache_page(CACHE_PAGE_INDEX_TTL);
?>