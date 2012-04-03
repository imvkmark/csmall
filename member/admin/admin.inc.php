<?php
defined('IN_WSLM') or exit('Access Denied');
require_once WSLM_ROOT.'languages/zh-cn/member_admin.lang.php';

define('MOD_ROOT', WSLM_ROOT.''.$mod.'/');
require MOD_ROOT.'include/global.func.php';
$_extend_group = $db->select("SELECT groupid FROM `".DB_PRE."member_group_extend` WHERE `userid`=$_userid");
$arr_founder = array();
$arr_founder = explode(',', ADMIN_FOUNDERS);
?>
