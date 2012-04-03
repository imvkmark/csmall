<?php
defined('IN_WSLM') or exit('Access Denied');

define('MOD_ROOT',WSLM_ROOT."/".$mod);
if(!@include_once(MOD_ROOT."/admin/".$file.".inc.php")) showmessage($LANG['illegal_operation']);
?>