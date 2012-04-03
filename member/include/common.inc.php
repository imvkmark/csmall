<?php
$mod = 'member';
define('MOD_ROOT', substr(dirname(__FILE__), 0, -7));
require_once substr(MOD_ROOT, 0, -1-strlen($mod)).'include/common.inc.php';
require_once MOD_ROOT.'include/global.func.php';
require WSLM_ROOT.'include/form.class.php';

if($WSLM['uc'])
{
	define("UC_DBHOST", $WSLM['uc_dbhost']) ;
	define("UC_DBUSER", $WSLM['uc_dbuser']) ;
	define("UC_DBPW", $WSLM['uc_dbpwd']) ;
	define("UC_DBNAME", $WSLM['uc_dbname']) ;
	define("UC_DBPRE", $WSLM['uc_dbpre']) ;
	define("UC_KEY", $WSLM['uc_key']) ;
	define('UC_APPID', $WSLM['uc_appid']) ;
	define("UC_API", $WSLM['uc_api']) ;
	define("UC_IP", $WSLM['uc_ip']) ;
	define("UC_DBTABLEPRE", $WSLM['uc_dbpre']);
	define("UC_CONNECT", 'mysql');
	define('API_RETURN_SUCCEED', 1);
    define('UC_DBCHARSET', $WSLM['uc_charset']); 
	define('API_UPDATECREDIT', 1);		//更新用户积分 开关
	define('API_GETCREDITSETTINGS', 1);	//向 UCenter 提供积分设置 开关
	define('API_UPDATECREDITSETTINGS', 1);	//更新应用积分设置 开关
}
$member = load('member.class.php', 'member', 'include');
require 'attachment.class.php';
$attachment = new attachment($mod);

$GROUP = cache_read('member_group.php');
$unitname = $M['paytype'] == 'amount' ? '元' : '点';
if($_userid)
{
	$_extend_group = $db->select("SELECT groupid FROM `".DB_PRE."member_group_extend` WHERE `userid`=$_userid");
}
$head['title'] = $M['name'];
$head['keywords'] = $LANG['member_center'];
$head['description'] = $LANG['member_center'];
?>