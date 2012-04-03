<?php
defined('IN_WSLM') or exit('Access Denied');

$files = glob(WSLM_ROOT.'data/datasource/*');
foreach($files as $k=>$v)
{
	$v = substr(basename($v), 7, -4);
	if($v) $tables[] = $v;
}
$tablenames = cache_read('wslm.php', WSLM_ROOT.'data/datasource/');
if(strtolower(CHARSET) != 'utf-8') $tablenames = str_charset('utf-8', CHARSET, $tablenames);

switch($action)
{
    case 'field':
		$fields = cache_read('wslm_'.$table.'.php', WSLM_ROOT.'data/datasource/');
		if(strtolower(CHARSET) != 'utf-8') $fields = str_charset('utf-8', CHARSET, $fields);
		include admin_tpl('datadict_field');
		break;

    default :
		include admin_tpl('datadict');
}
?>