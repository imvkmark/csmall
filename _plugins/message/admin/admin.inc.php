<?php
defined('IN_WSLM') or exit('Access Denied');
define('MOD_ROOT', WSLM_ROOT.''.$mod.'/');

require MOD_ROOT.'include/global.func.php';
require MOD_ROOT.'admin/include/message_admin.class.php';
$message_admin = new message_admin();
if(!is_a($member, 'member'))
{
	$member = new member();
}
?>