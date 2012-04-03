<?php
error_reporting(E_ALL);
defined("IN_WSLM") or exit ("Access Denied");
define('MOD_ROOT', WSLM_ROOT . '/' . $mod);
require MOD_ROOT . '/include/functions.func.php';
if (!@include_once(MOD_ROOT . '/admin/' . $file . '.inc.php')) showmessage($LANG['illegal_operation']);
?>