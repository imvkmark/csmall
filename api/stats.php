<?php
require '../include/common.inc.php';
if ($_username) {
	echo '<a href="member/filedown.php">用户中心</a><a href="member/logout.php">退出登录</a>';
} else {
	echo '<a href="member/login.php">登录</a><a href="member/register.php">注册</a>';
}
?>