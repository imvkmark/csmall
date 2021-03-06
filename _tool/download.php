<?php 
require dirname(__FILE__).'/include/common.inc.php';

$wslm_auth_key = md5(AUTH_KEY.$_SERVER['HTTP_USER_AGENT']);
$a_k = wslm_auth($a_k, 'DECODE', $wslm_auth_key);
if(empty($a_k)) showmessage($LANG['illegal_parameters']);
unset($i,$m,$f,$t,$ip);
parse_str($a_k);

if(isset($i)) $downid = intval($i);
if(!isset($m)) showmessage($LANG['illegal_parameters']);
if(empty($f)) showmessage('地址失效');
if(!$i || $m<0) showmessage($LANG['illegal_parameters']);
if(!isset($t)) showmessage($LANG['illegal_parameters']);
if(!isset($ip)) showmessage($LANG['illegal_parameters']);
$starttime = intval($t);
if(preg_match('/(php|phtml|php3|php4|jsp|dll|asp|cer|asa|shtml|shtm|aspx|asax|cgi|fcgi|pl)(\.|$)/i',$f) || strpos($f, ":\\")!==FALSE || strpos($f,'..')!==FALSE) showmessage($LANG['illegal_parameters']);
$fileurl = trim($f);
if(!$downid || empty($fileurl) || !preg_match("/[0-9]{10}/", $starttime) || !preg_match("/[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}/", $ip) || $ip != IP) showmessage($LANG['illegal_parameters']);

$endtime = TIME - $starttime;
if($endtime > 3600) showmessage('地址失效');
if($s && !preg_match('/http:\/\//i',$s)) showmessage($LANG['illegal_parameters']);
if($m) $fileurl = trim($s).trim($fileurl);

require_once 'admin/content.class.php';
$c = new content();
$c->hits($downid);

if(strpos($fileurl, ':/'))//远程文件
{
	header("Location: $fileurl");
}
else//本地文件
{
	if($d == 0)
	{
		header("Location: ".SITE_URL.$fileurl);
	}
	else
	{
		$fileurl = file_exists($fileurl) ? stripslashes($fileurl) : WSLM_ROOT.$fileurl;//此处可能为物理路径
		$filename = basename($fileurl);
		if(preg_match("/^([\s\S]*?)([\x81-\xfe][\x40-\xfe])([\s\S]*?)/", $fileurl))//处理中文文件
		{
			$filename = str_replace(array("%5C", "%2F", "%3A"), array("\\", "/", ":"), urlencode($fileurl));
			$filename = urldecode(basename($filename));
		}
		$ext = fileext($filename);
		$filename = date('Ymd_his').random(3).'.'.$ext;
		file_down($fileurl, $filename);
	}
}
?>