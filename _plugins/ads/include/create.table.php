<?php
defined('IN_WSLM') or exit('Access Denied');
$sql = "CREATE TABLE IF NOT EXISTS `".DB_PRE."ads_".$year."` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `adsid` mediumint(8) unsigned NOT NULL default '0',
  `username` char(20) NOT NULL,
  `area` char(40) NOT NULL,
  `ip` char(15) NOT NULL,
  `referer` char(120) NOT NULL,
  `clicktime` int(10) unsigned NOT NULL default '0',
  `type` tinyint(1) unsigned NOT NULL default '1',
  PRIMARY KEY  (`id`),
  KEY `adsid` (`adsid`,`type`,`ip`)
) ENGINE=MyISAM;";
if($db->version() > '4.1' && DB_CHARSET)
{
	$sql = preg_replace("/ENGINE=(InnoDB|MyISAM|MEMORY)( DEFAULT CHARSET=[^; ]+)?/", "ENGINE=\\1 DEFAULT CHARSET=".DB_CHARSET,$sql);
}
$db->query($sql);
?>