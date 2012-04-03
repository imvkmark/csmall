<?php 
require './include/common.inc.php';
$head['keywords'] = $M['name'];
$head['description'] = $head['title'] = $M['name'].' - '.$WSLM['sitename'];

include template('ask', 'browse');
?>