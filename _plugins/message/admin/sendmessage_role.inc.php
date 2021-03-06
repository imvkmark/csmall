<?php
defined('IN_WSLM') or exit('Access Denied');
if(!class_exists('member'))
{
	require WSLM_ROOT.'member/include/member.class.php';
}
if(!class_exists(sendmail))
{
	$mail = load('sendmail.class.php');
}
$member = new member();
require 'admin/admin.class.php';
$admin = new admin();

if(!$forward) $forward = HTTP_REFERER;

if ($dosubmit)
{
	if(!$pagesize) $pagesize = $sendnumber ? $sendnumber: $WSLM['pagesize'];
	$page = max(intval($page), 1);
	$offset = $pagesize*($page-1);
	$total = $admin->count_admin(" roleid='$roleid'");
	$pages = ceil($total/$pagesize);
	$arr_user = $admin->listadmin(" roleid='$roleid'", $order = 'userid', $page, $pagesize);
	
	foreach ($arr_user as $touser)
	{
		$touserid = $touser['userid'];
		if(!$message_admin->send_new($touserid, $_userid, $subject, $content))
		{
			showmessage($message_admin->msg(), $forward);
		}
		$memberinfo = array('userid'=>$touserid, 'message'=>1);
		$member->edit($memberinfo);
		if($send) $mail->send($touser['email'], $subject, $content, $_email);
	}
	
	if($pages > $page)
	{
		$page++;
		$forward = "?mod=$mod&file=$file&action=$action&name=$name&roleid=$roleid&dosubmit=1&subject=$subject&content=$content&&page=$page&pagesize=pagesize&total=$total&type=role";
		showmessage('开始发送短消息', $forward);
	}
	else
	{
		$forward = "?mod=$mod&file=$file&action=manage";
		showmessage($LANG['message_send_successful'], $forward);
	}
}
else
{

	$role_group = cache_read('role.php');
	if(!isset($type)) $type = 'group';
	include admin_tpl('sendmessage_role');
}
?>