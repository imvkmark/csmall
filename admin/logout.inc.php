<?php
defined('IN_WSLM') or exit('Access Denied');

require WSLM_ROOT.'member/include/member.class.php';
$member = new member();
$member->logout();
showmessage($LANG['logout_success'], SITE_URL);
?>