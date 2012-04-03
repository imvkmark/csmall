<?php
defined('IN_WSLM') or exit('Access Denied');

define('MOD_ROOT', WSLM_ROOT.$mod.'/');
require_once MOD_ROOT.'include/output.func.php';
$module = 'video';
$CATEGORY = subcat('video');
$modelid = $M['modelid'];
?>