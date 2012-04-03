<?php 
defined('IN_WSLM') or exit('Access Denied');

if(!$forward) $forward = HTTP_REFERER ? HTTP_REFERER : SITE_URL;
$passport_key = $WSLM['passport_key'];

$arr_member = $member->get($userid, '*', 1);
if(strpos($WSLM['passport_url'], ',') !== FALSE)
{
	$clienturl = explode(',', $WSLM['passport_url']);
	$jumpurl = array_shift($clienturl);
	$arr_member['url'] = implode(',', $clienturl);
}
else
{
	$jumpurl = $WSLM['passport_url'];
}

$member_encode = '';

foreach($arr_member as $key=>$val)
{
	$userdb_encode .= $userdb_encode ? "&$key=$val" : "$key=$val";
}
$userdb_encode .= '&time='.TIME.'&cktime='.$cookietime;

$auth = wslm_auth($userdb_encode, 'ENCODE', $WSLM['passport_key']);
if($action == 'login')
{
	
	$verify = md5('login'.$auth.$forward.$WSLM['passport_key']);
	$url = $jumpurl.'member/api/passport_client.php?action=login&userdb='.urlencode($auth).'&forward='.urlencode($forward).'&verify='.$verify;
}
elseif($action == 'logout')
{
	$verify = md5('logout'.$auth.$forward.$WSLM['passport_key']);
	$url = $jumpurl.'member/api/passport_client.php?action=logout&userdb='.urlencode($auth).'&forward='.urlencode($forward).'&verify='.$verify;
}
?>