INSERT INTO `wslm_module` (`module`, `name`, `path`, `url`, `iscore`, `version`, `author`, `site`, `email`, `description`, `license`, `faq`, `tagtypes`, `setting`, `listorder`, `disabled`, `publishdate`, `installdate`, `updatedate`) VALUES 
('space', '个人空间', 'space/', '', 0, '1.0.0.0', 'Wslm Team', 'http://www.wslm.cn/', 'wslm@163.com', '', '', '', '', '', 0, 0, '2008-10-28', '2008-10-28', '2008-10-28');

DROP TABLE IF EXISTS `wslm_space`;
CREATE TABLE `wslm_space` (
  `userid` mediumint(8) unsigned NOT NULL,
  `spacename` char(30) NOT NULL,
  `blockid` char(200) NOT NULL,
  UNIQUE KEY `userid` (`userid`)
) ENGINE=MyISAM;

DROP TABLE IF EXISTS `wslm_space_api`;
CREATE TABLE IF NOT EXISTS `wslm_space_api` (
  `apiid` smallint(5) unsigned NOT NULL auto_increment,
  `module` varchar(15) NOT NULL,
  `name` varchar(50) NOT NULL,
  `url` varchar(100) NOT NULL,
  `template` varchar(15) NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL default '0',
  `disable` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`apiid`)
) ENGINE=MyISAM;

INSERT INTO `wslm_space_api` (`module`, `name`, `url`, `template`, `listorder`, `disable`) VALUES ('wslm', '文章', 'api/space.api.php', '', 0, 0);
INSERT INTO `wslm_space_api` (`module`, `name`, `url`, `template`, `listorder`, `disable`) VALUES ('wslm', '问吧', 'ask/api/space.api.php', '', 0, 0);
