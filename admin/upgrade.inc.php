<?php
defined('IN_WSLM') or exit('Access Denied');

$upgrade = load('upgrade.class.php');

switch($action)
{
    case 'download':
        if($upgrade->download())
	    {
		    header('location:'.SITE_URL.'data/upgrade.php');
		}
		break;

    default :
        if($upgrade->check() == 1)
	    {
		    header('location:?mod=wslm&file=upgrade&action=download');
		}
		include admin_tpl('upgrade');
}
?>