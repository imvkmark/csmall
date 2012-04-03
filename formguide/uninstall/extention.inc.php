<?php
defined('IN_WSLM') or exit('Access Denied');
$query = $db->query("SELECT tablename FROM ".DB_PRE."formguide");
while($r = $db->fetch_array($query))
{
	$db->query("DROP TABLE ".DB_PRE."$r[tablename]");
}
?>