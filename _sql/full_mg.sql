# --------------------------------------------------------
# Host:                         127.0.0.1
# Server version:               5.5.20-log
# Server OS:                    Win32
# HeidiSQL version:             6.0.0.3603
# Date/time:                    2012-03-27 19:27:29
# --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

# Dumping structure for table mg_wlsm.mg_admin
DROP TABLE IF EXISTS `mg_admin`;
CREATE TABLE IF NOT EXISTS `mg_admin` (
  `userid` mediumint(8) unsigned NOT NULL,
  `username` char(20) NOT NULL,
  `allowmultilogin` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `alloweditpassword` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `editpasswordnextlogin` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# Dumping data for table mg_wlsm.mg_admin: 1 rows
DELETE FROM `mg_admin`;
/*!40000 ALTER TABLE `mg_admin` DISABLE KEYS */;
INSERT INTO `mg_admin` (`userid`, `username`, `allowmultilogin`, `alloweditpassword`, `editpasswordnextlogin`, `disabled`) VALUES
	(1, 'admin', 1, 1, 0, 0);
/*!40000 ALTER TABLE `mg_admin` ENABLE KEYS */;


# Dumping structure for table mg_wlsm.mg_admin_role
DROP TABLE IF EXISTS `mg_admin_role`;
CREATE TABLE IF NOT EXISTS `mg_admin_role` (
  `userid` mediumint(8) unsigned NOT NULL,
  `roleid` tinyint(3) unsigned NOT NULL,
  KEY `userid` (`userid`),
  KEY `roleid` (`roleid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# Dumping data for table mg_wlsm.mg_admin_role: 1 rows
DELETE FROM `mg_admin_role`;
/*!40000 ALTER TABLE `mg_admin_role` DISABLE KEYS */;
INSERT INTO `mg_admin_role` (`userid`, `roleid`) VALUES
	(1, 1);
/*!40000 ALTER TABLE `mg_admin_role` ENABLE KEYS */;


# Dumping structure for table mg_wlsm.mg_admin_role_priv
DROP TABLE IF EXISTS `mg_admin_role_priv`;
CREATE TABLE IF NOT EXISTS `mg_admin_role_priv` (
  `roleid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `field` char(15) NOT NULL,
  `value` char(15) NOT NULL,
  `priv` char(15) NOT NULL,
  PRIMARY KEY (`roleid`,`field`,`value`,`priv`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# Dumping data for table mg_wlsm.mg_admin_role_priv: 1 rows
DELETE FROM `mg_admin_role_priv`;
/*!40000 ALTER TABLE `mg_admin_role_priv` DISABLE KEYS */;
INSERT INTO `mg_admin_role_priv` (`roleid`, `field`, `value`, `priv`) VALUES
	(1, 'processid', '8', '');
/*!40000 ALTER TABLE `mg_admin_role_priv` ENABLE KEYS */;


# Dumping structure for table mg_wlsm.mg_area
DROP TABLE IF EXISTS `mg_area`;
CREATE TABLE IF NOT EXISTS `mg_area` (
  `areaid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `style` varchar(35) NOT NULL,
  `parentid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `arrparentid` varchar(255) NOT NULL DEFAULT '',
  `child` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `arrchildid` mediumtext NOT NULL,
  `template` varchar(50) NOT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`areaid`),
  KEY `parentid` (`parentid`,`listorder`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

# Dumping data for table mg_wlsm.mg_area: 2 rows
DELETE FROM `mg_area`;
/*!40000 ALTER TABLE `mg_area` DISABLE KEYS */;
INSERT INTO `mg_area` (`areaid`, `name`, `style`, `parentid`, `arrparentid`, `child`, `arrchildid`, `template`, `listorder`, `hits`) VALUES
	(1, '北京', '', 0, '0', 0, '1', '', 1, 0),
	(2, '上海', '', 0, '0', 0, '2', '', 2, 0);
/*!40000 ALTER TABLE `mg_area` ENABLE KEYS */;


# Dumping structure for table mg_wlsm.mg_attachment
DROP TABLE IF EXISTS `mg_attachment`;
CREATE TABLE IF NOT EXISTS `mg_attachment` (
  `aid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `module` char(15) NOT NULL,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `contentid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field` char(20) NOT NULL,
  `filename` char(50) NOT NULL,
  `filepath` char(200) NOT NULL,
  `filetype` char(30) NOT NULL,
  `filesize` int(10) unsigned NOT NULL DEFAULT '0',
  `fileext` char(10) NOT NULL,
  `description` char(50) NOT NULL,
  `isimage` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isthumb` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `downloads` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `uploadtime` int(10) unsigned NOT NULL DEFAULT '0',
  `uploadip` char(15) NOT NULL,
  PRIMARY KEY (`aid`),
  KEY `contentid` (`contentid`,`field`,`listorder`)
) ENGINE=MyISAM AUTO_INCREMENT=99 DEFAULT CHARSET=utf8;

# Dumping data for table mg_wlsm.mg_attachment: 98 rows
DELETE FROM `mg_attachment`;
/*!40000 ALTER TABLE `mg_attachment` DISABLE KEYS */;
INSERT INTO `mg_attachment` (`aid`, `module`, `catid`, `contentid`, `field`, `filename`, `filepath`, `filetype`, `filesize`, `fileext`, `description`, `isimage`, `isthumb`, `downloads`, `listorder`, `userid`, `uploadtime`, `uploadip`) VALUES
	(1, 'wslm', 0, 1, 'thumb', 'banner_01.jpg', '2012/0325/20120325094805455.jpg', 'image/jpeg', 18770, 'jpg', '', 1, 0, 0, 0, 1, 1332683285, '127.0.0.1'),
	(2, 'wslm', 0, 3, 'thumb', 'banner_02.jpg', '2012/0325/20120325101107508.jpg', 'image/pjpeg', 29027, 'jpg', '', 1, 0, 0, 0, 1, 1332684667, '127.0.0.1'),
	(3, 'wslm', 0, 4, 'thumb', 'banner_03.jpg', '2012/0325/20120325101141235.jpg', 'image/jpeg', 32134, 'jpg', '', 1, 0, 0, 0, 1, 1332684701, '127.0.0.1'),
	(4, 'wslm', 0, 5, 'thumb', 'banner_04.jpg', '2012/0325/20120325101214319.jpg', 'image/jpeg', 18583, 'jpg', '', 1, 0, 0, 0, 1, 1332684734, '127.0.0.1'),
	(5, 'wslm', 0, 6, 'thumb', 'index_cycle_small.jpg', '2012/0325/20120325101244282.jpg', 'image/jpeg', 40717, 'jpg', '', 1, 0, 0, 0, 1, 1332684764, '127.0.0.1'),
	(6, 'wslm', 0, 7, 'thumb', 'index_cycle_small2.png', '2012/0325/20120325101354774.png', 'image/png', 98743, 'png', '', 1, 0, 0, 0, 1, 1332684834, '127.0.0.1'),
	(7, 'wslm', 0, 8, 'thumb', 'banner_05.jpg', '2012/0325/20120325101628323.jpg', 'image/jpeg', 21174, 'jpg', '', 1, 0, 0, 0, 1, 1332684988, '127.0.0.1'),
	(8, 'wslm', 0, 9, 'thumb', 'banner_06.jpg', '2012/0325/20120325101723670.jpg', 'image/jpeg', 50265, 'jpg', '', 1, 0, 0, 0, 1, 1332685043, '127.0.0.1'),
	(9, 'wslm', 0, 10, 'thumb', 'index_cycle_big.jpg', '2012/0325/20120325101839791.jpg', 'image/jpeg', 37014, 'jpg', '', 1, 0, 0, 0, 1, 1332685119, '127.0.0.1'),
	(10, 'wslm', 0, 11, 'thumb', 'banner_07.jpg', '2012/0325/20120325101905327.jpg', 'image/jpeg', 23896, 'jpg', '', 1, 0, 0, 0, 1, 1332685145, '127.0.0.1'),
	(11, 'wslm', 0, 12, 'thumb', 'banner_08.jpg', '2012/0325/20120325101948969.jpg', 'image/jpeg', 8321, 'jpg', '', 1, 0, 0, 0, 1, 1332685187, '127.0.0.1'),
	(12, 'wslm', 0, 13, 'thumb', 'banner_08.jpg', '2012/0325/20120325102200455.jpg', 'image/jpeg', 8321, 'jpg', '', 1, 0, 0, 0, 1, 1332685320, '127.0.0.1'),
	(13, 'wslm', 0, 14, 'thumb', 'banner_09.jpg', '2012/0325/20120325103244178.jpg', 'image/jpeg', 19032, 'jpg', '', 1, 0, 0, 0, 1, 1332685964, '127.0.0.1'),
	(14, 'wslm', 0, 15, 'thumb', 'banner_10.jpg', '2012/0325/20120325104957983.jpg', 'image/jpeg', 29684, 'jpg', '', 1, 0, 0, 0, 1, 1332686997, '127.0.0.1'),
	(15, 'wslm', 0, 16, 'thumb', 'banner_11.jpg', '2012/0325/20120325105140322.jpg', 'image/jpeg', 14177, 'jpg', '', 1, 0, 0, 0, 1, 1332687100, '127.0.0.1'),
	(16, 'wslm', 0, 17, 'thumb', 'banner_12.jpg', '2012/0325/20120325105202940.jpg', 'image/jpeg', 13083, 'jpg', '', 1, 0, 0, 0, 1, 1332687121, '127.0.0.1'),
	(17, 'wslm', 0, 0, 'thumb', 'banner_10.jpg', '2012/0325/20120325105421586.jpg', 'image/jpeg', 29684, 'jpg', '', 1, 0, 0, 0, 1, 1332687261, '127.0.0.1'),
	(18, 'wslm', 0, 0, 'thumb', 'banner_10.jpg', '2012/0325/20120325105619152.jpg', 'image/jpeg', 29684, 'jpg', '', 1, 0, 0, 0, 1, 1332687379, '127.0.0.1'),
	(19, 'wslm', 0, 15, 'thumb', 'banner_10.jpg', '2012/0325/20120325105735724.jpg', 'image/jpeg', 29684, 'jpg', '', 1, 0, 0, 0, 1, 1332687455, '127.0.0.1'),
	(20, 'wslm', 15, 18, 'content', '20120326093042418.jpg', '2012/0326/20120326093042418.jpg', '', 104031, 'jpg', '', 1, 0, 0, 0, 1, 1332725441, '127.0.0.1'),
	(21, 'wslm', 15, 18, 'content', '20120326093042716.jpg', '2012/0326/20120326093042716.jpg', '', 109059, 'jpg', '', 1, 0, 0, 0, 1, 1332725441, '127.0.0.1'),
	(22, 'wslm', 15, 18, 'content', '20120326093045893.jpg', '2012/0326/20120326093045893.jpg', '', 94793, 'jpg', '', 1, 0, 0, 0, 1, 1332725441, '127.0.0.1'),
	(23, 'wslm', 15, 18, 'content', '20120326093045414.jpg', '2012/0326/20120326093045414.jpg', '', 111692, 'jpg', '', 1, 0, 0, 0, 1, 1332725441, '127.0.0.1'),
	(24, 'wslm', 15, 18, 'content', '20120326093050770.jpg', '2012/0326/20120326093050770.jpg', '', 105835, 'jpg', '', 1, 0, 0, 0, 1, 1332725441, '127.0.0.1'),
	(25, 'wslm', 15, 18, 'content', '20120326093051653.jpg', '2012/0326/20120326093051653.jpg', '', 138829, 'jpg', '', 1, 0, 0, 0, 1, 1332725441, '127.0.0.1'),
	(26, 'wslm', 0, 27, 'thumb', 'plan_01.jpg', '2012/0326/20120326095712599.jpg', 'image/jpeg', 3505, 'jpg', '', 1, 0, 0, 0, 1, 1332727032, '127.0.0.1'),
	(27, 'wslm', 0, 27, 'background', 'class_12.jpg', '2012/0326/20120326095733791.jpg', 'image/jpeg', 11655, 'jpg', '', 1, 0, 0, 0, 1, 1332727053, '127.0.0.1'),
	(28, 'wslm', 0, 28, 'thumb', 'plan_02.jpg', '2012/0326/20120326095930804.jpg', 'image/jpeg', 3505, 'jpg', '', 1, 0, 0, 0, 1, 1332727170, '127.0.0.1'),
	(29, 'wslm', 0, 29, 'background', 'plan_03.jpg', '2012/0326/20120326100022136.jpg', 'image/jpeg', 4688, 'jpg', '', 1, 0, 0, 0, 1, 1332727222, '127.0.0.1'),
	(30, 'wslm', 0, 30, 'background', 'plan_04.jpg', '2012/0326/20120326100050514.jpg', 'image/jpeg', 2967, 'jpg', '', 1, 0, 0, 0, 1, 1332727250, '127.0.0.1'),
	(31, 'wslm', 0, 31, 'background', 'plan_05.jpg', '2012/0326/20120326100114719.jpg', 'image/jpeg', 4598, 'jpg', '', 1, 0, 0, 0, 1, 1332727274, '127.0.0.1'),
	(32, 'wslm', 0, 32, 'background', 'plan_06.jpg', '2012/0326/20120326100141288.jpg', 'image/jpeg', 4427, 'jpg', '', 1, 0, 0, 0, 1, 1332727301, '127.0.0.1'),
	(33, 'wslm', 0, 33, 'background', 'plan_07.jpg', '2012/0326/20120326100231958.jpg', 'image/jpeg', 4135, 'jpg', '', 1, 0, 0, 0, 1, 1332727351, '127.0.0.1'),
	(34, 'wslm', 0, 34, 'background', 'plan_08.jpg', '2012/0326/20120326100301117.jpg', 'image/jpeg', 4513, 'jpg', '', 1, 0, 0, 0, 1, 1332727381, '127.0.0.1'),
	(35, 'wslm', 0, 0, 'uploadfile', 'tel.jpg', '2012/0326/20120326102706440.jpg', 'image/jpeg', 3315, 'jpg', '', 1, 0, 0, 0, 1, 1332728826, '127.0.0.1'),
	(36, 'wslm', 0, 0, 'uploadfile', 'QQ截图20120326102910.png', '2012/0326/20120326103030436.png', 'image/png', 2957, 'png', '', 1, 0, 0, 0, 1, 1332729030, '127.0.0.1'),
	(37, 'wslm', 0, 0, 'uploadfile', 'QQ截图20120326102922.png', '2012/0326/20120326103253564.png', 'image/png', 18470, 'png', '', 1, 0, 0, 0, 1, 1332729173, '127.0.0.1'),
	(38, 'wslm', 0, 0, 'uploadfile', '85026247917.jpg', '2012/0326/20120326111515769.jpg', 'image/jpeg', 86373, 'jpg', '', 1, 0, 0, 0, 1, 1332731715, '127.0.0.1'),
	(39, 'wslm', 0, 0, 'uploadfile', '85026247917.jpg', '2012/0326/20120326112118541.jpg', 'image/jpeg', 86373, 'jpg', '', 1, 0, 0, 0, 1, 1332732078, '127.0.0.1'),
	(40, 'wslm', 0, 0, 'uploadfile', '85026247917.jpg', '2012/0326/20120326112323292.jpg', 'image/jpeg', 86373, 'jpg', '', 1, 0, 0, 0, 1, 1332732203, '127.0.0.1'),
	(41, 'wslm', 0, 0, 'uploadfile', '85026247917.jpg', '2012/0326/20120326112750555.jpg', 'image/jpeg', 86373, 'jpg', '', 1, 0, 0, 0, 1, 1332732470, '127.0.0.1'),
	(42, 'wslm', 0, 0, 'uploadfile', 'pic2.jpg', '2012/0326/20120326112829595.jpg', 'image/jpeg', 16161, 'jpg', '', 1, 0, 0, 0, 1, 1332732509, '127.0.0.1'),
	(43, 'wslm', 0, 0, 'uploadfile', 'pic3.jpg', '2012/0326/20120326112912714.jpg', 'image/jpeg', 16522, 'jpg', '', 1, 0, 0, 0, 1, 1332732552, '127.0.0.1'),
	(44, 'wslm', 0, 0, 'uploadfile', 'pic1.jpg', '2012/0326/20120326112955873.jpg', 'image/jpeg', 11570, 'jpg', '', 1, 0, 0, 0, 1, 1332732594, '127.0.0.1'),
	(45, 'wslm', 0, 35, 'thumb', 'images (1).jpg', '2012/0326/20120326113959303.jpg', 'image/jpeg', 9632, 'jpg', '', 1, 0, 0, 0, 1, 1332733199, '127.0.0.1'),
	(46, 'wslm', 0, 36, 'thumb', 'images (2).jpg', '2012/0326/20120326114628861.jpg', 'image/jpeg', 12772, 'jpg', '', 1, 0, 0, 0, 1, 1332733588, '127.0.0.1'),
	(47, 'wslm', 0, 37, 'thumb', 'images (3).jpg', '2012/0326/20120326114737798.jpg', 'image/jpeg', 8738, 'jpg', '', 1, 0, 0, 0, 1, 1332733657, '127.0.0.1'),
	(48, 'wslm', 0, 38, 'thumb', 'images (4).jpg', '2012/0326/20120326114753550.jpg', 'image/jpeg', 10842, 'jpg', '', 1, 0, 0, 0, 1, 1332733673, '127.0.0.1'),
	(49, 'wslm', 0, 39, 'thumb', 'images.jpg', '2012/0326/20120326114815274.jpg', 'image/jpeg', 7147, 'jpg', '', 1, 0, 0, 0, 1, 1332733695, '127.0.0.1'),
	(50, 'wslm', 0, 0, 'uploadfile', '85026247917.jpg', '2012/0326/20120326031510907.jpg', 'image/jpeg', 86373, 'jpg', '', 1, 0, 0, 0, 1, 1332746110, '127.0.0.1'),
	(51, 'wslm', 0, 0, 'uploadfile', 'news_1.jpg', '2012/0326/20120326032112527.jpg', 'image/jpeg', 14578, 'jpg', '', 1, 0, 0, 0, 1, 1332746472, '127.0.0.1'),
	(52, 'wslm', 0, 0, 'uploadfile', 'news_2.jpg', '2012/0326/20120326032148546.jpg', 'image/jpeg', 11136, 'jpg', '', 1, 0, 0, 0, 1, 1332746508, '127.0.0.1'),
	(53, 'wslm', 0, 0, 'uploadfile', 'news_3.jpg', '2012/0326/20120326032214823.jpg', 'image/jpeg', 17763, 'jpg', '', 1, 0, 0, 0, 1, 1332746534, '127.0.0.1'),
	(54, 'wslm', 0, 0, 'uploadfile', '85026247917.jpg', '2012/0326/20120326033406767.jpg', 'image/jpeg', 86373, 'jpg', '', 1, 0, 0, 0, 1, 1332747246, '127.0.0.1'),
	(55, 'wslm', 0, 0, 'uploadfile', 'ser_flow.jpg', '2012/0326/20120326033711951.jpg', 'image/jpeg', 13995, 'jpg', '', 1, 0, 0, 0, 1, 1332747431, '127.0.0.1'),
	(56, 'wslm', 0, 0, 'uploadfile', '85026247917.jpg', '2012/0326/20120326035259850.jpg', 'image/jpeg', 86373, 'jpg', '', 1, 0, 0, 0, 1, 1332748379, '127.0.0.1'),
	(57, 'wslm', 0, 0, 'uploadfile', 'sidebar_tel.jpg', '2012/0326/20120326062613730.jpg', 'image/jpeg', 4739, 'jpg', '', 1, 0, 0, 0, 1, 1332757573, '127.0.0.1'),
	(58, 'wslm', 0, 40, 'thumb', 'cat_pro_slide1.jpg', '2012/0326/20120326100646673.jpg', 'image/jpeg', 5844, 'jpg', '', 1, 0, 0, 0, 1, 1332770806, '127.0.0.1'),
	(59, 'wslm', 0, 40, 'bigpic', '565-306-01.jpg', '2012/0326/20120326100654389.jpg', 'image/jpeg', 53147, 'jpg', '', 1, 0, 0, 0, 1, 1332770814, '127.0.0.1'),
	(60, 'wslm', 0, 41, 'thumb', 'cat_pro_slide2.jpg', '2012/0326/20120326100725202.jpg', 'image/jpeg', 6659, 'jpg', '', 1, 0, 0, 0, 1, 1332770845, '127.0.0.1'),
	(61, 'wslm', 0, 41, 'bigpic', '565-306-02.png', '2012/0326/20120326100731954.png', 'image/png', 176642, 'png', '', 1, 0, 0, 0, 1, 1332770851, '127.0.0.1'),
	(62, 'wslm', 0, 42, 'thumb', 'cat_pro_slide3.jpg', '2012/0326/20120326100758917.jpg', 'image/jpeg', 4134, 'jpg', '', 1, 0, 0, 0, 1, 1332770878, '127.0.0.1'),
	(63, 'wslm', 0, 42, 'bigpic', '565-306-03.jpg', '2012/0326/20120326100805548.jpg', 'image/jpeg', 21288, 'jpg', '', 1, 0, 0, 0, 1, 1332770884, '127.0.0.1'),
	(64, 'wslm', 0, 43, 'thumb', 'cat_pro_slide2.jpg', '2012/0326/20120326100825640.jpg', 'image/jpeg', 6659, 'jpg', '', 1, 0, 0, 0, 1, 1332770905, '127.0.0.1'),
	(65, 'wslm', 0, 43, 'bigpic', 'cat_pro_slide_show.jpg', '2012/0326/20120326100831495.jpg', 'image/jpeg', 55331, 'jpg', '', 1, 0, 0, 0, 1, 1332770911, '127.0.0.1'),
	(66, 'wslm', 0, 0, 'uploadfile', 'pro_menu (1).jpg', '2012/0326/20120326103058422.jpg', 'image/jpeg', 21508, 'jpg', '', 1, 0, 0, 0, 1, 1332772258, '127.0.0.1'),
	(67, 'wslm', 0, 0, 'uploadfile', 'pro_menu (2).jpg', '2012/0326/20120326103145641.jpg', 'image/jpeg', 23557, 'jpg', '', 1, 0, 0, 0, 1, 1332772305, '127.0.0.1'),
	(68, 'wslm', 0, 0, 'uploadfile', 'pro_menu (3).jpg', '2012/0326/20120326103248534.jpg', 'image/jpeg', 26072, 'jpg', '', 1, 0, 0, 0, 1, 1332772368, '127.0.0.1'),
	(69, 'wslm', 0, 0, 'uploadfile', 'invest_category_ (5).jpg', '2012/0326/20120326110839336.jpg', 'image/jpeg', 31254, 'jpg', '', 1, 0, 0, 0, 1, 1332774519, '127.0.0.1'),
	(70, 'wslm', 0, 0, 'uploadfile', 'ser_flow.jpg', '2012/0326/20120326111238445.jpg', 'image/jpeg', 13995, 'jpg', '', 1, 0, 0, 0, 1, 1332774758, '127.0.0.1'),
	(71, 'wslm', 0, 0, 'uploadfile', '组织架构.jpg', '2012/0327/20120327094916899.jpg', 'image/jpeg', 138255, 'jpg', '', 1, 0, 0, 0, 1, 1332812955, '127.0.0.1'),
	(72, 'wslm', 0, 46, 'thumb', 'images.jpg', '2012/0327/20120327113628617.jpg', 'image/jpeg', 7692, 'jpg', '', 1, 0, 0, 0, 1, 1332819388, '127.0.0.1'),
	(73, 'wslm', 0, 0, 'uploadfile', 'pic01.gif', '2012/0327/20120327115404615.gif', 'image/gif', 46094, 'gif', '', 1, 0, 0, 0, 1, 1332820444, '127.0.0.1'),
	(74, 'wslm', 0, 47, 'thumb', 'QQ截图20120327115452.png', '2012/0327/20120327115506829.png', 'image/png', 97485, 'png', '', 1, 0, 0, 0, 1, 1332820506, '127.0.0.1'),
	(75, 'wslm', 0, 48, 'thumb', 'T15nCfXbhqXXcfs179_102957.jpg', '2012/0327/20120327125359787.jpg', 'image/jpeg', 69059, 'jpg', '', 1, 0, 0, 0, 1, 1332824039, '127.0.0.1'),
	(76, 'wslm', 0, 49, 'thumb', 'T13dXhXbG7_tLpEyZ7_065203.jpg', '2012/0327/20120327125432395.jpg', 'image/jpeg', 58007, 'jpg', '', 1, 0, 0, 0, 1, 1332824071, '127.0.0.1'),
	(77, 'wslm', 0, 50, 'thumb', 'T1wESDXm0XXXcndeM.jpg', '2012/0327/20120327125509405.jpg', 'image/jpeg', 27775, 'jpg', '', 1, 0, 0, 0, 1, 1332824109, '127.0.0.1'),
	(78, 'wslm', 0, 0, 'uploadfile', 'T15nCfXbhqXXcfs179_102957.jpg', '2012/0327/20120327010241905.jpg', 'image/jpeg', 69059, 'jpg', '', 1, 0, 0, 0, 1, 1332824561, '127.0.0.1'),
	(79, 'wslm', 0, 49, 'thumb', 'T1kXpsXjVsXXazMSoT_013042.jpg', '2012/0327/20120327010258398.jpg', 'image/jpeg', 87997, 'jpg', '', 1, 0, 0, 0, 1, 1332824578, '127.0.0.1'),
	(80, 'wslm', 0, 49, 'thumb', 'T1wESDXm0XXXcndeM.jpg', '2012/0327/20120327010607655.jpg', 'image/pjpeg', 27775, 'jpg', '', 1, 0, 0, 0, 1, 1332824766, '127.0.0.1'),
	(81, 'wslm', 0, 0, 'uploadfile', 'T13dXhXbG7_tLpEyZ7_065203.jpg', '2012/0327/20120327010745228.jpg', 'image/jpeg', 58007, 'jpg', '', 1, 0, 0, 0, 1, 1332824865, '127.0.0.1'),
	(82, 'wslm', 0, 0, 'uploadfile', 'T1lY9pXoVWXXXbXyLb_094425.jpg', '2012/0327/20120327010757488.jpg', 'image/jpeg', 53401, 'jpg', '', 1, 0, 0, 0, 1, 1332824877, '127.0.0.1'),
	(83, 'wslm', 0, 0, 'uploadfile', 'T1wESDXm0XXXcndeM.jpg', '2012/0327/20120327010909552.jpg', 'image/jpeg', 27775, 'jpg', '', 1, 0, 0, 0, 1, 1332824949, '127.0.0.1'),
	(84, 'wslm', 0, 0, 'uploadfile', 'T1lY9pXoVWXXXbXyLb_094425.jpg', '2012/0327/20120327010920294.jpg', 'image/jpeg', 53401, 'jpg', '', 1, 0, 0, 0, 1, 1332824960, '127.0.0.1'),
	(85, 'wslm', 0, 0, 'thumb', 'T1M.tSXfXGXXcEmpYb_093009.jpg', '2012/0327/20120327011022747.jpg', 'image/jpeg', 271925, 'jpg', '', 1, 0, 0, 0, 1, 1332825021, '127.0.0.1'),
	(86, 'wslm', 0, 0, 'uploadfile', 'T1M.tSXfXGXXcEmpYb_093009.jpg', '2012/0327/20120327011106949.jpg', 'image/jpeg', 271925, 'jpg', '', 1, 0, 0, 0, 1, 1332825066, '127.0.0.1'),
	(87, 'wslm', 0, 0, 'uploadfile', 'T1M.tSXfXGXXcEmpYb_093009.jpg', '2012/0327/20120327011211514.jpg', 'image/jpeg', 271925, 'jpg', '', 1, 0, 0, 0, 1, 1332825130, '127.0.0.1'),
	(88, 'wslm', 0, 0, 'uploadfile', 'T1M.tSXfXGXXcEmpYb_093009.jpg', '2012/0327/20120327011226652.jpg', 'image/jpeg', 271925, 'jpg', '', 1, 0, 0, 0, 1, 1332825146, '127.0.0.1'),
	(89, 'wslm', 0, 0, 'uploadfile', 'T1M.tSXfXGXXcEmpYb_093009.jpg', '2012/0327/20120327011256993.jpg', 'image/jpeg', 271925, 'jpg', '', 1, 0, 0, 0, 1, 1332825176, '127.0.0.1'),
	(90, 'wslm', 0, 51, 'thumb', 'case_sucess_ (1).jpg', '2012/0327/20120327041123405.jpg', 'image/jpeg', 18080, 'jpg', '', 1, 0, 0, 0, 1, 1332835883, '127.0.0.1'),
	(91, 'wslm', 0, 52, 'thumb', 'case_sucess_ (2).jpg', '2012/0327/20120327041148623.jpg', 'image/jpeg', 24996, 'jpg', '', 1, 0, 0, 0, 1, 1332835908, '127.0.0.1'),
	(92, 'wslm', 0, 53, 'thumb', 'case_sucess_ (3).jpg', '2012/0327/20120327041223316.jpg', 'image/jpeg', 18980, 'jpg', '', 1, 0, 0, 0, 1, 1332835943, '127.0.0.1'),
	(93, 'wslm', 0, 54, 'thumb', 'case_sucess_ (4).jpg', '2012/0327/20120327041252460.jpg', 'image/jpeg', 20715, 'jpg', '', 1, 0, 0, 0, 1, 1332835972, '127.0.0.1'),
	(94, 'wslm', 0, 55, 'thumb', 'case_sucess_ (5).jpg', '2012/0327/20120327041310117.jpg', 'image/jpeg', 24147, 'jpg', '', 1, 0, 0, 0, 1, 1332835990, '127.0.0.1'),
	(95, 'wslm', 0, 56, 'thumb', 'case_sucess_ (6).jpg', '2012/0327/20120327041342295.jpg', 'image/jpeg', 24883, 'jpg', '', 1, 0, 0, 0, 1, 1332836022, '127.0.0.1'),
	(96, 'wslm', 0, 57, 'thumb', 'case_sucess_ (7).jpg', '2012/0327/20120327041402803.jpg', 'image/jpeg', 20562, 'jpg', '', 1, 0, 0, 0, 1, 1332836042, '127.0.0.1'),
	(97, 'wslm', 0, 58, 'thumb', 'case_sucess_ (6).jpg', '2012/0327/20120327041427574.jpg', 'image/jpeg', 24883, 'jpg', '', 1, 0, 0, 0, 1, 1332836067, '127.0.0.1'),
	(98, 'wslm', 0, 0, 'uploadfile', 'banner.jpg', '2012/0327/20120327051602922.jpg', 'image/jpeg', 83683, 'jpg', '', 1, 0, 0, 0, 1, 1332839762, '127.0.0.1');
/*!40000 ALTER TABLE `mg_attachment` ENABLE KEYS */;


# Dumping structure for table mg_wlsm.mg_author
DROP TABLE IF EXISTS `mg_author`;
CREATE TABLE IF NOT EXISTS `mg_author` (
  `authorid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `name` varchar(30) NOT NULL,
  `gender` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `birthday` date NOT NULL DEFAULT '0000-00-00',
  `email` varchar(40) NOT NULL,
  `qq` varchar(15) NOT NULL,
  `msn` varchar(40) NOT NULL,
  `homepage` varchar(100) NOT NULL,
  `telephone` varchar(20) NOT NULL,
  `address` varchar(100) NOT NULL,
  `postcode` varchar(6) NOT NULL,
  `photo` varchar(100) NOT NULL,
  `introduce` mediumtext NOT NULL,
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `elite` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`authorid`),
  UNIQUE KEY `name` (`name`),
  KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# Dumping data for table mg_wlsm.mg_author: 0 rows
DELETE FROM `mg_author`;
/*!40000 ALTER TABLE `mg_author` DISABLE KEYS */;
/*!40000 ALTER TABLE `mg_author` ENABLE KEYS */;


# Dumping structure for table mg_wlsm.mg_block
DROP TABLE IF EXISTS `mg_block`;
CREATE TABLE IF NOT EXISTS `mg_block` (
  `blockid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `pageid` varchar(20) NOT NULL,
  `blockno` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL,
  `isarray` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `rows` tinyint(2) unsigned NOT NULL DEFAULT '8',
  `data` mediumtext NOT NULL,
  `listorder` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`blockid`),
  KEY `pageid` (`pageid`,`blockno`,`disabled`,`listorder`)
) ENGINE=MyISAM AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;

# Dumping data for table mg_wlsm.mg_block: 44 rows
DELETE FROM `mg_block`;
/*!40000 ALTER TABLE `mg_block` DISABLE KEYS */;
INSERT INTO `mg_block` (`blockid`, `pageid`, `blockno`, `name`, `isarray`, `rows`, `data`, `listorder`, `disabled`) VALUES
	(22, 'cat_about_us', 1, '关于我们-企业简介', 0, 6, '由于漫画本身的发展形成了现代故事漫画的表现形式，将影视艺术融入漫画之中，使得漫画与动画更容易结合，影视艺术独特的地方在于它能通过镜头的推拉摇移和片段剪辑的蒙太奇技巧来表达想法和感受。漫画正是吸收了影视艺术的这两个特点漫画正是吸收了影视艺术的这两个特点...', 2, 0),
	(23, 'top_1', 1, '关于我们-banner', 0, 6, '<img alt="" src="/wslm/uploadfile/2012/0326/20120326112323292.jpg" />', 2, 0),
	(24, 'cat_about_partner', 1, '栏目-关于我们-合作伙伴', 0, 6, '<img alt="" src="/wslm/uploadfile/2012/0326/20120326112829595.jpg" />&nbsp;', 2, 0),
	(25, 'cat_about_honor', 1, '栏目-关于我们-资质荣誉', 0, 6, '<img alt="" src="/wslm/uploadfile/2012/0326/20120326112912714.jpg" />&nbsp;', 2, 0),
	(26, 'cat_about_org', 1, '栏目-关于我们-组织架构', 0, 6, '<img alt="" src="/wslm/uploadfile/2012/0326/20120326112955873.jpg" />&nbsp;', 2, 0),
	(27, 'top_2', 1, '栏目-新闻中心-栏目', 0, 6, '<img alt="" src="/wslm/uploadfile/2012/0326/20120326031510907.jpg" />&nbsp;', 2, 0),
	(28, 'news_15', 1, '栏目-新闻中心-公告图片', 0, 6, '<img alt="" src="/wslm/uploadfile/2012/0326/20120326032112527.jpg" />&nbsp;', 2, 0),
	(29, 'news_16', 1, '栏目-新闻中心-新闻图片', 0, 6, '<img alt="" src="/wslm/uploadfile/2012/0326/20120326032148546.jpg" />&nbsp;', 2, 0),
	(30, 'news_17', 1, '栏目-新闻中心-资讯图片', 0, 6, '<img alt="" src="/wslm/uploadfile/2012/0326/20120326032214823.jpg" />&nbsp;', 2, 0),
	(31, 'top_3', 1, '栏目-服务管理-banner', 0, 6, '<img alt="" src="/wslm/uploadfile/2012/0326/20120326033406767.jpg" />', 2, 0),
	(32, 'cat_ser_progress', 1, '栏目-服务管理-运营流程', 1, 6, '', 2, 0),
	(33, 'cat_ser_progress', 1, '栏目-服务管理-运营流程', 0, 6, '<img alt="" src="/wslm/uploadfile/2012/0326/20120326033711951.jpg" />&nbsp;', 4, 0),
	(34, 'cat_ser_views', 1, '栏目-服务管理-服务理念', 0, 6, '<p>网上经常将动漫说成是动画，由于这个说法一直存在，出现了误区，但也将错就错。主要原因是，日本的动漫比较热门，漫迷为了方便讨论与表达，将动漫一词用于指日本的动漫，大部分是用于指日本的动画，少部分用于指日本的漫画。 　日本是制作和生产动漫最出名的国家之一。</p>\n    <p>惯用说法有“动漫爱好者”、“动漫展览会”、“动漫产业”等等。中国大陆还有以“动漫志”为名的杂志，把这个新生词推广到整个社会，尤其在青少年中甚为常用。在日本、大中华等许多地方，日本动漫十分流行，并逐渐成为了一种文化时尚，故以中文提及“动漫”时多指日本动漫或日式动漫。Manga为日语“漫画”的英语译音，现在manga本身也涵盖漫画产业的意思。</p>', 2, 0),
	(35, 'top_4', 1, '栏目-动漫文化-banner', 0, 6, '<img alt="" src="/wslm/uploadfile/2012/0326/20120326035259850.jpg" />&nbsp;', 2, 0),
	(36, 'side_left_tel', 1, '左侧导航-列表', 0, 6, '<img alt="" src="/wslm/uploadfile/2012/0326/20120326062613730.jpg" />&nbsp;', 2, 0),
	(18, 'tel', 1, '顶部-电话', 0, 6, '<img alt="" src="/wslm/uploadfile/2012/0326/20120326102706440.jpg" />', 2, 0),
	(19, 'about', 1, '底部介绍', 0, 6, '济南青春咨询有限公司是由工商行政管理部门比准注册的国内第一家专门为动漫产品经营管理行业提供管理咨询服务的专业机构。公司凭借多年的行业管理经验和咨询案例经验，为动漫行业从业者提供产品。济南青春咨询有限公司是由工商行政管理部门比准注册的国内第一家专门为动漫产品经营管理行业提供管理咨询服务的专业机构。', 2, 0),
	(21, 'cat_about_culture', 1, '关于我们-企业文化', 0, 6, '当要讲述的故事越发复杂、人物越发丰富的时候，用传统单线式叙事的方法就越行不通，蒙太奇的介入就成为一种需要了；当漫画家在传统表现手段中无法找到更合适...', 2, 0),
	(37, 'top_5', 1, '栏目-产品展示-banner', 0, 6, '<img width="980" height="260" alt="" src="/wslm/uploadfile/2012/0326/20120326112323292.jpg" />&nbsp;', 2, 0),
	(38, 'cat_pro_euro', 1, '栏目-产品展示-欧美动漫', 0, 6, '<img alt="" src="/wslm/uploadfile/2012/0326/20120326103058422.jpg" />&nbsp;', 2, 0),
	(39, 'cat_pro_home', 1, '栏目-产品展示-国产动漫', 0, 6, '<img alt="" src="/wslm/uploadfile/2012/0326/20120326103145641.jpg" />&nbsp;', 2, 0),
	(40, 'cat_pro_japan', 1, '栏目-产品展示-日本动漫', 0, 6, '<img alt="" src="/wslm/uploadfile/2012/0326/20120326103248534.jpg" />&nbsp;', 2, 0),
	(41, 'top_6', 1, '栏目-案例分享-banner', 0, 6, '<img width="980" height="260" alt="" src="/wslm/uploadfile/2012/0326/20120326112750555.jpg" />&nbsp;', 2, 0),
	(42, 'top_7', 1, '栏目-投资合作-banner', 0, 6, '<img width="980" height="260" alt="" src="/wslm/uploadfile/2012/0326/20120326112750555.jpg" />&nbsp;', 2, 0),
	(43, 'invest_analysis', 1, '栏目-投资合作-投资分析', 0, 6, '<p>网上经常将动漫说成是动画，由于这个说法一直存在，出现了误区，但也将错就错。主要原因是，日本的动漫比较热门，漫迷为了方便讨论与表达，将动漫一词用于指日本的动漫，大部分是用于指日本的动画，少部分用于指日本的漫画。 　日本是制作和生产动漫最出名的国家之一。</p>\n    <p>惯用说法有“动漫爱好者”、“动漫展览会”、“动漫产业”等等。中国大陆还有以“动漫志”为名的杂志，把这个新生词推广到整个社会，尤其在青少年中甚为常用。在日本、大中华等许多地方，日本动漫十分流行，并逐渐成为了一种文化时尚，故以中文提及“动漫”时多指日本动漫或日式动漫。Manga为日语“漫画”的英语译音，现在manga本身也涵盖漫画产业的意思。</p>', 2, 0),
	(44, 'invest_flow', 1, '栏目-投资合作-顾问流程', 0, 6, '<img alt="" src="/wslm/uploadfile/2012/0326/20120326110839336.jpg" />&nbsp;', 2, 0),
	(45, 'invest_process', 1, '栏目-投资合作-运营流程', 0, 6, '&nbsp;<img alt="" src="/wslm/uploadfile/2012/0326/20120326111238445.jpg" />', 2, 0),
	(47, 'page_9', 1, '内容-关于我们-企业简介', 0, 6, '<div>动漫是相当受到欢迎的，无论是大人或是小孩，那动漫又是怎样出来的呢？请看下面动漫的简介与概述！希望大家能对你们所喜爱的动漫有更深入的了解。</div><div>&nbsp;</div><div>　　动漫是动画和漫画的合称与缩写，在其他语言相当少用。随着现代传媒技术的发展，动画（animation或anime）和漫画（comics，manga；特别是故事性漫画）之间联系日趋紧密，两者常被合而为&ldquo;动漫&rdquo;。惯用说法有&ldquo;动漫爱好者&rdquo;、&ldquo;动漫展览会&rdquo;、&ldquo;动漫产业&rdquo;等等。中国大陆还有以&ldquo;动漫志&rdquo;为名的杂志，把这个新生词推广到整个社会，尤其在青少年中甚为常用。在日本、大中华等许多地方，日本动漫十分流行，并逐渐成为了一种文化时尚，故以中文提及&ldquo;动漫&rdquo;时多指日本动漫或日式动漫。Manga为日语&ldquo;漫画&rdquo;的英语译音，现在manga本身也涵盖漫画产业的意思。另外，英文词cartoon的中文音译&ldquo;卡通&rdquo;，也是漫画与动画的合称，但有时常被用来特指美国动画等等。动漫有两种艺术特性：一是有语言功能，即使无声也可以表达一定的意思；二是具有谐趣性，即滑稽幽默或讽刺性。</div><div>&nbsp;</div><div>　　&ldquo;动漫&rdquo;一词在1996年以前在中国大陆并没有出现这个统一的概念，2者是分立而互有联系。此词的出现和推广，源于在98年全中国第一家首先拔地而起的动漫资讯杂志《动漫时代（ANIME COMIC TIME）》，因此&ldquo;动漫&rdquo;一词才得以出现并慢慢深入人心成为全中国动漫迷常用的词汇和动画与漫画的总称。</div><div>&nbsp;</div><div>　　动漫是通过制作，使一些有或无生命的东西拟人化、夸张化，赋予其人类的一切感情、动作。或将架空的场景加以绘制，使其真实化。在日漫中也有将生活场景片段绘出的漫画。这也算是艺术的表达的形式。就像文字用小说表达，而图片用绘画表达是很相似的。</div><div>&nbsp;</div><div>　　其中漫画对于我们来说是怎样存在的呢？漫画通常是以书刊形式与大家见面，它轻松幽默、易阅读、读者年龄广，是在各式出版品中商业性最强的，因着漫画衍生而出的的产品，其中之利润更是令人眼红。而动画，顾名思义便是可以活动的连环画剧。其实正是漫画奠定了动画的基础。漫画与动画作为美术的一部分，从艺术的一个角度展示人类的文化与文明，反映人类的精神，而当今世界也形成了以美国和日本为首的局面，其中日本尤为突出，日本动漫已成为日本民族的象征。但美国作为世界文化的象征，聚集世界各地才华横溢的艺术家，以迪斯尼为首，创造着雅致的画廊。面向儿童的，就该纯真；面向成人的，就该美妙。动漫画也是心灵的艺术，也就应该有超越思维的永恒&hellip;&hellip;</div><div>&nbsp;</div><div>　　概述</div><div>&nbsp;</div><div>　　随着现代传媒技术的发展，动画（animation或anime）和漫画（comics，manga；特别是故事性漫画）之间联系日趋紧密，两者常被合二为一称为&ldquo;动漫&rdquo;。惯用说法有&ldquo;动漫爱好者&rdquo;、&ldquo;动漫展览会&rdquo;、&ldquo;动漫产业&rdquo;等等。中国大陆还有以&ldquo;动漫志&rdquo;为名的杂志，把这个新生词推广到整个社会，尤其在青少年中甚为常用。在日本、大中华等许多地方，日本动漫十分流行，并逐渐成为了一种文化时尚，故以中文提及&ldquo;动漫&rdquo;时多指日本动漫或日式动漫。</div><div>&nbsp;</div><div>　　动漫领域衍生出的许多术语均已经被广泛应用，例如：萌（日语中的萌え），杀必死，萝莉（LOLI）等等。</div><div>&nbsp;</div><div>　　动漫产业日益与游戏产业结合紧密，在日本已经形成一个成熟的产业链，动漫已经从单单的平面媒体和电视媒体扩展到游戏机，网络，玩具等众多领域。 许多动漫游戏应运而生，例如《死神》PSP平台的游戏，也有许多GALGAME被改编成动漫作品，例如《あかね色に染まる坂》 ，《EF-a tale of memores》 等等</div><div>&nbsp;</div><div>　　Manga（まんが）为日语&ldquo;漫画&rdquo;的罗马字注音。另外，英文词cartoon的中文音译&ldquo;卡通&rdquo;，也是漫画与动画的合称，但常被用来特指美国动画。</div><div>&nbsp;</div>　　动漫人才是指掌握动漫制作设计技巧的人群，他们多在相关行业单位中工作，以动漫制作设计为主要工作内容。 动漫培训是指参加动漫职业学校或者动漫培训班以求掌握动漫知识或动漫制作设计技巧的行为。&nbsp;', 2, 0),
	(48, 'page_10', 1, '内容-关于我们-企业文化', 0, 6, '&nbsp;动漫是相当受到欢迎的，无论是大人或是小孩，那动漫又是怎样出来的呢？请看下面动漫的简介与概述！希望大家能对你们所喜爱的动漫有更深入的了解。<div>&nbsp;</div><div>　　动漫是动画和漫画的合称与缩写，在其他语言相当少用。随着现代传媒技术的发展，动画（animation或anime）和漫画（comics，manga；特别是故事性漫画）之间联系日趋紧密，两者常被合而为&ldquo;动漫&rdquo;。惯用说法有&ldquo;动漫爱好者&rdquo;、&ldquo;动漫展览会&rdquo;、&ldquo;动漫产业&rdquo;等等。中国大陆还有以&ldquo;动漫志&rdquo;为名的杂志，把这个新生词推广到整个社会，尤其在青少年中甚为常用。在日本、大中华等许多地方，日本动漫十分流行，并逐渐成为了一种文化时尚，故以中文提及&ldquo;动漫&rdquo;时多指日本动漫或日式动漫。Manga为日语&ldquo;漫画&rdquo;的英语译音，现在manga本身也涵盖漫画产业的意思。另外，英文词cartoon的中文音译&ldquo;卡通&rdquo;，也是漫画与动画的合称，但有时常被用来特指美国动画等等。动漫有两种艺术特性：一是有语言功能，即使无声也可以表达一定的意思；二是具有谐趣性，即滑稽幽默或讽刺性。</div><div>&nbsp;</div><div>　　&ldquo;动漫&rdquo;一词在1996年以前在中国大陆并没有出现这个统一的概念，2者是分立而互有联系。此词的出现和推广，源于在98年全中国第一家首先拔地而起的动漫资讯杂志《动漫时代（ANIME COMIC TIME）》，因此&ldquo;动漫&rdquo;一词才得以出现并慢慢深入人心成为全中国动漫迷常用的词汇和动画与漫画的总称。</div><div>&nbsp;</div><div>　　动漫是通过制作，使一些有或无生命的东西拟人化、夸张化，赋予其人类的一切感情、动作。或将架空的场景加以绘制，使其真实化。在日漫中也有将生活场景片段绘出的漫画。这也算是艺术的表达的形式。就像文字用小说表达，而图片用绘画表达是很相似的。</div><div>&nbsp;</div><div>　　其中漫画对于我们来说是怎样存在的呢？漫画通常是以书刊形式与大家见面，它轻松幽默、易阅读、读者年龄广，是在各式出版品中商业性最强的，因着漫画衍生而出的的产品，其中之利润更是令人眼红。而动画，顾名思义便是可以活动的连环画剧。其实正是漫画奠定了动画的基础。漫画与动画作为美术的一部分，从艺术的一个角度展示人类的文化与文明，反映人类的精神，而当今世界也形成了以美国和日本为首的局面，其中日本尤为突出，日本动漫已成为日本民族的象征。但美国作为世界文化的象征，聚集世界各地才华横溢的艺术家，以迪斯尼为首，创造着雅致的画廊。面向儿童的，就该纯真；面向成人的，就该美妙。动漫画也是心灵的艺术，也就应该有超越思维的永恒&hellip;&hellip;</div><div>&nbsp;</div><div>　　概述</div><div>&nbsp;</div><div>　　随着现代传媒技术的发展，动画（animation或anime）和漫画（comics，manga；特别是故事性漫画）之间联系日趋紧密，两者常被合二为一称为&ldquo;动漫&rdquo;。惯用说法有&ldquo;动漫爱好者&rdquo;、&ldquo;动漫展览会&rdquo;、&ldquo;动漫产业&rdquo;等等。中国大陆还有以&ldquo;动漫志&rdquo;为名的杂志，把这个新生词推广到整个社会，尤其在青少年中甚为常用。在日本、大中华等许多地方，日本动漫十分流行，并逐渐成为了一种文化时尚，故以中文提及&ldquo;动漫&rdquo;时多指日本动漫或日式动漫。</div><div>&nbsp;</div><div>　　动漫领域衍生出的许多术语均已经被广泛应用，例如：萌（日语中的萌え），杀必死，萝莉（LOLI）等等。</div><div>&nbsp;</div><div>　　动漫产业日益与游戏产业结合紧密，在日本已经形成一个成熟的产业链，动漫已经从单单的平面媒体和电视媒体扩展到游戏机，网络，玩具等众多领域。 许多动漫游戏应运而生，例如《死神》PSP平台的游戏，也有许多GALGAME被改编成动漫作品，例如《あかね色に染まる坂》 ，《EF-a tale of memores》 等等</div><div>&nbsp;</div><div>　　Manga（まんが）为日语&ldquo;漫画&rdquo;的罗马字注音。另外，英文词cartoon的中文音译&ldquo;卡通&rdquo;，也是漫画与动画的合称，但常被用来特指美国动画。</div><div>&nbsp;</div><div>　　动漫人才是指掌握动漫制作设计技巧的人群，他们多在相关行业单位中工作，以动漫制作设计为主要工作内容。 动漫培训是指参加动漫职业学校或者动漫培训班以求掌握动漫知识或动漫制作设计技巧的行为。</div>', 2, 0),
	(49, 'page_11', 1, '内容-关于我们-资质荣誉', 0, 6, '<div>动漫是相当受到欢迎的，无论是大人或是小孩，那动漫又是怎样出来的呢？请看下面动漫的简介与概述！希望大家能对你们所喜爱的动漫有更深入的了解。</div><div>&nbsp;</div><div>　　动漫是动画和漫画的合称与缩写，在其他语言相当少用。随着现代传媒技术的发展，动画（animation或anime）和漫画（comics，manga；特别是故事性漫画）之间联系日趋紧密，两者常被合而为&ldquo;动漫&rdquo;。惯用说法有&ldquo;动漫爱好者&rdquo;、&ldquo;动漫展览会&rdquo;、&ldquo;动漫产业&rdquo;等等。中国大陆还有以&ldquo;动漫志&rdquo;为名的杂志，把这个新生词推广到整个社会，尤其在青少年中甚为常用。在日本、大中华等许多地方，日本动漫十分流行，并逐渐成为了一种文化时尚，故以中文提及&ldquo;动漫&rdquo;时多指日本动漫或日式动漫。Manga为日语&ldquo;漫画&rdquo;的英语译音，现在manga本身也涵盖漫画产业的意思。另外，英文词cartoon的中文音译&ldquo;卡通&rdquo;，也是漫画与动画的合称，但有时常被用来特指美国动画等等。动漫有两种艺术特性：一是有语言功能，即使无声也可以表达一定的意思；二是具有谐趣性，即滑稽幽默或讽刺性。</div><div>&nbsp;</div><div>　　&ldquo;动漫&rdquo;一词在1996年以前在中国大陆并没有出现这个统一的概念，2者是分立而互有联系。此词的出现和推广，源于在98年全中国第一家首先拔地而起的动漫资讯杂志《动漫时代（ANIME COMIC TIME）》，因此&ldquo;动漫&rdquo;一词才得以出现并慢慢深入人心成为全中国动漫迷常用的词汇和动画与漫画的总称。</div><div>&nbsp;</div><div>　　动漫是通过制作，使一些有或无生命的东西拟人化、夸张化，赋予其人类的一切感情、动作。或将架空的场景加以绘制，使其真实化。在日漫中也有将生活场景片段绘出的漫画。这也算是艺术的表达的形式。就像文字用小说表达，而图片用绘画表达是很相似的。</div><div>&nbsp;</div><div>　　其中漫画对于我们来说是怎样存在的呢？漫画通常是以书刊形式与大家见面，它轻松幽默、易阅读、读者年龄广，是在各式出版品中商业性最强的，因着漫画衍生而出的的产品，其中之利润更是令人眼红。而动画，顾名思义便是可以活动的连环画剧。其实正是漫画奠定了动画的基础。漫画与动画作为美术的一部分，从艺术的一个角度展示人类的文化与文明，反映人类的精神，而当今世界也形成了以美国和日本为首的局面，其中日本尤为突出，日本动漫已成为日本民族的象征。但美国作为世界文化的象征，聚集世界各地才华横溢的艺术家，以迪斯尼为首，创造着雅致的画廊。面向儿童的，就该纯真；面向成人的，就该美妙。动漫画也是心灵的艺术，也就应该有超越思维的永恒&hellip;&hellip;</div><div>&nbsp;</div><div>　　概述</div><div>&nbsp;</div><div>　　随着现代传媒技术的发展，动画（animation或anime）和漫画（comics，manga；特别是故事性漫画）之间联系日趋紧密，两者常被合二为一称为&ldquo;动漫&rdquo;。惯用说法有&ldquo;动漫爱好者&rdquo;、&ldquo;动漫展览会&rdquo;、&ldquo;动漫产业&rdquo;等等。中国大陆还有以&ldquo;动漫志&rdquo;为名的杂志，把这个新生词推广到整个社会，尤其在青少年中甚为常用。在日本、大中华等许多地方，日本动漫十分流行，并逐渐成为了一种文化时尚，故以中文提及&ldquo;动漫&rdquo;时多指日本动漫或日式动漫。</div><div>&nbsp;</div><div>　　动漫领域衍生出的许多术语均已经被广泛应用，例如：萌（日语中的萌え），杀必死，萝莉（LOLI）等等。</div><div>&nbsp;</div><div>　　动漫产业日益与游戏产业结合紧密，在日本已经形成一个成熟的产业链，动漫已经从单单的平面媒体和电视媒体扩展到游戏机，网络，玩具等众多领域。 许多动漫游戏应运而生，例如《死神》PSP平台的游戏，也有许多GALGAME被改编成动漫作品，例如《あかね色に染まる坂》 ，《EF-a tale of memores》 等等</div><div>&nbsp;</div><div>　　Manga（まんが）为日语&ldquo;漫画&rdquo;的罗马字注音。另外，英文词cartoon的中文音译&ldquo;卡通&rdquo;，也是漫画与动画的合称，但常被用来特指美国动画。</div><div>&nbsp;</div><div>　　动漫人才是指掌握动漫制作设计技巧的人群，他们多在相关行业单位中工作，以动漫制作设计为主要工作内容。 动漫培训是指参加动漫职业学校或者动漫培训班以求掌握动漫知识或动漫制作设计技巧的行为。</div>', 2, 0),
	(50, 'page_12', 1, '内容-关于我们-组织架构', 0, 6, '<img alt="" src="/wslm/uploadfile/2012/0327/20120327094916899.jpg" />&nbsp;', 2, 0),
	(51, 'page_18', 1, '内容-服务管理-服务理念', 0, 6, '内容-服务管理-服务理念', 2, 0),
	(52, 'page_20', 1, '内容-服务范围-动漫cosplay策划', 0, 6, '内容-服务范围-动漫cosplay策划', 2, 0),
	(53, 'page_21', 1, '内容-服务范围-产品形象策划', 0, 6, '内容-服务范围-动漫cosplay策划', 2, 0),
	(54, 'page_22', 1, '内容-服务范围-动漫渠道建设策划', 0, 6, '内容-服务范围-动漫渠道建设策划', 2, 0),
	(55, 'page_23', 1, '内容-服务范围-动漫推广策划', 0, 6, '内容-服务范围-动漫推广策划', 2, 0),
	(56, 'page_24', 1, '内容-服务范围-动漫网络营销策划', 0, 6, '内容-服务范围-动漫推广策划', 2, 0),
	(57, 'page_25', 1, '内容-服务范围-动漫展会活动策划', 0, 6, '内容-服务范围-动漫推广策划', 2, 0),
	(58, 'page_26', 1, '内容-服务范围-动漫终端设计策划', 0, 6, '内容-服务范围-动漫推广策划', 2, 0),
	(59, 'page_27', 1, '内容-服务范围-动漫终端营销策划', 0, 6, '内容-服务范围-动漫推广策划', 2, 0),
	(60, 'page_28', 1, '内容-服务管理-运营流程', 0, 6, '&nbsp;<img alt="" src="/wslm/uploadfile/2012/0327/20120327115404615.gif" />', 2, 0),
	(61, 'invest_policy', 1, '栏目-投资合作-合作政策', 0, 6, '&nbsp;网上经常将动漫说成是动画，由于这个说法一直存在，出现了误区，但也将错就错。主要原因是，日本的动漫比较热门，漫迷为了方便讨论与表达，将动漫一词用于指日本的动漫，大部分是用于指日本的动画，少部分用于指日本的漫画。 　日本是制作和生产动漫最出名的国家之一。', 2, 0),
	(62, 'top_8', 1, '栏目-联系我们-banner', 0, 6, '<img alt="" src="/wslm/uploadfile/2012/0327/20120327051602922.jpg" />&nbsp;', 2, 0),
	(63, 'page_contact_us', 1, '内容-联系我们-联系方式', 0, 6, '<ul>\n    <li>联系方式:123456789</li>\n    <li>联系方式:123456789</li>\n    <li>联系方式:123456789</li>\n    <li>联系方式:123456789</li>\n    <li>联系方式:123456789</li>\n</ul>', 2, 0);
/*!40000 ALTER TABLE `mg_block` ENABLE KEYS */;


# Dumping structure for table mg_wlsm.mg_cache_count
DROP TABLE IF EXISTS `mg_cache_count`;
CREATE TABLE IF NOT EXISTS `mg_cache_count` (
  `id` char(32) NOT NULL DEFAULT '',
  `count` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

# Dumping data for table mg_wlsm.mg_cache_count: 227 rows
DELETE FROM `mg_cache_count`;
/*!40000 ALTER TABLE `mg_cache_count` DISABLE KEYS */;
INSERT INTO `mg_cache_count` (`id`, `count`, `updatetime`) VALUES
	('1ff8ebf4a96733afbf1b823a34946975', 0, 1332670992),
	('89204fd40ca4b679a8c2ac28dc6f294b', 0, 1332670989),
	('8ceaca3e65c3d9189fcbf63dc1a80dca', 0, 1332670985),
	('fa6faec4d50d386d58c8e98f498c6760', 0, 1332670982),
	('b7d8cbeb20d41aec1de09a0b761fe4c0', 0, 1332670976),
	('158a83be5fd6f775fc118cb2e582a042', 0, 1332671019),
	('8dbcd5729c1c9b7e83f7804148d72970', 0, 1332671019),
	('a64c781b111d81cb6765e3f7887a16d8', 0, 1332671019),
	('226bbe98295c93ef89e39521c190b8f6', 0, 1332671019),
	('b11fe1839d91a1ee112012fcacdc4340', 0, 1332671019),
	('4ed2d28ae069786766eaf56282b3eec5', 0, 1332671019),
	('101c643b7b387dde8765b54eaafec844', 0, 1332671019),
	('eb2e0724f69f7c1adf5b03e688a9bed1', 0, 1332671019),
	('c5e017c8cdd736693dafaf09a3a61286', 0, 1332671019),
	('9171e17baaea482787cc892e96f49d9c', 0, 1332671019),
	('40bb3192826c538d69d8227513685555', 0, 1332677477),
	('baa3883dcea51bc5e19d87ac1ffb6544', 0, 1332677443),
	('bcfbd206e6876670b39d3f3f308b326f', 71, 1332846863),
	('9d3d5f14a291b2850ef83be905329b44', 0, 1332682710),
	('01eb9839cc2201411e575c0e0eb0a2b6', 0, 1332682875),
	('6b6243bbeb9ff6ddc89ba94276bc667a', 0, 1332682972),
	('586f8bea7621c362eb15ad138dc8595d', 2, 1332828807),
	('dfc5a4ce58d6b698efda96d53b18cc96', 0, 1332683094),
	('eaff7535479c7c59f92969f0fb0ac222', 0, 1332683149),
	('d0b58a9aaee6d7060ac4e6c8bdfcdf69', 1, 1332688920),
	('6792a005c5b433ed50c81dd658e006ad', 1, 1332688935),
	('779c6aa31cf18c3362b2bf8c851690aa', 1, 1332688934),
	('d7a3989c03d52b81262b52ad1c44524c', 3, 1332685597),
	('62a38ede3d786128e77125545ab1ce6b', 1, 1332685599),
	('ba298a6554144c2803066a32b80b73c9', 2, 1332685949),
	('161728de72712bf9651cba8adf3492e0', 0, 1332684463),
	('511556c9b37152a204f58dff72847ffb', 0, 1332684596),
	('344ba00a96a044973c663fc0a5b354b4', 2, 1332684578),
	('8f7f716d6cf3e7d337e48ddd0c0c7a7a', 1, 1332684774),
	('760212a91b2ac67afc0d1b1332af4fe5', 0, 1332684782),
	('bb0760b28a3bd448b567abba4cd73d17', 1, 1332684787),
	('6b687c4772e614e3ea85e2f3320c6319', 0, 1332684848),
	('0f8163a452e59276d8305077b015bb4d', 2, 1332684798),
	('93f31b4f68cd740adbc177396995f3d0', 0, 1332684857),
	('c8e9ca8891b1029506996704af746142', 0, 1332826595),
	('63d836eaba0ebba4fa31f53005e51f8b', 16, 1332687202),
	('85e5421fcc2efc908eb831c0c8c6b92a', 0, 1332685020),
	('08daae7d723790ff25ff401e5d892f26', 0, 1332685104),
	('6a5c698ebc858241931764d9722471a8', 1, 1332685951),
	('446dfaeaba0985e2e2d16e1d7a9bb6ae', 0, 1332685167),
	('76afb823b10194d255c7ab4ab0b7f99e', 2, 1332686948),
	('68d2b7f4c1b83991e85c9c806bafdaea', 1, 1332685592),
	('ee8a94158ccec7345470281bcbbbff0b', 0, 1332685628),
	('791d28abca49dae3bd8e4365d5d7f059', 2, 1332685629),
	('c6096f1ab717c8ef4eeeb90b58de00e5', 12, 1332685847),
	('c9da2d0ab2a193cc0994b8aab4cc7958', 3, 1332685839),
	('e53822abdd7534b3603e5c87609f619b', 1, 1332685917),
	('54f078b77ced2edf7b77d993e1f60203', 1, 1332688941),
	('d36c3c747c1505eeaebb8959aa818eba', 1, 1332686952),
	('02d7bacaac27746c387e0acc183f835b', 1, 1332685997),
	('b530d4438b5693dfca36c077f0d32b1e', 0, 1332686093),
	('6c04a46f652eda723b826b2970826e66', 0, 1332686091),
	('65197ee51e04f5b5c0bb3d3d28e55197', 0, 1332686080),
	('11b7d9651a40b615bd1f607998a20604', 1, 1332688940),
	('971dd45a42818fc1db5da24ced3b49ef', 1, 1332688938),
	('89da580d40b15c4850f45cc3ea8bdc84', 1, 1332688937),
	('e40b71bac259301fa980ec4180af9b82', 1, 1332687407),
	('f2790b6f7b24ff7658fe23811d4f58aa', 0, 1332688933),
	('2f6f4931fe4ed7372c97ddb45797d106', 0, 1332688993),
	('0c8024984e2246b28ed0419d164fe322', 3, 1332846128),
	('9a4171467d1e079388a619db3faeb3b4', 3, 1332748244),
	('c868d4dca583a3b56a8f5376e457c4df', 3, 1332746915),
	('6e100b69ff1e4e973f5746125c331084', 0, 1332746746),
	('d741f05d70f1cc4cbbb1b40d785c4f8e', 8, 1332727903),
	('91ec52917580f78eacdf4dac7825b9ee', 0, 1332729612),
	('5bb0ea18263dc7a450460898f5948584', 0, 1332729620),
	('1ff12921c58772421fd74aca838b56d9', 0, 1332729622),
	('dccb1878f43a3aca4f0d7f066168cc5b', 0, 1332732046),
	('92a28b6ae4c8de71bd6012be79b7b264', 9, 1332827427),
	('fa28bb1717cc3eaa63d4d6413f436f82', 7, 1332819105),
	('5dcb18bdd0015a4f1d25a4414428ef34', 6, 1332846292),
	('0036bd6421227ae1f64376db16edca98', 5, 1332813347),
	('0f9b70cc15cf03aa1dc262dff7919703', 5, 1332814588),
	('437d6fbd6d4d37a4f6ed620316e625b8', 5, 1332814585),
	('0389d6429dbc6f34f020c123302b8bb5', 1, 1332819598),
	('6614c27bb505a06d5da5d4556e3cf27d', 4, 1332846292),
	('bf6bdbf8e734554783aed3fb49665d4d', 0, 1332747172),
	('bc636e3ee30e008c16f3559be439a073', 0, 1332748297),
	('502d362cd3e890b68b689ca33eed7a27', 1, 1332820759),
	('6c76be1e3f4c8a5082b2694fbe36cacb', 1, 1332847004),
	('1107aecaa635d5d52ad3ca533ed6d8a5', 0, 1332823856),
	('8d97fc9a4d3965e87cc128cb73289a72', 0, 1332770760),
	('1b3c73c843932dd0e0c5a8b9934493a4', 0, 1332846292),
	('01828b426eb2b14b61bef2c943a6ebe4', 0, 1332772417),
	('2a15dd8aa5e54b4d42c4cdee7228c04f', 8, 1332846292),
	('9f8225a090141f560f54667a9d5af33e', 0, 1332773444),
	('201a0527e2031500ea5664f4e51444f5', 0, 1332773474),
	('03be5dbfdd6cf577ac4d47ed629aa217', 0, 1332773485),
	('aad982faf40b43291f93113245f49710', 0, 1332773501),
	('9e20322b12bd95cdcbe71e0c9b95df30', 0, 1332774201),
	('2f8d3b54e0e23e40e69b1325ec61da6c', 8, 1332846292),
	('fef8f7666ba9208983ebf1977ad6a1ef', 0, 1332846876),
	('8f40e8f804143a6ed6d8a5481701c513', 7, 1332846995),
	('6d21c6a78a18c405af10990f711c7555', 1, 1332846997),
	('47c89997f9636c5855209db1183e6ab4', 12, 1332846998),
	('f50348ef025f8289c2197f26e2a398ea', 3, 1332847000),
	('9807d3a3e223911cbe75579577a44dbe', 3, 1332847001),
	('6f754253959a48214e23a1647bbaf933', 1, 1332847004),
	('7218f265a12a88bdca4e0600bca25d57', 0, 1332847006),
	('8a826046d19453b2d1345e4f96fcd40a', 0, 1332847007),
	('34b8a12374000dd50e01a4a51e7f2601', 0, 1332847009),
	('7225fbaf0a5ff6929c20ffd80aeba1bb', 0, 1332847010),
	('024e9ce3743e3ba2f94c5cdfca0a1865', 0, 1332847012),
	('50b7878e2d38d37abd5fcbef7392821e', 0, 1332847013),
	('aea492bc29ea4302807e2f2dd8e6f56a', 0, 1332847015),
	('203c137495f35cb1d259fd15ff13fb34', 0, 1332810895),
	('9acda4b60736e5086253a9186ab9a796', 0, 1332847018),
	('11028d678ba5097c23633c0bfc8afb6d', 0, 1332847019),
	('b830b91d57369ea71da38d0aefa1af52', 0, 1332847021),
	('84fb8ef6b1b426ef7943ae1e37df48ec', 0, 1332847022),
	('dd29e26930754ab7c54f730af79d0a1b', 0, 1332847024),
	('eaeb19e631977bf53c69143d22e21865', 0, 1332847025),
	('91318b9b182094abff77f43d64ec5f58', 0, 1332847027),
	('0595b0c351bb036063365e8401b8ac94', 0, 1332847028),
	('33369cca77fd406a61e86a3106683933', 0, 1332847029),
	('f0b6382202cb9dec21b96e89fb5d1786', 0, 1332847031),
	('fb07b6de4123ea9bf2805e185639432a', 0, 1332847032),
	('a7c08917ddd49d2344b9ae13b0a625d4', 0, 1332847035),
	('efbae4da26f0f322738037e4009e3d71', 0, 1332847037),
	('a3657643a8cc09d95395cd826b3313aa', 8, 1332847038),
	('946921c2c05c361bbcd6cd78b01aa914', 0, 1332847040),
	('d9c6754c5bb85e3a15ed19f1228394a7', 0, 1332847041),
	('806786e5dce4a55bc4b5261b465e1896', 0, 1332847043),
	('3e395734396d9eb6a85521ddbf0e50b1', 1, 1332847047),
	('a452f3dd174539a1c221cf77616e8b2e', 1, 1332847049),
	('238d98cd55fea779d0dbcb0f8f255fb3', 1, 1332847051),
	('f1fa04db5cd27373bfd02fa5aaba5861', 3, 1332847052),
	('bb1c8f8b4e14b9adfe7d981a39fde798', 1, 1332847054),
	('59dc325e6a7f14ecbca23e45d99dc815', 2, 1332847055),
	('6a8c55be3576846c17d989d2b7cd7279', 1, 1332847058),
	('48c711b180950fd8db799f7fcf20d849', 2, 1332847060),
	('c28694e6711e4a592e85f1ee5f47f839', 1, 1332847062),
	('c00c642054a100cc884a83530dbdedaa', 1, 1332847063),
	('ddbf2285d56ab298ca4e528be31c7f31', 1, 1332847065),
	('ea1d13eae5a55fd400aecf7fa32b1ec5', 1, 1332847066),
	('4b1c7bd40c2be8f4bbcb73105da75cbe', 8, 1332847068),
	('40d31318740cab1ca05746fc7736bfa7', 4, 1332847070),
	('fa8d2f93d6f1f80f7ecc310f4c5077cf', 8, 1332828835),
	('27d53be762c616ec86d47de131ce1839', 0, 1332820790),
	('4193068025884b58450a79137e140bdb', 0, 1332820787),
	('831b4c9815fd064109aecab5a2b98f52', 0, 1332820795),
	('8622218f1029eb0978771906e5acaa6f', 0, 1332820800),
	('421c4f0cbce58f3a702985af69b1e80a', 0, 1332820807),
	('85c2754f71056a7e475f05a1685a7525', 0, 1332820814),
	('ad4e29fcc941da9b55acf78642331445', 0, 1332820822),
	('e3033fb6db8e91c8c722d2f146048c66', 0, 1332812003),
	('09192b7d2230563f4798c051d4f2a7c6', 0, 1332811681),
	('3801b956a1f108dc9f9718ba6e556869', 0, 1332819338),
	('2f50ccc3707402a1df3ba884d1df28b2', 42, 1332813748),
	('2260f2325c9d70a3d3ee920105a09420', 7, 1332846995),
	('893a3fc8b57e702cab7d3f3b4b64a4c8', 1, 1332819432),
	('04271502d60c497b370455338b00dfd4', 3, 1332844412),
	('abfceee20f12292a8ebcc7c4549890be', 3, 1332844417),
	('b27ab8dfbb3a0d8b26ad2e60b3c4b12b', 3, 1332844437),
	('633f7132b2a694f30b3aa028101ea6b6', 3, 1332847000),
	('e91ef01fd0366670f77fc967e6c48087', 1, 1332847288),
	('d5110b052edb293276a9dfe16632ce5d', 0, 1332820600),
	('5349c9d2c82dab1fa368468f146c347a', 0, 1332823917),
	('909cf2ec3546186b70bc2885b8560e57', 0, 1332826439),
	('c1686520e2218fdecc175bb8498bc7a3', 0, 1332823904),
	('801e58e62598a490e955c60723ae9044', 2, 1332825007),
	('67fdf3f1a5bc9f13d7a166740b572c4f', 0, 1332824099),
	('4dba8c7e10d3451dc05af9a128f28d4c', 2, 1332826514),
	('9238d02aba5be4ded6caeaf22525fc5a', 0, 1332826493),
	('32de5a36f0c9b952711cdf0cfb15c628', 0, 1332826484),
	('d966e457049b00d07922dc73d541fcff', 1, 1332826471),
	('1c68a35acf1ca1fc8eacd93d6e8815f9', 0, 1332826453),
	('eb8d2ff0127e1d5d566a34068daf2e74', 2, 1332847073),
	('1ce580d4cc02b8dcde793ce641d4d6af', 0, 1332824798),
	('9249100ed98c2d2d8696e73adad73f46', 0, 1332825011),
	('a2b3a479e2dc8c305a19dd60fdde36db', 0, 1332825660),
	('8ef8dcd078a9fbc64e4da810e940c71f', 2, 1332847073),
	('4b6bb3c5f8843746a5e8559bb2552774', 0, 1332847074),
	('c87bc85fa3b473ba65a9afe449509558', 0, 1332847074),
	('4eb9f0a3e34be2ab34763ef3426ac345', 0, 1332847076),
	('81eca275ac68e3069f6d020b5aea7134', 0, 1332847076),
	('cd53205687a6ab9f34b3b8834c7cbb37', 1, 1332847077),
	('59c0260963ff283809551c73181d8bf1', 1, 1332847077),
	('2278f30d7ba2eeb7e2232483c724b00e', 0, 1332847079),
	('2ad81e91d5e689770fae09359599eee7', 0, 1332847079),
	('568bbe95d95f1a2abf37c406b131054e', 3, 1332825994),
	('cbe93cede51474ffd8a025a224eeb540', 0, 1332826540),
	('5c9694f61ce2bb767ae6ce7301caf32a', 0, 1332826551),
	('55ed7c25e6ae6077f2af52cf67c5e748', 0, 1332826567),
	('87dad093a4b41f2c2ae6431e61444af3', 0, 1332826584),
	('3dccaee3abdf7487d0ac24cf9c0c6d86', 0, 1332826605),
	('35ee2ff39574f741aedac9d2bc5fa9b3', 0, 1332826617),
	('12d074977de0749c1a15320d371b06c2', 0, 1332826631),
	('3b1a2c57759550567432c70e7fdddd60', 0, 1332826640),
	('05add1c25bfcd22f8e856a4b5f487c43', 0, 1332826338),
	('079979e10c682abf655c2bf8b5285043', 0, 1332826428),
	('9b2a7662a4b7dce2c99408b79b46c5cb', 3, 1332833584),
	('6f93ba4cb16a6b6cdeed8063a794f09f', 12, 1332846998),
	('f57146f1537caf357d938a2f2e0dc728', 3, 1332847001),
	('1b0f3cb6ce5634fe703de625998712f7', 0, 1332847006),
	('e58368a90100c88827bd920f8bd490f8', 0, 1332847007),
	('25cc64508fd24f8a1fcd7eb06e49bb6d', 0, 1332847009),
	('733932351f92d7dae6da0629eb04153f', 0, 1332847010),
	('e41f5a9828193688b920a4cc1e866801', 0, 1332847012),
	('474874ce57d989c056189438ed9ec2b9', 0, 1332847013),
	('decace580f6e0408b35572830b102820', 0, 1332847015),
	('7e2d87904816c1180271f789bf5f5011', 0, 1332847019),
	('bdb9a165a3a2e701b73c19fa252a91b2', 0, 1332847021),
	('2a267b68ca5a4bbe2a87ebf13d6cab21', 0, 1332847022),
	('d0e8dd1fa39d30ee3789184d4cf4eb39', 0, 1332847024),
	('b3c93bf2181b5e4574c16534dd6bfa9c', 0, 1332847025),
	('f14accdea5cd1c7ccc02c4b396040f26', 0, 1332847027),
	('4fe479af159285ce48ef65bb72b20ab3', 0, 1332847028),
	('00f5f5e9dbed324a16260751f96779c7', 0, 1332847029),
	('233c413f0829962c06e5256b215fdb66', 0, 1332847031),
	('9b08ff471cdf890372212c57455269bb', 0, 1332847032),
	('1792ff5a4171dd9c59e9f4c9fa3e39fe', 0, 1332847035),
	('63355b59bd1c73ca0e15956a810256fa', 0, 1332847037),
	('daba1a677be8a351ec2d06f42ad41cae', 0, 1332828344),
	('4af61a56ccc9160ee396d82f75310f5c', 4, 1332829352),
	('72db201fca231f4ff26be7eb1dba495e', 16, 1332829375),
	('756eb1cd15d47fb1710ec1d3a50a7c3b', 3, 1332833934),
	('16ef8baa9b0377a8f6cf3c7f65cfc18f', 0, 1332835641),
	('0b70b287e545bda6e183b58b1f653c81', 0, 1332836865),
	('0a34a5760138ad2ebcee47172c7f2783', 2, 1332843097),
	('510fee902ddd21cfec86d4781103b520', 1, 1332839532),
	('90476c0ca33295f9737514695fbf9ff7', 0, 1332840578),
	('1d7493208ad4d0b3d65165f0f38a3c89', 5, 1332847080);
/*!40000 ALTER TABLE `mg_cache_count` ENABLE KEYS */;


# Dumping structure for table mg_wlsm.mg_category
DROP TABLE IF EXISTS `mg_category`;
CREATE TABLE IF NOT EXISTS `mg_category` (
  `catid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `module` varchar(15) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `modelid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `parentid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `arrparentid` varchar(255) NOT NULL,
  `child` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `arrchildid` mediumtext NOT NULL,
  `catname` varchar(30) NOT NULL,
  `style` varchar(5) NOT NULL,
  `image` varchar(100) NOT NULL,
  `description` mediumtext NOT NULL,
  `parentdir` varchar(100) NOT NULL,
  `catdir` varchar(30) NOT NULL,
  `url` varchar(100) NOT NULL,
  `content` mediumtext NOT NULL,
  `items` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `setting` mediumtext NOT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ismenu` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `letter` varchar(1) NOT NULL,
  `citems` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `pitems` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`catid`),
  KEY `module` (`module`,`parentid`,`listorder`,`catid`)
) ENGINE=MyISAM AUTO_INCREMENT=84 DEFAULT CHARSET=utf8;

# Dumping data for table mg_wlsm.mg_category: 83 rows
DELETE FROM `mg_category`;
/*!40000 ALTER TABLE `mg_category` DISABLE KEYS */;
INSERT INTO `mg_category` (`catid`, `module`, `type`, `modelid`, `parentid`, `arrparentid`, `child`, `arrchildid`, `catname`, `style`, `image`, `description`, `parentdir`, `catdir`, `url`, `content`, `items`, `hits`, `setting`, `listorder`, `ismenu`, `letter`, `citems`, `pitems`) VALUES
	(1, 'wslm', 0, 27, 0, '0', 1, '1,9,10,11,12,13,14', '关于我们', '', '', '', '', 'about', 'html/about/', '', 0, 0, 'array (\n  \'workflowid\' => \'1\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'template_category\' => \'category_about\',\n  \'template_list\' => \'list\',\n  \'template_show\' => \'show\',\n  \'template_print\' => \'print\',\n  \'upload_allowext\' => \'\',\n  \'upload_maxsize\' => \'\',\n  \'thumb_enable\' => \'0\',\n  \'thumb_width\' => \'\',\n  \'thumb_height\' => \'\',\n  \'watermark_enable\' => \'0\',\n  \'ishtml\' => \'1\',\n  \'content_ishtml\' => \'1\',\n  \'category_urlruleid\' => \'3\',\n  \'show_urlruleid\' => \'7\',\n)', 1, 1, '', 0, 0),
	(2, 'wslm', 0, 27, 0, '0', 1, '2,15,16,17', '新闻中心', '', '', '', '', 'news', 'html/news/', '', 0, 0, 'array (\n  \'workflowid\' => \'1\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'template_category\' => \'category_news\',\n  \'template_list\' => \'list_news\',\n  \'template_show\' => \'show\',\n  \'template_print\' => \'print\',\n  \'upload_allowext\' => \'\',\n  \'upload_maxsize\' => \'\',\n  \'thumb_enable\' => \'0\',\n  \'thumb_width\' => \'\',\n  \'thumb_height\' => \'\',\n  \'watermark_enable\' => \'0\',\n  \'ishtml\' => \'1\',\n  \'content_ishtml\' => \'1\',\n  \'category_urlruleid\' => \'3\',\n  \'show_urlruleid\' => \'7\',\n)', 2, 1, '', 0, 0),
	(3, 'wslm', 0, 27, 0, '0', 1, '3,18,19,20,21,22,23,24,25,26,27,28', '服务管理', '', '', '', '', 'service', 'html/service/', '', 0, 0, 'array (\n  \'workflowid\' => \'1\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'template_category\' => \'category_service\',\n  \'template_list\' => \'list\',\n  \'template_show\' => \'show\',\n  \'template_print\' => \'print\',\n  \'upload_allowext\' => \'\',\n  \'upload_maxsize\' => \'\',\n  \'thumb_enable\' => \'0\',\n  \'thumb_width\' => \'\',\n  \'thumb_height\' => \'\',\n  \'watermark_enable\' => \'0\',\n  \'ishtml\' => \'1\',\n  \'content_ishtml\' => \'1\',\n  \'category_urlruleid\' => \'3\',\n  \'show_urlruleid\' => \'10\',\n)', 3, 1, '', 0, 0),
	(4, 'wslm', 0, 27, 0, '0', 1, '4,29,30,31,32,33,34,35,36', '动漫文化', '', '', '', '', 'comic', 'html/comic/', '', 0, 0, 'array (\n  \'workflowid\' => \'1\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'template_category\' => \'category\',\n  \'template_list\' => \'list_culture\',\n  \'template_show\' => \'show\',\n  \'template_print\' => \'print\',\n  \'upload_allowext\' => \'\',\n  \'upload_maxsize\' => \'\',\n  \'thumb_enable\' => \'0\',\n  \'thumb_width\' => \'\',\n  \'thumb_height\' => \'\',\n  \'watermark_enable\' => \'0\',\n  \'ishtml\' => \'1\',\n  \'content_ishtml\' => \'1\',\n  \'category_urlruleid\' => \'3\',\n  \'show_urlruleid\' => \'7\',\n)', 4, 1, '', 0, 0),
	(5, 'wslm', 0, 27, 0, '0', 1, '5,37,38,39,40,41,42,43,44,45,46,47,48,49,50,78,79,80,81,82', '产品展示', '', '', '', '', 'product', 'html/product/', '', 0, 0, 'array (\n  \'workflowid\' => \'1\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'template_category\' => \'category_products\',\n  \'template_list\' => \'list_products\',\n  \'template_show\' => \'show\',\n  \'template_print\' => \'print\',\n  \'upload_allowext\' => \'\',\n  \'upload_maxsize\' => \'\',\n  \'thumb_enable\' => \'0\',\n  \'thumb_width\' => \'\',\n  \'thumb_height\' => \'\',\n  \'watermark_enable\' => \'0\',\n  \'ishtml\' => \'1\',\n  \'content_ishtml\' => \'1\',\n  \'category_urlruleid\' => \'3\',\n  \'show_urlruleid\' => \'7\',\n)', 5, 1, '', 0, 0),
	(6, 'wslm', 0, 27, 0, '0', 1, '6,51,52,53,54', '成功案例', '', '', '', '', 'case', 'html/case/', '', 0, 0, 'array (\n  \'workflowid\' => \'1\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'template_category\' => \'category_case\',\n  \'template_list\' => \'list_culture\',\n  \'template_show\' => \'show\',\n  \'template_print\' => \'print\',\n  \'upload_allowext\' => \'\',\n  \'upload_maxsize\' => \'\',\n  \'thumb_enable\' => \'0\',\n  \'thumb_width\' => \'\',\n  \'thumb_height\' => \'\',\n  \'watermark_enable\' => \'0\',\n  \'ishtml\' => \'1\',\n  \'content_ishtml\' => \'1\',\n  \'category_urlruleid\' => \'3\',\n  \'show_urlruleid\' => \'10\',\n)', 6, 1, '', 0, 0),
	(7, 'wslm', 0, 27, 0, '0', 1, '7,55,56,57,58,59,83', '投资合作', '', '', '', '', 'invest', 'html/invest/', '', 0, 0, 'array (\n  \'workflowid\' => \'1\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'template_category\' => \'category_invest\',\n  \'template_list\' => \'list\',\n  \'template_show\' => \'show\',\n  \'template_print\' => \'print\',\n  \'upload_allowext\' => \'\',\n  \'upload_maxsize\' => \'\',\n  \'thumb_enable\' => \'0\',\n  \'thumb_width\' => \'\',\n  \'thumb_height\' => \'\',\n  \'watermark_enable\' => \'0\',\n  \'ishtml\' => \'1\',\n  \'content_ishtml\' => \'1\',\n  \'category_urlruleid\' => \'3\',\n  \'show_urlruleid\' => \'10\',\n)', 7, 1, '', 0, 0),
	(8, 'wslm', 0, 27, 0, '0', 1, '8,60,61', '联系我们', '', '', '', '', 'contact', 'html/contact/', '', 0, 0, 'array (\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'template_category\' => \'category\',\n  \'template_list\' => \'list\',\n  \'template_show\' => \'show\',\n  \'template_print\' => \'print\',\n  \'workflowid\' => \'1\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n)', 8, 1, '', 0, 0),
	(9, 'wslm', 1, 0, 1, '0,1', 0, '9', '企业简介', '', '', '', 'about/', 'introduction', 'html/about/introduction/', '', 0, 0, 'array (\n  \'template\' => \'page\',\n  \'ishtml\' => \'1\',\n  \'category_urlruleid\' => \'3\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n)', 9, 0, '', 0, 0),
	(10, 'wslm', 1, 0, 1, '0,1', 0, '10', '企业文化', '', '', '', 'about/', 'culture', 'html/about/culture/', '', 0, 0, 'array (\n  \'template\' => \'page\',\n  \'ishtml\' => \'1\',\n  \'category_urlruleid\' => \'3\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n)', 10, 0, '', 0, 0),
	(11, 'wslm', 1, 0, 1, '0,1', 0, '11', '资质荣誉', '', '', '', 'about/', 'honor', 'html/about/honor/', '', 0, 0, 'array (\n  \'template\' => \'page\',\n  \'ishtml\' => \'1\',\n  \'category_urlruleid\' => \'3\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n)', 11, 0, '', 0, 0),
	(12, 'wslm', 1, 0, 1, '0,1', 0, '12', '组织架构', '', '', '', 'about/', 'structure', 'html/about/structure/', '', 0, 0, 'array (\n  \'template\' => \'page\',\n  \'ishtml\' => \'1\',\n  \'category_urlruleid\' => \'3\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n)', 12, 0, '', 0, 0),
	(13, 'wslm', 0, 29, 1, '0,1', 0, '13', '企业团队', '', '', '', 'about/', 'team', 'html/about/team/', '', 7, 12, 'array (\n  \'workflowid\' => \'1\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'template_category\' => \'category\',\n  \'template_list\' => \'list_team\',\n  \'template_show\' => \'show\',\n  \'template_print\' => \'print\',\n  \'upload_allowext\' => \'\',\n  \'upload_maxsize\' => \'\',\n  \'thumb_enable\' => \'0\',\n  \'thumb_width\' => \'\',\n  \'thumb_height\' => \'\',\n  \'watermark_enable\' => \'0\',\n  \'ishtml\' => \'1\',\n  \'content_ishtml\' => \'1\',\n  \'category_urlruleid\' => \'3\',\n  \'show_urlruleid\' => \'7\',\n)', 13, 1, '', 0, 0),
	(14, 'wslm', 0, 32, 1, '0,1', 0, '14', '合作伙伴', '', '', '', 'about/', 'cooperation', 'html/about/cooperation/', '', 1, 1, 'array (\n  \'workflowid\' => \'1\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'template_category\' => \'category\',\n  \'template_list\' => \'list_partner\',\n  \'template_show\' => \'show\',\n  \'template_print\' => \'print\',\n  \'upload_allowext\' => \'\',\n  \'upload_maxsize\' => \'\',\n  \'thumb_enable\' => \'0\',\n  \'thumb_width\' => \'\',\n  \'thumb_height\' => \'\',\n  \'watermark_enable\' => \'0\',\n  \'ishtml\' => \'1\',\n  \'content_ishtml\' => \'1\',\n  \'category_urlruleid\' => \'3\',\n  \'show_urlruleid\' => \'7\',\n)', 14, 1, '', 0, 0),
	(15, 'wslm', 0, 21, 2, '0,2', 0, '15', '网站公告', '', '', '', 'news/', 'notice', 'html/news/notice/', '', 12, 1, 'array (\n  \'workflowid\' => \'1\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'template_category\' => \'category\',\n  \'template_list\' => \'list_news\',\n  \'template_show\' => \'show\',\n  \'template_print\' => \'print\',\n  \'upload_allowext\' => \'\',\n  \'upload_maxsize\' => \'\',\n  \'thumb_enable\' => \'0\',\n  \'thumb_width\' => \'\',\n  \'thumb_height\' => \'\',\n  \'watermark_enable\' => \'0\',\n  \'ishtml\' => \'1\',\n  \'content_ishtml\' => \'1\',\n  \'category_urlruleid\' => \'3\',\n  \'show_urlruleid\' => \'7\',\n)', 15, 1, '', 0, 0),
	(16, 'wslm', 0, 21, 2, '0,2', 0, '16', '企业新闻', '', '', '', 'news/', 'news', 'html/news/news/', '', 3, 0, 'array (\n  \'workflowid\' => \'1\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'template_category\' => \'category\',\n  \'template_list\' => \'list_news\',\n  \'template_show\' => \'show\',\n  \'template_print\' => \'print\',\n  \'upload_allowext\' => \'\',\n  \'upload_maxsize\' => \'\',\n  \'thumb_enable\' => \'0\',\n  \'thumb_width\' => \'\',\n  \'thumb_height\' => \'\',\n  \'watermark_enable\' => \'0\',\n  \'ishtml\' => \'1\',\n  \'content_ishtml\' => \'1\',\n  \'category_urlruleid\' => \'3\',\n  \'show_urlruleid\' => \'7\',\n)', 16, 1, '', 0, 0),
	(17, 'wslm', 0, 21, 2, '0,2', 0, '17', '行业资讯', '', '', '', 'news/', 'information', 'html/news/information/', '', 3, 1, 'array (\n  \'workflowid\' => \'1\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'template_category\' => \'category\',\n  \'template_list\' => \'list_news\',\n  \'template_show\' => \'show\',\n  \'template_print\' => \'print\',\n  \'upload_allowext\' => \'\',\n  \'upload_maxsize\' => \'\',\n  \'thumb_enable\' => \'0\',\n  \'thumb_width\' => \'\',\n  \'thumb_height\' => \'\',\n  \'watermark_enable\' => \'0\',\n  \'ishtml\' => \'1\',\n  \'content_ishtml\' => \'1\',\n  \'category_urlruleid\' => \'3\',\n  \'show_urlruleid\' => \'7\',\n)', 17, 1, '', 0, 0),
	(18, 'wslm', 1, 0, 3, '0,3', 0, '18', '服务理念', '', '', '', 'service/', 'views', 'html/service/views/', '', 0, 0, 'array (\n  \'template\' => \'page\',\n  \'ishtml\' => \'1\',\n  \'category_urlruleid\' => \'3\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n)', 18, 0, '', 0, 0),
	(19, 'wslm', 0, 27, 3, '0,3', 1, '19,20,21,22,23,24,25,26,27', '服务范围', '', '', '', 'service/', 'scope', 'html/service/scope/', '', 0, 0, 'array (\n  \'workflowid\' => \'1\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'template_category\' => \'category\',\n  \'template_list\' => \'list\',\n  \'template_show\' => \'show\',\n  \'template_print\' => \'print\',\n  \'upload_allowext\' => \'doc|docx|xls|ppt|wps|zip|rar|txt|jpg|jpeg|gif|bmp|swf|png\',\n  \'upload_maxsize\' => \'1024000\',\n  \'thumb_enable\' => \'1\',\n  \'thumb_width\' => \'300\',\n  \'thumb_height\' => \'300\',\n  \'watermark_enable\' => \'1\',\n  \'ishtml\' => \'1\',\n  \'content_ishtml\' => \'1\',\n  \'category_urlruleid\' => \'3\',\n  \'show_urlruleid\' => \'7\',\n)', 19, 1, '', 0, 0),
	(20, 'wslm', 1, 0, 19, '0,3,19', 0, '20', '动漫COSPLAY策划', '', '', '', 'service/scope/', 'cosplay', 'html/service/scope/cosplay/', '', 0, 0, 'array (\n  \'template\' => \'page\',\n  \'ishtml\' => \'1\',\n  \'category_urlruleid\' => \'3\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n)', 20, 0, '', 0, 0),
	(21, 'wslm', 1, 0, 19, '0,3,19', 0, '21', '动漫产品形象策划', '', '', '', 'service/scope/', 'product', 'html/service/scope/product/', '', 0, 0, 'array (\n  \'template\' => \'page\',\n  \'ishtml\' => \'1\',\n  \'category_urlruleid\' => \'3\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n)', 21, 0, '', 0, 0),
	(22, 'wslm', 1, 0, 19, '0,3,19', 0, '22', '动漫渠道建设策划', '', '', '', 'service/scope/', 'channel', 'html/service/scope/channel/', '', 0, 0, 'array (\n  \'template\' => \'page\',\n  \'ishtml\' => \'1\',\n  \'category_urlruleid\' => \'3\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n)', 22, 0, '', 0, 0),
	(23, 'wslm', 1, 0, 19, '0,3,19', 0, '23', '动漫推广策划', '', '', '', 'service/scope/', 'promotion', 'html/service/scope/promotion/', '', 0, 0, 'array (\n  \'template\' => \'page\',\n  \'ishtml\' => \'1\',\n  \'category_urlruleid\' => \'3\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n)', 23, 0, '', 0, 0),
	(24, 'wslm', 1, 0, 19, '0,3,19', 0, '24', '动漫网络营销策划', '', '', '', 'service/scope/', 'marketing', 'html/service/scope/marketing/', '', 0, 0, 'array (\n  \'template\' => \'page\',\n  \'ishtml\' => \'1\',\n  \'category_urlruleid\' => \'3\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n)', 24, 0, '', 0, 0),
	(25, 'wslm', 1, 0, 19, '0,3,19', 0, '25', '动漫展会活动策划', '', '', '', 'service/scope/', 'show', 'html/service/scope/show/', '', 0, 0, 'array (\n  \'template\' => \'page\',\n  \'ishtml\' => \'1\',\n  \'category_urlruleid\' => \'3\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n)', 25, 0, '', 0, 0),
	(26, 'wslm', 1, 0, 19, '0,3,19', 0, '26', '动漫终端设计策划', '', '', '', 'service/scope/', 'anime terminal', 'html/service/scope/anime terminal/', '', 0, 0, 'array (\n  \'template\' => \'page\',\n  \'ishtml\' => \'1\',\n  \'category_urlruleid\' => \'3\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n)', 26, 0, '', 0, 0),
	(27, 'wslm', 1, 0, 19, '0,3,19', 0, '27', '动漫终端营销策划', '', '', '', 'service/scope/', 'terminal marketing', 'html/service/scope/terminal marketing/', '', 0, 0, 'array (\n  \'template\' => \'page\',\n  \'ishtml\' => \'1\',\n  \'category_urlruleid\' => \'3\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n)', 27, 0, '', 0, 0),
	(28, 'wslm', 1, 0, 3, '0,3', 0, '28', '运营流程', '', '', '', 'service/', 'flow', 'html/service/flow/', '', 0, 0, 'array (\n  \'template\' => \'page\',\n  \'ishtml\' => \'1\',\n  \'category_urlruleid\' => \'3\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n)', 28, 0, '', 0, 0),
	(29, 'wslm', 0, 31, 4, '0,4', 0, '29', '动漫常识', '', '', '', 'comic/', 'sense', 'html/comic/sense/', '', 1, 2, 'array (\n  \'workflowid\' => \'1\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'template_category\' => \'category\',\n  \'template_list\' => \'list_culture\',\n  \'template_show\' => \'show\',\n  \'template_print\' => \'print\',\n  \'upload_allowext\' => \'\',\n  \'upload_maxsize\' => \'\',\n  \'thumb_enable\' => \'0\',\n  \'thumb_width\' => \'\',\n  \'thumb_height\' => \'\',\n  \'watermark_enable\' => \'0\',\n  \'ishtml\' => \'1\',\n  \'content_ishtml\' => \'1\',\n  \'category_urlruleid\' => \'3\',\n  \'show_urlruleid\' => \'7\',\n)', 29, 1, '', 0, 0),
	(30, 'wslm', 0, 31, 4, '0,4', 0, '30', '国产动漫文化', '', '', '', 'comic/', 'home', 'html/comic/home/', '', 0, 0, 'array (\n  \'workflowid\' => \'1\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'template_category\' => \'category\',\n  \'template_list\' => \'list_sense\',\n  \'template_show\' => \'show\',\n  \'template_print\' => \'print\',\n  \'upload_allowext\' => \'\',\n  \'upload_maxsize\' => \'\',\n  \'thumb_enable\' => \'0\',\n  \'thumb_width\' => \'\',\n  \'thumb_height\' => \'\',\n  \'watermark_enable\' => \'0\',\n  \'ishtml\' => \'1\',\n  \'content_ishtml\' => \'1\',\n  \'category_urlruleid\' => \'3\',\n  \'show_urlruleid\' => \'7\',\n)', 30, 1, '', 0, 0),
	(31, 'wslm', 0, 31, 4, '0,4', 0, '31', '日本动漫文化', '', '', '', 'comic/', 'japan', 'html/comic/japan/', '', 0, 0, 'array (\n  \'workflowid\' => \'1\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'template_category\' => \'category\',\n  \'template_list\' => \'list_sense\',\n  \'template_show\' => \'show\',\n  \'template_print\' => \'print\',\n  \'upload_allowext\' => \'\',\n  \'upload_maxsize\' => \'\',\n  \'thumb_enable\' => \'0\',\n  \'thumb_width\' => \'\',\n  \'thumb_height\' => \'\',\n  \'watermark_enable\' => \'0\',\n  \'ishtml\' => \'1\',\n  \'content_ishtml\' => \'1\',\n  \'category_urlruleid\' => \'3\',\n  \'show_urlruleid\' => \'7\',\n)', 31, 1, '', 0, 0),
	(32, 'wslm', 0, 31, 4, '0,4', 0, '32', '欧美动漫文化', '', '', '', 'comic/', 'west', 'html/comic/west/', '', 0, 0, 'array (\n  \'workflowid\' => \'1\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'template_category\' => \'category\',\n  \'template_list\' => \'list_sense\',\n  \'template_show\' => \'show\',\n  \'template_print\' => \'print\',\n  \'upload_allowext\' => \'\',\n  \'upload_maxsize\' => \'\',\n  \'thumb_enable\' => \'0\',\n  \'thumb_width\' => \'\',\n  \'thumb_height\' => \'\',\n  \'watermark_enable\' => \'0\',\n  \'ishtml\' => \'1\',\n  \'content_ishtml\' => \'1\',\n  \'category_urlruleid\' => \'3\',\n  \'show_urlruleid\' => \'7\',\n)', 32, 1, '', 0, 0),
	(33, 'wslm', 0, 31, 4, '0,4', 0, '33', 'Cosplay文化', '', '', '', 'comic/', 'cosplay', 'html/comic/cosplay/', '', 0, 0, 'array (\n  \'workflowid\' => \'1\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'template_category\' => \'category\',\n  \'template_list\' => \'list_sense\',\n  \'template_show\' => \'show\',\n  \'template_print\' => \'print\',\n  \'upload_allowext\' => \'\',\n  \'upload_maxsize\' => \'\',\n  \'thumb_enable\' => \'0\',\n  \'thumb_width\' => \'\',\n  \'thumb_height\' => \'\',\n  \'watermark_enable\' => \'0\',\n  \'ishtml\' => \'1\',\n  \'content_ishtml\' => \'1\',\n  \'category_urlruleid\' => \'3\',\n  \'show_urlruleid\' => \'7\',\n)', 33, 1, '', 0, 0),
	(34, 'wslm', 0, 31, 4, '0,4', 0, '34', '模型文化', '', '', '', 'comic/', 'model', 'html/comic/model/', '', 0, 0, 'array (\n  \'workflowid\' => \'1\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'template_category\' => \'category\',\n  \'template_list\' => \'list_sense\',\n  \'template_show\' => \'show\',\n  \'template_print\' => \'print\',\n  \'upload_allowext\' => \'\',\n  \'upload_maxsize\' => \'\',\n  \'thumb_enable\' => \'0\',\n  \'thumb_width\' => \'\',\n  \'thumb_height\' => \'\',\n  \'watermark_enable\' => \'0\',\n  \'ishtml\' => \'1\',\n  \'content_ishtml\' => \'1\',\n  \'category_urlruleid\' => \'3\',\n  \'show_urlruleid\' => \'7\',\n)', 34, 1, '', 0, 0),
	(35, 'wslm', 0, 31, 4, '0,4', 0, '35', '桌游文化', '', '', '', 'comic/', 'board games', 'html/comic/board games/', '', 0, 0, 'array (\n  \'workflowid\' => \'1\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'template_category\' => \'category\',\n  \'template_list\' => \'list_sense\',\n  \'template_show\' => \'show\',\n  \'template_print\' => \'print\',\n  \'upload_allowext\' => \'\',\n  \'upload_maxsize\' => \'\',\n  \'thumb_enable\' => \'0\',\n  \'thumb_width\' => \'\',\n  \'thumb_height\' => \'\',\n  \'watermark_enable\' => \'0\',\n  \'ishtml\' => \'1\',\n  \'content_ishtml\' => \'1\',\n  \'category_urlruleid\' => \'3\',\n  \'show_urlruleid\' => \'7\',\n)', 35, 1, '', 0, 0),
	(36, 'wslm', 0, 31, 4, '0,4', 0, '36', 'TOP动漫展示', '', '', '', 'comic/', 'top', 'html/comic/top/', '', 0, 0, 'array (\n  \'workflowid\' => \'1\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'template_category\' => \'category\',\n  \'template_list\' => \'list_sense\',\n  \'template_show\' => \'show\',\n  \'template_print\' => \'print\',\n  \'upload_allowext\' => \'\',\n  \'upload_maxsize\' => \'\',\n  \'thumb_enable\' => \'0\',\n  \'thumb_width\' => \'\',\n  \'thumb_height\' => \'\',\n  \'watermark_enable\' => \'0\',\n  \'ishtml\' => \'1\',\n  \'content_ishtml\' => \'1\',\n  \'category_urlruleid\' => \'3\',\n  \'show_urlruleid\' => \'7\',\n)', 36, 1, '', 0, 0),
	(37, 'wslm', 0, 22, 5, '0,5', 1, '37,78,79,80,81,82', '模型', '', '', '', 'product/', 'model', 'html/product/model/', '', 0, 0, 'array (\n  \'workflowid\' => \'1\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'template_category\' => \'category_list_products\',\n  \'template_list\' => \'list_products\',\n  \'template_show\' => \'show\',\n  \'template_print\' => \'print\',\n  \'upload_allowext\' => \'\',\n  \'upload_maxsize\' => \'\',\n  \'thumb_enable\' => \'0\',\n  \'thumb_width\' => \'\',\n  \'thumb_height\' => \'\',\n  \'watermark_enable\' => \'0\',\n  \'ishtml\' => \'1\',\n  \'content_ishtml\' => \'1\',\n  \'category_urlruleid\' => \'3\',\n  \'show_urlruleid\' => \'7\',\n)', 37, 1, '', 0, 0),
	(38, 'wslm', 0, 22, 5, '0,5', 0, '38', '饰品', '', '', '', 'product/', 'accessories', 'html/product/accessories/', '', 0, 0, 'array (\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'template_category\' => \'category\',\n  \'template_list\' => \'list\',\n  \'template_show\' => \'show\',\n  \'template_print\' => \'print\',\n  \'workflowid\' => \'1\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n)', 38, 1, '', 0, 0),
	(39, 'wslm', 0, 22, 5, '0,5', 0, '39', '公仔', '', '', '', 'product/', 'doll', 'html/product/doll/', '', 0, 0, 'array (\n  \'workflowid\' => \'1\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'template_category\' => \'category\',\n  \'template_list\' => \'list_products\',\n  \'template_show\' => \'show\',\n  \'template_print\' => \'print\',\n  \'upload_allowext\' => \'\',\n  \'upload_maxsize\' => \'\',\n  \'thumb_enable\' => \'0\',\n  \'thumb_width\' => \'\',\n  \'thumb_height\' => \'\',\n  \'watermark_enable\' => \'0\',\n  \'ishtml\' => \'1\',\n  \'content_ishtml\' => \'1\',\n  \'category_urlruleid\' => \'3\',\n  \'show_urlruleid\' => \'7\',\n)', 39, 1, '', 0, 0),
	(40, 'wslm', 0, 22, 5, '0,5', 0, '40', 'COS道具', '', '', '', 'product/', 'cos', 'html/product/cos/', '', 0, 0, 'array (\n  \'workflowid\' => \'1\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'template_category\' => \'category\',\n  \'template_list\' => \'list_products\',\n  \'template_show\' => \'show\',\n  \'template_print\' => \'print\',\n  \'upload_allowext\' => \'\',\n  \'upload_maxsize\' => \'\',\n  \'thumb_enable\' => \'0\',\n  \'thumb_width\' => \'\',\n  \'thumb_height\' => \'\',\n  \'watermark_enable\' => \'0\',\n  \'ishtml\' => \'1\',\n  \'content_ishtml\' => \'1\',\n  \'category_urlruleid\' => \'3\',\n  \'show_urlruleid\' => \'7\',\n)', 40, 1, '', 0, 0),
	(41, 'wslm', 0, 22, 5, '0,5', 0, '41', '兵器', '', '', '', 'product/', 'weapon', 'html/product/weapon/', '', 0, 0, 'array (\n  \'workflowid\' => \'1\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'template_category\' => \'category\',\n  \'template_list\' => \'list_products\',\n  \'template_show\' => \'show\',\n  \'template_print\' => \'print\',\n  \'upload_allowext\' => \'\',\n  \'upload_maxsize\' => \'\',\n  \'thumb_enable\' => \'0\',\n  \'thumb_width\' => \'\',\n  \'thumb_height\' => \'\',\n  \'watermark_enable\' => \'0\',\n  \'ishtml\' => \'1\',\n  \'content_ishtml\' => \'1\',\n  \'category_urlruleid\' => \'3\',\n  \'show_urlruleid\' => \'7\',\n)', 41, 1, '', 0, 0),
	(42, 'wslm', 0, 22, 5, '0,5', 0, '42', '包', '', '', '', 'product/', 'bag', 'html/product/bag/', '', 0, 0, 'array (\n  \'workflowid\' => \'1\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'template_category\' => \'category\',\n  \'template_list\' => \'list_products\',\n  \'template_show\' => \'show\',\n  \'template_print\' => \'print\',\n  \'upload_allowext\' => \'\',\n  \'upload_maxsize\' => \'\',\n  \'thumb_enable\' => \'0\',\n  \'thumb_width\' => \'\',\n  \'thumb_height\' => \'\',\n  \'watermark_enable\' => \'0\',\n  \'ishtml\' => \'1\',\n  \'content_ishtml\' => \'1\',\n  \'category_urlruleid\' => \'3\',\n  \'show_urlruleid\' => \'7\',\n)', 42, 1, '', 0, 0),
	(43, 'wslm', 0, 22, 5, '0,5', 0, '43', '日用家居', '', '', '', 'product/', 'home', 'html/product/home/', '', 0, 0, 'array (\n  \'workflowid\' => \'1\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'template_category\' => \'category\',\n  \'template_list\' => \'list_products\',\n  \'template_show\' => \'show\',\n  \'template_print\' => \'print\',\n  \'upload_allowext\' => \'\',\n  \'upload_maxsize\' => \'\',\n  \'thumb_enable\' => \'0\',\n  \'thumb_width\' => \'\',\n  \'thumb_height\' => \'\',\n  \'watermark_enable\' => \'0\',\n  \'ishtml\' => \'1\',\n  \'content_ishtml\' => \'1\',\n  \'category_urlruleid\' => \'3\',\n  \'show_urlruleid\' => \'7\',\n)', 43, 1, '', 0, 0),
	(44, 'wslm', 0, 22, 5, '0,5', 0, '44', '文体用品', '', '', '', 'product/', '2s', 'html/product/2s/', '', 0, 0, 'array (\n  \'workflowid\' => \'1\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'template_category\' => \'category\',\n  \'template_list\' => \'list_products\',\n  \'template_show\' => \'show\',\n  \'template_print\' => \'print\',\n  \'upload_allowext\' => \'\',\n  \'upload_maxsize\' => \'\',\n  \'thumb_enable\' => \'0\',\n  \'thumb_width\' => \'\',\n  \'thumb_height\' => \'\',\n  \'watermark_enable\' => \'0\',\n  \'ishtml\' => \'1\',\n  \'content_ishtml\' => \'1\',\n  \'category_urlruleid\' => \'3\',\n  \'show_urlruleid\' => \'7\',\n)', 44, 1, '', 0, 0),
	(45, 'wslm', 0, 22, 5, '0,5', 0, '45', '桌游', '', '', '', 'product/', 'board games', 'html/product/board games/', '', 0, 0, 'array (\n  \'workflowid\' => \'1\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'template_category\' => \'category\',\n  \'template_list\' => \'list_products\',\n  \'template_show\' => \'show\',\n  \'template_print\' => \'print\',\n  \'upload_allowext\' => \'\',\n  \'upload_maxsize\' => \'\',\n  \'thumb_enable\' => \'0\',\n  \'thumb_width\' => \'\',\n  \'thumb_height\' => \'\',\n  \'watermark_enable\' => \'0\',\n  \'ishtml\' => \'1\',\n  \'content_ishtml\' => \'1\',\n  \'category_urlruleid\' => \'3\',\n  \'show_urlruleid\' => \'7\',\n)', 45, 1, '', 0, 0),
	(46, 'wslm', 0, 22, 5, '0,5', 0, '46', '数码', '', '', '', 'product/', 'digital', 'html/product/digital/', '', 0, 0, 'array (\n  \'workflowid\' => \'1\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'template_category\' => \'category\',\n  \'template_list\' => \'list_products\',\n  \'template_show\' => \'show\',\n  \'template_print\' => \'print\',\n  \'upload_allowext\' => \'\',\n  \'upload_maxsize\' => \'\',\n  \'thumb_enable\' => \'0\',\n  \'thumb_width\' => \'\',\n  \'thumb_height\' => \'\',\n  \'watermark_enable\' => \'0\',\n  \'ishtml\' => \'1\',\n  \'content_ishtml\' => \'1\',\n  \'category_urlruleid\' => \'3\',\n  \'show_urlruleid\' => \'7\',\n)', 46, 1, '', 0, 0),
	(47, 'wslm', 0, 22, 5, '0,5', 0, '47', '毛绒', '', '', '', 'product/', 'plush', 'html/product/plush/', '', 0, 0, 'array (\n  \'workflowid\' => \'1\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'template_category\' => \'category\',\n  \'template_list\' => \'list_products\',\n  \'template_show\' => \'show\',\n  \'template_print\' => \'print\',\n  \'upload_allowext\' => \'\',\n  \'upload_maxsize\' => \'\',\n  \'thumb_enable\' => \'0\',\n  \'thumb_width\' => \'\',\n  \'thumb_height\' => \'\',\n  \'watermark_enable\' => \'0\',\n  \'ishtml\' => \'1\',\n  \'content_ishtml\' => \'1\',\n  \'category_urlruleid\' => \'3\',\n  \'show_urlruleid\' => \'7\',\n)', 47, 1, '', 0, 0),
	(48, 'wslm', 0, 22, 5, '0,5', 0, '48', '最新产品', '', '', '', 'product/', 'new', 'html/product/new/', '', 0, 0, 'array (\n  \'workflowid\' => \'1\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'template_category\' => \'category\',\n  \'template_list\' => \'list_products\',\n  \'template_show\' => \'show\',\n  \'template_print\' => \'print\',\n  \'upload_allowext\' => \'\',\n  \'upload_maxsize\' => \'\',\n  \'thumb_enable\' => \'0\',\n  \'thumb_width\' => \'\',\n  \'thumb_height\' => \'\',\n  \'watermark_enable\' => \'0\',\n  \'ishtml\' => \'1\',\n  \'content_ishtml\' => \'1\',\n  \'category_urlruleid\' => \'3\',\n  \'show_urlruleid\' => \'7\',\n)', 48, 1, '', 0, 0),
	(49, 'wslm', 0, 22, 5, '0,5', 0, '49', '热门产品', '', '', '', 'product/', 'hot', 'html/product/hot/', '', 0, 0, 'array (\n  \'workflowid\' => \'1\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'template_category\' => \'category\',\n  \'template_list\' => \'list_products\',\n  \'template_show\' => \'show\',\n  \'template_print\' => \'print\',\n  \'upload_allowext\' => \'\',\n  \'upload_maxsize\' => \'\',\n  \'thumb_enable\' => \'0\',\n  \'thumb_width\' => \'\',\n  \'thumb_height\' => \'\',\n  \'watermark_enable\' => \'0\',\n  \'ishtml\' => \'1\',\n  \'content_ishtml\' => \'1\',\n  \'category_urlruleid\' => \'3\',\n  \'show_urlruleid\' => \'7\',\n)', 49, 1, '', 0, 0),
	(50, 'wslm', 0, 22, 5, '0,5', 0, '50', '其他', '', '', '', 'product/', 'other', 'html/product/other/', '', 0, 0, 'array (\n  \'workflowid\' => \'1\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'template_category\' => \'category\',\n  \'template_list\' => \'list_products\',\n  \'template_show\' => \'show\',\n  \'template_print\' => \'print\',\n  \'upload_allowext\' => \'\',\n  \'upload_maxsize\' => \'\',\n  \'thumb_enable\' => \'0\',\n  \'thumb_width\' => \'\',\n  \'thumb_height\' => \'\',\n  \'watermark_enable\' => \'0\',\n  \'ishtml\' => \'1\',\n  \'content_ishtml\' => \'1\',\n  \'category_urlruleid\' => \'3\',\n  \'show_urlruleid\' => \'7\',\n)', 50, 1, '', 0, 0),
	(51, 'wslm', 0, 26, 6, '0,6', 0, '51', '动漫店', '', '', '', 'case/', 'comic', 'html/case/comic/', '', 8, 0, 'array (\n  \'workflowid\' => \'1\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'template_category\' => \'category\',\n  \'template_list\' => \'list\',\n  \'template_show\' => \'show\',\n  \'template_print\' => \'print\',\n  \'upload_allowext\' => \'\',\n  \'upload_maxsize\' => \'\',\n  \'thumb_enable\' => \'0\',\n  \'thumb_width\' => \'\',\n  \'thumb_height\' => \'\',\n  \'watermark_enable\' => \'0\',\n  \'ishtml\' => \'1\',\n  \'content_ishtml\' => \'1\',\n  \'category_urlruleid\' => \'3\',\n  \'show_urlruleid\' => \'10\',\n)', 51, 1, '', 0, 0),
	(52, 'wslm', 0, 26, 6, '0,6', 0, '52', '玩具店', '', '', '', 'case/', 'toy', 'html/case/toy/', '', 0, 0, 'array (\n  \'workflowid\' => \'1\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'template_category\' => \'category\',\n  \'template_list\' => \'list\',\n  \'template_show\' => \'show\',\n  \'template_print\' => \'print\',\n  \'upload_allowext\' => \'\',\n  \'upload_maxsize\' => \'\',\n  \'thumb_enable\' => \'0\',\n  \'thumb_width\' => \'\',\n  \'thumb_height\' => \'\',\n  \'watermark_enable\' => \'0\',\n  \'ishtml\' => \'1\',\n  \'content_ishtml\' => \'1\',\n  \'category_urlruleid\' => \'3\',\n  \'show_urlruleid\' => \'10\',\n)', 52, 1, '', 0, 0),
	(53, 'wslm', 0, 26, 6, '0,6', 0, '53', '婴幼店', '', '', '', 'case/', 'baby', 'html/case/baby/', '', 0, 0, 'array (\n  \'workflowid\' => \'1\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'template_category\' => \'category\',\n  \'template_list\' => \'list\',\n  \'template_show\' => \'show\',\n  \'template_print\' => \'print\',\n  \'upload_allowext\' => \'\',\n  \'upload_maxsize\' => \'\',\n  \'thumb_enable\' => \'0\',\n  \'thumb_width\' => \'\',\n  \'thumb_height\' => \'\',\n  \'watermark_enable\' => \'0\',\n  \'ishtml\' => \'1\',\n  \'content_ishtml\' => \'1\',\n  \'category_urlruleid\' => \'3\',\n  \'show_urlruleid\' => \'10\',\n)', 53, 1, '', 0, 0),
	(54, 'wslm', 0, 26, 6, '0,6', 0, '54', '桌游吧', '', '', '', 'case/', 'board', 'html/case/board/', '', 0, 0, 'array (\n  \'workflowid\' => \'1\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'template_category\' => \'category\',\n  \'template_list\' => \'list\',\n  \'template_show\' => \'show\',\n  \'template_print\' => \'print\',\n  \'upload_allowext\' => \'\',\n  \'upload_maxsize\' => \'\',\n  \'thumb_enable\' => \'0\',\n  \'thumb_width\' => \'\',\n  \'thumb_height\' => \'\',\n  \'watermark_enable\' => \'0\',\n  \'ishtml\' => \'1\',\n  \'content_ishtml\' => \'1\',\n  \'category_urlruleid\' => \'3\',\n  \'show_urlruleid\' => \'10\',\n)', 54, 1, '', 0, 0),
	(55, 'wslm', 1, 0, 7, '0,7', 0, '55', '投资分析', '', '', '', 'invest/', 'analysis', 'html/invest/analysis/', '', 0, 0, 'array (\n  \'template\' => \'page\',\n  \'ishtml\' => \'1\',\n  \'category_urlruleid\' => \'3\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n)', 55, 0, '', 0, 0),
	(56, 'wslm', 1, 0, 7, '0,7', 0, '56', '顾问流程', '', '', '', 'invest/', 'flow', 'html/invest/flow/', '', 0, 0, 'array (\n  \'template\' => \'page\',\n  \'ishtml\' => \'1\',\n  \'category_urlruleid\' => \'3\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n)', 56, 0, '', 0, 0),
	(57, 'wslm', 1, 0, 7, '0,7', 0, '57', '合作政策', '', '', '', 'invest/', 'policy', 'html/invest/policy/', '', 0, 0, 'array (\n  \'template\' => \'page\',\n  \'ishtml\' => \'1\',\n  \'category_urlruleid\' => \'3\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n)', 57, 0, '', 0, 0),
	(58, 'wslm', 1, 0, 7, '0,7', 0, '58', '营销支持', '', '', '', 'invest/', 'support', 'html/invest/support/', '', 0, 0, 'array (\n  \'template\' => \'page\',\n  \'ishtml\' => \'1\',\n  \'category_urlruleid\' => \'3\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n)', 58, 0, '', 0, 0),
	(59, 'wslm', 2, 0, 7, '0,7', 0, '59', '成功案例', '', '', '', 'invest/', '', 'temp', '', 0, 0, '', 59, 0, '', 0, 0),
	(60, 'wslm', 1, 0, 8, '0,8', 0, '60', '联系方式', '', '', '', 'contact/', 'contact', 'html/contact/contact/', '', 0, 0, 'array (\n  \'template\' => \'page\',\n  \'ishtml\' => \'1\',\n  \'category_urlruleid\' => \'3\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n)', 60, 0, '', 0, 0),
	(61, 'wslm', 1, 0, 8, '0,8', 0, '61', '在线留言', '', '', '', 'contact/', 'message', 'html/contact/message/', '', 0, 0, 'array (\n  \'template\' => \'page\',\n  \'ishtml\' => \'1\',\n  \'category_urlruleid\' => \'3\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n)', 61, 0, '', 0, 0),
	(62, 'wslm', 0, 27, 0, '0', 1, '62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77', '其他管理', '', '', '', '', 'other', 'list.php?catid=62', '', 0, 0, 'array (\n  \'workflowid\' => \'1\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'template_category\' => \'category\',\n  \'template_list\' => \'list\',\n  \'template_show\' => \'show\',\n  \'template_print\' => \'print\',\n  \'upload_allowext\' => \'doc|docx|xls|ppt|wps|zip|rar|txt|jpg|jpeg|gif|bmp|swf|png\',\n  \'upload_maxsize\' => \'1024000\',\n  \'thumb_enable\' => \'0\',\n  \'thumb_width\' => \'300\',\n  \'thumb_height\' => \'300\',\n  \'watermark_enable\' => \'0\',\n  \'ishtml\' => \'0\',\n  \'content_ishtml\' => \'0\',\n  \'category_urlruleid\' => \'4\',\n  \'show_urlruleid\' => \'10\',\n)', 62, 1, '', 0, 0),
	(63, 'wslm', 0, 27, 62, '0,62', 1, '63,64,65,66,67,68,69,70,71,72,73,74,75', '首页十二幅', '', '', '', 'other/', 'index12', 'list.php?catid=63', '', 0, 0, 'array (\n  \'workflowid\' => \'1\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'template_category\' => \'category\',\n  \'template_list\' => \'list\',\n  \'template_show\' => \'show\',\n  \'template_print\' => \'print\',\n  \'upload_allowext\' => \'doc|docx|xls|ppt|wps|zip|rar|txt|jpg|jpeg|gif|bmp|swf|png\',\n  \'upload_maxsize\' => \'1024000\',\n  \'thumb_enable\' => \'1\',\n  \'thumb_width\' => \'300\',\n  \'thumb_height\' => \'300\',\n  \'watermark_enable\' => \'1\',\n  \'ishtml\' => \'0\',\n  \'content_ishtml\' => \'0\',\n  \'category_urlruleid\' => \'4\',\n  \'show_urlruleid\' => \'10\',\n)', 63, 0, '', 0, 0),
	(64, 'wslm', 0, 23, 63, '0,62,63', 0, '64', '首页01', '', '', '', 'other/index12/', 'index01', 'list.php?catid=64', '', 2, 0, 'array (\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'template_category\' => \'category\',\n  \'template_list\' => \'list\',\n  \'template_show\' => \'show\',\n  \'template_print\' => \'print\',\n  \'workflowid\' => \'1\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n)', 64, 1, '', 0, 0),
	(65, 'wslm', 0, 25, 63, '0,62,63', 0, '65', '首页02', '', '', '', 'other/index12/', 'index02', 'list.php?catid=65', '', 1, 0, 'array (\n  \'workflowid\' => \'1\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'template_category\' => \'category\',\n  \'template_list\' => \'list\',\n  \'template_show\' => \'show\',\n  \'template_print\' => \'print\',\n  \'upload_allowext\' => \'\',\n  \'upload_maxsize\' => \'\',\n  \'thumb_enable\' => \'0\',\n  \'thumb_width\' => \'\',\n  \'thumb_height\' => \'\',\n  \'watermark_enable\' => \'0\',\n  \'ishtml\' => \'0\',\n  \'content_ishtml\' => \'1\',\n  \'category_urlruleid\' => \'4\',\n  \'show_urlruleid\' => \'10\',\n)', 65, 1, '', 0, 0),
	(66, 'wslm', 0, 23, 63, '0,62,63', 0, '66', '首页03', '', '', '', 'other/index12/', 'index03', 'list.php?catid=66', '', 1, 0, 'array (\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'template_category\' => \'category\',\n  \'template_list\' => \'list\',\n  \'template_show\' => \'show\',\n  \'template_print\' => \'print\',\n  \'workflowid\' => \'1\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n)', 66, 1, '', 0, 0),
	(67, 'wslm', 0, 25, 63, '0,62,63', 0, '67', '首页04', '', '', '', 'other/index12/', 'index04', 'list.php?catid=67', '', 3, 0, 'array (\n  \'workflowid\' => \'1\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'template_category\' => \'category\',\n  \'template_list\' => \'list\',\n  \'template_show\' => \'show\',\n  \'template_print\' => \'print\',\n  \'upload_allowext\' => \'\',\n  \'upload_maxsize\' => \'\',\n  \'thumb_enable\' => \'0\',\n  \'thumb_width\' => \'\',\n  \'thumb_height\' => \'\',\n  \'watermark_enable\' => \'0\',\n  \'ishtml\' => \'0\',\n  \'content_ishtml\' => \'1\',\n  \'category_urlruleid\' => \'4\',\n  \'show_urlruleid\' => \'10\',\n)', 67, 1, '', 0, 0),
	(68, 'wslm', 0, 23, 63, '0,62,63', 0, '68', '首页05', '', '', '', 'other/index12/', 'index05', 'list.php?catid=68', '', 1, 0, 'array (\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'template_category\' => \'category\',\n  \'template_list\' => \'list\',\n  \'template_show\' => \'show\',\n  \'template_print\' => \'print\',\n  \'workflowid\' => \'1\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n)', 68, 1, '', 0, 0),
	(69, 'wslm', 0, 25, 63, '0,62,63', 0, '69', '首页06', '', '', '', 'other/index12/', 'index06', 'list.php?catid=69', '', 2, 0, 'array (\n  \'workflowid\' => \'1\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'template_category\' => \'category\',\n  \'template_list\' => \'list\',\n  \'template_show\' => \'show\',\n  \'template_print\' => \'print\',\n  \'upload_allowext\' => \'\',\n  \'upload_maxsize\' => \'\',\n  \'thumb_enable\' => \'0\',\n  \'thumb_width\' => \'\',\n  \'thumb_height\' => \'\',\n  \'watermark_enable\' => \'0\',\n  \'ishtml\' => \'0\',\n  \'content_ishtml\' => \'0\',\n  \'category_urlruleid\' => \'4\',\n  \'show_urlruleid\' => \'10\',\n)', 69, 1, '', 0, 0),
	(70, 'wslm', 0, 23, 63, '0,62,63', 0, '70', '首页07', '', '', '', 'other/index12/', 'index07', 'list.php?catid=70', '', 1, 0, 'array (\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'template_category\' => \'category\',\n  \'template_list\' => \'list\',\n  \'template_show\' => \'show\',\n  \'template_print\' => \'print\',\n  \'workflowid\' => \'1\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n)', 70, 1, '', 0, 0),
	(71, 'wslm', 0, 23, 63, '0,62,63', 0, '71', '首页08', '', '', '', 'other/index12/', 'index08', 'list.php?catid=71', '', 2, 0, 'array (\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'template_category\' => \'category\',\n  \'template_list\' => \'list\',\n  \'template_show\' => \'show\',\n  \'template_print\' => \'print\',\n  \'workflowid\' => \'1\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n)', 71, 1, '', 0, 0),
	(72, 'wslm', 0, 25, 63, '0,62,63', 0, '72', '首页09', '', '', '', 'other/index12/', 'index09', 'list.php?catid=72', '', 1, 0, 'array (\n  \'workflowid\' => \'1\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'template_category\' => \'category\',\n  \'template_list\' => \'list\',\n  \'template_show\' => \'show\',\n  \'template_print\' => \'print\',\n  \'upload_allowext\' => \'\',\n  \'upload_maxsize\' => \'\',\n  \'thumb_enable\' => \'0\',\n  \'thumb_width\' => \'\',\n  \'thumb_height\' => \'\',\n  \'watermark_enable\' => \'0\',\n  \'ishtml\' => \'0\',\n  \'content_ishtml\' => \'1\',\n  \'category_urlruleid\' => \'4\',\n  \'show_urlruleid\' => \'10\',\n)', 72, 1, '', 0, 0),
	(73, 'wslm', 0, 23, 63, '0,62,63', 0, '73', '首页10', '', '', '', 'other/index12/', 'index10', 'list.php?catid=73', '', 1, 0, 'array (\n  \'workflowid\' => \'1\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'template_category\' => \'category\',\n  \'template_list\' => \'list\',\n  \'template_show\' => \'show\',\n  \'template_print\' => \'print\',\n  \'upload_allowext\' => \'\',\n  \'upload_maxsize\' => \'\',\n  \'thumb_enable\' => \'0\',\n  \'thumb_width\' => \'\',\n  \'thumb_height\' => \'\',\n  \'watermark_enable\' => \'0\',\n  \'ishtml\' => \'0\',\n  \'content_ishtml\' => \'1\',\n  \'category_urlruleid\' => \'4\',\n  \'show_urlruleid\' => \'10\',\n)', 73, 1, '', 0, 0),
	(74, 'wslm', 0, 25, 63, '0,62,63', 0, '74', '首页11', '', '', '', 'other/index12/', 'index11', 'list.php?catid=74', '', 1, 0, 'array (\n  \'workflowid\' => \'1\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'template_category\' => \'category\',\n  \'template_list\' => \'list\',\n  \'template_show\' => \'show\',\n  \'template_print\' => \'print\',\n  \'upload_allowext\' => \'\',\n  \'upload_maxsize\' => \'\',\n  \'thumb_enable\' => \'0\',\n  \'thumb_width\' => \'\',\n  \'thumb_height\' => \'\',\n  \'watermark_enable\' => \'0\',\n  \'ishtml\' => \'0\',\n  \'content_ishtml\' => \'1\',\n  \'category_urlruleid\' => \'4\',\n  \'show_urlruleid\' => \'10\',\n)', 74, 1, '', 0, 0),
	(75, 'wslm', 0, 23, 63, '0,62,63', 0, '75', '首页12', '', '', '', 'other/index12/', 'index12', 'list.php?catid=75', '', 1, 0, 'array (\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'template_category\' => \'category\',\n  \'template_list\' => \'list\',\n  \'template_show\' => \'show\',\n  \'template_print\' => \'print\',\n  \'workflowid\' => \'1\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n)', 75, 1, '', 0, 0),
	(76, 'wslm', 0, 28, 62, '0,62', 0, '76', '首页策划图片', '', '', '', 'other/', 'plan', 'list.php?catid=76', '', 8, 0, 'array (\n  \'workflowid\' => \'1\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'template_category\' => \'category\',\n  \'template_list\' => \'list\',\n  \'template_show\' => \'show\',\n  \'template_print\' => \'print\',\n  \'upload_allowext\' => \'doc|docx|xls|ppt|wps|zip|rar|txt|jpg|jpeg|gif|bmp|swf|png\',\n  \'upload_maxsize\' => \'1024000\',\n  \'thumb_enable\' => \'1\',\n  \'thumb_width\' => \'300\',\n  \'thumb_height\' => \'300\',\n  \'watermark_enable\' => \'1\',\n  \'ishtml\' => \'0\',\n  \'content_ishtml\' => \'0\',\n  \'category_urlruleid\' => \'4\',\n  \'show_urlruleid\' => \'10\',\n)', 76, 1, '', 0, 0),
	(77, 'wslm', 0, 30, 62, '0,62', 0, '77', '产品栏目页滑动门', '', '', '', 'other/', 'proslider', 'list.php?catid=77', '', 4, 0, 'array (\n  \'workflowid\' => \'1\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'template_category\' => \'category\',\n  \'template_list\' => \'list\',\n  \'template_show\' => \'show\',\n  \'template_print\' => \'print\',\n  \'upload_allowext\' => \'doc|docx|xls|ppt|wps|zip|rar|txt|jpg|jpeg|gif|bmp|swf|png\',\n  \'upload_maxsize\' => \'1024000\',\n  \'thumb_enable\' => \'0\',\n  \'thumb_width\' => \'300\',\n  \'thumb_height\' => \'300\',\n  \'watermark_enable\' => \'0\',\n  \'ishtml\' => \'0\',\n  \'content_ishtml\' => \'0\',\n  \'category_urlruleid\' => \'4\',\n  \'show_urlruleid\' => \'10\',\n)', 77, 1, '', 0, 0),
	(78, 'wslm', 0, 22, 37, '0,5,37', 0, '78', '飞机', '', '', '', 'product/model/', 'plane', 'html/product/model/plane/', '', 2, 5, 'array (\n  \'workflowid\' => \'1\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'template_category\' => \'category\',\n  \'template_list\' => \'list_products\',\n  \'template_show\' => \'show\',\n  \'template_print\' => \'print\',\n  \'upload_allowext\' => \'\',\n  \'upload_maxsize\' => \'\',\n  \'thumb_enable\' => \'1\',\n  \'thumb_width\' => \'300\',\n  \'thumb_height\' => \'300\',\n  \'watermark_enable\' => \'0\',\n  \'ishtml\' => \'1\',\n  \'content_ishtml\' => \'1\',\n  \'category_urlruleid\' => \'3\',\n  \'show_urlruleid\' => \'7\',\n)', 78, 1, '', 0, 0),
	(79, 'wslm', 0, 22, 37, '0,5,37', 0, '79', '轮船', '', '', '', 'product/model/', 'ship', 'html/product/model/ship/', '', 0, 0, 'array (\n  \'workflowid\' => \'1\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'template_category\' => \'category\',\n  \'template_list\' => \'list_products\',\n  \'template_show\' => \'show\',\n  \'template_print\' => \'print\',\n  \'upload_allowext\' => \'\',\n  \'upload_maxsize\' => \'\',\n  \'thumb_enable\' => \'0\',\n  \'thumb_width\' => \'\',\n  \'thumb_height\' => \'\',\n  \'watermark_enable\' => \'0\',\n  \'ishtml\' => \'1\',\n  \'content_ishtml\' => \'1\',\n  \'category_urlruleid\' => \'3\',\n  \'show_urlruleid\' => \'7\',\n)', 79, 1, '', 0, 0),
	(80, 'wslm', 0, 22, 37, '0,5,37', 0, '80', '汽车', '', '', '', 'product/model/', 'car', 'html/product/model/car/', '', 0, 0, 'array (\n  \'workflowid\' => \'1\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'template_category\' => \'category\',\n  \'template_list\' => \'list_products\',\n  \'template_show\' => \'show\',\n  \'template_print\' => \'print\',\n  \'upload_allowext\' => \'\',\n  \'upload_maxsize\' => \'\',\n  \'thumb_enable\' => \'0\',\n  \'thumb_width\' => \'\',\n  \'thumb_height\' => \'\',\n  \'watermark_enable\' => \'0\',\n  \'ishtml\' => \'1\',\n  \'content_ishtml\' => \'1\',\n  \'category_urlruleid\' => \'3\',\n  \'show_urlruleid\' => \'7\',\n)', 80, 1, '', 0, 0),
	(81, 'wslm', 0, 22, 37, '0,5,37', 0, '81', '人模', '', '', '', 'product/model/', 'person', 'html/product/model/person/', '', 1, 0, 'array (\n  \'workflowid\' => \'1\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'template_category\' => \'category\',\n  \'template_list\' => \'list_products\',\n  \'template_show\' => \'show\',\n  \'template_print\' => \'print\',\n  \'upload_allowext\' => \'\',\n  \'upload_maxsize\' => \'\',\n  \'thumb_enable\' => \'0\',\n  \'thumb_width\' => \'\',\n  \'thumb_height\' => \'\',\n  \'watermark_enable\' => \'0\',\n  \'ishtml\' => \'1\',\n  \'content_ishtml\' => \'1\',\n  \'category_urlruleid\' => \'3\',\n  \'show_urlruleid\' => \'7\',\n)', 81, 1, '', 0, 0),
	(82, 'wslm', 0, 22, 37, '0,5,37', 0, '82', '圣斗士', '', '', '', 'product/model/', 'star', 'html/product/model/star/', '', 0, 0, 'array (\n  \'workflowid\' => \'1\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'template_category\' => \'category\',\n  \'template_list\' => \'list_products\',\n  \'template_show\' => \'show\',\n  \'template_print\' => \'print\',\n  \'upload_allowext\' => \'\',\n  \'upload_maxsize\' => \'\',\n  \'thumb_enable\' => \'0\',\n  \'thumb_width\' => \'\',\n  \'thumb_height\' => \'\',\n  \'watermark_enable\' => \'0\',\n  \'ishtml\' => \'1\',\n  \'content_ishtml\' => \'1\',\n  \'category_urlruleid\' => \'3\',\n  \'show_urlruleid\' => \'7\',\n)', 82, 1, '', 0, 0),
	(83, 'wslm', 0, 33, 7, '0,7', 0, '83', '常见问题', '', '', '', 'invest/', 'question', 'html/invest/question/', '', 5, 0, 'array (\n  \'workflowid\' => \'1\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'template_category\' => \'category\',\n  \'template_list\' => \'list\',\n  \'template_show\' => \'show\',\n  \'template_print\' => \'print\',\n  \'upload_allowext\' => \'doc|docx|xls|ppt|wps|zip|rar|txt|jpg|jpeg|gif|bmp|swf|png\',\n  \'upload_maxsize\' => \'1024000\',\n  \'thumb_enable\' => \'1\',\n  \'thumb_width\' => \'667\',\n  \'thumb_height\' => \'667\',\n  \'watermark_enable\' => \'0\',\n  \'ishtml\' => \'1\',\n  \'content_ishtml\' => \'1\',\n  \'category_urlruleid\' => \'3\',\n  \'show_urlruleid\' => \'7\',\n)', 83, 1, '', 0, 0);
/*!40000 ALTER TABLE `mg_category` ENABLE KEYS */;


# Dumping structure for table mg_wlsm.mg_collect
DROP TABLE IF EXISTS `mg_collect`;
CREATE TABLE IF NOT EXISTS `mg_collect` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `contentid` int(10) unsigned NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `contentid` (`contentid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# Dumping data for table mg_wlsm.mg_collect: 0 rows
DELETE FROM `mg_collect`;
/*!40000 ALTER TABLE `mg_collect` DISABLE KEYS */;
/*!40000 ALTER TABLE `mg_collect` ENABLE KEYS */;


# Dumping structure for table mg_wlsm.mg_content
DROP TABLE IF EXISTS `mg_content`;
CREATE TABLE IF NOT EXISTS `mg_content` (
  `contentid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `areaid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` char(80) NOT NULL DEFAULT '',
  `style` char(5) NOT NULL DEFAULT '',
  `thumb` char(100) NOT NULL DEFAULT '',
  `keywords` char(40) NOT NULL DEFAULT '',
  `description` char(255) NOT NULL DEFAULT '',
  `posids` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(100) NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '99',
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  `searchid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `prefix` char(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`contentid`),
  KEY `status` (`status`,`listorder`,`contentid`),
  KEY `listorder` (`catid`,`status`,`listorder`,`contentid`),
  KEY `catid` (`catid`,`status`,`contentid`),
  KEY `updatetime` (`catid`,`status`,`updatetime`),
  KEY `typeid` (`typeid`,`status`,`contentid`)
) ENGINE=MyISAM AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;

# Dumping data for table mg_wlsm.mg_content: 62 rows
DELETE FROM `mg_content`;
/*!40000 ALTER TABLE `mg_content` DISABLE KEYS */;
INSERT INTO `mg_content` (`contentid`, `catid`, `typeid`, `areaid`, `title`, `style`, `thumb`, `keywords`, `description`, `posids`, `url`, `listorder`, `status`, `userid`, `username`, `inputtime`, `updatetime`, `searchid`, `islink`, `prefix`) VALUES
	(1, 64, 0, 0, '天岛影视动漫制作有限公司', '', 'uploadfile/2012/0325/20120325094805455.jpg', '', '由中国著名漫画家姚非拉创办，简称SUMMERZOO（夏天岛）工作室.是原创漫画史上拥有最多“全国第一”的团队', 0, 'show.php?contentid=1', 0, 99, 1, 'admin', 1332683170, 1332684613, 0, 0, ''),
	(15, 73, 0, 0, '姚非拉、夏达、姜晓晨', '', 'uploadfile/2012/0325/20120325105735724.jpg', '', '作品代表了中国最高水准。囊括了20多项国内国际漫画大奖，得到了国家领导人李长春、陈至立、贺国强的亲切接见，多次代表中国漫画界出访海外，并被国外权威媒体广泛报道。与国内外众多著名动漫机构展开合作，并曾成功由央视改编为系列电视动画片。', 0, 'show.php?contentid=15', 0, 99, 1, 'admin', 1332686992, 1332687460, 0, 0, ''),
	(3, 65, 0, 0, '02020202', '', 'uploadfile/2012/0325/20120325101107508.jpg', '', '', 0, 'show.php?contentid=3', 0, 99, 1, 'admin', 1332684656, 1332684656, 0, 0, ''),
	(4, 66, 0, 0, '月新番导言', '', 'uploadfile/2012/0325/20120325101141235.jpg', '', '做4月新番到了第5个年头，居然还没有审美疲劳，这本身就是件可喜可贺的事情了吧…今年的4月番岁不及去年，但可圈可点之作也非常之多，希望能有神作出现。小编依旧会在微博中进行及时扫番，敬请关注=', 0, 'show.php?contentid=4', 0, 99, 1, 'admin', 1332684695, 1332684695, 0, 0, ''),
	(5, 67, 0, 0, '040404', '', 'uploadfile/2012/0325/20120325101214319.jpg', '', '', 0, 'show.php?contentid=5', 0, 99, 1, 'admin', 1332684724, 1332684724, 0, 0, ''),
	(6, 67, 0, 0, '222222', '', 'uploadfile/2012/0325/20120325101244282.jpg', '', '', 0, 'show.php?contentid=6', 0, 99, 1, 'admin', 1332684744, 1332684744, 0, 0, ''),
	(7, 67, 0, 0, '040404', '', 'uploadfile/2012/0325/20120325101354774.png', '', '', 0, 'show.php?contentid=7', 0, 99, 1, 'admin', 1332684827, 1332684827, 0, 0, ''),
	(8, 68, 0, 0, '《散华礼弥》追加声优公开', '', 'uploadfile/2012/0325/20120325101628323.jpg', '', '原作是由曾经创作过《GO！纯情水泳社！》的服部充创作、目前连载于讲谈社《别册少年Magazine》的一部关于人与僵尸之间的搞笑恋爱漫画', 0, 'show.php?contentid=8', 0, 99, 1, 'admin', 1332684978, 1332684978, 0, 0, ''),
	(9, 69, 0, 0, '06060606', '', 'uploadfile/2012/0325/20120325101723670.jpg', '', '', 0, 'show.php?contentid=9', 0, 99, 1, 'admin', 1332685037, 1332685037, 0, 0, ''),
	(10, 69, 0, 0, '06060606', '', 'uploadfile/2012/0325/20120325101839791.jpg', '', '', 0, 'show.php?contentid=10', 0, 99, 1, 'admin', 1332685109, 1332685109, 0, 0, ''),
	(11, 70, 0, 0, '07070707', '', 'uploadfile/2012/0325/20120325101905327.jpg', '', '淡定淡定', 0, 'show.php?contentid=11', 0, 99, 1, 'admin', 1332685136, 1332685136, 0, 0, ''),
	(12, 71, 0, 0, '做4月新番到了第5个年头', '', 'uploadfile/2012/0325/20120325101948969.jpg', '', '居然还没有审美疲劳，这本身就是件可喜可贺的事情了吧…今年的4月番岁不及去年，但可圈可点之作也非常之多，希望能有神作出现。小编依旧会在微博中进行及时扫番，敬请关注=', 0, 'show.php?contentid=12', 0, 99, 1, 'admin', 1332685182, 1332685182, 0, 0, ''),
	(13, 71, 0, 0, '做4月新番到了第5个年头', '', 'uploadfile/2012/0325/20120325102200455.jpg', '', '做4月新番到了第5个年头', 0, 'show.php?contentid=13', 0, 99, 1, 'admin', 1332685314, 1332685314, 0, 0, ''),
	(14, 72, 0, 0, '999999', '', 'uploadfile/2012/0325/20120325103244178.jpg', '', '', 0, 'show.php?contentid=14', 0, 99, 1, 'admin', 1332685959, 1332686117, 0, 0, ''),
	(16, 74, 0, 0, '1111', '', 'uploadfile/2012/0325/20120325105140322.jpg', '', '', 0, 'show.php?contentid=16', 0, 99, 1, 'admin', 1332687092, 1332687092, 0, 0, ''),
	(17, 75, 0, 0, '姚非拉、夏达、姜晓晨', '', 'uploadfile/2012/0325/20120325105202940.jpg', '', '姚非拉、夏达、姜晓晨姚非拉、夏达、姜晓晨姚非拉、夏达、姜晓晨姚非拉、夏达、姜晓晨', 0, 'show.php?contentid=17', 0, 99, 1, 'admin', 1332687110, 1332687110, 0, 0, ''),
	(18, 15, 0, 0, '《铁甲龙》演绎火一般的热血之路！', '', '', '', '《铁甲龙》演绎火一般的热血之路！', 0, 'html/2012/0326/18.html', 0, 99, 1, 'admin', 1332725399, 1332725399, 1, 0, ''),
	(19, 15, 0, 0, '《铁甲龙》演绎火一般的热血之路！', '', '', '', '做4月新番到了第5个年头，居然还没有审美疲劳，这本身就是件可喜可贺的事情了吧…今年的4月番岁不及去年，但可圈可点之作也非常之多，希望能有神作出现。小编依旧会在微博中进行及时扫番，敬请关注= w =', 0, 'html/2012/0326/19.html', 0, 99, 1, 'admin', 1332725841, 1332725841, 2, 0, ''),
	(20, 15, 0, 0, '4月新番《散华礼弥》追加声优公开', '', '', '', ' 预定于4月开播的新番《散华礼弥》，原作是由曾经创作过《GO！纯情水泳社！》的服部充创作、目前连载于讲谈社《别册少年Magazine》的一部关于人与僵尸之间的搞笑恋爱漫画。作品讲述了高中美少女散华礼弥被父亲不小心打落悬崖，而特别喜欢僵尸的高', 1, 'html/2012/0326/20.html', 0, 99, 1, 'admin', 1332725872, 1332746787, 3, 0, ''),
	(21, 16, 0, 0, '4月新番《散华礼弥》追加声优公开', '', '', '', ' 预定于4月开播的新番《散华礼弥》，原作是由曾经创作过《GO！纯情水泳社！》的服部充创作、目前连载于讲谈社《别册少年Magazine》的一部关于人与僵尸之间的搞笑恋爱漫画。作品讲述了高中美少女散华礼弥被父亲不小心打落悬崖，而特别喜欢僵尸的高中生降谷千纮目击了这一切，机缘巧合的情况下，意外地令本来已死的女主角散华礼弥因复活术而成为僵尸', 0, 'html/2012/0326/21.html', 0, 99, 1, 'admin', 1332725959, 1332725959, 4, 0, ''),
	(22, 16, 0, 0, '高中生降谷千纮目击了这一切，机缘巧合的情况下', '', '', '', '，意外地令本来已死的女主角散华礼弥因复活术而成为僵尸，变成了僵尸的散华礼弥顺理成章地开始寄居在降谷千纮家里，就这样降谷千纮开始了与一直憧憬的僵尸共同生活。', 0, 'html/2012/0326/22.html', 0, 99, 1, 'admin', 1332725987, 1332725987, 5, 0, ''),
	(23, 16, 0, 0, '谷千纮目击了这一切，机缘巧合的情况下，意外地令本来已死的女主角散华礼弥因复活术而成为僵尸，变成了僵尸的散', '', '', '', '作是由曾经创作过《GO！纯情水泳社！》的服部充创作、目前连载于讲谈社《别册少年Magazine》的一部关于人与僵尸之间的搞笑恋爱漫画。作品讲述了高中美少女散华礼弥被父亲不小心打落悬崖，而特别喜欢僵尸的高中生降谷千纮目击了这一切，机缘巧合的情况下，意外地令本来已死的女主角散华礼弥因复活术而成为僵尸，变成了僵', 1, 'html/2012/0326/23.html', 0, 99, 1, 'admin', 1332726001, 1332746805, 6, 0, ''),
	(24, 17, 0, 0, '变成了僵尸的散华礼弥顺理成章地开始寄居在降谷千纮家', '', '', '', '由曾经创作过《GO！纯情水泳社！》的服部充创作、目前连载于讲谈社《别册少年Magazine》的一部关于人与僵尸之间的搞笑恋爱漫画。作品讲述了高中美少女散华礼弥被父亲不小心打落悬崖，而特别喜欢僵尸的高中生降谷千', 1, 'html/2012/0326/24.html', 0, 99, 1, 'admin', 1332726023, 1332746912, 7, 0, ''),
	(25, 17, 0, 0, '就这样降谷千纮开始了与一直憧憬的僵尸共同生活。', '', '', '', '《散华礼弥》，原作是由曾经创作过《GO！纯情水泳社！》的服部充创作、目前连载于讲谈社《别册少年Magazine》的一', 0, 'html/2012/0326/25.html', 0, 99, 1, 'admin', 1332726038, 1332726038, 8, 0, ''),
	(26, 17, 0, 0, '预定于4月开播的新番《散华礼弥》', '', '', '', '经创作过《GO！纯情水泳社！》的服部充创作、目前连载于讲谈社《别册少年Magazine》的一部关于人与僵尸之间的搞笑恋爱漫画。作品讲述了高中美少女散华礼弥被父亲不小心打落悬崖，而特别喜欢僵尸的高中生降谷千纮目击了这一切，机缘巧合的情况下，意外地令本来已死的女主角散华礼弥因复活术而成为僵尸', 0, 'html/2012/0326/26.html', 0, 99, 1, 'admin', 1332726054, 1332726054, 9, 0, ''),
	(27, 76, 0, 0, '动漫COSPLAY策划', '', 'uploadfile/2012/0326/20120326095733791.jpg', '', '', 0, 'show.php?contentid=27', 0, 99, 1, 'admin', 1332726763, 1332726763, 10, 0, ''),
	(28, 76, 0, 0, '动漫产品形象策划', '', 'uploadfile/2012/0326/20120326095733791.jpg', '', '', 0, 'show.php?contentid=28', 0, 99, 1, 'admin', 1332727150, 1332727150, 11, 0, ''),
	(29, 76, 0, 0, '动漫渠道建设策划', '', 'uploadfile/2012/0326/20120326095733791.jpg', '', '', 0, 'show.php?contentid=29', 0, 99, 1, 'admin', 1332727204, 1332727204, 12, 0, ''),
	(30, 76, 0, 0, '动漫推广策划', '', 'uploadfile/2012/0326/20120326095733791.jpg', '', '', 0, 'show.php?contentid=30', 0, 99, 1, 'admin', 1332727235, 1332727235, 13, 0, ''),
	(31, 76, 0, 0, '动漫网络营销策划', '', 'uploadfile/2012/0326/20120326095733791.jpg', '', '', 0, 'show.php?contentid=31', 0, 99, 1, 'admin', 1332727259, 1332727259, 14, 0, ''),
	(32, 76, 0, 0, '动漫展会活动策划', '', 'uploadfile/2012/0326/20120326095733791.jpg', '', '', 0, 'show.php?contentid=32', 0, 99, 1, 'admin', 1332727287, 1332727287, 15, 0, ''),
	(33, 76, 0, 0, '动漫终端设计策划', '', 'uploadfile/2012/0326/20120326095733791.jpg', '', '', 0, 'show.php?contentid=33', 0, 99, 1, 'admin', 1332727320, 1332727320, 16, 0, ''),
	(34, 76, 0, 0, '动漫终端营销策划', '', 'uploadfile/2012/0326/20120326095733791.jpg', '', '', 0, 'show.php?contentid=34', 0, 99, 1, 'admin', 1332727373, 1332727895, 17, 0, ''),
	(35, 13, 0, 0, '团队管理', '', 'uploadfile/2012/0326/20120326113959303.jpg', '', '', 1, 'html/2012/0326/35.html', 0, 99, 1, 'admin', 1332733171, 1332733171, 18, 0, ''),
	(36, 13, 0, 0, '企业团队2', '', 'uploadfile/2012/0326/20120326114628861.jpg', '', '企业团队2企业团队2企业团队2', 1, 'html/2012/0326/36.html', 0, 99, 1, 'admin', 1332733581, 1332733581, 19, 0, ''),
	(37, 13, 0, 0, '企业团队2', '', 'uploadfile/2012/0326/20120326114737798.jpg', '', '企业团队2', 1, 'html/2012/0326/37.html', 0, 99, 1, 'admin', 1332733630, 1332733630, 20, 0, ''),
	(38, 13, 0, 0, '企业团队444', '', 'uploadfile/2012/0326/20120326114753550.jpg', '', '企业团队444企业团队444企业团队444企业团队444', 1, 'html/2012/0326/38.html', 0, 99, 1, 'admin', 1332733667, 1332733667, 21, 0, ''),
	(39, 13, 0, 0, '企业团队5', '', 'uploadfile/2012/0326/20120326114815274.jpg', '', '企业团队5企业团队5企业团队5企业团队52225554545', 1, 'html/2012/0326/39.html', 0, 99, 1, 'admin', 1332733690, 1332818318, 22, 0, ''),
	(40, 77, 0, 0, '链接01', '', 'uploadfile/2012/0326/20120326100646673.jpg', '', '', 0, 'show.php?contentid=40', 0, 99, 1, 'admin', 1332770762, 1332770762, 23, 0, ''),
	(41, 77, 0, 0, '链接02', '', 'uploadfile/2012/0326/20120326100725202.jpg', '', '', 0, 'show.php?contentid=41', 0, 99, 1, 'admin', 1332770832, 1332770832, 24, 0, ''),
	(42, 77, 0, 0, '链接03', '', 'uploadfile/2012/0326/20120326100758917.jpg', '', '', 0, 'show.php?contentid=42', 0, 99, 1, 'admin', 1332770863, 1332770863, 25, 0, ''),
	(43, 77, 0, 0, '链接04', '', 'uploadfile/2012/0326/20120326100825640.jpg', '', '', 0, 'show.php?contentid=43', 0, 99, 1, 'admin', 1332770893, 1332770893, 26, 0, ''),
	(44, 13, 0, 0, '动画师团队', '', 'uploadfile/2012/0326/20120326114815274.jpg', '', '动画师团队动画师团队动画师团队动画师团队动画师团队动画师团队', 1, 'html/2012/0327/44.html', 0, 99, 1, 'admin', 1332818405, 1332818405, 27, 0, ''),
	(45, 13, 0, 0, '设计师团队', '', 'uploadfile/2012/0326/20120326114815274.jpg', '', '设计师团队设计师团队设计师团队设计师团队设计师团队设计师团队设计师团队设计师团队设计师团队设计师团队设计师团队设计师团队设计师团队设计师团队设计师团队设计师团队设计师团队', 0, 'html/2012/0327/45.html', 0, 99, 1, 'admin', 1332818437, 1332818437, 28, 0, ''),
	(46, 14, 0, 0, '桂纶镁', '', 'uploadfile/2012/0327/20120327113628617.jpg', '', '桂纶镁，女，1983年12月25日出生，中国台湾新生代演员。高中就读薇阁高中，大学毕业于淡江大学法国语文学系，曾于2004年9月前往法国里昂第三大学交换学生。高二时出演《蓝色大门》当中的“孟克柔”，跨出了她人生第一步表演生涯。之后桂纶镁出演了《经过》、《危险心灵》、《波丽士大人》等影视剧。', 0, 'html/2012/0327/46.html', 0, 99, 1, 'admin', 1332819380, 1332819380, 29, 0, ''),
	(47, 29, 0, 0, '国漫精品！夏天岛名家名作集体入驻', '', 'uploadfile/2012/0327/20120327115506829.png', '', '', 0, 'html/2012/0327/47.html', 0, 99, 1, 'admin', 1332820468, 1332820468, 30, 0, ''),
	(48, 78, 0, 0, '歼击机', '', 'uploadfile/2012/0327/20120327125359787.jpg', '', '', 0, 'html/2012/0327/48.html', 0, 99, 1, 'admin', 1332824029, 1332824097, 31, 0, ''),
	(49, 78, 0, 0, '直升机', '', 'uploadfile/2012/0327/1_120322130622_42c2d7ed3d07.jpg', '', '', 0, 'html/2012/0327/49.html', 0, 99, 1, 'admin', 1332824060, 1332824798, 32, 0, ''),
	(50, 81, 0, 0, '悟空', '', 'uploadfile/2012/0327/20120327125509405.jpg', '', '', 0, 'html/2012/0327/50.html', 0, 99, 1, 'admin', 1332824101, 1332824101, 33, 0, ''),
	(51, 51, 0, 0, '美味家居', '', 'uploadfile/2012/0327/20120327041123405.jpg', '', '美味家居美味家居美味家居', 1, 'show.php?contentid=51', 0, 99, 1, 'admin', 1332835643, 1332835643, 34, 0, ''),
	(52, 51, 0, 0, '味美香', '', 'uploadfile/2012/0327/20120327041148623.jpg', '', '味美香味美香味美香味美香味美香味美香', 1, 'show.php?contentid=52', 0, 99, 1, 'admin', 1332835901, 1332835901, 35, 0, ''),
	(53, 51, 0, 0, '怡美家', '', 'uploadfile/2012/0327/20120327041223316.jpg', '', '一咩价', 1, 'show.php?contentid=53', 0, 99, 1, 'admin', 1332835933, 1332835933, 36, 0, ''),
	(54, 51, 0, 0, '味达美味达美味达美味达美味达美味达美味达美味达美味达美味达美味达美味达美味达美味达美味达美', '', 'uploadfile/2012/0327/20120327041252460.jpg', '', '味达美味达美味达美味达美味达美味达美味达美味达美味达美味达美味达美味达美味达美味达美', 1, 'show.php?contentid=54', 0, 99, 1, 'admin', 1332835960, 1332835960, 37, 0, ''),
	(55, 51, 0, 0, '成名家', '', 'uploadfile/2012/0327/20120327041310117.jpg', '', '成名家成名家成名家成名家成名家', 1, 'show.php?contentid=55', 0, 99, 1, 'admin', 1332835984, 1332835984, 38, 0, ''),
	(56, 51, 0, 0, '益美鲜', '', 'uploadfile/2012/0327/20120327041342295.jpg', '', '益美鲜益美鲜', 1, 'show.php?contentid=56', 0, 99, 1, 'admin', 1332836006, 1332836006, 39, 0, ''),
	(57, 51, 0, 0, '益达', '', 'uploadfile/2012/0327/20120327041402803.jpg', '', '益美鲜益美鲜益美鲜', 1, 'show.php?contentid=57', 0, 99, 1, 'admin', 1332836033, 1332836033, 40, 0, ''),
	(58, 51, 0, 0, '达沃斯', '', 'uploadfile/2012/0327/20120327041427574.jpg', '', '达沃斯达沃斯达沃斯', 1, 'show.php?contentid=58', 0, 99, 1, 'admin', 1332836054, 1332836054, 41, 0, ''),
	(59, 83, 0, 0, '【理财投资】理财规划_家庭理财_生活理财_个人理财', '', '', '', '', 0, 'html/2012/0327/59.html', 0, 99, 1, 'admin', 1332836868, 1332836868, 42, 0, ''),
	(60, 83, 0, 0, '投资（Investment）——投资、出口、消费被称为发展经济的“三驾马车"', '', '', '', '', 0, 'html/2012/0327/60.html', 0, 99, 1, 'admin', 1332836897, 1332836897, 43, 0, ''),
	(61, 83, 0, 0, '投资的含义', '', '', '', '', 0, 'html/2012/0327/61.html', 0, 99, 1, 'admin', 1332836923, 1332836923, 44, 0, ''),
	(62, 83, 0, 0, '投资的实质', '', '', '', '', 0, 'html/2012/0327/62.html', 0, 99, 1, 'admin', 1332836942, 1332836942, 45, 0, ''),
	(63, 83, 0, 0, '投资类型', '', '', '', '', 0, 'html/2012/0327/63.html', 0, 99, 1, 'admin', 1332836957, 1332836957, 46, 0, ''),
	(64, 15, 0, 0, '4月新番《散华礼弥》追加声优公开', '', '', '', '4月新番《散华礼弥》追加声优公开', 1, 'html/2012/0327/64.html', 0, 99, 1, 'admin', 1332846134, 1332846134, 47, 0, ''),
	(65, 15, 0, 0, '4月新番《散华礼弥》追加声优公开', '', '4月新番《散华礼弥》追加声优公开', '', '4月新番《散华礼弥》追加声优公开', 0, 'html/2012/0327/65.html', 0, 99, 1, 'admin', 1332846148, 1332846148, 48, 0, ''),
	(66, 15, 0, 0, '4月新番《散华礼弥》追加声优公开', '', '4月新番《散华礼弥》追加声优公开', '', '4月新番《散华礼弥》追加声优公开', 0, 'html/2012/0327/66.html', 0, 99, 1, 'admin', 1332846156, 1332846156, 49, 0, ''),
	(67, 15, 0, 0, '4月新番《散华礼弥》追加声优公开', '', '4月新番《散华礼弥》追加声优公开', '', '4月新番《散华礼弥》追加声优公开', 0, 'html/2012/0327/67.html', 0, 99, 1, 'admin', 1332846163, 1332846163, 50, 0, ''),
	(68, 15, 0, 0, '4月新番《散华礼弥》追加声优公开', '', '4月新番《散华礼弥》追加声优公开', '', '4月新番《散华礼弥》追加声优公开', 0, 'html/2012/0327/68.html', 0, 99, 1, 'admin', 1332846170, 1332846170, 51, 0, ''),
	(69, 15, 0, 0, '4月新番《散华礼弥》追加声优公开', '', '4月新番《散华礼弥》追加声优公开', '', '4月新番《散华礼弥》追加声优公开', 0, 'html/2012/0327/69.html', 0, 99, 1, 'admin', 1332846187, 1332846187, 52, 0, ''),
	(70, 15, 0, 0, '4月新番《散华礼弥》追加声优公开', '', '', '', '', 0, 'html/2012/0327/70.html', 0, 99, 1, 'admin', 1332846194, 1332846194, 53, 0, ''),
	(71, 15, 0, 0, '4月新番《散华礼弥》追加声优公开', '', '4月新番《散华礼弥》追加声优公开', '', '', 0, 'html/2012/0327/71.html', 0, 99, 1, 'admin', 1332846208, 1332846208, 54, 0, ''),
	(72, 15, 0, 0, '4月新番《散华礼弥》追加声优公开', '', '', '', '4月新番《散华礼弥》追加声优公开', 0, 'html/2012/0327/72.html', 0, 99, 1, 'admin', 1332846215, 1332846215, 55, 0, '');
/*!40000 ALTER TABLE `mg_content` ENABLE KEYS */;


# Dumping structure for table mg_wlsm.mg_content_count
DROP TABLE IF EXISTS `mg_content_count`;
CREATE TABLE IF NOT EXISTS `mg_content_count` (
  `contentid` mediumint(8) unsigned NOT NULL,
  `hits` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `hits_day` smallint(5) unsigned NOT NULL DEFAULT '0',
  `hits_week` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `hits_month` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `hits_time` int(10) unsigned NOT NULL DEFAULT '0',
  `comments` smallint(5) unsigned NOT NULL DEFAULT '0',
  `comments_checked` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`contentid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# Dumping data for table mg_wlsm.mg_content_count: 63 rows
DELETE FROM `mg_content_count`;
/*!40000 ALTER TABLE `mg_content_count` DISABLE KEYS */;
INSERT INTO `mg_content_count` (`contentid`, `hits`, `hits_day`, `hits_week`, `hits_month`, `hits_time`, `comments`, `comments_checked`) VALUES
	(1, 0, 0, 0, 0, 0, 0, 0),
	(2, 0, 0, 0, 0, 0, 0, 0),
	(3, 0, 0, 0, 0, 0, 0, 0),
	(4, 0, 0, 0, 0, 0, 0, 0),
	(5, 0, 0, 0, 0, 0, 0, 0),
	(6, 0, 0, 0, 0, 0, 0, 0),
	(7, 0, 0, 0, 0, 0, 0, 0),
	(8, 0, 0, 0, 0, 0, 0, 0),
	(9, 0, 0, 0, 0, 0, 0, 0),
	(10, 0, 0, 0, 0, 0, 0, 0),
	(11, 0, 0, 0, 0, 0, 0, 0),
	(12, 0, 0, 0, 0, 0, 0, 0),
	(13, 0, 0, 0, 0, 0, 0, 0),
	(14, 0, 0, 0, 0, 0, 0, 0),
	(15, 0, 0, 0, 0, 0, 0, 0),
	(16, 0, 0, 0, 0, 0, 0, 0),
	(17, 0, 0, 0, 0, 0, 0, 0),
	(18, 0, 0, 0, 0, 0, 0, 0),
	(19, 1, 1, 1, 1, 1332846234, 0, 0),
	(20, 0, 0, 0, 0, 0, 0, 0),
	(21, 0, 0, 0, 0, 0, 0, 0),
	(22, 0, 0, 0, 0, 0, 0, 0),
	(23, 0, 0, 0, 0, 0, 0, 0),
	(24, 1, 1, 1, 1, 1332846248, 0, 0),
	(25, 0, 0, 0, 0, 0, 0, 0),
	(26, 0, 0, 0, 0, 0, 0, 0),
	(27, 0, 0, 0, 0, 0, 0, 0),
	(28, 0, 0, 0, 0, 0, 0, 0),
	(29, 0, 0, 0, 0, 0, 0, 0),
	(30, 0, 0, 0, 0, 0, 0, 0),
	(31, 0, 0, 0, 0, 0, 0, 0),
	(32, 0, 0, 0, 0, 0, 0, 0),
	(33, 0, 0, 0, 0, 0, 0, 0),
	(34, 0, 0, 0, 0, 0, 0, 0),
	(35, 0, 0, 0, 0, 0, 0, 0),
	(36, 0, 0, 0, 0, 0, 0, 0),
	(37, 0, 0, 0, 0, 0, 0, 0),
	(38, 0, 0, 0, 0, 0, 0, 0),
	(39, 10, 10, 10, 10, 1332818469, 0, 0),
	(40, 0, 0, 0, 0, 0, 0, 0),
	(41, 0, 0, 0, 0, 0, 0, 0),
	(42, 0, 0, 0, 0, 0, 0, 0),
	(43, 0, 0, 0, 0, 0, 0, 0),
	(44, 0, 0, 0, 0, 0, 0, 0),
	(45, 2, 2, 2, 2, 1332818473, 0, 0),
	(46, 1, 1, 1, 1, 1332830256, 0, 0),
	(47, 2, 2, 2, 2, 1332844939, 0, 0),
	(48, 1, 1, 1, 1, 1332824657, 0, 0),
	(49, 4, 4, 4, 4, 1332825203, 0, 0),
	(50, 0, 0, 0, 0, 0, 0, 0),
	(51, 0, 0, 0, 0, 0, 0, 0),
	(52, 0, 0, 0, 0, 0, 0, 0),
	(53, 0, 0, 0, 0, 0, 0, 0),
	(54, 0, 0, 0, 0, 0, 0, 0),
	(55, 0, 0, 0, 0, 0, 0, 0),
	(56, 0, 0, 0, 0, 0, 0, 0),
	(57, 0, 0, 0, 0, 0, 0, 0),
	(58, 0, 0, 0, 0, 0, 0, 0),
	(59, 0, 0, 0, 0, 0, 0, 0),
	(60, 0, 0, 0, 0, 0, 0, 0),
	(61, 0, 0, 0, 0, 0, 0, 0),
	(62, 0, 0, 0, 0, 0, 0, 0),
	(63, 0, 0, 0, 0, 0, 0, 0),
	(64, 0, 0, 0, 0, 0, 0, 0),
	(65, 0, 0, 0, 0, 0, 0, 0),
	(66, 0, 0, 0, 0, 0, 0, 0),
	(67, 0, 0, 0, 0, 0, 0, 0),
	(68, 0, 0, 0, 0, 0, 0, 0),
	(69, 0, 0, 0, 0, 0, 0, 0),
	(70, 0, 0, 0, 0, 0, 0, 0),
	(71, 0, 0, 0, 0, 0, 0, 0),
	(72, 0, 0, 0, 0, 0, 0, 0);
/*!40000 ALTER TABLE `mg_content_count` ENABLE KEYS */;


# Dumping structure for table mg_wlsm.mg_content_position
DROP TABLE IF EXISTS `mg_content_position`;
CREATE TABLE IF NOT EXISTS `mg_content_position` (
  `contentid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `posid` smallint(5) unsigned NOT NULL DEFAULT '0',
  KEY `posid` (`posid`),
  KEY `contentid` (`contentid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# Dumping data for table mg_wlsm.mg_content_position: 25 rows
DELETE FROM `mg_content_position`;
/*!40000 ALTER TABLE `mg_content_position` DISABLE KEYS */;
INSERT INTO `mg_content_position` (`contentid`, `posid`) VALUES
	(39, 6),
	(38, 6),
	(37, 6),
	(36, 6),
	(35, 6),
	(20, 7),
	(23, 7),
	(24, 7),
	(44, 6),
	(51, 9),
	(51, 10),
	(52, 9),
	(52, 10),
	(53, 9),
	(53, 10),
	(54, 9),
	(54, 10),
	(55, 9),
	(55, 10),
	(56, 9),
	(56, 10),
	(57, 9),
	(57, 10),
	(58, 9),
	(58, 10),
	(64, 7);
/*!40000 ALTER TABLE `mg_content_position` ENABLE KEYS */;


# Dumping structure for table mg_wlsm.mg_content_tag
DROP TABLE IF EXISTS `mg_content_tag`;
CREATE TABLE IF NOT EXISTS `mg_content_tag` (
  `tag` char(20) NOT NULL,
  `contentid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  KEY `contentid` (`contentid`),
  KEY `tag` (`tag`(10))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# Dumping data for table mg_wlsm.mg_content_tag: 0 rows
DELETE FROM `mg_content_tag`;
/*!40000 ALTER TABLE `mg_content_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `mg_content_tag` ENABLE KEYS */;


# Dumping structure for table mg_wlsm.mg_copyfrom
DROP TABLE IF EXISTS `mg_copyfrom`;
CREATE TABLE IF NOT EXISTS `mg_copyfrom` (
  `copyfromid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `url` varchar(100) NOT NULL,
  `usetimes` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`copyfromid`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# Dumping data for table mg_wlsm.mg_copyfrom: 0 rows
DELETE FROM `mg_copyfrom`;
/*!40000 ALTER TABLE `mg_copyfrom` DISABLE KEYS */;
/*!40000 ALTER TABLE `mg_copyfrom` ENABLE KEYS */;


# Dumping structure for table mg_wlsm.mg_c_backfront
DROP TABLE IF EXISTS `mg_c_backfront`;
CREATE TABLE IF NOT EXISTS `mg_c_backfront` (
  `contentid` mediumint(8) unsigned NOT NULL,
  `template` char(30) NOT NULL,
  `content` mediumtext NOT NULL,
  `background` varchar(255) NOT NULL DEFAULT '',
  `link` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`contentid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# Dumping data for table mg_wlsm.mg_c_backfront: 8 rows
DELETE FROM `mg_c_backfront`;
/*!40000 ALTER TABLE `mg_c_backfront` DISABLE KEYS */;
INSERT INTO `mg_c_backfront` (`contentid`, `template`, `content`, `background`, `link`) VALUES
	(27, '', '', 'uploadfile/2012/0326/20120326095712599.jpg', ''),
	(28, '', '', 'uploadfile/2012/0326/20120326095930804.jpg', ''),
	(29, '', '', 'uploadfile/2012/0326/20120326100022136.jpg', ''),
	(30, '', '', 'uploadfile/2012/0326/20120326100050514.jpg', ''),
	(31, '', '', 'uploadfile/2012/0326/20120326100114719.jpg', ''),
	(32, '', '', 'uploadfile/2012/0326/20120326100141288.jpg', ''),
	(33, '', '', 'uploadfile/2012/0326/20120326100231958.jpg', ''),
	(34, '', '', 'uploadfile/2012/0326/20120326100301117.jpg', 'http://www.baidu.com');
/*!40000 ALTER TABLE `mg_c_backfront` ENABLE KEYS */;


# Dumping structure for table mg_wlsm.mg_c_catproslider
DROP TABLE IF EXISTS `mg_c_catproslider`;
CREATE TABLE IF NOT EXISTS `mg_c_catproslider` (
  `contentid` mediumint(8) unsigned NOT NULL,
  `template` char(30) NOT NULL,
  `content` mediumtext NOT NULL,
  `bigpic` char(255) NOT NULL DEFAULT '',
  `link` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`contentid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# Dumping data for table mg_wlsm.mg_c_catproslider: 4 rows
DELETE FROM `mg_c_catproslider`;
/*!40000 ALTER TABLE `mg_c_catproslider` DISABLE KEYS */;
INSERT INTO `mg_c_catproslider` (`contentid`, `template`, `content`, `bigpic`, `link`) VALUES
	(40, '', '', 'uploadfile/2012/0326/20120326100654389.jpg', 'http://baidu.com'),
	(41, '', '', 'uploadfile/2012/0326/20120326100731954.png', 'http://www.zgweb.com'),
	(42, '', '', 'uploadfile/2012/0326/20120326100805548.jpg', 'http.//music365.ac.cn'),
	(43, '', '', 'uploadfile/2012/0326/20120326100831495.jpg', 'http://php.net');
/*!40000 ALTER TABLE `mg_c_catproslider` ENABLE KEYS */;


# Dumping structure for table mg_wlsm.mg_c_culture
DROP TABLE IF EXISTS `mg_c_culture`;
CREATE TABLE IF NOT EXISTS `mg_c_culture` (
  `contentid` mediumint(8) unsigned NOT NULL,
  `template` char(30) NOT NULL,
  `content` mediumtext NOT NULL,
  PRIMARY KEY (`contentid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# Dumping data for table mg_wlsm.mg_c_culture: 1 rows
DELETE FROM `mg_c_culture`;
/*!40000 ALTER TABLE `mg_c_culture` DISABLE KEYS */;
INSERT INTO `mg_c_culture` (`contentid`, `template`, `content`) VALUES
	(47, '', '&nbsp;\r\n<h2 class="big_title f288 text_c" style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; text-align: center; color: rgb(40, 141, 195); font-size: 18px; font-family: 黑体; line-height: 35px; font-weight: normal; "><a target="_blank" href="http://ac.qq.com/famous/summerzoo.html" style="color: rgb(40, 141, 195); text-decoration: none; ">国漫精品！夏天岛名家名作集体入驻</a><a target="_blank" href="http://ac.qq.com/famous/summerzoo.html" style="color: rgb(40, 141, 195); text-decoration: none; ">国漫精品！夏天岛名家名作集体入驻</a><a target="_blank" href="http://ac.qq.com/famous/summerzoo.html" style="color: rgb(40, 141, 195); text-decoration: none; ">国漫精品！夏天岛名家名作集体入驻</a><a target="_blank" href="http://ac.qq.com/famous/summerzoo.html" style="color: rgb(40, 141, 195); text-decoration: none; ">国漫精品！夏天岛名家名作集体入驻</a><a target="_blank" href="http://ac.qq.com/famous/summerzoo.html" style="color: rgb(40, 141, 195); text-decoration: none; ">国漫精品！夏天岛名家名作集体入驻</a><a target="_blank" href="http://ac.qq.com/famous/summerzoo.html" style="color: rgb(40, 141, 195); text-decoration: none; ">国漫精品！夏天岛名家名作集体入驻</a><a target="_blank" href="http://ac.qq.com/famous/summerzoo.html" style="color: rgb(40, 141, 195); text-decoration: none; ">国漫精品！夏天岛名家名作集体入驻</a><a target="_blank" href="http://ac.qq.com/famous/summerzoo.html" style="color: rgb(40, 141, 195); text-decoration: none; ">国漫精品！夏天岛名家名作集体入驻</a><a target="_blank" href="http://ac.qq.com/famous/summerzoo.html" style="color: rgb(40, 141, 195); text-decoration: none; ">国漫精品！夏天岛名家名作集体入驻</a><a target="_blank" href="http://ac.qq.com/famous/summerzoo.html" style="color: rgb(40, 141, 195); text-decoration: none; ">国漫精品！夏天岛名家名作集体入驻</a><a target="_blank" href="http://ac.qq.com/famous/summerzoo.html" style="color: rgb(40, 141, 195); text-decoration: none; ">国漫精品！夏天岛名家名作集体入驻</a><a target="_blank" href="http://ac.qq.com/famous/summerzoo.html" style="color: rgb(40, 141, 195); text-decoration: none; ">国漫精品！夏天岛名家名作集体入驻</a><a target="_blank" href="http://ac.qq.com/famous/summerzoo.html" style="color: rgb(40, 141, 195); text-decoration: none; ">国漫精品！夏天岛名家名作集体入驻</a><a target="_blank" href="http://ac.qq.com/famous/summerzoo.html" style="color: rgb(40, 141, 195); text-decoration: none; ">国漫精品！夏天岛名家名作集体入驻</a><a target="_blank" href="http://ac.qq.com/famous/summerzoo.html" style="color: rgb(40, 141, 195); text-decoration: none; ">国漫精品！夏天岛名家名作集体入驻</a><a target="_blank" href="http://ac.qq.com/famous/summerzoo.html" style="color: rgb(40, 141, 195); text-decoration: none; ">国漫精品！夏天岛名家名作集体入驻</a><a target="_blank" href="http://ac.qq.com/famous/summerzoo.html" style="color: rgb(40, 141, 195); text-decoration: none; ">国漫精品！夏天岛名家名作集体入驻</a><a target="_blank" href="http://ac.qq.com/famous/summerzoo.html" style="color: rgb(40, 141, 195); text-decoration: none; ">国漫精品！夏天岛名家名作集体入驻</a><a target="_blank" href="http://ac.qq.com/famous/summerzoo.html" style="color: rgb(40, 141, 195); text-decoration: none; ">国漫精品！夏天岛名家名作集体入驻</a><a target="_blank" href="http://ac.qq.com/famous/summerzoo.html" style="color: rgb(40, 141, 195); text-decoration: none; ">国漫精品！夏天岛名家名作集体入驻</a><a target="_blank" href="http://ac.qq.com/famous/summerzoo.html" style="color: rgb(40, 141, 195); text-decoration: none; ">国漫精品！夏天岛名家名作集体入驻</a><a target="_blank" href="http://ac.qq.com/famous/summerzoo.html" style="color: rgb(40, 141, 195); text-decoration: none; ">国漫精品！夏天岛名家名作集体入驻</a><a target="_blank" href="http://ac.qq.com/famous/summerzoo.html" style="color: rgb(40, 141, 195); text-decoration: none; ">国漫精品！夏天岛名家名作集体入驻</a><a target="_blank" href="http://ac.qq.com/famous/summerzoo.html" style="color: rgb(40, 141, 195); text-decoration: none; ">国漫精品！夏天岛名家名作集体入驻</a><a target="_blank" href="http://ac.qq.com/famous/summerzoo.html" style="color: rgb(40, 141, 195); text-decoration: none; ">国漫精品！夏天岛名家名作集体入驻</a></h2>');
/*!40000 ALTER TABLE `mg_c_culture` ENABLE KEYS */;


# Dumping structure for table mg_wlsm.mg_c_foder
DROP TABLE IF EXISTS `mg_c_foder`;
CREATE TABLE IF NOT EXISTS `mg_c_foder` (
  `contentid` mediumint(8) unsigned NOT NULL,
  `template` char(30) NOT NULL,
  `content` mediumtext NOT NULL,
  PRIMARY KEY (`contentid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# Dumping data for table mg_wlsm.mg_c_foder: 0 rows
DELETE FROM `mg_c_foder`;
/*!40000 ALTER TABLE `mg_c_foder` DISABLE KEYS */;
/*!40000 ALTER TABLE `mg_c_foder` ENABLE KEYS */;


# Dumping structure for table mg_wlsm.mg_c_ku6video
DROP TABLE IF EXISTS `mg_c_ku6video`;
CREATE TABLE IF NOT EXISTS `mg_c_ku6video` (
  `contentid` mediumint(8) unsigned NOT NULL,
  `template` char(30) NOT NULL,
  `content` mediumtext NOT NULL,
  `photo` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ku6video` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `readpoint` int(10) unsigned NOT NULL DEFAULT '0',
  `groupids_view` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `director` varchar(255) NOT NULL DEFAULT '',
  `actor` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`contentid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# Dumping data for table mg_wlsm.mg_c_ku6video: 0 rows
DELETE FROM `mg_c_ku6video`;
/*!40000 ALTER TABLE `mg_c_ku6video` DISABLE KEYS */;
/*!40000 ALTER TABLE `mg_c_ku6video` ENABLE KEYS */;


# Dumping structure for table mg_wlsm.mg_c_partner
DROP TABLE IF EXISTS `mg_c_partner`;
CREATE TABLE IF NOT EXISTS `mg_c_partner` (
  `contentid` mediumint(8) unsigned NOT NULL,
  `template` char(30) NOT NULL,
  `content` mediumtext NOT NULL,
  PRIMARY KEY (`contentid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# Dumping data for table mg_wlsm.mg_c_partner: 0 rows
DELETE FROM `mg_c_partner`;
/*!40000 ALTER TABLE `mg_c_partner` DISABLE KEYS */;
/*!40000 ALTER TABLE `mg_c_partner` ENABLE KEYS */;


# Dumping structure for table mg_wlsm.mg_c_pic
DROP TABLE IF EXISTS `mg_c_pic`;
CREATE TABLE IF NOT EXISTS `mg_c_pic` (
  `contentid` mediumint(8) unsigned NOT NULL,
  `template` char(30) NOT NULL,
  `content` mediumtext NOT NULL,
  PRIMARY KEY (`contentid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# Dumping data for table mg_wlsm.mg_c_pic: 8 rows
DELETE FROM `mg_c_pic`;
/*!40000 ALTER TABLE `mg_c_pic` DISABLE KEYS */;
INSERT INTO `mg_c_pic` (`contentid`, `template`, `content`) VALUES
	(3, '', ''),
	(5, '', ''),
	(6, '', ''),
	(7, '', ''),
	(9, '', ''),
	(10, '', ''),
	(14, '', ''),
	(16, '', '');
/*!40000 ALTER TABLE `mg_c_pic` ENABLE KEYS */;


# Dumping structure for table mg_wlsm.mg_c_picart
DROP TABLE IF EXISTS `mg_c_picart`;
CREATE TABLE IF NOT EXISTS `mg_c_picart` (
  `contentid` mediumint(8) unsigned NOT NULL,
  `template` char(30) NOT NULL,
  `content` mediumtext NOT NULL,
  PRIMARY KEY (`contentid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# Dumping data for table mg_wlsm.mg_c_picart: 3 rows
DELETE FROM `mg_c_picart`;
/*!40000 ALTER TABLE `mg_c_picart` DISABLE KEYS */;
INSERT INTO `mg_c_picart` (`contentid`, `template`, `content`) VALUES
	(48, '', '&nbsp;飞机11飞机11飞机11飞机11飞机11飞机11飞机11飞机11飞机11飞机11飞机11飞机11飞机11飞机11飞机11飞机11飞机11飞机11飞机11飞机11飞机11飞机11飞机11飞机11飞机11飞机11飞机11飞机11飞机11飞机11飞机11飞机11飞机11飞机11飞机11飞机11飞机11飞机11飞机11飞机11飞机11飞机11飞机11飞机11飞机11飞机11飞机11飞机11飞机11'),
	(49, '', '<div style="text-align: left; ">&nbsp;直升机</div>\r\n<div style="text-align: center; "><img alt="" src="/wslm/uploadfile/2012/0327/20120327010241905.jpg" /></div>'),
	(50, '', '&nbsp;');
/*!40000 ALTER TABLE `mg_c_picart` ENABLE KEYS */;


# Dumping structure for table mg_wlsm.mg_c_picdesart
DROP TABLE IF EXISTS `mg_c_picdesart`;
CREATE TABLE IF NOT EXISTS `mg_c_picdesart` (
  `contentid` mediumint(8) unsigned NOT NULL,
  `template` char(30) NOT NULL,
  `content` mediumtext NOT NULL,
  PRIMARY KEY (`contentid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# Dumping data for table mg_wlsm.mg_c_picdesart: 15 rows
DELETE FROM `mg_c_picdesart`;
/*!40000 ALTER TABLE `mg_c_picdesart` DISABLE KEYS */;
INSERT INTO `mg_c_picdesart` (`contentid`, `template`, `content`) VALUES
	(18, '', '&nbsp;<span style="font-family: 宋体, arial, sans-serif; font-size: 14px; line-height: 25px; text-align: left; text-indent: 2em; ">刘家凯老师热血爱国大作《铁甲龙》在《少年漫画TOP》火爆连载以来，受到越来越多机甲漫迷的喜爱！它的独特魅力在于哪里呢？本次就让阿铁带领年糕们走进《铁甲龙》的世界中去一探究竟吧！</span>\r\n<p style="margin-top: 20px; margin-right: auto; margin-bottom: 0px; margin-left: auto; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; line-height: 25px; font-family: 宋体, arial, sans-serif; font-size: 14px; text-align: left; text-indent: 2em; "><strong style="font-weight: 800; ">铁甲龙看点一：无厘头少年变身爱国英雄！</strong></p>\r\n<p align="center" style="margin-top: 20px; margin-right: auto; margin-bottom: 0px; margin-left: auto; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; line-height: 25px; font-family: 宋体, arial, sans-serif; font-size: 14px; ">&nbsp;</p>\r\n<div class="mbArticleSharePic " r="1" style="margin-top: 0px; margin-right: auto; margin-bottom: 0px; margin-left: auto; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; position: relative; z-index: 10; width: 491px; "><img alt="《铁甲龙》演绎火一般的热血之路！" src="/wslm/uploadfile/2012/0326/20120326093042418.jpg" style="border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; border-style: initial; border-color: initial; " /></div>\r\n<p>&nbsp;</p>\r\n<p style="margin-top: 20px; margin-right: auto; margin-bottom: 0px; margin-left: auto; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; line-height: 25px; font-family: 宋体, arial, sans-serif; font-size: 14px; text-align: left; text-indent: 2em; ">故事的主线围绕混世魔王贾宝玉的成长之路展开~混世魔王贾宝玉，调皮，无厘头，甚至有点不负责任，出于师父对他的喜爱，他无忧无虑的生活着，时常捉弄捉弄师父，日子过得简单而快乐。</p>\r\n<p align="center" style="margin-top: 20px; margin-right: auto; margin-bottom: 0px; margin-left: auto; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; line-height: 25px; font-family: 宋体, arial, sans-serif; font-size: 14px; ">&nbsp;</p>\r\n<div class="mbArticleSharePic" style="margin-top: 0px; margin-right: auto; margin-bottom: 0px; margin-left: auto; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; position: relative; z-index: 10; text-align: center; "><img alt="《铁甲龙》演绎火一般的热血之路！" src="/wslm/uploadfile/2012/0326/20120326093042716.jpg" style="border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; border-style: initial; border-color: initial; " /></div>\r\n<p>&nbsp;</p>\r\n<p style="margin-top: 20px; margin-right: auto; margin-bottom: 0px; margin-left: auto; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; line-height: 25px; font-family: 宋体, arial, sans-serif; font-size: 14px; text-align: left; text-indent: 2em; ">直到有一天平静的生活被打破了，首先是土匪屠城，然后是小日本侵略，国难当头，人人有责！贾宝玉在充斥着国仇家恨的世界中，快速成长，体现出了他性格的另一面：爱国，很有正义感，为了家人和国家不惜一切奋战。</p>\r\n<p style="margin-top: 20px; margin-right: auto; margin-bottom: 0px; margin-left: auto; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; line-height: 25px; font-family: 宋体, arial, sans-serif; font-size: 14px; text-align: left; text-indent: 2em; ">由无所事事变得富有责任感，这期间的精彩不用阿铁多说，相信年糕们也预计的到了！</p>\r\n<p style="margin-top: 20px; margin-right: auto; margin-bottom: 0px; margin-left: auto; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; line-height: 25px; font-family: 宋体, arial, sans-serif; font-size: 14px; text-align: left; text-indent: 2em; "><strong style="font-weight: 800; ">铁甲龙看点二：红粉知己遍天下，谁才是你心中的那朵花？</strong></p>\r\n<p align="center" style="margin-top: 20px; margin-right: auto; margin-bottom: 0px; margin-left: auto; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; line-height: 25px; font-family: 宋体, arial, sans-serif; font-size: 14px; ">&nbsp;</p>\r\n<div class="mbArticleSharePic" style="margin-top: 0px; margin-right: auto; margin-bottom: 0px; margin-left: auto; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; position: relative; z-index: 10; text-align: center; "><img alt="《铁甲龙》演绎火一般的热血之路！" src="/wslm/uploadfile/2012/0326/20120326093045893.jpg" style="border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; border-style: initial; border-color: initial; " /></div>\r\n<p>&nbsp;</p>\r\n<p style="margin-top: 20px; margin-right: auto; margin-bottom: 0px; margin-left: auto; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; line-height: 25px; font-family: 宋体, arial, sans-serif; font-size: 14px; text-align: left; text-indent: 2em; ">主角贾宝玉的桃花运也是铁甲漫画的一大看点哦！无论是愣头小子贾宝玉还是爱国青年贾宝玉，在宝玉身边一直都不乏红粉知己，青梅竹马长大的薛宝钗；机械天才少女林黛玉；阴差阳错附身在他身上的四娘~而且貌似还有一直增加的趋势~红粉知己太多，也是很头疼的事情呢~所以这也是铁甲龙的一大看点哦！</p>\r\n<p style="margin-top: 20px; margin-right: auto; margin-bottom: 0px; margin-left: auto; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; line-height: 25px; font-family: 宋体, arial, sans-serif; font-size: 14px; text-align: left; text-indent: 2em; "><strong style="font-weight: 800; ">铁甲龙看点三：男子汉的战斗！机甲搏击！</strong></p>\r\n<p style="margin-top: 20px; margin-right: auto; margin-bottom: 0px; margin-left: auto; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; line-height: 25px; font-family: 宋体, arial, sans-serif; font-size: 14px; text-align: left; text-indent: 2em; ">机甲欣赏</p>\r\n<p align="center" style="margin-top: 20px; margin-right: auto; margin-bottom: 0px; margin-left: auto; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; line-height: 25px; font-family: 宋体, arial, sans-serif; font-size: 14px; "><img alt="《铁甲龙》演绎火一般的热血之路！" src="/wslm/uploadfile/2012/0326/20120326093045414.jpg" style="border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; border-style: initial; border-color: initial; " /></p>\r\n<p style="margin-top: 20px; margin-right: auto; margin-bottom: 0px; margin-left: auto; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; line-height: 25px; font-family: 宋体, arial, sans-serif; font-size: 14px; text-align: center; "><strong style="font-weight: 800; ">（枪林弹雨中古代铁甲机炫酷登场！）</strong></p>\r\n<p style="margin-top: 20px; margin-right: auto; margin-bottom: 0px; margin-left: auto; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; line-height: 25px; font-family: 宋体, arial, sans-serif; font-size: 14px; text-align: center; ">&nbsp;</p>\r\n<p align="center" style="margin-top: 20px; margin-right: auto; margin-bottom: 0px; margin-left: auto; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; line-height: 25px; font-family: 宋体, arial, sans-serif; font-size: 14px; ">&nbsp;</p>\r\n<div class="mbArticleSharePic " r="1" style="margin-top: 0px; margin-right: auto; margin-bottom: 0px; margin-left: auto; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; position: relative; z-index: 10; width: 362px; "><strong style="font-weight: 800; "><img alt="《铁甲龙》演绎火一般的热血之路！" src="/wslm/uploadfile/2012/0326/20120326093050770.jpg" style="border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; border-style: initial; border-color: initial; " /></strong></div>\r\n<p>&nbsp;</p>\r\n<p style="margin-top: 20px; margin-right: auto; margin-bottom: 0px; margin-left: auto; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; line-height: 25px; font-family: 宋体, arial, sans-serif; font-size: 14px; text-align: center; ">&nbsp;</p>\r\n<p style="margin-top: 20px; margin-right: auto; margin-bottom: 0px; margin-left: auto; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; line-height: 25px; font-family: 宋体, arial, sans-serif; font-size: 14px; text-align: center; "><strong style="font-weight: 800; ">（宝玉驾驶的中国古机甲大战日本兵浪速）</strong></p>\r\n<p style="margin-top: 20px; margin-right: auto; margin-bottom: 0px; margin-left: auto; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; line-height: 25px; font-family: 宋体, arial, sans-serif; font-size: 14px; text-align: center; ">&nbsp;</p>\r\n<p align="center" style="margin-top: 20px; margin-right: auto; margin-bottom: 0px; margin-left: auto; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; line-height: 25px; font-family: 宋体, arial, sans-serif; font-size: 14px; ">&nbsp;</p>\r\n<div class="mbArticleSharePic  " r="1" style="margin-top: 0px; margin-right: auto; margin-bottom: 0px; margin-left: auto; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; position: relative; z-index: 10; width: 548px; "><strong style="font-weight: 800; "><img alt="《铁甲龙》演绎火一般的热血之路！" src="/wslm/uploadfile/2012/0326/20120326093051653.jpg" style="border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; border-image: initial; border-style: initial; border-color: initial; " /></strong></div>\r\n<p>&nbsp;</p>\r\n<p style="margin-top: 20px; margin-right: auto; margin-bottom: 0px; margin-left: auto; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; line-height: 25px; font-family: 宋体, arial, sans-serif; font-size: 14px; text-align: center; "><strong style="font-weight: 800; ">（贾宝玉驾驶古代铁甲机全爆发！）</strong></p>\r\n<p style="margin-top: 20px; margin-right: auto; margin-bottom: 0px; margin-left: auto; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; line-height: 25px; font-family: 宋体, arial, sans-serif; font-size: 14px; text-align: left; text-indent: 2em; ">作为结合机械、中国古老文明、著作《红楼梦》，三者为一体的热血机甲漫画《铁甲龙》，当然要看他里头的机甲才过瘾喽！刘家凯老师为了铁甲龙，深入研究了中外古今的兵学器械，从而画出的机甲富有质感！机甲间的搏斗场面也十分具有震撼力！给喜欢机械兵法的年糕们献上热血激情的视觉享受！</p>\r\n<p style="margin-top: 20px; margin-right: auto; margin-bottom: 0px; margin-left: auto; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; line-height: 25px; font-family: 宋体, arial, sans-serif; font-size: 14px; text-align: left; text-indent: 2em; ">哈哈！不愧是鬼才漫画家刘家凯老师笔下的重机甲热血爱国漫画啊！阿铁看了之后果然胸潮澎湃！当然啦~《铁甲龙》的看点可不止这三点哦~但是阿铁本次就给年糕们介绍到这里啦~其他的看点~就留给年糕们自己到《铁甲龙》漫画中去找寻吧！</p>'),
	(19, '', '做4月新番到了第5个年头，居然还没有审美疲劳，这本身就是件可喜可贺的事情了吧…今年的4月番岁不及去年，但可圈可点之作也非常之多，希望能有神作出现。小编依旧会在微博中进行及时扫番，敬请关注= w =做4月新番到了第5个年头，居然还没有审美疲劳，这本身就是件可喜可贺的事情了吧…今年的4月番岁不及去年，但可圈可点之作也非常之多，希望能有神作出现。小编依旧会在微博中进行及时扫番，敬请关注= w =做4月新番到了第5个年头，居然还没有审美疲劳，这本身就是件可喜可贺的事情了吧\r\n…今年的4月番岁不及去年，但可圈可点之作也非常之多，希望能有神作出现。小编依旧会在微博中进行及时扫番，敬请关注= w =做4月新番到了第5个年头，居然还没有审美疲劳，这本身就是件可喜可贺的事情了吧…今年的4月番岁不及去年，但可圈可点之作也非常之多，希望能有神作出现。小编依旧会在微博中进行及时扫番，敬请关注= w =做4月新番到了第5个年头，居然还没有审美疲劳，这本身就是件可喜可贺的事情了吧…今年的4月番岁不及去年，但可圈可点之作也非常之多，希望能有神作出现\r\n。小编依旧会在微博中进行及时扫番，敬请关注= w =做4月新番到了第5个年头，居然还没有审美疲劳，这本身就是件可喜可贺的事情了吧…今年的4月番岁不及去年，但可圈可点之作也非常之多，希望能有神作出现。小编依旧会在微博中进行及时扫番，敬请关注= w ='),
	(20, '', '&nbsp;<span style="font-family: 宋体, arial, sans-serif; font-size: 14px; line-height: 25px; text-align: left; text-indent: 2em; ">预定于4月开播的新番《散华礼弥》，原作是由曾经创作过《GO！纯情水泳社！》的服部充创作、目前连载于讲谈社《别册少年Magazine》的一部关于人与僵尸之间的搞笑恋爱漫画。作品讲述了高中美少女散华礼弥被父亲不小心打落悬崖，而特别喜欢僵尸的高中生降谷千纮目击了这一切，机缘巧合的情况下，意外地令本来已死的女主角散华礼弥因复活术而成为僵尸，变成了僵尸的散华礼弥顺理成章地开始寄居在降谷千纮家里，就这样降谷千纮开始了与一直憧憬的僵尸共同生活。</span>\r\n<p style="margin-top: 20px; margin-right: auto; margin-bottom: 0px; margin-left: auto; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; line-height: 25px; font-family: 宋体, arial, sans-serif; font-size: 14px; text-align: left; text-indent: 2em; ">近日，该动画的又公开了追加CAST的情报。本次追加CAST的角色清一色是女仆妹子，且为她们配音的大部分都是人气声优。曾出演过《竹刀少女》的宫崎都、《大剑》的古妮雅、《神风怪盗贞德》的贞德等等角色的桑岛法子将出演女仆长。曾出演过《夜樱四重奏》的蓝、《摇曳百合》的杉浦绫乃、《迷糊餐厅》的伊波真昼等角色的藤田咲将出演副女仆长夏川。曾出演过《电波女与青春男》的御船流子、《便当》的著莪菖蒲、《笨蛋，测验，召唤兽》的木下秀吉等主要角色的加藤英美里将出演女仆秋野。女仆冰室则由新人声优太田敦子担当。</p>'),
	(21, '', '&nbsp;<span style="font-family: 宋体, arial, sans-serif; font-size: 14px; line-height: 25px; text-align: left; text-indent: 2em; ">预定于4月开播的新番《散华礼弥》，原作是由曾经创作过《GO！纯情水泳社！》的服部充创作、目前连载于讲谈社《别册少年Magazine》的一部关于人与僵尸之间的搞笑恋爱漫画。作品讲述了高中美少女散华礼弥被父亲不小心打落悬崖，而特别喜欢僵尸的高中生降谷千纮目击了这一切，机缘巧合的情况下，意外地令本来已死的女主角散华礼弥因复活术而成为僵尸，变成了僵尸的散华礼弥顺理成章地开始寄居在降谷千纮家里，就这样降谷千纮开始了与一直憧憬的僵尸共同生活。</span>\r\n<p style="margin-top: 20px; margin-right: auto; margin-bottom: 0px; margin-left: auto; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; line-height: 25px; font-family: 宋体, arial, sans-serif; font-size: 14px; text-align: left; text-indent: 2em; ">近日，该动画的又公开了追加CAST的情报。本次追加CAST的角色清一色是女仆妹子，且为她们配音的大部分都是人气声优。曾出演过《竹刀少女》的宫崎都、《大剑》的古妮雅、《神风怪盗贞德》的贞德等等角色的桑岛法子将出演女仆长。曾出演过《夜樱四重奏》的蓝、《摇曳百合》的杉浦绫乃、《迷糊餐厅》的伊波真昼等角色的藤田咲将出演副女仆长夏川。曾出演过《电波女与青春男》的御船流子、《便当》的著莪菖蒲、《笨蛋，测验，召唤兽》的木下秀吉等主要角色的加藤英美里将出演女仆秋野。女仆冰室则由新人声优太田敦子担当。</p>'),
	(22, '', '&nbsp;<span style="font-family: 宋体, arial, sans-serif; font-size: 14px; line-height: 25px; text-align: left; text-indent: 2em; ">预定于4月开播的新番《散华礼弥》，原作是由曾经创作过《GO！纯情水泳社！》的服部充创作、目前连载于讲谈社《别册少年Magazine》的一部关于人与僵尸之间的搞笑恋爱漫画。作品讲述了高中美少女散华礼弥被父亲不小心打落悬崖，而特别喜欢僵尸的高中生降谷千纮目击了这一切，机缘巧合的情况下，意外地令本来已死的女主角散华礼弥因复活术而成为僵尸，变成了僵尸的散华礼弥顺理成章地开始寄居在降谷千纮家里，就这样降谷千纮开始了与一直憧憬的僵尸共同生活。</span>\r\n<p style="margin-top: 20px; margin-right: auto; margin-bottom: 0px; margin-left: auto; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; line-height: 25px; font-family: 宋体, arial, sans-serif; font-size: 14px; text-align: left; text-indent: 2em; ">近日，该动画的又公开了追加CAST的情报。本次追加CAST的角色清一色是女仆妹子，且为她们配音的大部分都是人气声优。曾出演过《竹刀少女》的宫崎都、《大剑》的古妮雅、《神风怪盗贞德》的贞德等等角色的桑岛法子将出演女仆长。曾出演过《夜樱四重奏》的蓝、《摇曳百合》的杉浦绫乃、《迷糊餐厅》的伊波真昼等角色的藤田咲将出演副女仆长夏川。曾出演过《电波女与青春男》的御船流子、《便当》的著莪菖蒲、《笨蛋，测验，召唤兽》的木下秀吉等主要角色的加藤英美里将出演女仆秋野。女仆冰室则由新人声优太田敦子担当。</p>'),
	(23, '', '&nbsp;<span style="font-family: 宋体, arial, sans-serif; font-size: 14px; line-height: 25px; text-align: left; text-indent: 2em; ">预定于4月开播的新番《散华礼弥》，原作是由曾经创作过《GO！纯情水泳社！》的服部充创作、目前连载于讲谈社《别册少年Magazine》的一部关于人与僵尸之间的搞笑恋爱漫画。作品讲述了高中美少女散华礼弥被父亲不小心打落悬崖，而特别喜欢僵尸的高中生降谷千纮目击了这一切，机缘巧合的情况下，意外地令本来已死的女主角散华礼弥因复活术而成为僵尸，变成了僵尸的散华礼弥顺理成章地开始寄居在降谷千纮家里，就这样降谷千纮开始了与一直憧憬的僵尸共同生活。</span>\r\n<p style="margin-top: 20px; margin-right: auto; margin-bottom: 0px; margin-left: auto; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; line-height: 25px; font-family: 宋体, arial, sans-serif; font-size: 14px; text-align: left; text-indent: 2em; ">近日，该动画的又公开了追加CAST的情报。本次追加CAST的角色清一色是女仆妹子，且为她们配音的大部分都是人气声优。曾出演过《竹刀少女》的宫崎都、《大剑》的古妮雅、《神风怪盗贞德》的贞德等等角色的桑岛法子将出演女仆长。曾出演过《夜樱四重奏》的蓝、《摇曳百合》的杉浦绫乃、《迷糊餐厅》的伊波真昼等角色的藤田咲将出演副女仆长夏川。曾出演过《电波女与青春男》的御船流子、《便当》的著莪菖蒲、《笨蛋，测验，召唤兽》的木下秀吉等主要角色的加藤英美里将出演女仆秋野。女仆冰室则由新人声优太田敦子担当。</p>'),
	(24, '', '&nbsp;<span style="font-family: 宋体, arial, sans-serif; font-size: 14px; line-height: 25px; text-align: left; text-indent: 2em; ">预定于4月开播的新番《散华礼弥》，原作是由曾经创作过《GO！纯情水泳社！》的服部充创作、目前连载于讲谈社《别册少年Magazine》的一部关于人与僵尸之间的搞笑恋爱漫画。作品讲述了高中美少女散华礼弥被父亲不小心打落悬崖，而特别喜欢僵尸的高中生降谷千纮目击了这一切，机缘巧合的情况下，意外地令本来已死的女主角散华礼弥因复活术而成为僵尸，变成了僵尸的散华礼弥顺理成章地开始寄居在降谷千纮家里，就这样降谷千纮开始了与一直憧憬的僵尸共同生活。</span>\r\n<p style="margin-top: 20px; margin-right: auto; margin-bottom: 0px; margin-left: auto; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; line-height: 25px; font-family: 宋体, arial, sans-serif; font-size: 14px; text-align: left; text-indent: 2em; ">近日，该动画的又公开了追加CAST的情报。本次追加CAST的角色清一色是女仆妹子，且为她们配音的大部分都是人气声优。曾出演过《竹刀少女》的宫崎都、《大剑》的古妮雅、《神风怪盗贞德》的贞德等等角色的桑岛法子将出演女仆长。曾出演过《夜樱四重奏》的蓝、《摇曳百合》的杉浦绫乃、《迷糊餐厅》的伊波真昼等角色的藤田咲将出演副女仆长夏川。曾出演过《电波女与青春男》的御船流子、《便当》的著莪菖蒲、《笨蛋，测验，召唤兽》的木下秀吉等主要角色的加藤英美里将出演女仆秋野。女仆冰室则由新人声优太田敦子担当。</p>'),
	(25, '', '&nbsp;<span style="font-family: 宋体, arial, sans-serif; font-size: 14px; line-height: 25px; text-align: left; text-indent: 2em; ">预定于4月开播的新番《散华礼弥》，原作是由曾经创作过《GO！纯情水泳社！》的服部充创作、目前连载于讲谈社《别册少年Magazine》的一部关于人与僵尸之间的搞笑恋爱漫画。作品讲述了高中美少女散华礼弥被父亲不小心打落悬崖，而特别喜欢僵尸的高中生降谷千纮目击了这一切，机缘巧合的情况下，意外地令本来已死的女主角散华礼弥因复活术而成为僵尸，变成了僵尸的散华礼弥顺理成章地开始寄居在降谷千纮家里，就这样降谷千纮开始了与一直憧憬的僵尸共同生活。</span>\r\n<p style="margin-top: 20px; margin-right: auto; margin-bottom: 0px; margin-left: auto; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; line-height: 25px; font-family: 宋体, arial, sans-serif; font-size: 14px; text-align: left; text-indent: 2em; ">近日，该动画的又公开了追加CAST的情报。本次追加CAST的角色清一色是女仆妹子，且为她们配音的大部分都是人气声优。曾出演过《竹刀少女》的宫崎都、《大剑》的古妮雅、《神风怪盗贞德》的贞德等等角色的桑岛法子将出演女仆长。曾出演过《夜樱四重奏》的蓝、《摇曳百合》的杉浦绫乃、《迷糊餐厅》的伊波真昼等角色的藤田咲将出演副女仆长夏川。曾出演过《电波女与青春男》的御船流子、《便当》的著莪菖蒲、《笨蛋，测验，召唤兽》的木下秀吉等主要角色的加藤英美里将出演女仆秋野。女仆冰室则由新人声优太田敦子担当。</p>'),
	(26, '', '&nbsp;<span style="font-family: 宋体, arial, sans-serif; font-size: 14px; line-height: 25px; text-align: left; text-indent: 2em; ">预定于4月开播的新番《散华礼弥》，原作是由曾经创作过《GO！纯情水泳社！》的服部充创作、目前连载于讲谈社《别册少年Magazine》的一部关于人与僵尸之间的搞笑恋爱漫画。作品讲述了高中美少女散华礼弥被父亲不小心打落悬崖，而特别喜欢僵尸的高中生降谷千纮目击了这一切，机缘巧合的情况下，意外地令本来已死的女主角散华礼弥因复活术而成为僵尸，变成了僵尸的散华礼弥顺理成章地开始寄居在降谷千纮家里，就这样降谷千纮开始了与一直憧憬的僵尸共同生活。</span>\r\n<p style="margin-top: 20px; margin-right: auto; margin-bottom: 0px; margin-left: auto; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; line-height: 25px; font-family: 宋体, arial, sans-serif; font-size: 14px; text-align: left; text-indent: 2em; ">近日，该动画的又公开了追加CAST的情报。本次追加CAST的角色清一色是女仆妹子，且为她们配音的大部分都是人气声优。曾出演过《竹刀少女》的宫崎都、《大剑》的古妮雅、《神风怪盗贞德》的贞德等等角色的桑岛法子将出演女仆长。曾出演过《夜樱四重奏》的蓝、《摇曳百合》的杉浦绫乃、《迷糊餐厅》的伊波真昼等角色的藤田咲将出演副女仆长夏川。曾出演过《电波女与青春男》的御船流子、《便当》的著莪菖蒲、《笨蛋，测验，召唤兽》的木下秀吉等主要角色的加藤英美里将出演女仆秋野。女仆冰室则由新人声优太田敦子担当。</p>'),
	(35, '', '&nbsp;团队管理团队管理团队管理团队管理团队管理'),
	(36, '', '&nbsp;企业团队2企业团队2企业团队2企业团队2企业团队2'),
	(37, '', '&nbsp;企业团队2企业团队2企业团队2企业团队2企业团队2企业团队2企业团队2企业团队2企业团队2企业团队2企业团队2企业团队2'),
	(38, '', '&nbsp;企业团队444企业团队444企业团队444企业团队444企业团队444企业团队444企业团队444'),
	(39, '', '&nbsp;企业团队5企业团队5企业团队5企业团队5企业团队5'),
	(46, '', ''),
	(64, '', '&nbsp; <a href="http://127.0.0.1/wslm/html/2012/0326/20.html" target="_blank" style="text-decoration: none; color: rgb(82, 113, 37); font-family: 宋体; line-height: 18px; text-align: left; ">4月新番《散华礼弥》追加声优公开</a><span style="font-family: 宋体; line-height: 18px; text-align: left; ">&nbsp;</span>'),
	(65, '', '&nbsp; <a href="http://127.0.0.1/wslm/html/2012/0326/20.html" target="_blank" style="text-decoration: none; color: rgb(82, 113, 37); font-family: 宋体; line-height: 18px; text-align: left; ">4月新番《散华礼弥》追加声优公开</a><span style="font-family: 宋体; line-height: 18px; text-align: left; ">&nbsp;</span>'),
	(66, '', '&nbsp; <a href="http://127.0.0.1/wslm/html/2012/0326/20.html" target="_blank" style="text-decoration: none; color: rgb(82, 113, 37); font-family: 宋体; line-height: 18px; text-align: left; ">4月新番《散华礼弥》追加声优公开</a><span style="font-family: 宋体; line-height: 18px; text-align: left; ">&nbsp;</span>'),
	(67, '', '&nbsp; <a href="http://127.0.0.1/wslm/html/2012/0326/20.html" target="_blank" style="text-decoration: none; color: rgb(82, 113, 37); font-family: 宋体; line-height: 18px; text-align: left; ">4月新番《散华礼弥》追加声优公开</a><span style="font-family: 宋体; line-height: 18px; text-align: left; ">&nbsp;</span>'),
	(68, '', '&nbsp; <a href="http://127.0.0.1/wslm/html/2012/0326/20.html" target="_blank" style="text-decoration: none; color: rgb(82, 113, 37); font-family: 宋体; line-height: 18px; text-align: left; ">4月新番《散华礼弥》追加声优公开</a><span style="font-family: 宋体; line-height: 18px; text-align: left; ">&nbsp;</span>'),
	(69, '', '&nbsp; <a href="http://127.0.0.1/wslm/html/2012/0326/20.html" target="_blank" style="text-decoration: none; color: rgb(82, 113, 37); font-family: 宋体; line-height: 18px; text-align: left; ">4月新番《散华礼弥》追加声优公开</a><span style="font-family: 宋体; line-height: 18px; text-align: left; ">&nbsp;</span>'),
	(70, '', '&nbsp; <a href="http://127.0.0.1/wslm/html/2012/0326/20.html" target="_blank" style="text-decoration: none; color: rgb(82, 113, 37); font-family: 宋体; line-height: 18px; text-align: left; ">4月新番《散华礼弥》追加声优公开</a><span style="font-family: 宋体; line-height: 18px; text-align: left; ">&nbsp;</span>'),
	(71, '', '&nbsp; <a href="http://127.0.0.1/wslm/html/2012/0326/20.html" target="_blank" style="text-decoration: none; color: rgb(82, 113, 37); font-family: 宋体; line-height: 18px; text-align: left; ">4月新番《散华礼弥》追加声优公开</a><span style="font-family: 宋体; line-height: 18px; text-align: left; ">&nbsp;</span>'),
	(72, '', '&nbsp; <a href="http://127.0.0.1/wslm/html/2012/0326/20.html" target="_blank" style="text-decoration: none; color: rgb(82, 113, 37); font-family: 宋体; line-height: 18px; text-align: left; ">4月新番《散华礼弥》追加声优公开</a><span style="font-family: 宋体; line-height: 18px; text-align: left; ">&nbsp;</span>');
/*!40000 ALTER TABLE `mg_c_picdesart` ENABLE KEYS */;


# Dumping structure for table mg_wlsm.mg_c_picdesartsug
DROP TABLE IF EXISTS `mg_c_picdesartsug`;
CREATE TABLE IF NOT EXISTS `mg_c_picdesartsug` (
  `contentid` mediumint(8) unsigned NOT NULL,
  `template` char(30) NOT NULL,
  `content` mediumtext NOT NULL,
  PRIMARY KEY (`contentid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# Dumping data for table mg_wlsm.mg_c_picdesartsug: 8 rows
DELETE FROM `mg_c_picdesartsug`;
/*!40000 ALTER TABLE `mg_c_picdesartsug` DISABLE KEYS */;
INSERT INTO `mg_c_picdesartsug` (`contentid`, `template`, `content`) VALUES
	(51, '', '&nbsp;美味家居美味家居美味家居美味家居美味家居'),
	(52, '', '味美香味美香味美香味美香味美香味美香味美香味美香味美香味美香味美香味美香味美香味美香味美香味美香味美香味美香味美香味美香味美香味美香味美香味美香味美香味美香味美香味美香味美香味美香味美香味美香味美香味美香味美香味美香味美香味美香味美香味美香味美香味美香味美香味美香味美香味美香<br />\r\n<br />\r\n<br />\r\n味美香味美香味美香味美香味美香味美香味美香味美香味美香'),
	(53, '', '&nbsp;怡美家怡美家怡美家怡美家怡美家怡美家怡美家怡美家怡美家怡美家怡美家怡美家怡美家怡美家怡美家怡美家怡美家怡美家怡美家怡美家怡美家怡美家怡美家怡美家怡美家怡美家怡美家怡美家怡美家'),
	(54, '', '&nbsp;味达美味达美味达美味达美味达美味达美味达美味达美味达美味达美味达美味达美味达美味达美味达美味达美味达美味达美味达美味达美'),
	(55, '', '&nbsp;成名家成名家成名家成名家成名家成名家成名家成名家成名家成名家成名家成名家成名家成名家成名家成名家成名家成名家成名家成名家成名家成名家成名家成名家成名家成名家成名家成名家成名家成名家成名家'),
	(56, '', '&nbsp;益美鲜益美鲜益美鲜益美鲜益美鲜益美鲜益美鲜益美鲜益美鲜益美鲜益美鲜益美鲜益美鲜益美鲜益美鲜益美鲜益美鲜益美鲜益美鲜'),
	(57, '', '&nbsp;益达益达益达益达益达益达益达益达益达益达益达益达益达益达益达益达益达益达益达v'),
	(58, '', '&nbsp;达沃斯达沃斯达沃斯达沃斯');
/*!40000 ALTER TABLE `mg_c_picdesartsug` ENABLE KEYS */;


# Dumping structure for table mg_wlsm.mg_c_picdeslink
DROP TABLE IF EXISTS `mg_c_picdeslink`;
CREATE TABLE IF NOT EXISTS `mg_c_picdeslink` (
  `contentid` mediumint(8) unsigned NOT NULL,
  `template` char(30) NOT NULL,
  `content` mediumtext NOT NULL,
  `link` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`contentid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# Dumping data for table mg_wlsm.mg_c_picdeslink: 9 rows
DELETE FROM `mg_c_picdeslink`;
/*!40000 ALTER TABLE `mg_c_picdeslink` DISABLE KEYS */;
INSERT INTO `mg_c_picdeslink` (`contentid`, `template`, `content`, `link`) VALUES
	(1, '', '', ''),
	(2, '', '', ''),
	(4, '', '', ''),
	(8, '', '', ''),
	(11, '', '', ''),
	(12, '', '', ''),
	(13, '', '', ''),
	(15, '', '', ''),
	(17, '', '', '');
/*!40000 ALTER TABLE `mg_c_picdeslink` ENABLE KEYS */;


# Dumping structure for table mg_wlsm.mg_c_piclink
DROP TABLE IF EXISTS `mg_c_piclink`;
CREATE TABLE IF NOT EXISTS `mg_c_piclink` (
  `contentid` mediumint(8) unsigned NOT NULL,
  `template` char(30) NOT NULL,
  `content` mediumtext NOT NULL,
  `link` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`contentid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# Dumping data for table mg_wlsm.mg_c_piclink: 0 rows
DELETE FROM `mg_c_piclink`;
/*!40000 ALTER TABLE `mg_c_piclink` DISABLE KEYS */;
/*!40000 ALTER TABLE `mg_c_piclink` ENABLE KEYS */;


# Dumping structure for table mg_wlsm.mg_c_simplenews
DROP TABLE IF EXISTS `mg_c_simplenews`;
CREATE TABLE IF NOT EXISTS `mg_c_simplenews` (
  `contentid` mediumint(8) unsigned NOT NULL,
  `template` char(30) NOT NULL,
  `content` mediumtext NOT NULL,
  PRIMARY KEY (`contentid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# Dumping data for table mg_wlsm.mg_c_simplenews: 5 rows
DELETE FROM `mg_c_simplenews`;
/*!40000 ALTER TABLE `mg_c_simplenews` DISABLE KEYS */;
INSERT INTO `mg_c_simplenews` (`contentid`, `template`, `content`) VALUES
	(59, '', '【理财投资】理财规划_家庭理财_生活理财_个人理财【理财投资】理财规划_家庭理财_生活理财_个人理财【理财投资】理财规划_家庭理财_生活理财_个人理财【理财投资】理财规划_家庭理财_生活理财_个人理财【理财投资】理财规划_家庭理财_生活理财_个人理财【理财投资】理财规划_家庭理财_生活理财_个人理财【理财投资】理财规划_家庭理财_生活理财_个人理财【理财投资】理财规划_家庭理财_生活理财_个人理财【理财投资】理财规划_家庭理财_生活理财_个人理财【理财投资】理财规划_家庭理财_生活理财_个人理财【理财投资】理财规划_家庭理财_生活理财_个人理财【理财投资】理财规划_家庭理财_生活理财_个人理财【理财投资】理财规划_家庭理财_生活理财_个人理财【理财投资】理财规划_家庭理财_生活理财_个人理财【理财投资】理财规划_家庭理财_生活理财_个人理财【理财投资】理财规划_家庭理财_生活理财_个人理财【理财投资】理财规划_家庭理财_生活理财_个人理财【理财投资】理财规划_家庭理财_生活理财_个人理财【理财投资】理财规划_家庭理财_生活理财_个人理财【理财投资】理财规划_家庭理财_生活理财_个人理财【理财投资】理财规划_家庭理财_生活理财_个人理财【理财投资】理财规划_家庭理财_生活理财_个人理财【理财投资】理财规划_家庭理财_生活理财_个人理财【理财投资】理财规划_家庭理财_生活理财_个人理财【理财投资】理财规划_家庭理财_生活理财_个人理财'),
	(60, '', '投资这个名词在金融和经济方面有数个相关的意义。它涉及财产的累积以求在未来得到收益。技术上来说，这个字意味著“将某物品放入其他地方的行动”（或许最初是与人的服装或\'礼服\'相关）。从金融学角度来讲，相较于投机而言，投资的时间段更长一些，更趋向是为了在未来一定时间段内获得某种比较持续稳定的现金流收益，是未来收益的累积。'),
	(61, '', '&nbsp;在西方发达资本主义国家，投资通常是指为获取利润而投放资本于企业的行为，主要是通过购买国内外企业发行的股票和公司债券来实现。所以，在西方，投资一般是指间接投资，主要介绍如何计算股票和债券的收益、怎样评估风险和如何进行风险定价，帮助投资者选择获利最高的投资机会。\r\n<div>&nbsp;</div>\r\n<div>　　而在我国，投资概念既包括直接间接的股票、债券投资，也指购置和建造固定资产、购买和储备流动资产的经济活动，有时也用来指购置和建造固定资产、购买和储备流动资产（包括有价证券）的经济活动，必须运用资金，而运用上述资金的过程是一种经济活动。因此，投资一词具有双重含义，既用来指特定的经济活动，又用来指特种资金。</div>\r\n<div>&nbsp;</div>\r\n<div>　　简而言之，可以把投资定义为：经济主体为获得经济效益而垫付货币或其他资源用于某项事业的经济活动。</div>\r\n<div>&nbsp;</div>\r\n<div>　　从定义中看出，一项投资活动中至少包括投资主体和货币或其他经济资源等投资客体两个方面。</div>'),
	(62, '', '投资只在运动（生产和经营）中才能具有生命力。通过人类有目的的活动，使投资资金遵循一定途径不断循环与周转运动，才能取得预期的效果&mdash;&mdash;为个人提供更多的收益，为人类创造更多的财富，推动经济和科技的发展，推动人类社会的进步。 　　资金循环周转实现增值的过程，要依次经过三个阶段，相应采取三种不同的职能形式，才能使其价值达到增值，并在最后又回到原来的出发点进行新一轮的运动，开始新的循环过程。资金只有在连续不断的运动中才能实现价值的增值。下图是资金的循环运动示意图：'),
	(63, '', '<div>1、在理论经济学方面，投资是指购买(和因此生产) 资本货物&mdash;&mdash;不会被消耗掉而反倒是被使用在未来生产的物品。实例包括了修造铁路或工厂、清洁土地或让自己读大学。严格地讲，在公式GDP = C + I + G + N - X 里，投资也是国民生产总值(GDP)的一部分。在那方面来说，投资的功能被划分成非居住性投资(譬如工厂、机械等)和居住性投资(新房)。从 I = (Y，i) 的关联中可得知：投资是与收入和利率有密切关系的事。收入的增加将促进更高额的投资，但是更高的利率将阻碍投资，因为借钱的费用变得更加昂贵。既使企业选择使用自己的资金来投资，利率代表着所投资的那些资金的机会成本，而不是将资金放贷出去的利息。</div>\r\n<div>&nbsp;</div>\r\n<div>　　2、在财务方面，投资意味着买证券或其它金融资产。估价是估计一项潜在投资的价格的方法。投资的类型包括房地产、证券投资、黄金、外币、债券或邮票。之后这些投资也许会提供未来的现金流，也许其价值会增加或减少。股市里的投资是由证卷投资者来执行。</div>\r\n<div>&nbsp;</div>\r\n<div>　　3、集体投资计划经由推销投资的价值来鼓励投资者购买证券。</div>\r\n<div>&nbsp;</div>\r\n4、投资俱乐部是以投资金钱为目的而经常聚会的团体，其投资标的通常是股票和其他公开交易的证券。近来出现了致力于这类型投资的各式网络群组，并且在美国促成了个人投资的景气。&nbsp;');
/*!40000 ALTER TABLE `mg_c_simplenews` ENABLE KEYS */;


# Dumping structure for table mg_wlsm.mg_c_team
DROP TABLE IF EXISTS `mg_c_team`;
CREATE TABLE IF NOT EXISTS `mg_c_team` (
  `contentid` mediumint(8) unsigned NOT NULL,
  `template` char(30) NOT NULL,
  `content` mediumtext NOT NULL,
  PRIMARY KEY (`contentid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# Dumping data for table mg_wlsm.mg_c_team: 7 rows
DELETE FROM `mg_c_team`;
/*!40000 ALTER TABLE `mg_c_team` DISABLE KEYS */;
INSERT INTO `mg_c_team` (`contentid`, `template`, `content`) VALUES
	(39, '', '&nbsp;得到地地道道地地道道'),
	(38, '', ''),
	(37, '', ''),
	(36, '', ''),
	(35, '', ''),
	(44, '', '&nbsp;动画师团队动画师团队动画师团队动画师团队动画师团队动画师团队动画师团队动画师团队动画师团队动画师团队动画师团队动画师团队动画师团队动画师团队动画师团队动画师团队动画师团队动画师团队动画师团队动画师团队动画师团队动画师团队动画师团队动画师团队动画师团队动画师团队动画师团队动画师团队动画师团队动画师团队动画师团队动画师团队动画师团队动画师团队'),
	(45, '', '&nbsp;设计师团队设计师团队设计师团队设计师团队设计师团队设计师团队设计师团队设计师团队设计师团队设计师团队设计师团队设计师团队设计师团队设计师团队设计师团队设计师团队设计师团队设计师团队设计师团队设计师团队设计师团队设计师团队设计师团队设计师团队设计师团队设计师团队设计师团队设计师团队设计师团队设计师团队设计师团队设计师团队设计师团队设计师团队设计师团队设计师团队设计师团队设计师团队设计师团队设计师团队设计师团队设计师团队设计师团队设计师团队设计师团队设计师团队设计师团队设计师团队设计师团队设计师团队设计师团队设计师团队设计师团队设计师团队设计师团队设计师团队设计师团队设计师团队设计师团队设计师团队设计师团队设计师团队设计师团队设计师团队设计师团队设计师团队设计师团队设计师团队设计师团队设计师团队设计师团队');
/*!40000 ALTER TABLE `mg_c_team` ENABLE KEYS */;


# Dumping structure for table mg_wlsm.mg_datasource
DROP TABLE IF EXISTS `mg_datasource`;
CREATE TABLE IF NOT EXISTS `mg_datasource` (
  `name` varchar(15) NOT NULL,
  `dbtype` varchar(10) NOT NULL,
  `dbhost` varchar(15) NOT NULL,
  `dbuser` varchar(30) NOT NULL,
  `dbpw` varchar(50) NOT NULL,
  `dbname` varchar(30) NOT NULL,
  `dbcharset` varchar(10) NOT NULL,
  `tablename` varchar(30) NOT NULL,
  `fields` varchar(255) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# Dumping data for table mg_wlsm.mg_datasource: 0 rows
DELETE FROM `mg_datasource`;
/*!40000 ALTER TABLE `mg_datasource` DISABLE KEYS */;
/*!40000 ALTER TABLE `mg_datasource` ENABLE KEYS */;


# Dumping structure for table mg_wlsm.mg_editor_data
DROP TABLE IF EXISTS `mg_editor_data`;
CREATE TABLE IF NOT EXISTS `mg_editor_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `editorid` char(15) NOT NULL,
  `ip` char(15) NOT NULL,
  `created_time` int(10) unsigned NOT NULL DEFAULT '0',
  `data` mediumtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`,`editorid`,`created_time`,`id`)
) ENGINE=MyISAM AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;

# Dumping data for table mg_wlsm.mg_editor_data: 20 rows
DELETE FROM `mg_editor_data`;
/*!40000 ALTER TABLE `mg_editor_data` DISABLE KEYS */;
INSERT INTO `mg_editor_data` (`id`, `userid`, `editorid`, `ip`, `created_time`, `data`) VALUES
	(61, 1, 'mail_sign', '127.0.0.1', 1332847516, '&nbsp;'),
	(59, 1, 'mail_sign', '127.0.0.1', 1332846509, '&nbsp;'),
	(60, 1, 'copyright', '127.0.0.1', 1332847516, '<p>&nbsp;济南青春动漫咨询有限公司 联系地址：山东省济南市 咨询电话：0531-88888888&nbsp;</p> <p>Copyright &copy; 济南青春动漫咨询有限公司 2012All rights reserved&nbsp;</p>'),
	(51, 1, 'content', '127.0.0.1', 1332838811, '&nbsp;'),
	(50, 1, 'content', '127.0.0.1', 1332837003, '&nbsp;'),
	(49, 1, 'content', '127.0.0.1', 1332835674, '&nbsp;'),
	(58, 1, 'copyright', '127.0.0.1', 1332846509, '<p>&nbsp;</p> <p>济南青春动漫咨询有限公司 联系地址：山东省济南市 咨询电话：0531-88888888&nbsp;</p> <p>Copyright &copy; 济南青春动漫咨询有限公司 2012All rights reserved&nbsp;</p> <p>&nbsp;</p>'),
	(57, 1, 'mail_sign', '127.0.0.1', 1332846454, '&nbsp;'),
	(55, 1, 'mail_sign', '127.0.0.1', 1332846408, '&nbsp;'),
	(56, 1, 'copyright', '127.0.0.1', 1332846454, '<p>&nbsp;</p><p>济南青春动漫咨询有限公司 联系地址：山东省济南市 咨询电话：0531-88888888&nbsp;</p> <p>Copyright &copy; 济南青春动漫咨询有限公司 2012All rights reserved&nbsp;</p> <p>&nbsp;</p>'),
	(54, 1, 'content', '127.0.0.1', 1332846263, '&nbsp;'),
	(53, 1, 'copyright', '127.0.0.1', 1332844741, '<p>CopyRight 2006---2009&nbsp; <a href="http://www.wslm.cn/">酷6网（北京）信息技术有限公司</a>版权所有</p>'),
	(52, 1, 'mail_sign', '127.0.0.1', 1332844741, '&nbsp;');
/*!40000 ALTER TABLE `mg_editor_data` ENABLE KEYS */;


# Dumping structure for table mg_wlsm.mg_formguide
DROP TABLE IF EXISTS `mg_formguide`;
CREATE TABLE IF NOT EXISTS `mg_formguide` (
  `formid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `tablename` varchar(30) NOT NULL,
  `introduce` varchar(255) NOT NULL,
  `setting` mediumtext NOT NULL,
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `template` varchar(50) NOT NULL,
  `disabled` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`formid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# Dumping data for table mg_wlsm.mg_formguide: 0 rows
DELETE FROM `mg_formguide`;
/*!40000 ALTER TABLE `mg_formguide` DISABLE KEYS */;
/*!40000 ALTER TABLE `mg_formguide` ENABLE KEYS */;


# Dumping structure for table mg_wlsm.mg_formguide_fields
DROP TABLE IF EXISTS `mg_formguide_fields`;
CREATE TABLE IF NOT EXISTS `mg_formguide_fields` (
  `fieldid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `formid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field` varchar(20) NOT NULL,
  `name` varchar(30) NOT NULL,
  `tips` text NOT NULL,
  `css` varchar(30) NOT NULL,
  `minlength` int(10) unsigned NOT NULL DEFAULT '0',
  `maxlength` int(10) unsigned NOT NULL DEFAULT '0',
  `pattern` varchar(255) NOT NULL,
  `errortips` varchar(255) NOT NULL,
  `formtype` varchar(20) NOT NULL,
  `setting` mediumtext NOT NULL,
  `formattribute` varchar(255) NOT NULL,
  `unsetgroupids` varchar(255) NOT NULL,
  `issystem` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isbackground` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isunique` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `issearch` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isselect` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islist` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isshow` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `listorder` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`fieldid`),
  KEY `field` (`field`,`formid`),
  KEY `formid` (`formid`,`disabled`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# Dumping data for table mg_wlsm.mg_formguide_fields: 0 rows
DELETE FROM `mg_formguide_fields`;
/*!40000 ALTER TABLE `mg_formguide_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `mg_formguide_fields` ENABLE KEYS */;


# Dumping structure for table mg_wlsm.mg_guestbook
DROP TABLE IF EXISTS `mg_guestbook`;
CREATE TABLE IF NOT EXISTS `mg_guestbook` (
  `gid` smallint(5) NOT NULL AUTO_INCREMENT,
  `title` char(80) NOT NULL,
  `content` text NOT NULL,
  `reply` text NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `gender` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `head` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `email` char(40) NOT NULL,
  `qq` char(15) NOT NULL,
  `homepage` char(25) NOT NULL,
  `hidden` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `passed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ip` char(15) NOT NULL,
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `replyer` char(20) NOT NULL,
  `replytime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`gid`),
  KEY `hidden` (`hidden`,`gid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

# Dumping data for table mg_wlsm.mg_guestbook: 2 rows
DELETE FROM `mg_guestbook`;
/*!40000 ALTER TABLE `mg_guestbook` DISABLE KEYS */;
INSERT INTO `mg_guestbook` (`gid`, `title`, `content`, `reply`, `userid`, `username`, `gender`, `head`, `email`, `qq`, `homepage`, `hidden`, `passed`, `ip`, `addtime`, `replyer`, `replytime`) VALUES
	(1, 'ddddddddddddd', 'ddddddddddddddddddddddddddd', '&nbsp;我的回复内容', 1, 'dddddddddd', 0, 0, 'ddddddddddd', 'dddddddddddd', '', 0, 1, '127.0.0.1', 1332839528, 'admin', 1332840886),
	(2, 'dddddddddddddd', 'ddddddddddddddffffffffaaaaaaaaaaaaaaaaaaa', '', 1, 'fffffffffffffffff', 0, 0, 'dddddddddfff', 'ffffffffffffff', 'fffffffffffff', 0, 1, '127.0.0.1', 1332841322, '', 0);
/*!40000 ALTER TABLE `mg_guestbook` ENABLE KEYS */;


# Dumping structure for table mg_wlsm.mg_hits
DROP TABLE IF EXISTS `mg_hits`;
CREATE TABLE IF NOT EXISTS `mg_hits` (
  `field` char(10) NOT NULL,
  `value` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `date` date NOT NULL DEFAULT '0000-00-00',
  `hits` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`field`,`value`,`date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# Dumping data for table mg_wlsm.mg_hits: 4 rows
DELETE FROM `mg_hits`;
/*!40000 ALTER TABLE `mg_hits` DISABLE KEYS */;
INSERT INTO `mg_hits` (`field`, `value`, `date`, `hits`) VALUES
	('catid', 13, '2012-03-27', 12),
	('catid', 29, '2012-03-27', 2),
	('catid', 78, '2012-03-27', 5),
	('catid', 14, '2012-03-27', 1),
	('catid', 15, '2012-03-27', 1),
	('catid', 17, '2012-03-27', 1);
/*!40000 ALTER TABLE `mg_hits` ENABLE KEYS */;


# Dumping structure for table mg_wlsm.mg_ipbanned
DROP TABLE IF EXISTS `mg_ipbanned`;
CREATE TABLE IF NOT EXISTS `mg_ipbanned` (
  `ip` char(15) NOT NULL,
  `expires` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# Dumping data for table mg_wlsm.mg_ipbanned: 0 rows
DELETE FROM `mg_ipbanned`;
/*!40000 ALTER TABLE `mg_ipbanned` DISABLE KEYS */;
/*!40000 ALTER TABLE `mg_ipbanned` ENABLE KEYS */;


# Dumping structure for table mg_wlsm.mg_keylink
DROP TABLE IF EXISTS `mg_keylink`;
CREATE TABLE IF NOT EXISTS `mg_keylink` (
  `keylinkid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `word` char(40) NOT NULL,
  `url` char(100) NOT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`keylinkid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# Dumping data for table mg_wlsm.mg_keylink: 0 rows
DELETE FROM `mg_keylink`;
/*!40000 ALTER TABLE `mg_keylink` DISABLE KEYS */;
/*!40000 ALTER TABLE `mg_keylink` ENABLE KEYS */;


# Dumping structure for table mg_wlsm.mg_keyword
DROP TABLE IF EXISTS `mg_keyword`;
CREATE TABLE IF NOT EXISTS `mg_keyword` (
  `tagid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `tag` char(20) NOT NULL,
  `style` char(5) NOT NULL,
  `usetimes` smallint(5) unsigned NOT NULL DEFAULT '0',
  `lastusetime` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `lasthittime` int(10) unsigned NOT NULL DEFAULT '0',
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`tagid`),
  UNIQUE KEY `tag` (`tag`),
  KEY `usetimes` (`usetimes`,`listorder`),
  KEY `hits` (`hits`,`listorder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# Dumping data for table mg_wlsm.mg_keyword: 0 rows
DELETE FROM `mg_keyword`;
/*!40000 ALTER TABLE `mg_keyword` DISABLE KEYS */;
/*!40000 ALTER TABLE `mg_keyword` ENABLE KEYS */;


# Dumping structure for table mg_wlsm.mg_link
DROP TABLE IF EXISTS `mg_link`;
CREATE TABLE IF NOT EXISTS `mg_link` (
  `linkid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `typeid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `linktype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `style` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `logo` varchar(255) NOT NULL DEFAULT '',
  `introduce` text NOT NULL,
  `username` varchar(30) NOT NULL DEFAULT '',
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `elite` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `passed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`linkid`),
  KEY `typeid` (`typeid`,`passed`,`listorder`,`linkid`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

# Dumping data for table mg_wlsm.mg_link: 4 rows
DELETE FROM `mg_link`;
/*!40000 ALTER TABLE `mg_link` DISABLE KEYS */;
INSERT INTO `mg_link` (`linkid`, `typeid`, `linktype`, `style`, `name`, `url`, `logo`, `introduce`, `username`, `listorder`, `elite`, `passed`, `addtime`, `hits`) VALUES
	(4, 1, 1, '', '百度', 'http://baidu.com', 'uploadfile/2012/0326/20120326103030436.png', '', '', 0, 1, 1, 1332729140, 0),
	(5, 1, 1, '', '谷歌', 'http://google.com.hk', 'uploadfile/2012/0326/20120326103253564.png', '', '', 0, 1, 1, 1332729174, 0),
	(6, 1, 0, '', '百度', 'http://baidu.com', '', '', '', 0, 1, 1, 1332729200, 0),
	(7, 1, 0, '', '谷歌', 'http://google.com.hk', '', '', '', 0, 1, 1, 1332729224, 0);
/*!40000 ALTER TABLE `mg_link` ENABLE KEYS */;


# Dumping structure for table mg_wlsm.mg_linkage
DROP TABLE IF EXISTS `mg_linkage`;
CREATE TABLE IF NOT EXISTS `mg_linkage` (
  `linkageid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `style` varchar(35) NOT NULL,
  `parentid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `arrparentid` varchar(255) NOT NULL DEFAULT '',
  `child` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `arrchildid` mediumtext NOT NULL,
  `keyid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`linkageid`,`keyid`),
  KEY `parentid` (`parentid`,`listorder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# Dumping data for table mg_wlsm.mg_linkage: 0 rows
DELETE FROM `mg_linkage`;
/*!40000 ALTER TABLE `mg_linkage` DISABLE KEYS */;
/*!40000 ALTER TABLE `mg_linkage` ENABLE KEYS */;


# Dumping structure for table mg_wlsm.mg_log
DROP TABLE IF EXISTS `mg_log`;
CREATE TABLE IF NOT EXISTS `mg_log` (
  `logid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `field` varchar(15) NOT NULL,
  `value` int(10) unsigned NOT NULL DEFAULT '0',
  `module` varchar(15) NOT NULL,
  `file` varchar(20) NOT NULL,
  `action` varchar(20) NOT NULL,
  `querystring` varchar(255) NOT NULL,
  `data` mediumtext NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(20) NOT NULL,
  `ip` varchar(15) NOT NULL,
  `time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`logid`),
  KEY `userid` (`userid`),
  KEY `module` (`module`,`file`,`action`),
  KEY `field` (`field`,`value`)
) ENGINE=MyISAM AUTO_INCREMENT=231 DEFAULT CHARSET=utf8;

# Dumping data for table mg_wlsm.mg_log: 220 rows
DELETE FROM `mg_log`;
/*!40000 ALTER TABLE `mg_log` DISABLE KEYS */;
INSERT INTO `mg_log` (`logid`, `field`, `value`, `module`, `file`, `action`, `querystring`, `data`, `userid`, `username`, `ip`, `time`) VALUES
	(1, 'contentid', 1, 'wslm', 'content', 'add', 'mod=wslm&file=content&action=add&catid=64&modelid=23', '', 1, 'admin', '127.0.0.1', '2012-03-25 21:48:24'),
	(2, 'contentid', 2, 'wslm', 'content', 'add', 'mod=wslm&file=content&action=add&catid=64&modelid=23', '', 1, 'admin', '127.0.0.1', '2012-03-25 22:07:15'),
	(3, 'contentid', 1, 'wslm', 'content', 'pass', 'mod=wslm&file=content&action=pass&catid=64&processid=1&forward=http%3A%2F%2F127.0.0.1%2Fwslm%2Fhoutai.php%3Fmod%3Dwslm%26file%3Dcontent%26action%3Dcheck%26catid%3D64%26processid%3D1%26status%3D3', '', 1, 'admin', '127.0.0.1', '2012-03-25 22:09:54'),
	(4, 'contentid', 2, 'wslm', 'content', 'pass', 'mod=wslm&file=content&action=pass&catid=64&processid=1&forward=http%3A%2F%2F127.0.0.1%2Fwslm%2Fhoutai.php%3Fmod%3Dwslm%26file%3Dcontent%26action%3Dcheck%26catid%3D64%26processid%3D1%26status%3D3', '', 1, 'admin', '127.0.0.1', '2012-03-25 22:09:54'),
	(5, 'contentid', 2, 'wslm', 'content', 'cancel', 'mod=wslm&file=content&action=cancel&catid=64&processid=1&forward=http%3A%2F%2F127.0.0.1%2Fwslm%2Fhoutai.php%3Fmod%3Dwslm%26file%3Dcontent%26action%3Dmanage%26catid%3D64', '', 1, 'admin', '127.0.0.1', '2012-03-25 22:10:03'),
	(6, 'contentid', 1, 'wslm', 'content', 'edit', 'mod=wslm&file=content&action=edit&contentid=1', '', 1, 'admin', '127.0.0.1', '2012-03-25 22:10:13'),
	(7, 'contentid', 3, 'wslm', 'content', 'add', 'mod=wslm&file=content&action=add&catid=65&modelid=25', '', 1, 'admin', '127.0.0.1', '2012-03-25 22:11:22'),
	(8, 'contentid', 4, 'wslm', 'content', 'add', 'mod=wslm&file=content&action=add&catid=66&modelid=23', '', 1, 'admin', '127.0.0.1', '2012-03-25 22:12:00'),
	(9, 'contentid', 5, 'wslm', 'content', 'add', 'mod=wslm&file=content&action=add&catid=67&modelid=25', '', 1, 'admin', '127.0.0.1', '2012-03-25 22:12:22'),
	(10, 'contentid', 6, 'wslm', 'content', 'add', 'mod=wslm&file=content&action=add&catid=67&modelid=25', '', 1, 'admin', '127.0.0.1', '2012-03-25 22:12:47'),
	(11, 'contentid', 3, 'wslm', 'content', 'pass', 'mod=wslm&file=content&action=pass&catid=65&processid=1&forward=http%3A%2F%2F127.0.0.1%2Fwslm%2Fhoutai.php%3Fmod%3Dwslm%26file%3Dcontent%26action%3Dcheck%26catid%3D65%26processid%3D1%26status%3D3', '', 1, 'admin', '127.0.0.1', '2012-03-25 22:13:01'),
	(12, 'contentid', 4, 'wslm', 'content', 'pass', 'mod=wslm&file=content&action=pass&catid=66&processid=1&forward=http%3A%2F%2F127.0.0.1%2Fwslm%2Fhoutai.php%3Fmod%3Dwslm%26file%3Dcontent%26action%3Dcheck%26catid%3D66%26processid%3D1%26status%3D3', '', 1, 'admin', '127.0.0.1', '2012-03-25 22:13:10'),
	(13, 'contentid', 5, 'wslm', 'content', 'pass', 'mod=wslm&file=content&action=pass&catid=67&processid=1&forward=http%3A%2F%2F127.0.0.1%2Fwslm%2Fhoutai.php%3Fmod%3Dwslm%26file%3Dcontent%26action%3Dcheck%26catid%3D67%26processid%3D1%26status%3D-1', '', 1, 'admin', '127.0.0.1', '2012-03-25 22:13:21'),
	(14, 'contentid', 7, 'wslm', 'content', 'add', 'mod=wslm&file=content&action=add&catid=67&modelid=25', '', 1, 'admin', '127.0.0.1', '2012-03-25 22:13:58'),
	(15, 'contentid', 7, 'wslm', 'content', 'pass', 'mod=wslm&file=content&action=pass&catid=67&processid=1&forward=http%3A%2F%2F127.0.0.1%2Fwslm%2Fhoutai.php%3Fmod%3Dwslm%26file%3Dcontent%26action%3Dcheck%26catid%3D67%26processid%3D1%26status%3D3', '', 1, 'admin', '127.0.0.1', '2012-03-25 22:14:07'),
	(16, 'contentid', 8, 'wslm', 'content', 'add', 'mod=wslm&file=content&action=add&catid=68&modelid=23', '', 1, 'admin', '127.0.0.1', '2012-03-25 22:16:50'),
	(17, 'contentid', 8, 'wslm', 'content', 'pass', 'mod=wslm&file=content&action=pass&catid=68&processid=1&forward=http%3A%2F%2F127.0.0.1%2Fwslm%2Fhoutai.php%3Fmod%3Dwslm%26file%3Dcontent%26action%3Dcheck%26catid%3D68%26processid%3D1%26status%3D3', '', 1, 'admin', '127.0.0.1', '2012-03-25 22:16:58'),
	(18, 'contentid', 9, 'wslm', 'content', 'pass', 'mod=wslm&file=content&action=pass&catid=69&processid=1&forward=http%3A%2F%2F127.0.0.1%2Fwslm%2Fhoutai.php%3Fmod%3Dwslm%26file%3Dcontent%26action%3Dcheck%26catid%3D69%26processid%3D1%26status%3D3', '', 1, 'admin', '127.0.0.1', '2012-03-25 22:18:18'),
	(19, 'contentid', 11, 'wslm', 'content', 'add', 'mod=wslm&file=content&action=add&catid=70&modelid=23', '', 1, 'admin', '127.0.0.1', '2012-03-25 22:19:16'),
	(20, 'contentid', 11, 'wslm', 'content', 'pass', 'mod=wslm&file=content&action=pass&catid=70&processid=1&forward=http%3A%2F%2F127.0.0.1%2Fwslm%2Fhoutai.php%3Fmod%3Dwslm%26file%3Dcontent%26action%3Dcheck%26catid%3D70%26processid%3D1%26status%3D3', '', 1, 'admin', '127.0.0.1', '2012-03-25 22:19:25'),
	(21, 'contentid', 12, 'wslm', 'content', 'add', 'mod=wslm&file=content&action=add&catid=71&modelid=23', '', 1, 'admin', '127.0.0.1', '2012-03-25 22:20:04'),
	(22, 'contentid', 13, 'wslm', 'content', 'add', 'mod=wslm&file=content&action=add&catid=71&modelid=23', '', 1, 'admin', '127.0.0.1', '2012-03-25 22:22:06'),
	(23, 'contentid', 13, 'wslm', 'content_all', 'pass', 'mod=wslm&file=content_all&action=pass&catid=0&forward=http%3A%2F%2F127.0.0.1%2Fwslm%2Fhoutai.php%3Fmod%3Dwslm%26file%3Dcontent_all%26action%3Dmanage%26status%3D1000', '', 1, 'admin', '127.0.0.1', '2012-03-25 22:30:44'),
	(24, 'contentid', 12, 'wslm', 'content_all', 'pass', 'mod=wslm&file=content_all&action=pass&catid=0&forward=http%3A%2F%2F127.0.0.1%2Fwslm%2Fhoutai.php%3Fmod%3Dwslm%26file%3Dcontent_all%26action%3Dmanage%26status%3D1000', '', 1, 'admin', '127.0.0.1', '2012-03-25 22:30:44'),
	(25, 'contentid', 14, 'wslm', 'content', 'add', 'mod=wslm&file=content&action=add&catid=72&modelid=25', '', 1, 'admin', '127.0.0.1', '2012-03-25 22:32:50'),
	(26, 'contentid', 14, 'wslm', 'content', 'my_edit', 'mod=wslm&file=content&action=my_edit&contentid=14', '', 1, 'admin', '127.0.0.1', '2012-03-25 22:35:17'),
	(27, 'contentid', 15, 'wslm', 'content', 'add', 'mod=wslm&file=content&action=add&catid=73&modelid=23', '', 1, 'admin', '127.0.0.1', '2012-03-25 22:50:17'),
	(28, 'contentid', 17, 'wslm', 'content', 'add', 'mod=wslm&file=content&action=add&catid=75&modelid=23', '', 1, 'admin', '127.0.0.1', '2012-03-25 22:52:08'),
	(29, 'contentid', 18, 'wslm', 'content', 'add', 'mod=wslm&file=content&action=add&catid=15&modelid=21', '', 1, 'admin', '127.0.0.1', '2012-03-26 09:30:41'),
	(30, 'contentid', 19, 'wslm', 'content', 'add', 'mod=wslm&file=content&action=add&catid=15&modelid=21', '', 1, 'admin', '127.0.0.1', '2012-03-26 09:37:49'),
	(31, 'contentid', 20, 'wslm', 'content', 'add', 'mod=wslm&file=content&action=add&catid=15&modelid=21', '', 1, 'admin', '127.0.0.1', '2012-03-26 09:38:23'),
	(32, 'contentid', 21, 'wslm', 'content', 'add', 'mod=wslm&file=content&action=add&catid=16&modelid=21', '', 1, 'admin', '127.0.0.1', '2012-03-26 09:39:45'),
	(33, 'contentid', 22, 'wslm', 'content', 'add', 'mod=wslm&file=content&action=add&catid=16&modelid=21', '', 1, 'admin', '127.0.0.1', '2012-03-26 09:39:58'),
	(34, 'contentid', 23, 'wslm', 'content', 'add', 'mod=wslm&file=content&action=add&catid=16&modelid=21', '', 1, 'admin', '127.0.0.1', '2012-03-26 09:40:20'),
	(35, 'contentid', 24, 'wslm', 'content', 'add', 'mod=wslm&file=content&action=add&catid=17&modelid=21', '', 1, 'admin', '127.0.0.1', '2012-03-26 09:40:35'),
	(36, 'contentid', 25, 'wslm', 'content', 'add', 'mod=wslm&file=content&action=add&catid=17&modelid=21', '', 1, 'admin', '127.0.0.1', '2012-03-26 09:40:50'),
	(37, 'contentid', 26, 'wslm', 'content', 'add', 'mod=wslm&file=content&action=add&catid=17&modelid=21', '', 1, 'admin', '127.0.0.1', '2012-03-26 09:41:14'),
	(38, 'contentid', 27, 'wslm', 'content', 'add', 'mod=wslm&file=content&action=add&catid=76&modelid=28', '', 1, 'admin', '127.0.0.1', '2012-03-26 09:57:55'),
	(39, 'contentid', 28, 'wslm', 'content', 'add', 'mod=wslm&file=content&action=add&catid=76&modelid=28', '', 1, 'admin', '127.0.0.1', '2012-03-26 10:00:03'),
	(40, 'contentid', 29, 'wslm', 'content', 'add', 'mod=wslm&file=content&action=add&catid=76&modelid=28', '', 1, 'admin', '127.0.0.1', '2012-03-26 10:00:34'),
	(41, 'contentid', 30, 'wslm', 'content', 'add', 'mod=wslm&file=content&action=add&catid=76&modelid=28', '', 1, 'admin', '127.0.0.1', '2012-03-26 10:00:57'),
	(42, 'contentid', 31, 'wslm', 'content', 'add', 'mod=wslm&file=content&action=add&catid=76&modelid=28', '', 1, 'admin', '127.0.0.1', '2012-03-26 10:01:25'),
	(43, 'contentid', 32, 'wslm', 'content', 'add', 'mod=wslm&file=content&action=add&catid=76&modelid=28', '', 1, 'admin', '127.0.0.1', '2012-03-26 10:01:58'),
	(44, 'contentid', 33, 'wslm', 'content', 'add', 'mod=wslm&file=content&action=add&catid=76&modelid=28', '', 1, 'admin', '127.0.0.1', '2012-03-26 10:02:52'),
	(45, 'contentid', 34, 'wslm', 'content', 'add', 'mod=wslm&file=content&action=add&catid=76&modelid=28', '', 1, 'admin', '127.0.0.1', '2012-03-26 10:03:14'),
	(46, 'contentid', 34, 'wslm', 'content', 'edit', 'mod=wslm&file=content&action=edit&contentid=34', '', 1, 'admin', '127.0.0.1', '2012-03-26 10:11:16'),
	(47, 'contentid', 34, 'wslm', 'content', 'edit', 'mod=wslm&file=content&action=edit&contentid=34', '', 1, 'admin', '127.0.0.1', '2012-03-26 10:11:35'),
	(48, 'blockid', 18, 'wslm', 'block', 'add', 'mod=wslm&file=block&action=add&ajax=1', 'array (\n  \'pageid\' => \'tel\',\n  \'blockno\' => \'1\',\n  \'name\' => \'顶部-电话\',\n  \'listorder\' => \'1\',\n  \'isarray\' => \'0\',\n  \'rows\' => \'6\',\n)', 1, 'admin', '127.0.0.1', '2012-03-26 10:26:33'),
	(49, 'blockid', 18, 'wslm', 'block', 'update', 'mod=wslm&file=block&action=update&dosubmit=1&ajax=1&blockid=18', 'array (\n  \'data\' => \'<img alt="" src="/wslm/uploadfile/2012/0326/20120326102706440.jpg" />\',\n)', 1, 'admin', '127.0.0.1', '2012-03-26 10:27:09'),
	(50, 'blockid', 19, 'wslm', 'block', 'add', 'mod=wslm&file=block&action=add&ajax=1', 'array (\n  \'pageid\' => \'about\',\n  \'blockno\' => \'1\',\n  \'name\' => \'底部介绍\',\n  \'listorder\' => \'1\',\n  \'isarray\' => \'0\',\n  \'rows\' => \'6\',\n)', 1, 'admin', '127.0.0.1', '2012-03-26 10:27:38'),
	(51, 'blockid', 19, 'wslm', 'block', 'update', 'mod=wslm&file=block&action=update&dosubmit=1&ajax=1&blockid=19', 'array (\n  \'data\' => \'济南青春咨询有限公司是由工商行政管理部门比准注册的国内第一家专门为动漫产品经营管理行业提供管理咨询服务的专业机构。公司凭借多年的行业管理经验和咨询案例经验，为动漫行业从业者提供产品。济南青春咨询有限公司是由工商行政管理部门比准注册的国内第一家专门为动漫产品经营管理行业提供管理咨询服务的专业机构。\',\n)', 1, 'admin', '127.0.0.1', '2012-03-26 10:28:16'),
	(52, 'blockid', 20, 'wslm', 'block', 'add', 'mod=wslm&file=block&action=add&ajax=1', 'array (\n  \'pageid\' => \'tel\',\n  \'blockno\' => \'1\',\n  \'name\' => \'关于我们-企业简介\',\n  \'listorder\' => \'3\',\n  \'isarray\' => \'0\',\n  \'rows\' => \'6\',\n)', 1, 'admin', '127.0.0.1', '2012-03-26 11:09:27'),
	(53, 'blockid', 21, 'wslm', 'block', 'add', 'mod=wslm&file=block&action=add&ajax=1', 'array (\n  \'pageid\' => \'cat_about_culture\',\n  \'blockno\' => \'1\',\n  \'name\' => \'关于我们-企业文化\',\n  \'listorder\' => \'1\',\n  \'isarray\' => \'0\',\n  \'rows\' => \'6\',\n)', 1, 'admin', '127.0.0.1', '2012-03-26 11:09:44'),
	(54, 'blockid', 21, 'wslm', 'block', 'update', 'mod=wslm&file=block&action=update&dosubmit=1&ajax=1&blockid=21', 'array (\n  \'data\' => \'当要讲述的故事越发复杂、人物越发丰富的时候，用传统单线式叙事的方法就越行不通，蒙太奇的介入就成为一种需要了；当漫画家在传统表现手段中无法找到更合适...\',\n)', 1, 'admin', '127.0.0.1', '2012-03-26 11:09:47'),
	(55, 'blockid', 8, 'wslm', 'block', 'delete', 'file=block&action=delete&blockid=8', '', 1, 'admin', '127.0.0.1', '2012-03-26 11:10:10'),
	(56, 'blockid', 20, 'wslm', 'block', 'delete', 'mod=wslm&file=block&action=delete&forward=http%3A%2F%2F127.0.0.1%2Fwslm%2Fhoutai.php%3Fmod%3Dwslm%26file%3Dblock%26action%3Dmanage', '', 1, 'admin', '127.0.0.1', '2012-03-26 11:10:31'),
	(57, 'blockid', 17, 'wslm', 'block', 'delete', 'mod=wslm&file=block&action=delete&forward=http%3A%2F%2F127.0.0.1%2Fwslm%2Fhoutai.php%3Fmod%3Dwslm%26file%3Dblock%26action%3Dmanage', '', 1, 'admin', '127.0.0.1', '2012-03-26 11:10:31'),
	(58, 'blockid', 16, 'wslm', 'block', 'delete', 'mod=wslm&file=block&action=delete&forward=http%3A%2F%2F127.0.0.1%2Fwslm%2Fhoutai.php%3Fmod%3Dwslm%26file%3Dblock%26action%3Dmanage', '', 1, 'admin', '127.0.0.1', '2012-03-26 11:10:31'),
	(59, 'blockid', 15, 'wslm', 'block', 'delete', 'mod=wslm&file=block&action=delete&forward=http%3A%2F%2F127.0.0.1%2Fwslm%2Fhoutai.php%3Fmod%3Dwslm%26file%3Dblock%26action%3Dmanage', '', 1, 'admin', '127.0.0.1', '2012-03-26 11:10:31'),
	(60, 'blockid', 14, 'wslm', 'block', 'delete', 'mod=wslm&file=block&action=delete&forward=http%3A%2F%2F127.0.0.1%2Fwslm%2Fhoutai.php%3Fmod%3Dwslm%26file%3Dblock%26action%3Dmanage', '', 1, 'admin', '127.0.0.1', '2012-03-26 11:10:31'),
	(61, 'blockid', 13, 'wslm', 'block', 'delete', 'mod=wslm&file=block&action=delete&forward=http%3A%2F%2F127.0.0.1%2Fwslm%2Fhoutai.php%3Fmod%3Dwslm%26file%3Dblock%26action%3Dmanage', '', 1, 'admin', '127.0.0.1', '2012-03-26 11:10:31'),
	(62, 'blockid', 12, 'wslm', 'block', 'delete', 'mod=wslm&file=block&action=delete&forward=http%3A%2F%2F127.0.0.1%2Fwslm%2Fhoutai.php%3Fmod%3Dwslm%26file%3Dblock%26action%3Dmanage', '', 1, 'admin', '127.0.0.1', '2012-03-26 11:10:31'),
	(63, 'blockid', 11, 'wslm', 'block', 'delete', 'mod=wslm&file=block&action=delete&forward=http%3A%2F%2F127.0.0.1%2Fwslm%2Fhoutai.php%3Fmod%3Dwslm%26file%3Dblock%26action%3Dmanage', '', 1, 'admin', '127.0.0.1', '2012-03-26 11:10:31'),
	(64, 'blockid', 10, 'wslm', 'block', 'delete', 'mod=wslm&file=block&action=delete&forward=http%3A%2F%2F127.0.0.1%2Fwslm%2Fhoutai.php%3Fmod%3Dwslm%26file%3Dblock%26action%3Dmanage', '', 1, 'admin', '127.0.0.1', '2012-03-26 11:10:31'),
	(65, 'blockid', 9, 'wslm', 'block', 'delete', 'mod=wslm&file=block&action=delete&forward=http%3A%2F%2F127.0.0.1%2Fwslm%2Fhoutai.php%3Fmod%3Dwslm%26file%3Dblock%26action%3Dmanage', '', 1, 'admin', '127.0.0.1', '2012-03-26 11:10:31'),
	(66, 'blockid', 22, 'wslm', 'block', 'add', 'mod=wslm&file=block&action=add&ajax=1', 'array (\n  \'pageid\' => \'cat_about_us\',\n  \'blockno\' => \'1\',\n  \'name\' => \'关于我们-企业简介\',\n  \'listorder\' => \'1\',\n  \'isarray\' => \'0\',\n  \'rows\' => \'6\',\n)', 1, 'admin', '127.0.0.1', '2012-03-26 11:10:55'),
	(67, 'blockid', 22, 'wslm', 'block', 'update', 'mod=wslm&file=block&action=update&dosubmit=1&ajax=1&blockid=22', 'array (\n  \'data\' => \'由于漫画本身的发展形成了现代故事漫画的表现形式，将影视艺术融入漫画之中，使得漫画与动画更容易结合，影视艺术独特的地方在于它能通过镜头的推拉摇移和片段剪辑的蒙太奇技巧来表达想法和感受。漫画正是吸收了影视艺术的这两个特点漫画正是吸收了影视艺术的这两个特点...\',\n)', 1, 'admin', '127.0.0.1', '2012-03-26 11:10:57'),
	(68, 'blockid', 23, 'wslm', 'block', 'add', 'mod=wslm&file=block&action=add&ajax=1', 'array (\n  \'pageid\' => \'top_1\',\n  \'blockno\' => \'1\',\n  \'name\' => \'关于我们-banner\',\n  \'listorder\' => \'1\',\n  \'isarray\' => \'0\',\n  \'rows\' => \'6\',\n)', 1, 'admin', '127.0.0.1', '2012-03-26 11:15:08'),
	(69, 'blockid', 23, 'wslm', 'block', 'update', 'mod=wslm&file=block&action=update&dosubmit=1&ajax=1&blockid=23', 'array (\n  \'data\' => \'<img alt="" src="/wslm/uploadfile/2012/0326/20120326112323292.jpg" />\',\n)', 1, 'admin', '127.0.0.1', '2012-03-26 11:23:26'),
	(70, 'blockid', 24, 'wslm', 'block', 'add', 'mod=wslm&file=block&action=add&ajax=1', 'array (\n  \'pageid\' => \'cat_about_partner\',\n  \'blockno\' => \'1\',\n  \'name\' => \'栏目-关于我们-合作伙伴\',\n  \'listorder\' => \'1\',\n  \'isarray\' => \'0\',\n  \'rows\' => \'6\',\n)', 1, 'admin', '127.0.0.1', '2012-03-26 11:27:42'),
	(71, 'blockid', 24, 'wslm', 'block', 'update', 'mod=wslm&file=block&action=update&dosubmit=1&ajax=1&blockid=24', 'array (\n  \'data\' => \'<img alt="" src="/wslm/uploadfile/2012/0326/20120326112829595.jpg" />&nbsp;\',\n)', 1, 'admin', '127.0.0.1', '2012-03-26 11:28:32'),
	(72, 'blockid', 25, 'wslm', 'block', 'add', 'mod=wslm&file=block&action=add&ajax=1', 'array (\n  \'pageid\' => \'cat_about_honor\',\n  \'blockno\' => \'1\',\n  \'name\' => \'栏目-关于我们-资质荣誉\',\n  \'listorder\' => \'1\',\n  \'isarray\' => \'0\',\n  \'rows\' => \'6\',\n)', 1, 'admin', '127.0.0.1', '2012-03-26 11:28:57'),
	(73, 'blockid', 25, 'wslm', 'block', 'update', 'mod=wslm&file=block&action=update&dosubmit=1&ajax=1&blockid=25', 'array (\n  \'data\' => \'<img alt="" src="/wslm/uploadfile/2012/0326/20120326112912714.jpg" />&nbsp;\',\n)', 1, 'admin', '127.0.0.1', '2012-03-26 11:29:15'),
	(74, 'blockid', 26, 'wslm', 'block', 'add', 'mod=wslm&file=block&action=add&ajax=1', 'array (\n  \'pageid\' => \'cat_about_org\',\n  \'blockno\' => \'1\',\n  \'name\' => \'栏目-关于我们-组织架构\',\n  \'listorder\' => \'1\',\n  \'isarray\' => \'0\',\n  \'rows\' => \'6\',\n)', 1, 'admin', '127.0.0.1', '2012-03-26 11:29:43'),
	(75, 'blockid', 26, 'wslm', 'block', 'update', 'mod=wslm&file=block&action=update&dosubmit=1&ajax=1&blockid=26', 'array (\n  \'data\' => \'<img alt="" src="/wslm/uploadfile/2012/0326/20120326112955873.jpg" />&nbsp;\',\n)', 1, 'admin', '127.0.0.1', '2012-03-26 11:29:57'),
	(76, 'contentid', 35, 'wslm', 'content', 'add', 'mod=wslm&file=content&action=add&catid=13&modelid=29', '', 1, 'admin', '127.0.0.1', '2012-03-26 11:46:18'),
	(77, 'contentid', 36, 'wslm', 'content', 'add', 'mod=wslm&file=content&action=add&catid=13&modelid=29', '', 1, 'admin', '127.0.0.1', '2012-03-26 11:47:08'),
	(78, 'contentid', 37, 'wslm', 'content', 'add', 'mod=wslm&file=content&action=add&catid=13&modelid=29', '', 1, 'admin', '127.0.0.1', '2012-03-26 11:47:45'),
	(79, 'contentid', 38, 'wslm', 'content', 'add', 'mod=wslm&file=content&action=add&catid=13&modelid=29', '', 1, 'admin', '127.0.0.1', '2012-03-26 11:48:08'),
	(80, 'contentid', 39, 'wslm', 'content', 'add', 'mod=wslm&file=content&action=add&catid=13&modelid=29', '', 1, 'admin', '127.0.0.1', '2012-03-26 11:48:27'),
	(81, 'blockid', 27, 'wslm', 'block', 'add', 'mod=wslm&file=block&action=add&ajax=1', 'array (\n  \'pageid\' => \'top_2\',\n  \'blockno\' => \'1\',\n  \'name\' => \'栏目-新闻中心-栏目\',\n  \'listorder\' => \'1\',\n  \'isarray\' => \'0\',\n  \'rows\' => \'6\',\n)', 1, 'admin', '127.0.0.1', '2012-03-26 15:15:01'),
	(82, 'blockid', 27, 'wslm', 'block', 'update', 'mod=wslm&file=block&action=update&dosubmit=1&ajax=1&blockid=27', 'array (\n  \'data\' => \'<img alt="" src="/wslm/uploadfile/2012/0326/20120326031510907.jpg" />&nbsp;\',\n)', 1, 'admin', '127.0.0.1', '2012-03-26 15:15:13'),
	(83, 'blockid', 28, 'wslm', 'block', 'add', 'mod=wslm&file=block&action=add&ajax=1', 'array (\n  \'pageid\' => \'news_15\',\n  \'blockno\' => \'1\',\n  \'name\' => \'栏目-新闻中心-公告图片\',\n  \'listorder\' => \'1\',\n  \'isarray\' => \'0\',\n  \'rows\' => \'6\',\n)', 1, 'admin', '127.0.0.1', '2012-03-26 15:20:09'),
	(84, 'blockid', 28, 'wslm', 'block', 'update', 'mod=wslm&file=block&action=update&dosubmit=1&ajax=1&blockid=28', 'array (\n  \'data\' => \'<img alt="" src="/wslm/uploadfile/2012/0326/20120326032112527.jpg" />&nbsp;\',\n)', 1, 'admin', '127.0.0.1', '2012-03-26 15:21:16'),
	(85, 'blockid', 29, 'wslm', 'block', 'add', 'mod=wslm&file=block&action=add&ajax=1', 'array (\n  \'pageid\' => \'news_16\',\n  \'blockno\' => \'1\',\n  \'name\' => \'栏目-新闻中心-新闻图片\',\n  \'listorder\' => \'1\',\n  \'isarray\' => \'0\',\n  \'rows\' => \'6\',\n)', 1, 'admin', '127.0.0.1', '2012-03-26 15:21:36'),
	(86, 'blockid', 29, 'wslm', 'block', 'update', 'mod=wslm&file=block&action=update&dosubmit=1&ajax=1&blockid=29', 'array (\n  \'data\' => \'<img alt="" src="/wslm/uploadfile/2012/0326/20120326032148546.jpg" />&nbsp;\',\n)', 1, 'admin', '127.0.0.1', '2012-03-26 15:21:51'),
	(87, 'blockid', 30, 'wslm', 'block', 'add', 'mod=wslm&file=block&action=add&ajax=1', 'array (\n  \'pageid\' => \'news_17\',\n  \'blockno\' => \'1\',\n  \'name\' => \'栏目-新闻中心-资讯图片\',\n  \'listorder\' => \'1\',\n  \'isarray\' => \'0\',\n  \'rows\' => \'6\',\n)', 1, 'admin', '127.0.0.1', '2012-03-26 15:22:04'),
	(88, 'blockid', 30, 'wslm', 'block', 'update', 'mod=wslm&file=block&action=update&dosubmit=1&ajax=1&blockid=30', 'array (\n  \'data\' => \'<img alt="" src="/wslm/uploadfile/2012/0326/20120326032214823.jpg" />&nbsp;\',\n)', 1, 'admin', '127.0.0.1', '2012-03-26 15:22:17'),
	(89, 'contentid', 20, 'wslm', 'content', 'edit', 'mod=wslm&file=content&action=edit&contentid=20', '', 1, 'admin', '127.0.0.1', '2012-03-26 15:26:27'),
	(90, 'contentid', 23, 'wslm', 'content', 'edit', 'mod=wslm&file=content&action=edit&contentid=23', '', 1, 'admin', '127.0.0.1', '2012-03-26 15:26:45'),
	(91, 'contentid', 24, 'wslm', 'content', 'edit', 'mod=wslm&file=content&action=edit&contentid=24', '', 1, 'admin', '127.0.0.1', '2012-03-26 15:28:32'),
	(92, 'blockid', 31, 'wslm', 'block', 'add', 'mod=wslm&file=block&action=add&ajax=1', 'array (\n  \'pageid\' => \'top_3\',\n  \'blockno\' => \'1\',\n  \'name\' => \'栏目-服务管理-banner\',\n  \'listorder\' => \'1\',\n  \'isarray\' => \'0\',\n  \'rows\' => \'6\',\n)', 1, 'admin', '127.0.0.1', '2012-03-26 15:33:55'),
	(93, 'blockid', 31, 'wslm', 'block', 'update', 'mod=wslm&file=block&action=update&dosubmit=1&ajax=1&blockid=31', 'array (\n  \'data\' => \'&nbsp;<img alt="" src="/wslm/uploadfile/2012/0326/20120326033406767.jpg" />\',\n)', 1, 'admin', '127.0.0.1', '2012-03-26 15:34:08'),
	(94, 'blockid', 32, 'wslm', 'block', 'add', 'mod=wslm&file=block&action=add&ajax=1', 'array (\n  \'pageid\' => \'cat_ser_progress\',\n  \'blockno\' => \'1\',\n  \'name\' => \'栏目-服务管理-运营流程\',\n  \'listorder\' => \'1\',\n  \'isarray\' => \'1\',\n  \'rows\' => \'6\',\n)', 1, 'admin', '127.0.0.1', '2012-03-26 15:36:55'),
	(95, 'blockid', 33, 'wslm', 'block', 'add', 'mod=wslm&file=block&action=add&ajax=1', 'array (\n  \'pageid\' => \'cat_ser_progress\',\n  \'blockno\' => \'1\',\n  \'name\' => \'栏目-服务管理-运营流程\',\n  \'listorder\' => \'3\',\n  \'isarray\' => \'0\',\n  \'rows\' => \'6\',\n)', 1, 'admin', '127.0.0.1', '2012-03-26 15:36:59'),
	(96, 'blockid', 33, 'wslm', 'block', 'update', 'mod=wslm&file=block&action=update&dosubmit=1&ajax=1&blockid=33', 'array (\n  \'data\' => \'<img alt="" src="/wslm/uploadfile/2012/0326/20120326033711951.jpg" />&nbsp;\',\n)', 1, 'admin', '127.0.0.1', '2012-03-26 15:37:13'),
	(97, 'blockid', 34, 'wslm', 'block', 'add', 'mod=wslm&file=block&action=add&ajax=1', 'array (\n  \'pageid\' => \'cat_ser_views\',\n  \'blockno\' => \'1\',\n  \'name\' => \'栏目-服务管理-服务理念\',\n  \'listorder\' => \'1\',\n  \'isarray\' => \'0\',\n  \'rows\' => \'6\',\n)', 1, 'admin', '127.0.0.1', '2012-03-26 15:38:12'),
	(98, 'blockid', 34, 'wslm', 'block', 'update', 'mod=wslm&file=block&action=update&dosubmit=1&ajax=1&blockid=34', 'array (\n  \'data\' => \'<p>网上经常将动漫说成是动画，由于这个说法一直存在，出现了误区，但也将错就错。主要原因是，日本的动漫比较热门，漫迷为了方便讨论与表达，将动漫一词用于指日本的动漫，大部分是用于指日本的动画，少部分用于指日本的漫画。 　日本是制作和生产动漫最出名的国家之一。</p>\n    <p>惯用说法有“动漫爱好者”、“动漫展览会”、“动漫产业”等等。中国大陆还有以“动漫志”为名的杂志，把这个新生词推广到整个社会，尤其在青少年中甚为常用。在日本、大中华等许多地方，日本动漫十分流行，并逐渐成为了一种文化时尚，故以中文提及“动漫”时多指日本动漫或日式动漫。Manga为日语“漫画”的英语译音，现在manga本身也涵盖漫画产业的意思。</p>\',\n)', 1, 'admin', '127.0.0.1', '2012-03-26 15:38:16'),
	(99, 'blockid', 35, 'wslm', 'block', 'add', 'mod=wslm&file=block&action=add&ajax=1', 'array (\n  \'pageid\' => \'top_4\',\n  \'blockno\' => \'1\',\n  \'name\' => \'栏目-动漫文化-banner\',\n  \'listorder\' => \'1\',\n  \'isarray\' => \'0\',\n  \'rows\' => \'6\',\n)', 1, 'admin', '127.0.0.1', '2012-03-26 15:52:48'),
	(100, 'blockid', 35, 'wslm', 'block', 'update', 'mod=wslm&file=block&action=update&dosubmit=1&ajax=1&blockid=35', 'array (\n  \'data\' => \'<img alt="" src="/wslm/uploadfile/2012/0326/20120326035259850.jpg" />&nbsp;\',\n)', 1, 'admin', '127.0.0.1', '2012-03-26 15:53:02'),
	(101, 'blockid', 36, 'wslm', 'block', 'add', 'mod=wslm&file=block&action=add&ajax=1', 'array (\n  \'pageid\' => \'side_left_tel\',\n  \'blockno\' => \'1\',\n  \'name\' => \'左侧导航-列表\',\n  \'listorder\' => \'1\',\n  \'isarray\' => \'0\',\n  \'rows\' => \'6\',\n)', 1, 'admin', '127.0.0.1', '2012-03-26 18:26:03'),
	(102, 'blockid', 36, 'wslm', 'block', 'update', 'mod=wslm&file=block&action=update&dosubmit=1&ajax=1&blockid=36', 'array (\n  \'data\' => \'<img alt="" src="/wslm/uploadfile/2012/0326/20120326062613730.jpg" />&nbsp;\',\n)', 1, 'admin', '127.0.0.1', '2012-03-26 18:26:16'),
	(103, 'blockid', 37, 'wslm', 'block', 'add', 'mod=wslm&file=block&action=add&ajax=1', 'array (\n  \'pageid\' => \'top_5\',\n  \'blockno\' => \'1\',\n  \'name\' => \'栏目-产品展示-banner\',\n  \'listorder\' => \'1\',\n  \'isarray\' => \'0\',\n  \'rows\' => \'6\',\n)', 1, 'admin', '127.0.0.1', '2012-03-26 21:54:14'),
	(104, 'blockid', 37, 'wslm', 'block', 'update', 'mod=wslm&file=block&action=update&dosubmit=1&ajax=1&blockid=37', 'array (\n  \'data\' => \'<img width="980" height="260" alt="" src="/wslm/uploadfile/2012/0326/20120326112323292.jpg" />&nbsp;\',\n)', 1, 'admin', '127.0.0.1', '2012-03-26 21:54:39'),
	(105, 'contentid', 40, 'wslm', 'content', 'add', 'mod=wslm&file=content&action=add&catid=77&modelid=30', '', 1, 'admin', '127.0.0.1', '2012-03-26 22:07:10'),
	(106, 'contentid', 41, 'wslm', 'content', 'add', 'mod=wslm&file=content&action=add&catid=77&modelid=30', '', 1, 'admin', '127.0.0.1', '2012-03-26 22:07:42'),
	(107, 'contentid', 42, 'wslm', 'content', 'add', 'mod=wslm&file=content&action=add&catid=77&modelid=30', '', 1, 'admin', '127.0.0.1', '2012-03-26 22:08:12'),
	(108, 'contentid', 43, 'wslm', 'content', 'add', 'mod=wslm&file=content&action=add&catid=77&modelid=30', '', 1, 'admin', '127.0.0.1', '2012-03-26 22:08:45'),
	(109, 'blockid', 38, 'wslm', 'block', 'add', 'mod=wslm&file=block&action=add&ajax=1', 'array (\n  \'pageid\' => \'cat_pro_euro\',\n  \'blockno\' => \'1\',\n  \'name\' => \'栏目-产品展示-欧美动漫\',\n  \'listorder\' => \'1\',\n  \'isarray\' => \'0\',\n  \'rows\' => \'6\',\n)', 1, 'admin', '127.0.0.1', '2012-03-26 22:30:45'),
	(110, 'blockid', 38, 'wslm', 'block', 'update', 'mod=wslm&file=block&action=update&dosubmit=1&ajax=1&blockid=38', 'array (\n  \'data\' => \'<img alt="" src="/wslm/uploadfile/2012/0326/20120326103058422.jpg" />&nbsp;\',\n)', 1, 'admin', '127.0.0.1', '2012-03-26 22:31:02'),
	(111, 'blockid', 39, 'wslm', 'block', 'add', 'mod=wslm&file=block&action=add&ajax=1', 'array (\n  \'pageid\' => \'cat_pro_home\',\n  \'blockno\' => \'1\',\n  \'name\' => \'栏目-产品展示-国产动漫\',\n  \'listorder\' => \'1\',\n  \'isarray\' => \'0\',\n  \'rows\' => \'6\',\n)', 1, 'admin', '127.0.0.1', '2012-03-26 22:31:39'),
	(112, 'blockid', 39, 'wslm', 'block', 'update', 'mod=wslm&file=block&action=update&dosubmit=1&ajax=1&blockid=39', 'array (\n  \'data\' => \'<img alt="" src="/wslm/uploadfile/2012/0326/20120326103145641.jpg" />&nbsp;\',\n)', 1, 'admin', '127.0.0.1', '2012-03-26 22:31:47'),
	(113, 'blockid', 40, 'wslm', 'block', 'add', 'mod=wslm&file=block&action=add&ajax=1', 'array (\n  \'pageid\' => \'cat_pro_japan\',\n  \'blockno\' => \'1\',\n  \'name\' => \'栏目-产品展示-日本动漫\',\n  \'listorder\' => \'1\',\n  \'isarray\' => \'0\',\n  \'rows\' => \'6\',\n)', 1, 'admin', '127.0.0.1', '2012-03-26 22:32:42'),
	(114, 'blockid', 40, 'wslm', 'block', 'update', 'mod=wslm&file=block&action=update&dosubmit=1&ajax=1&blockid=40', 'array (\n  \'data\' => \'<img alt="" src="/wslm/uploadfile/2012/0326/20120326103248534.jpg" />&nbsp;\',\n)', 1, 'admin', '127.0.0.1', '2012-03-26 22:32:51'),
	(115, 'blockid', 41, 'wslm', 'block', 'add', 'mod=wslm&file=block&action=add&ajax=1', 'array (\n  \'pageid\' => \'top_6\',\n  \'blockno\' => \'1\',\n  \'name\' => \'栏目-案例分享-banner\',\n  \'listorder\' => \'1\',\n  \'isarray\' => \'0\',\n  \'rows\' => \'6\',\n)', 1, 'admin', '127.0.0.1', '2012-03-26 22:35:37'),
	(116, 'blockid', 41, 'wslm', 'block', 'update', 'mod=wslm&file=block&action=update&dosubmit=1&ajax=1&blockid=41', 'array (\n  \'data\' => \'<img width="980" height="260" alt="" src="/wslm/uploadfile/2012/0326/20120326112750555.jpg" />&nbsp;\',\n)', 1, 'admin', '127.0.0.1', '2012-03-26 22:35:54'),
	(117, 'blockid', 42, 'wslm', 'block', 'add', 'mod=wslm&file=block&action=add&ajax=1', 'array (\n  \'pageid\' => \'top_7\',\n  \'blockno\' => \'1\',\n  \'name\' => \'栏目-投资合作\',\n  \'listorder\' => \'1\',\n  \'isarray\' => \'0\',\n  \'rows\' => \'6\',\n)', 1, 'admin', '127.0.0.1', '2012-03-26 23:05:10'),
	(118, 'blockid', 42, 'wslm', 'block', 'update', 'mod=wslm&file=block&action=update&dosubmit=1&ajax=1&blockid=42', 'array (\n  \'data\' => \'<img width="980" height="260" alt="" src="/wslm/uploadfile/2012/0326/20120326112750555.jpg" />&nbsp;\',\n)', 1, 'admin', '127.0.0.1', '2012-03-26 23:05:27'),
	(119, 'blockid', 43, 'wslm', 'block', 'add', 'mod=wslm&file=block&action=add&ajax=1', 'array (\n  \'pageid\' => \'invest_analysis\',\n  \'blockno\' => \'1\',\n  \'name\' => \'栏目-投资合作-投资分析\',\n  \'listorder\' => \'1\',\n  \'isarray\' => \'0\',\n  \'rows\' => \'6\',\n)', 1, 'admin', '127.0.0.1', '2012-03-26 23:08:07'),
	(120, 'blockid', 43, 'wslm', 'block', 'update', 'mod=wslm&file=block&action=update&dosubmit=1&ajax=1&blockid=43', 'array (\n  \'data\' => \'<p>网上经常将动漫说成是动画，由于这个说法一直存在，出现了误区，但也将错就错。主要原因是，日本的动漫比较热门，漫迷为了方便讨论与表达，将动漫一词用于指日本的动漫，大部分是用于指日本的动画，少部分用于指日本的漫画。 　日本是制作和生产动漫最出名的国家之一。</p>\n    <p>惯用说法有“动漫爱好者”、“动漫展览会”、“动漫产业”等等。中国大陆还有以“动漫志”为名的杂志，把这个新生词推广到整个社会，尤其在青少年中甚为常用。在日本、大中华等许多地方，日本动漫十分流行，并逐渐成为了一种文化时尚，故以中文提及“动漫”时多指日本动漫或日式动漫。Manga为日语“漫画”的英语译音，现在manga本身也涵盖漫画产业的意思。</p>\',\n)', 1, 'admin', '127.0.0.1', '2012-03-26 23:08:10'),
	(121, 'blockid', 44, 'wslm', 'block', 'add', 'mod=wslm&file=block&action=add&ajax=1', 'array (\n  \'pageid\' => \'invest_flow\',\n  \'blockno\' => \'1\',\n  \'name\' => \'栏目-投资合作-顾问流程\',\n  \'listorder\' => \'1\',\n  \'isarray\' => \'0\',\n  \'rows\' => \'6\',\n)', 1, 'admin', '127.0.0.1', '2012-03-26 23:08:32'),
	(122, 'blockid', 44, 'wslm', 'block', 'update', 'mod=wslm&file=block&action=update&dosubmit=1&ajax=1&blockid=44', 'array (\n  \'data\' => \'<img alt="" src="/wslm/uploadfile/2012/0326/20120326110839336.jpg" />&nbsp;\',\n)', 1, 'admin', '127.0.0.1', '2012-03-26 23:08:48'),
	(123, 'blockid', 45, 'wslm', 'block', 'add', 'mod=wslm&file=block&action=add&ajax=1', 'array (\n  \'pageid\' => \'invest_process\',\n  \'blockno\' => \'1\',\n  \'name\' => \'栏目-投资合作-运营流程\',\n  \'listorder\' => \'1\',\n  \'isarray\' => \'0\',\n  \'rows\' => \'6\',\n)', 1, 'admin', '127.0.0.1', '2012-03-26 23:12:30'),
	(124, 'blockid', 45, 'wslm', 'block', 'update', 'mod=wslm&file=block&action=update&dosubmit=1&ajax=1&blockid=45', 'array (\n  \'data\' => \'&nbsp;<img alt="" src="/wslm/uploadfile/2012/0326/20120326111238445.jpg" />\',\n)', 1, 'admin', '127.0.0.1', '2012-03-26 23:12:40'),
	(125, 'blockid', 46, 'wslm', 'block', 'add', 'mod=wslm&file=block&action=add&ajax=1', 'array (\n  \'pageid\' => \'invest_analysis\',\n  \'blockno\' => \'1\',\n  \'name\' => \'222222\',\n  \'listorder\' => \'3\',\n  \'isarray\' => \'0\',\n  \'rows\' => \'6\',\n)', 1, 'admin', '127.0.0.1', '2012-03-26 23:14:11'),
	(126, 'blockid', 46, 'wslm', 'block', 'delete', 'file=block&action=delete&blockid=46', '', 1, 'admin', '127.0.0.1', '2012-03-26 23:19:57'),
	(127, 'blockid', 42, 'wslm', 'block', 'edit', 'mod=wslm&file=block&action=edit', 'array (\n  \'name\' => \'栏目-投资合作-banner\',\n  \'pageid\' => \'top_7\',\n  \'blockno\' => \'1\',\n  \'listorder\' => \'2\',\n  \'isarray\' => \'0\',\n  \'rows\' => \'6\',\n)', 1, 'admin', '127.0.0.1', '2012-03-27 09:27:41'),
	(128, 'blockid', 42, 'wslm', 'block', 'update', 'mod=wslm&file=block&action=update', 'array (\n  \'data\' => \'<img width="980" height="260" alt="" src="/wslm/uploadfile/2012/0326/20120326112750555.jpg" />&nbsp;\',\n)', 1, 'admin', '127.0.0.1', '2012-03-27 09:27:44'),
	(129, 'blockid', 47, 'wslm', 'block', 'add', 'mod=wslm&file=block&action=add&ajax=1', 'array (\n  \'pageid\' => \'page_9\',\n  \'blockno\' => \'1\',\n  \'name\' => \'内容-关于我们-企业简介\',\n  \'listorder\' => \'1\',\n  \'isarray\' => \'0\',\n  \'rows\' => \'6\',\n)', 1, 'admin', '127.0.0.1', '2012-03-27 09:45:16'),
	(130, 'blockid', 47, 'wslm', 'block', 'update', 'mod=wslm&file=block&action=update&dosubmit=1&ajax=1&blockid=47', 'array (\n  \'data\' => \'<div>动漫是相当受到欢迎的，无论是大人或是小孩，那动漫又是怎样出来的呢？请看下面动漫的简介与概述！希望大家能对你们所喜爱的动漫有更深入的了解。</div><div>&nbsp;</div><div>　　动漫是动画和漫画的合称与缩写，在其他语言相当少用。随着现代传媒技术的发展，动画（animation或anime）和漫画（comics，manga；特别是故事性漫画）之间联系日趋紧密，两者常被合而为&ldquo;动漫&rdquo;。惯用说法有&ldquo;动漫爱好者&rdquo;、&ldquo;动漫展览会&rdquo;、&ldquo;动漫产业&rdquo;等等。中国大陆还有以&ldquo;动漫志&rdquo;为名的杂志，把这个新生词推广到整个社会，尤其在青少年中甚为常用。在日本、大中华等许多地方，日本动漫十分流行，并逐渐成为了一种文化时尚，故以中文提及&ldquo;动漫&rdquo;时多指日本动漫或日式动漫。Manga为日语&ldquo;漫画&rdquo;的英语译音，现在manga本身也涵盖漫画产业的意思。另外，英文词cartoon的中文音译&ldquo;卡通&rdquo;，也是漫画与动画的合称，但有时常被用来特指美国动画等等。动漫有两种艺术特性：一是有语言功能，即使无声也可以表达一定的意思；二是具有谐趣性，即滑稽幽默或讽刺性。</div><div>&nbsp;</div><div>　　&ldquo;动漫&rdquo;一词在1996年以前在中国大陆并没有出现这个统一的概念，2者是分立而互有联系。此词的出现和推广，源于在98年全中国第一家首先拔地而起的动漫资讯杂志《动漫时代（ANIME COMIC TIME）》，因此&ldquo;动漫&rdquo;一词才得以出现并慢慢深入人心成为全中国动漫迷常用的词汇和动画与漫画的总称。</div><div>&nbsp;</div><div>　　动漫是通过制作，使一些有或无生命的东西拟人化、夸张化，赋予其人类的一切感情、动作。或将架空的场景加以绘制，使其真实化。在日漫中也有将生活场景片段绘出的漫画。这也算是艺术的表达的形式。就像文字用小说表达，而图片用绘画表达是很相似的。</div><div>&nbsp;</div><div>　　其中漫画对于我们来说是怎样存在的呢？漫画通常是以书刊形式与大家见面，它轻松幽默、易阅读、读者年龄广，是在各式出版品中商业性最强的，因着漫画衍生而出的的产品，其中之利润更是令人眼红。而动画，顾名思义便是可以活动的连环画剧。其实正是漫画奠定了动画的基础。漫画与动画作为美术的一部分，从艺术的一个角度展示人类的文化与文明，反映人类的精神，而当今世界也形成了以美国和日本为首的局面，其中日本尤为突出，日本动漫已成为日本民族的象征。但美国作为世界文化的象征，聚集世界各地才华横溢的艺术家，以迪斯尼为首，创造着雅致的画廊。面向儿童的，就该纯真；面向成人的，就该美妙。动漫画也是心灵的艺术，也就应该有超越思维的永恒&hellip;&hellip;</div><div>&nbsp;</div><div>　　概述</div><div>&nbsp;</div><div>　　随着现代传媒技术的发展，动画（animation或anime）和漫画（comics，manga；特别是故事性漫画）之间联系日趋紧密，两者常被合二为一称为&ldquo;动漫&rdquo;。惯用说法有&ldquo;动漫爱好者&rdquo;、&ldquo;动漫展览会&rdquo;、&ldquo;动漫产业&rdquo;等等。中国大陆还有以&ldquo;动漫志&rdquo;为名的杂志，把这个新生词推广到整个社会，尤其在青少年中甚为常用。在日本、大中华等许多地方，日本动漫十分流行，并逐渐成为了一种文化时尚，故以中文提及&ldquo;动漫&rdquo;时多指日本动漫或日式动漫。</div><div>&nbsp;</div><div>　　动漫领域衍生出的许多术语均已经被广泛应用，例如：萌（日语中的萌え），杀必死，萝莉（LOLI）等等。</div><div>&nbsp;</div><div>　　动漫产业日益与游戏产业结合紧密，在日本已经形成一个成熟的产业链，动漫已经从单单的平面媒体和电视媒体扩展到游戏机，网络，玩具等众多领域。 许多动漫游戏应运而生，例如《死神》PSP平台的游戏，也有许多GALGAME被改编成动漫作品，例如《あかね色に染まる坂》 ，《EF-a tale of memores》 等等</div><div>&nbsp;</div><div>　　Manga（まんが）为日语&ldquo;漫画&rdquo;的罗马字注音。另外，英文词cartoon的中文音译&ldquo;卡通&rdquo;，也是漫画与动画的合称，但常被用来特指美国动画。</div><div>&nbsp;</div>　　动漫人才是指掌握动漫制作设计技巧的人群，他们多在相关行业单位中工作，以动漫制作设计为主要工作内容。 动漫培训是指参加动漫职业学校或者动漫培训班以求掌握动漫知识或动漫制作设计技巧的行为。&nbsp;\',\n)', 1, 'admin', '127.0.0.1', '2012-03-27 09:46:51'),
	(131, 'blockid', 48, 'wslm', 'block', 'add', 'mod=wslm&file=block&action=add&ajax=1', 'array (\n  \'pageid\' => \'page_10\',\n  \'blockno\' => \'1\',\n  \'name\' => \'内容-关于我们-企业文化\',\n  \'listorder\' => \'1\',\n  \'isarray\' => \'0\',\n  \'rows\' => \'6\',\n)', 1, 'admin', '127.0.0.1', '2012-03-27 09:47:49'),
	(132, 'blockid', 48, 'wslm', 'block', 'update', 'mod=wslm&file=block&action=update&dosubmit=1&ajax=1&blockid=48', 'array (\n  \'data\' => \'&nbsp;动漫是相当受到欢迎的，无论是大人或是小孩，那动漫又是怎样出来的呢？请看下面动漫的简介与概述！希望大家能对你们所喜爱的动漫有更深入的了解。<div>&nbsp;</div><div>　　动漫是动画和漫画的合称与缩写，在其他语言相当少用。随着现代传媒技术的发展，动画（animation或anime）和漫画（comics，manga；特别是故事性漫画）之间联系日趋紧密，两者常被合而为&ldquo;动漫&rdquo;。惯用说法有&ldquo;动漫爱好者&rdquo;、&ldquo;动漫展览会&rdquo;、&ldquo;动漫产业&rdquo;等等。中国大陆还有以&ldquo;动漫志&rdquo;为名的杂志，把这个新生词推广到整个社会，尤其在青少年中甚为常用。在日本、大中华等许多地方，日本动漫十分流行，并逐渐成为了一种文化时尚，故以中文提及&ldquo;动漫&rdquo;时多指日本动漫或日式动漫。Manga为日语&ldquo;漫画&rdquo;的英语译音，现在manga本身也涵盖漫画产业的意思。另外，英文词cartoon的中文音译&ldquo;卡通&rdquo;，也是漫画与动画的合称，但有时常被用来特指美国动画等等。动漫有两种艺术特性：一是有语言功能，即使无声也可以表达一定的意思；二是具有谐趣性，即滑稽幽默或讽刺性。</div><div>&nbsp;</div><div>　　&ldquo;动漫&rdquo;一词在1996年以前在中国大陆并没有出现这个统一的概念，2者是分立而互有联系。此词的出现和推广，源于在98年全中国第一家首先拔地而起的动漫资讯杂志《动漫时代（ANIME COMIC TIME）》，因此&ldquo;动漫&rdquo;一词才得以出现并慢慢深入人心成为全中国动漫迷常用的词汇和动画与漫画的总称。</div><div>&nbsp;</div><div>　　动漫是通过制作，使一些有或无生命的东西拟人化、夸张化，赋予其人类的一切感情、动作。或将架空的场景加以绘制，使其真实化。在日漫中也有将生活场景片段绘出的漫画。这也算是艺术的表达的形式。就像文字用小说表达，而图片用绘画表达是很相似的。</div><div>&nbsp;</div><div>　　其中漫画对于我们来说是怎样存在的呢？漫画通常是以书刊形式与大家见面，它轻松幽默、易阅读、读者年龄广，是在各式出版品中商业性最强的，因着漫画衍生而出的的产品，其中之利润更是令人眼红。而动画，顾名思义便是可以活动的连环画剧。其实正是漫画奠定了动画的基础。漫画与动画作为美术的一部分，从艺术的一个角度展示人类的文化与文明，反映人类的精神，而当今世界也形成了以美国和日本为首的局面，其中日本尤为突出，日本动漫已成为日本民族的象征。但美国作为世界文化的象征，聚集世界各地才华横溢的艺术家，以迪斯尼为首，创造着雅致的画廊。面向儿童的，就该纯真；面向成人的，就该美妙。动漫画也是心灵的艺术，也就应该有超越思维的永恒&hellip;&hellip;</div><div>&nbsp;</div><div>　　概述</div><div>&nbsp;</div><div>　　随着现代传媒技术的发展，动画（animation或anime）和漫画（comics，manga；特别是故事性漫画）之间联系日趋紧密，两者常被合二为一称为&ldquo;动漫&rdquo;。惯用说法有&ldquo;动漫爱好者&rdquo;、&ldquo;动漫展览会&rdquo;、&ldquo;动漫产业&rdquo;等等。中国大陆还有以&ldquo;动漫志&rdquo;为名的杂志，把这个新生词推广到整个社会，尤其在青少年中甚为常用。在日本、大中华等许多地方，日本动漫十分流行，并逐渐成为了一种文化时尚，故以中文提及&ldquo;动漫&rdquo;时多指日本动漫或日式动漫。</div><div>&nbsp;</div><div>　　动漫领域衍生出的许多术语均已经被广泛应用，例如：萌（日语中的萌え），杀必死，萝莉（LOLI）等等。</div><div>&nbsp;</div><div>　　动漫产业日益与游戏产业结合紧密，在日本已经形成一个成熟的产业链，动漫已经从单单的平面媒体和电视媒体扩展到游戏机，网络，玩具等众多领域。 许多动漫游戏应运而生，例如《死神》PSP平台的游戏，也有许多GALGAME被改编成动漫作品，例如《あかね色に染まる坂》 ，《EF-a tale of memores》 等等</div><div>&nbsp;</div><div>　　Manga（まんが）为日语&ldquo;漫画&rdquo;的罗马字注音。另外，英文词cartoon的中文音译&ldquo;卡通&rdquo;，也是漫画与动画的合称，但常被用来特指美国动画。</div><div>&nbsp;</div><div>　　动漫人才是指掌握动漫制作设计技巧的人群，他们多在相关行业单位中工作，以动漫制作设计为主要工作内容。 动漫培训是指参加动漫职业学校或者动漫培训班以求掌握动漫知识或动漫制作设计技巧的行为。</div>\',\n)', 1, 'admin', '127.0.0.1', '2012-03-27 09:47:54'),
	(133, 'blockid', 49, 'wslm', 'block', 'add', 'mod=wslm&file=block&action=add&ajax=1', 'array (\n  \'pageid\' => \'page_11\',\n  \'blockno\' => \'1\',\n  \'name\' => \'内容-关于我们-资质荣誉\',\n  \'listorder\' => \'1\',\n  \'isarray\' => \'0\',\n  \'rows\' => \'6\',\n)', 1, 'admin', '127.0.0.1', '2012-03-27 09:48:18'),
	(134, 'blockid', 49, 'wslm', 'block', 'update', 'mod=wslm&file=block&action=update&dosubmit=1&ajax=1&blockid=49', 'array (\n  \'data\' => \'<div>动漫是相当受到欢迎的，无论是大人或是小孩，那动漫又是怎样出来的呢？请看下面动漫的简介与概述！希望大家能对你们所喜爱的动漫有更深入的了解。</div><div>&nbsp;</div><div>　　动漫是动画和漫画的合称与缩写，在其他语言相当少用。随着现代传媒技术的发展，动画（animation或anime）和漫画（comics，manga；特别是故事性漫画）之间联系日趋紧密，两者常被合而为&ldquo;动漫&rdquo;。惯用说法有&ldquo;动漫爱好者&rdquo;、&ldquo;动漫展览会&rdquo;、&ldquo;动漫产业&rdquo;等等。中国大陆还有以&ldquo;动漫志&rdquo;为名的杂志，把这个新生词推广到整个社会，尤其在青少年中甚为常用。在日本、大中华等许多地方，日本动漫十分流行，并逐渐成为了一种文化时尚，故以中文提及&ldquo;动漫&rdquo;时多指日本动漫或日式动漫。Manga为日语&ldquo;漫画&rdquo;的英语译音，现在manga本身也涵盖漫画产业的意思。另外，英文词cartoon的中文音译&ldquo;卡通&rdquo;，也是漫画与动画的合称，但有时常被用来特指美国动画等等。动漫有两种艺术特性：一是有语言功能，即使无声也可以表达一定的意思；二是具有谐趣性，即滑稽幽默或讽刺性。</div><div>&nbsp;</div><div>　　&ldquo;动漫&rdquo;一词在1996年以前在中国大陆并没有出现这个统一的概念，2者是分立而互有联系。此词的出现和推广，源于在98年全中国第一家首先拔地而起的动漫资讯杂志《动漫时代（ANIME COMIC TIME）》，因此&ldquo;动漫&rdquo;一词才得以出现并慢慢深入人心成为全中国动漫迷常用的词汇和动画与漫画的总称。</div><div>&nbsp;</div><div>　　动漫是通过制作，使一些有或无生命的东西拟人化、夸张化，赋予其人类的一切感情、动作。或将架空的场景加以绘制，使其真实化。在日漫中也有将生活场景片段绘出的漫画。这也算是艺术的表达的形式。就像文字用小说表达，而图片用绘画表达是很相似的。</div><div>&nbsp;</div><div>　　其中漫画对于我们来说是怎样存在的呢？漫画通常是以书刊形式与大家见面，它轻松幽默、易阅读、读者年龄广，是在各式出版品中商业性最强的，因着漫画衍生而出的的产品，其中之利润更是令人眼红。而动画，顾名思义便是可以活动的连环画剧。其实正是漫画奠定了动画的基础。漫画与动画作为美术的一部分，从艺术的一个角度展示人类的文化与文明，反映人类的精神，而当今世界也形成了以美国和日本为首的局面，其中日本尤为突出，日本动漫已成为日本民族的象征。但美国作为世界文化的象征，聚集世界各地才华横溢的艺术家，以迪斯尼为首，创造着雅致的画廊。面向儿童的，就该纯真；面向成人的，就该美妙。动漫画也是心灵的艺术，也就应该有超越思维的永恒&hellip;&hellip;</div><div>&nbsp;</div><div>　　概述</div><div>&nbsp;</div><div>　　随着现代传媒技术的发展，动画（animation或anime）和漫画（comics，manga；特别是故事性漫画）之间联系日趋紧密，两者常被合二为一称为&ldquo;动漫&rdquo;。惯用说法有&ldquo;动漫爱好者&rdquo;、&ldquo;动漫展览会&rdquo;、&ldquo;动漫产业&rdquo;等等。中国大陆还有以&ldquo;动漫志&rdquo;为名的杂志，把这个新生词推广到整个社会，尤其在青少年中甚为常用。在日本、大中华等许多地方，日本动漫十分流行，并逐渐成为了一种文化时尚，故以中文提及&ldquo;动漫&rdquo;时多指日本动漫或日式动漫。</div><div>&nbsp;</div><div>　　动漫领域衍生出的许多术语均已经被广泛应用，例如：萌（日语中的萌え），杀必死，萝莉（LOLI）等等。</div><div>&nbsp;</div><div>　　动漫产业日益与游戏产业结合紧密，在日本已经形成一个成熟的产业链，动漫已经从单单的平面媒体和电视媒体扩展到游戏机，网络，玩具等众多领域。 许多动漫游戏应运而生，例如《死神》PSP平台的游戏，也有许多GALGAME被改编成动漫作品，例如《あかね色に染まる坂》 ，《EF-a tale of memores》 等等</div><div>&nbsp;</div><div>　　Manga（まんが）为日语&ldquo;漫画&rdquo;的罗马字注音。另外，英文词cartoon的中文音译&ldquo;卡通&rdquo;，也是漫画与动画的合称，但常被用来特指美国动画。</div><div>&nbsp;</div><div>　　动漫人才是指掌握动漫制作设计技巧的人群，他们多在相关行业单位中工作，以动漫制作设计为主要工作内容。 动漫培训是指参加动漫职业学校或者动漫培训班以求掌握动漫知识或动漫制作设计技巧的行为。</div>\',\n)', 1, 'admin', '127.0.0.1', '2012-03-27 09:48:21'),
	(135, 'blockid', 50, 'wslm', 'block', 'add', 'mod=wslm&file=block&action=add&ajax=1', 'array (\n  \'pageid\' => \'page_12\',\n  \'blockno\' => \'1\',\n  \'name\' => \'内容-关于我们-组织架构\',\n  \'listorder\' => \'1\',\n  \'isarray\' => \'0\',\n  \'rows\' => \'6\',\n)', 1, 'admin', '127.0.0.1', '2012-03-27 09:48:46'),
	(136, 'blockid', 50, 'wslm', 'block', 'update', 'mod=wslm&file=block&action=update&dosubmit=1&ajax=1&blockid=50', 'array (\n  \'data\' => \'<img alt="" src="/wslm/uploadfile/2012/0327/20120327094916899.jpg" />&nbsp;\',\n)', 1, 'admin', '127.0.0.1', '2012-03-27 09:49:18'),
	(137, 'contentid', 39, 'wslm', 'content', 'edit', 'mod=wslm&file=content&action=edit&contentid=39', '', 1, 'admin', '127.0.0.1', '2012-03-27 10:06:42'),
	(138, 'contentid', 39, 'wslm', 'content', 'edit', 'mod=wslm&file=content&action=edit&contentid=39', '', 1, 'admin', '127.0.0.1', '2012-03-27 10:07:16'),
	(139, 'contentid', 39, 'wslm', 'content', 'edit', 'mod=wslm&file=content&action=edit&contentid=39', '', 1, 'admin', '127.0.0.1', '2012-03-27 10:07:48'),
	(140, 'contentid', 39, 'wslm', 'content', 'edit', 'mod=wslm&file=content&action=edit&contentid=39', '', 1, 'admin', '127.0.0.1', '2012-03-27 10:08:41'),
	(141, 'contentid', 39, 'wslm', 'content', 'edit', 'mod=wslm&file=content&action=edit&contentid=39', '', 1, 'admin', '127.0.0.1', '2012-03-27 10:09:08'),
	(142, 'contentid', 39, 'wslm', 'content', 'edit', 'mod=wslm&file=content&action=edit&contentid=39', '', 1, 'admin', '127.0.0.1', '2012-03-27 10:15:09'),
	(143, 'contentid', 35, 'wslm', 'content', 'pass', 'mod=wslm&file=content&action=pass&catid=13&processid=8&forward=http%3A%2F%2F127.0.0.1%2Fwslm%2Fhoutai.php%3Fmod%3Dwslm%26file%3Dcontent%26action%3Dcheck%26catid%3D13%26processid%3D8%26status%3D-1', '', 1, 'admin', '127.0.0.1', '2012-03-27 10:16:23'),
	(144, 'contentid', 36, 'wslm', 'content', 'pass', 'mod=wslm&file=content&action=pass&catid=13&processid=8&forward=http%3A%2F%2F127.0.0.1%2Fwslm%2Fhoutai.php%3Fmod%3Dwslm%26file%3Dcontent%26action%3Dcheck%26catid%3D13%26processid%3D8%26status%3D-1', '', 1, 'admin', '127.0.0.1', '2012-03-27 10:16:23'),
	(145, 'contentid', 37, 'wslm', 'content', 'pass', 'mod=wslm&file=content&action=pass&catid=13&processid=8&forward=http%3A%2F%2F127.0.0.1%2Fwslm%2Fhoutai.php%3Fmod%3Dwslm%26file%3Dcontent%26action%3Dcheck%26catid%3D13%26processid%3D8%26status%3D-1', '', 1, 'admin', '127.0.0.1', '2012-03-27 10:16:23'),
	(146, 'contentid', 38, 'wslm', 'content', 'pass', 'mod=wslm&file=content&action=pass&catid=13&processid=8&forward=http%3A%2F%2F127.0.0.1%2Fwslm%2Fhoutai.php%3Fmod%3Dwslm%26file%3Dcontent%26action%3Dcheck%26catid%3D13%26processid%3D8%26status%3D-1', '', 1, 'admin', '127.0.0.1', '2012-03-27 10:16:23'),
	(147, 'contentid', 39, 'wslm', 'content', 'pass', 'mod=wslm&file=content&action=pass&catid=13&processid=8&forward=http%3A%2F%2F127.0.0.1%2Fwslm%2Fhoutai.php%3Fmod%3Dwslm%26file%3Dcontent%26action%3Dcheck%26catid%3D13%26processid%3D8%26status%3D-1', '', 1, 'admin', '127.0.0.1', '2012-03-27 10:16:23'),
	(148, 'contentid', 39, 'wslm', 'content', 'edit', 'mod=wslm&file=content&action=edit&contentid=39', '', 1, 'admin', '127.0.0.1', '2012-03-27 10:16:40'),
	(149, 'contentid', 39, 'wslm', 'content', 'edit', 'mod=wslm&file=content&action=edit&contentid=39', '', 1, 'admin', '127.0.0.1', '2012-03-27 10:26:57'),
	(150, 'contentid', 39, 'wslm', 'content', 'edit', 'mod=wslm&file=content&action=edit&contentid=39', '', 1, 'admin', '127.0.0.1', '2012-03-27 10:31:54'),
	(151, 'contentid', 39, 'wslm', 'content', 'edit', 'mod=wslm&file=content&action=edit&contentid=39', '', 1, 'admin', '127.0.0.1', '2012-03-27 10:32:50'),
	(152, 'contentid', 39, 'wslm', 'content', 'edit', 'mod=wslm&file=content&action=edit&contentid=39', '', 1, 'admin', '127.0.0.1', '2012-03-27 10:33:29'),
	(153, 'contentid', 39, 'wslm', 'content', 'edit', 'mod=wslm&file=content&action=edit&contentid=39', '', 1, 'admin', '127.0.0.1', '2012-03-27 10:35:32'),
	(154, 'contentid', 39, 'wslm', 'content', 'edit', 'mod=wslm&file=content&action=edit&contentid=39', '', 1, 'admin', '127.0.0.1', '2012-03-27 10:37:42'),
	(155, 'contentid', 39, 'wslm', 'content', 'edit', 'mod=wslm&file=content&action=edit&contentid=39', '', 1, 'admin', '127.0.0.1', '2012-03-27 10:37:57'),
	(156, 'contentid', 39, 'wslm', 'content', 'edit', 'mod=wslm&file=content&action=edit&contentid=39', '', 1, 'admin', '127.0.0.1', '2012-03-27 10:41:16'),
	(157, 'contentid', 39, 'wslm', 'content', 'edit', 'mod=wslm&file=content&action=edit&contentid=39', '', 1, 'admin', '127.0.0.1', '2012-03-27 10:47:47'),
	(158, 'contentid', 39, 'wslm', 'content', 'edit', 'mod=wslm&file=content&action=edit&contentid=39', '', 1, 'admin', '127.0.0.1', '2012-03-27 10:51:31'),
	(159, 'contentid', 39, 'wslm', 'content', 'edit', 'mod=wslm&file=content&action=edit&contentid=39', '', 1, 'admin', '127.0.0.1', '2012-03-27 10:51:39'),
	(160, 'contentid', 39, 'wslm', 'content', 'edit', 'mod=wslm&file=content&action=edit&contentid=39', '', 1, 'admin', '127.0.0.1', '2012-03-27 11:04:09'),
	(161, 'contentid', 39, 'wslm', 'content', 'edit', 'mod=wslm&file=content&action=edit&contentid=39', '', 1, 'admin', '127.0.0.1', '2012-03-27 11:04:45'),
	(162, 'contentid', 39, 'wslm', 'content', 'edit', 'mod=wslm&file=content&action=edit&contentid=39', '', 1, 'admin', '127.0.0.1', '2012-03-27 11:04:53'),
	(163, 'contentid', 39, 'wslm', 'content', 'edit', 'mod=wslm&file=content&action=edit&contentid=39', '', 1, 'admin', '127.0.0.1', '2012-03-27 11:06:51'),
	(164, 'contentid', 39, 'wslm', 'content', 'edit', 'mod=wslm&file=content&action=edit&contentid=39', '', 1, 'admin', '127.0.0.1', '2012-03-27 11:07:52'),
	(165, 'contentid', 39, 'wslm', 'content', 'edit', 'mod=wslm&file=content&action=edit&contentid=39', '', 1, 'admin', '127.0.0.1', '2012-03-27 11:08:34'),
	(166, 'contentid', 39, 'wslm', 'content', 'edit', 'mod=wslm&file=content&action=edit&contentid=39', '', 1, 'admin', '127.0.0.1', '2012-03-27 11:10:53'),
	(167, 'contentid', 39, 'wslm', 'content', 'edit', 'mod=wslm&file=content&action=edit&contentid=39', '', 1, 'admin', '127.0.0.1', '2012-03-27 11:13:36'),
	(168, 'contentid', 39, 'wslm', 'content', 'edit', 'mod=wslm&file=content&action=edit&contentid=39', '', 1, 'admin', '127.0.0.1', '2012-03-27 11:14:04'),
	(169, 'contentid', 39, 'wslm', 'content', 'edit', 'mod=wslm&file=content&action=edit&contentid=39', '', 1, 'admin', '127.0.0.1', '2012-03-27 11:16:50'),
	(170, 'contentid', 39, 'wslm', 'content', 'edit', 'mod=wslm&file=content&action=edit&contentid=39', '', 1, 'admin', '127.0.0.1', '2012-03-27 11:18:38'),
	(171, 'contentid', 44, 'wslm', 'content', 'add', 'mod=wslm&file=content&action=add&catid=13&modelid=29', '', 1, 'admin', '127.0.0.1', '2012-03-27 11:20:22'),
	(172, 'contentid', 45, 'wslm', 'content', 'add', 'mod=wslm&file=content&action=add&catid=13&modelid=29', '', 1, 'admin', '127.0.0.1', '2012-03-27 11:20:51'),
	(173, 'contentid', 46, 'wslm', 'content', 'add', 'mod=wslm&file=content&action=add&catid=14&modelid=32', '', 1, 'admin', '127.0.0.1', '2012-03-27 11:37:11'),
	(174, 'blockid', 51, 'wslm', 'block', 'add', 'mod=wslm&file=block&action=add&ajax=1', 'array (\n  \'pageid\' => \'page_18\',\n  \'blockno\' => \'1\',\n  \'name\' => \'内容-服务管理-服务理念\',\n  \'listorder\' => \'1\',\n  \'isarray\' => \'0\',\n  \'rows\' => \'6\',\n)', 1, 'admin', '127.0.0.1', '2012-03-27 11:50:45'),
	(175, 'blockid', 51, 'wslm', 'block', 'update', 'mod=wslm&file=block&action=update&dosubmit=1&ajax=1&blockid=51', 'array (\n  \'data\' => \'内容-服务管理-服务理念\',\n)', 1, 'admin', '127.0.0.1', '2012-03-27 11:50:48'),
	(176, 'blockid', 52, 'wslm', 'block', 'add', 'mod=wslm&file=block&action=add&ajax=1', 'array (\n  \'pageid\' => \'page_20\',\n  \'blockno\' => \'1\',\n  \'name\' => \'内容-服务范围-动漫cosplay策划\',\n  \'listorder\' => \'1\',\n  \'isarray\' => \'0\',\n  \'rows\' => \'6\',\n)', 1, 'admin', '127.0.0.1', '2012-03-27 11:51:14'),
	(177, 'blockid', 52, 'wslm', 'block', 'update', 'mod=wslm&file=block&action=update&dosubmit=1&ajax=1&blockid=52', 'array (\n  \'data\' => \'内容-服务范围-动漫cosplay策划\',\n)', 1, 'admin', '127.0.0.1', '2012-03-27 11:51:17'),
	(178, 'blockid', 53, 'wslm', 'block', 'add', 'mod=wslm&file=block&action=add&ajax=1', 'array (\n  \'pageid\' => \'page_21\',\n  \'blockno\' => \'1\',\n  \'name\' => \'内容-服务范围-产品形象策划\',\n  \'listorder\' => \'1\',\n  \'isarray\' => \'0\',\n  \'rows\' => \'6\',\n)', 1, 'admin', '127.0.0.1', '2012-03-27 11:51:31'),
	(179, 'blockid', 53, 'wslm', 'block', 'update', 'mod=wslm&file=block&action=update&dosubmit=1&ajax=1&blockid=53', 'array (\n  \'data\' => \'内容-服务范围-动漫cosplay策划\',\n)', 1, 'admin', '127.0.0.1', '2012-03-27 11:51:33'),
	(180, 'blockid', 54, 'wslm', 'block', 'add', 'mod=wslm&file=block&action=add&ajax=1', 'array (\n  \'pageid\' => \'page_22\',\n  \'blockno\' => \'1\',\n  \'name\' => \'内容-服务范围-动漫渠道建设策划\',\n  \'listorder\' => \'1\',\n  \'isarray\' => \'0\',\n  \'rows\' => \'6\',\n)', 1, 'admin', '127.0.0.1', '2012-03-27 11:51:50'),
	(181, 'blockid', 54, 'wslm', 'block', 'update', 'mod=wslm&file=block&action=update&dosubmit=1&ajax=1&blockid=54', 'array (\n  \'data\' => \'内容-服务范围-动漫渠道建设策划\',\n)', 1, 'admin', '127.0.0.1', '2012-03-27 11:51:53'),
	(182, 'blockid', 55, 'wslm', 'block', 'add', 'mod=wslm&file=block&action=add&ajax=1', 'array (\n  \'pageid\' => \'page_23\',\n  \'blockno\' => \'1\',\n  \'name\' => \'内容-服务范围-动漫推广策划\',\n  \'listorder\' => \'1\',\n  \'isarray\' => \'0\',\n  \'rows\' => \'6\',\n)', 1, 'admin', '127.0.0.1', '2012-03-27 11:52:05'),
	(183, 'blockid', 55, 'wslm', 'block', 'update', 'mod=wslm&file=block&action=update&dosubmit=1&ajax=1&blockid=55', 'array (\n  \'data\' => \'内容-服务范围-动漫推广策划\',\n)', 1, 'admin', '127.0.0.1', '2012-03-27 11:52:09'),
	(184, 'blockid', 56, 'wslm', 'block', 'add', 'mod=wslm&file=block&action=add&ajax=1', 'array (\n  \'pageid\' => \'page_24\',\n  \'blockno\' => \'1\',\n  \'name\' => \'内容-服务范围-动漫网络营销策划\',\n  \'listorder\' => \'1\',\n  \'isarray\' => \'0\',\n  \'rows\' => \'6\',\n)', 1, 'admin', '127.0.0.1', '2012-03-27 11:52:23'),
	(185, 'blockid', 56, 'wslm', 'block', 'update', 'mod=wslm&file=block&action=update&dosubmit=1&ajax=1&blockid=56', 'array (\n  \'data\' => \'内容-服务范围-动漫推广策划\',\n)', 1, 'admin', '127.0.0.1', '2012-03-27 11:52:26'),
	(186, 'blockid', 57, 'wslm', 'block', 'add', 'mod=wslm&file=block&action=add&ajax=1', 'array (\n  \'pageid\' => \'page_25\',\n  \'blockno\' => \'1\',\n  \'name\' => \'内容-服务范围-动漫展会活动策划\',\n  \'listorder\' => \'1\',\n  \'isarray\' => \'0\',\n  \'rows\' => \'6\',\n)', 1, 'admin', '127.0.0.1', '2012-03-27 11:52:36'),
	(187, 'blockid', 57, 'wslm', 'block', 'update', 'mod=wslm&file=block&action=update&dosubmit=1&ajax=1&blockid=57', 'array (\n  \'data\' => \'内容-服务范围-动漫推广策划\',\n)', 1, 'admin', '127.0.0.1', '2012-03-27 11:52:38'),
	(188, 'blockid', 58, 'wslm', 'block', 'add', 'mod=wslm&file=block&action=add&ajax=1', 'array (\n  \'pageid\' => \'page_26\',\n  \'blockno\' => \'1\',\n  \'name\' => \'内容-服务范围-动漫终端设计策划\',\n  \'listorder\' => \'1\',\n  \'isarray\' => \'0\',\n  \'rows\' => \'6\',\n)', 1, 'admin', '127.0.0.1', '2012-03-27 11:52:48'),
	(189, 'blockid', 58, 'wslm', 'block', 'update', 'mod=wslm&file=block&action=update&dosubmit=1&ajax=1&blockid=58', 'array (\n  \'data\' => \'内容-服务范围-动漫推广策划\',\n)', 1, 'admin', '127.0.0.1', '2012-03-27 11:52:50'),
	(190, 'blockid', 59, 'wslm', 'block', 'add', 'mod=wslm&file=block&action=add&ajax=1', 'array (\n  \'pageid\' => \'page_27\',\n  \'blockno\' => \'1\',\n  \'name\' => \'内容-服务范围-动漫终端营销策划\',\n  \'listorder\' => \'1\',\n  \'isarray\' => \'0\',\n  \'rows\' => \'6\',\n)', 1, 'admin', '127.0.0.1', '2012-03-27 11:53:03'),
	(191, 'blockid', 59, 'wslm', 'block', 'update', 'mod=wslm&file=block&action=update&dosubmit=1&ajax=1&blockid=59', 'array (\n  \'data\' => \'内容-服务范围-动漫推广策划\',\n)', 1, 'admin', '127.0.0.1', '2012-03-27 11:53:06'),
	(192, 'blockid', 60, 'wslm', 'block', 'add', 'mod=wslm&file=block&action=add&ajax=1', 'array (\n  \'pageid\' => \'page_28\',\n  \'blockno\' => \'1\',\n  \'name\' => \'内容-服务管理-运营流程\',\n  \'listorder\' => \'1\',\n  \'isarray\' => \'0\',\n  \'rows\' => \'6\',\n)', 1, 'admin', '127.0.0.1', '2012-03-27 11:53:51'),
	(193, 'blockid', 60, 'wslm', 'block', 'update', 'mod=wslm&file=block&action=update&dosubmit=1&ajax=1&blockid=60', 'array (\n  \'data\' => \'&nbsp;<img alt="" src="/wslm/uploadfile/2012/0327/20120327115404615.gif" />\',\n)', 1, 'admin', '127.0.0.1', '2012-03-27 11:54:06'),
	(194, 'contentid', 47, 'wslm', 'content', 'add', 'mod=wslm&file=content&action=add&catid=29&modelid=31', '', 1, 'admin', '127.0.0.1', '2012-03-27 11:55:20'),
	(195, 'contentid', 48, 'wslm', 'content', 'add', 'mod=wslm&file=content&action=add&catid=78&modelid=22', '', 1, 'admin', '127.0.0.1', '2012-03-27 12:54:18'),
	(196, 'contentid', 49, 'wslm', 'content', 'add', 'mod=wslm&file=content&action=add&catid=78&modelid=22', '', 1, 'admin', '127.0.0.1', '2012-03-27 12:54:43'),
	(197, 'contentid', 48, 'wslm', 'content', 'edit', 'mod=wslm&file=content&action=edit&contentid=48', '', 1, 'admin', '127.0.0.1', '2012-03-27 12:54:57'),
	(198, 'contentid', 50, 'wslm', 'content', 'add', 'mod=wslm&file=content&action=add&catid=81&modelid=22', '', 1, 'admin', '127.0.0.1', '2012-03-27 12:55:16'),
	(199, 'contentid', 49, 'wslm', 'content', 'edit', 'mod=wslm&file=content&action=edit&contentid=49', '', 1, 'admin', '127.0.0.1', '2012-03-27 13:04:04'),
	(200, 'contentid', 49, 'wslm', 'content', 'edit', 'mod=wslm&file=content&action=edit&contentid=49', '', 1, 'admin', '127.0.0.1', '2012-03-27 13:06:38'),
	(201, 'contentid', 51, 'wslm', 'content', 'add', 'mod=wslm&file=content&action=add&catid=51&modelid=26', '', 1, 'admin', '127.0.0.1', '2012-03-27 16:11:39'),
	(202, 'contentid', 52, 'wslm', 'content', 'add', 'mod=wslm&file=content&action=add&catid=51&modelid=26', '', 1, 'admin', '127.0.0.1', '2012-03-27 16:12:10'),
	(203, 'contentid', 53, 'wslm', 'content', 'add', 'mod=wslm&file=content&action=add&catid=51&modelid=26', '', 1, 'admin', '127.0.0.1', '2012-03-27 16:12:38'),
	(204, 'contentid', 54, 'wslm', 'content', 'add', 'mod=wslm&file=content&action=add&catid=51&modelid=26', '', 1, 'admin', '127.0.0.1', '2012-03-27 16:13:03'),
	(205, 'contentid', 55, 'wslm', 'content', 'add', 'mod=wslm&file=content&action=add&catid=51&modelid=26', '', 1, 'admin', '127.0.0.1', '2012-03-27 16:13:24'),
	(206, 'contentid', 56, 'wslm', 'content', 'add', 'mod=wslm&file=content&action=add&catid=51&modelid=26', '', 1, 'admin', '127.0.0.1', '2012-03-27 16:13:51'),
	(207, 'contentid', 57, 'wslm', 'content', 'add', 'mod=wslm&file=content&action=add&catid=51&modelid=26', '', 1, 'admin', '127.0.0.1', '2012-03-27 16:14:13'),
	(208, 'contentid', 58, 'wslm', 'content', 'add', 'mod=wslm&file=content&action=add&catid=51&modelid=26', '', 1, 'admin', '127.0.0.1', '2012-03-27 16:14:36'),
	(209, 'blockid', 61, 'wslm', 'block', 'add', 'mod=wslm&file=block&action=add&ajax=1', 'array (\n  \'pageid\' => \'invest_policy\',\n  \'blockno\' => \'1\',\n  \'name\' => \'栏目-投资合作-合作政策\',\n  \'listorder\' => \'1\',\n  \'isarray\' => \'0\',\n  \'rows\' => \'6\',\n)', 1, 'admin', '127.0.0.1', '2012-03-27 16:21:59'),
	(210, 'blockid', 61, 'wslm', 'block', 'update', 'mod=wslm&file=block&action=update&dosubmit=1&ajax=1&blockid=61', 'array (\n  \'data\' => \'&nbsp;网上经常将动漫说成是动画，由于这个说法一直存在，出现了误区，但也将错就错。主要原因是，日本的动漫比较热门，漫迷为了方便讨论与表达，将动漫一词用于指日本的动漫，大部分是用于指日本的动画，少部分用于指日本的漫画。 　日本是制作和生产动漫最出名的国家之一。\',\n)', 1, 'admin', '127.0.0.1', '2012-03-27 16:22:05'),
	(211, 'contentid', 59, 'wslm', 'content', 'add', 'mod=wslm&file=content&action=add&catid=83&modelid=33', '', 1, 'admin', '127.0.0.1', '2012-03-27 16:28:16'),
	(212, 'contentid', 60, 'wslm', 'content', 'add', 'mod=wslm&file=content&action=add&catid=83&modelid=33', '', 1, 'admin', '127.0.0.1', '2012-03-27 16:28:42'),
	(213, 'contentid', 61, 'wslm', 'content', 'add', 'mod=wslm&file=content&action=add&catid=83&modelid=33', '', 1, 'admin', '127.0.0.1', '2012-03-27 16:29:00'),
	(214, 'contentid', 62, 'wslm', 'content', 'add', 'mod=wslm&file=content&action=add&catid=83&modelid=33', '', 1, 'admin', '127.0.0.1', '2012-03-27 16:29:15'),
	(215, 'contentid', 63, 'wslm', 'content', 'add', 'mod=wslm&file=content&action=add&catid=83&modelid=33', '', 1, 'admin', '127.0.0.1', '2012-03-27 16:29:31'),
	(216, 'blockid', 62, 'wslm', 'block', 'add', 'mod=wslm&file=block&action=add&ajax=1', 'array (\n  \'pageid\' => \'top_8\',\n  \'blockno\' => \'1\',\n  \'name\' => \'栏目-联系我们-banner\',\n  \'listorder\' => \'1\',\n  \'isarray\' => \'0\',\n  \'rows\' => \'6\',\n)', 1, 'admin', '127.0.0.1', '2012-03-27 17:15:51'),
	(217, 'blockid', 62, 'wslm', 'block', 'update', 'mod=wslm&file=block&action=update&dosubmit=1&ajax=1&blockid=62', 'array (\n  \'data\' => \'<img alt="" src="/wslm/uploadfile/2012/0327/20120327051602922.jpg" />&nbsp;\',\n)', 1, 'admin', '127.0.0.1', '2012-03-27 17:16:06'),
	(218, 'blockid', 63, 'wslm', 'block', 'add', 'mod=wslm&file=block&action=add&ajax=1', 'array (\n  \'pageid\' => \'page_contact_us\',\n  \'blockno\' => \'1\',\n  \'name\' => \'内容-联系我们-联系方式\',\n  \'listorder\' => \'1\',\n  \'isarray\' => \'0\',\n  \'rows\' => \'6\',\n)', 1, 'admin', '127.0.0.1', '2012-03-27 17:23:47'),
	(219, 'blockid', 63, 'wslm', 'block', 'update', 'mod=wslm&file=block&action=update&dosubmit=1&ajax=1&blockid=63', 'array (\n  \'data\' => \'\n\n								<ul>\n\n									<li>联系方式:123456789</li>\n\n									<li>联系方式:123456789</li>\n\n									<li>联系方式:123456789</li>\n\n									<li>联系方式:123456789</li>\n\n									<li>联系方式:123456789</li>\n\n								</ul>\n\n\',\n)', 1, 'admin', '127.0.0.1', '2012-03-27 17:23:56'),
	(220, 'blockid', 63, 'wslm', 'block', 'update', 'mod=wslm&file=block&action=update&dosubmit=1&ajax=1&blockid=63', 'array (\n  \'data\' => \'<ul>\n    <li>联系方式:123456789</li>\n    <li>联系方式:123456789</li>\n    <li>联系方式:123456789</li>\n    <li>联系方式:123456789</li>\n    <li>联系方式:123456789</li>\n</ul>\',\n)', 1, 'admin', '127.0.0.1', '2012-03-27 17:25:34'),
	(221, 'blockid', 31, 'wslm', 'block', 'update', 'mod=wslm&file=block&action=update&dosubmit=1&ajax=1&blockid=31', 'array (\n  \'data\' => \'<img alt="" src="/wslm/uploadfile/2012/0326/20120326033406767.jpg" />\',\n)', 1, 'admin', '127.0.0.1', '2012-03-27 19:01:24'),
	(222, 'contentid', 64, 'wslm', 'content', 'add', 'mod=wslm&file=content&action=add&catid=15&modelid=21', '', 1, 'admin', '127.0.0.1', '2012-03-27 19:02:26'),
	(223, 'contentid', 65, 'wslm', 'content', 'add', 'mod=wslm&file=content&action=add&catid=15&modelid=21', '', 1, 'admin', '127.0.0.1', '2012-03-27 19:02:34'),
	(224, 'contentid', 66, 'wslm', 'content', 'add', 'mod=wslm&file=content&action=add&catid=15&modelid=21', '', 1, 'admin', '127.0.0.1', '2012-03-27 19:02:41'),
	(225, 'contentid', 67, 'wslm', 'content', 'add', 'mod=wslm&file=content&action=add&catid=15&modelid=21', '', 1, 'admin', '127.0.0.1', '2012-03-27 19:02:48'),
	(226, 'contentid', 68, 'wslm', 'content', 'add', 'mod=wslm&file=content&action=add&catid=15&modelid=21', '', 1, 'admin', '127.0.0.1', '2012-03-27 19:03:05'),
	(227, 'contentid', 69, 'wslm', 'content', 'add', 'mod=wslm&file=content&action=add&catid=15&modelid=21', '', 1, 'admin', '127.0.0.1', '2012-03-27 19:03:12'),
	(228, 'contentid', 70, 'wslm', 'content', 'add', 'mod=wslm&file=content&action=add&catid=15&modelid=21', '', 1, 'admin', '127.0.0.1', '2012-03-27 19:03:26'),
	(229, 'contentid', 71, 'wslm', 'content', 'add', 'mod=wslm&file=content&action=add&catid=15&modelid=21', '', 1, 'admin', '127.0.0.1', '2012-03-27 19:03:33'),
	(230, 'contentid', 72, 'wslm', 'content', 'add', 'mod=wslm&file=content&action=add&catid=15&modelid=21', '', 1, 'admin', '127.0.0.1', '2012-03-27 19:03:50');
/*!40000 ALTER TABLE `mg_log` ENABLE KEYS */;


# Dumping structure for table mg_wlsm.mg_mail
DROP TABLE IF EXISTS `mg_mail`;
CREATE TABLE IF NOT EXISTS `mg_mail` (
  `mailid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `typeid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` char(200) NOT NULL,
  `content` mediumtext NOT NULL,
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `sendtime` int(10) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL,
  `period` int(10) unsigned NOT NULL DEFAULT '0',
  `count` smallint(6) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`mailid`),
  KEY `typeid` (`typeid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# Dumping data for table mg_wlsm.mg_mail: 0 rows
DELETE FROM `mg_mail`;
/*!40000 ALTER TABLE `mg_mail` DISABLE KEYS */;
/*!40000 ALTER TABLE `mg_mail` ENABLE KEYS */;


# Dumping structure for table mg_wlsm.mg_mail_email
DROP TABLE IF EXISTS `mg_mail_email`;
CREATE TABLE IF NOT EXISTS `mg_mail_email` (
  `email` char(50) NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `ip` char(15) NOT NULL,
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `authcode` char(32) NOT NULL,
  PRIMARY KEY (`email`),
  KEY `userid` (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# Dumping data for table mg_wlsm.mg_mail_email: 0 rows
DELETE FROM `mg_mail_email`;
/*!40000 ALTER TABLE `mg_mail_email` DISABLE KEYS */;
/*!40000 ALTER TABLE `mg_mail_email` ENABLE KEYS */;


# Dumping structure for table mg_wlsm.mg_mail_email_type
DROP TABLE IF EXISTS `mg_mail_email_type`;
CREATE TABLE IF NOT EXISTS `mg_mail_email_type` (
  `email` char(50) NOT NULL,
  `typeid` smallint(5) unsigned NOT NULL DEFAULT '0',
  KEY `email` (`email`),
  KEY `typeid` (`typeid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# Dumping data for table mg_wlsm.mg_mail_email_type: 0 rows
DELETE FROM `mg_mail_email_type`;
/*!40000 ALTER TABLE `mg_mail_email_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `mg_mail_email_type` ENABLE KEYS */;


# Dumping structure for table mg_wlsm.mg_member
DROP TABLE IF EXISTS `mg_member`;
CREATE TABLE IF NOT EXISTS `mg_member` (
  `userid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `username` char(20) NOT NULL,
  `password` char(32) NOT NULL,
  `touserid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `email` char(40) NOT NULL,
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `areaid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `amount` float(6,2) unsigned NOT NULL DEFAULT '0.00',
  `point` smallint(5) unsigned NOT NULL DEFAULT '0',
  `modelid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `message` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`userid`),
  UNIQUE KEY `username` (`username`(15)),
  KEY `email` (`email`(20)),
  KEY `groupid` (`groupid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

# Dumping data for table mg_wlsm.mg_member: 1 rows
DELETE FROM `mg_member`;
/*!40000 ALTER TABLE `mg_member` DISABLE KEYS */;
INSERT INTO `mg_member` (`userid`, `username`, `password`, `touserid`, `email`, `groupid`, `areaid`, `amount`, `point`, `modelid`, `message`, `disabled`) VALUES
	(1, 'admin', '5dfd8829b73474a9c851dee3787b5fb0', 0, 'zkz15@yahoo.com.cn', 1, 0, 0.00, 0, 10, 0, 0);
/*!40000 ALTER TABLE `mg_member` ENABLE KEYS */;


# Dumping structure for table mg_wlsm.mg_member_cache
DROP TABLE IF EXISTS `mg_member_cache`;
CREATE TABLE IF NOT EXISTS `mg_member_cache` (
  `userid` mediumint(8) unsigned NOT NULL,
  `username` char(20) NOT NULL,
  `password` char(32) NOT NULL,
  `touserid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `email` char(40) NOT NULL,
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `areaid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `amount` float(6,2) unsigned NOT NULL DEFAULT '0.00',
  `point` smallint(5) unsigned NOT NULL DEFAULT '0',
  `modelid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `message` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`userid`),
  UNIQUE KEY `username` (`username`(15)),
  KEY `email` (`email`(20)),
  KEY `groupid` (`groupid`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

# Dumping data for table mg_wlsm.mg_member_cache: 1 rows
DELETE FROM `mg_member_cache`;
/*!40000 ALTER TABLE `mg_member_cache` DISABLE KEYS */;
INSERT INTO `mg_member_cache` (`userid`, `username`, `password`, `touserid`, `email`, `groupid`, `areaid`, `amount`, `point`, `modelid`, `message`, `disabled`) VALUES
	(1, 'admin', '5dfd8829b73474a9c851dee3787b5fb0', 0, 'zkz15@yahoo.com.cn', 1, 0, 0.00, 0, 10, 0, 0);
/*!40000 ALTER TABLE `mg_member_cache` ENABLE KEYS */;


# Dumping structure for table mg_wlsm.mg_member_company
DROP TABLE IF EXISTS `mg_member_company`;
CREATE TABLE IF NOT EXISTS `mg_member_company` (
  `userid` int(10) unsigned NOT NULL,
  `sitedomain` varchar(30) NOT NULL,
  `tplname` varchar(30) NOT NULL,
  `products` mediumtext NOT NULL,
  `companyname` varchar(150) NOT NULL DEFAULT '',
  `catids` varchar(200) NOT NULL DEFAULT '',
  `genre` varchar(30) NOT NULL DEFAULT '未经工商注册，个人',
  `areaname` char(15) NOT NULL DEFAULT '',
  `establishtime` date NOT NULL COMMENT '公司成立日期',
  `linkman` varchar(20) NOT NULL,
  `telephone` varchar(18) NOT NULL,
  `email` varchar(40) NOT NULL,
  `address` varchar(150) NOT NULL DEFAULT '',
  `grade` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '会员等级',
  `endtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '服务期截止时间',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '公司审核状态：0-未审核 1-审核通过',
  `diy` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '自定义风格：1为自定义，0 系统样式',
  `map` varchar(50) NOT NULL COMMENT '地理位置参数',
  `menu` text NOT NULL COMMENT '企业主页使用的菜单',
  `introduce` text NOT NULL COMMENT '公司介绍',
  `logo` varchar(100) NOT NULL COMMENT '企业LOGO',
  `banner` varchar(100) NOT NULL COMMENT '公司Banner',
  `pattern` varchar(30) NOT NULL,
  `employnum` varchar(12) NOT NULL COMMENT '员工人数',
  `turnover` varchar(20) NOT NULL COMMENT '年营业额',
  `elite` tinyint(1) NOT NULL DEFAULT '0',
  `fax` varchar(18) NOT NULL,
  `zip` mediumint(8) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `userid` (`userid`),
  KEY `sitedomain` (`sitedomain`,`status`),
  KEY `elite` (`elite`,`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# Dumping data for table mg_wlsm.mg_member_company: 0 rows
DELETE FROM `mg_member_company`;
/*!40000 ALTER TABLE `mg_member_company` DISABLE KEYS */;
/*!40000 ALTER TABLE `mg_member_company` ENABLE KEYS */;


# Dumping structure for table mg_wlsm.mg_member_detail
DROP TABLE IF EXISTS `mg_member_detail`;
CREATE TABLE IF NOT EXISTS `mg_member_detail` (
  `userid` mediumint(8) unsigned NOT NULL,
  `truename` varchar(50) NOT NULL DEFAULT '',
  `gender` tinyint(1) NOT NULL DEFAULT '2',
  `msn` varchar(20) NOT NULL DEFAULT '',
  `telephone` varchar(20) NOT NULL DEFAULT '',
  `address` varchar(100) NOT NULL DEFAULT '',
  `qq` varchar(15) NOT NULL DEFAULT '',
  `birthday` datetime NOT NULL,
  `postcode` varchar(15) NOT NULL DEFAULT '',
  `mobile` varchar(15) NOT NULL DEFAULT '',
  UNIQUE KEY `userid` (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# Dumping data for table mg_wlsm.mg_member_detail: 1 rows
DELETE FROM `mg_member_detail`;
/*!40000 ALTER TABLE `mg_member_detail` DISABLE KEYS */;
INSERT INTO `mg_member_detail` (`userid`, `truename`, `gender`, `msn`, `telephone`, `address`, `qq`, `birthday`, `postcode`, `mobile`) VALUES
	(1, '', 2, '', '', '', '', '0000-00-00 00:00:00', '', '');
/*!40000 ALTER TABLE `mg_member_detail` ENABLE KEYS */;


# Dumping structure for table mg_wlsm.mg_member_group
DROP TABLE IF EXISTS `mg_member_group`;
CREATE TABLE IF NOT EXISTS `mg_member_group` (
  `groupid` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(20) NOT NULL,
  `issystem` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allowmessage` smallint(5) unsigned NOT NULL DEFAULT '0',
  `allowvisit` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allowpost` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allowsearch` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allowupgrade` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `price_y` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `price_m` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `price_d` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `description` mediumtext NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`groupid`),
  KEY `disabled` (`disabled`),
  KEY `listorder` (`listorder`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

# Dumping data for table mg_wlsm.mg_member_group: 6 rows
DELETE FROM `mg_member_group`;
/*!40000 ALTER TABLE `mg_member_group` DISABLE KEYS */;
INSERT INTO `mg_member_group` (`groupid`, `name`, `issystem`, `allowmessage`, `allowvisit`, `allowpost`, `allowsearch`, `allowupgrade`, `price_y`, `price_m`, `price_d`, `description`, `listorder`, `disabled`) VALUES
	(1, '管理员', 1, 9999, 1, 1, 1, 1, 0.00, 0.00, 0.00, '', 0, 0),
	(2, '禁用', 1, 0, 0, 0, 0, 1, 0.00, 0.00, 0.00, '', 12, 0),
	(3, '游客', 1, 0, 1, 0, 0, 1, 0.00, 0.00, 0.00, '', 0, 0),
	(4, '待邮件验证', 1, 0, 1, 0, 0, 1, 0.00, 0.00, 0.00, '', 0, 0),
	(5, '待审核', 1, 0, 1, 0, 0, 1, 0.00, 0.00, 0.00, '', 0, 0),
	(6, '注册会员', 1, 50, 1, 1, 1, 1, 0.00, 0.00, 0.00, '', 0, 0);
/*!40000 ALTER TABLE `mg_member_group` ENABLE KEYS */;


# Dumping structure for table mg_wlsm.mg_member_group_extend
DROP TABLE IF EXISTS `mg_member_group_extend`;
CREATE TABLE IF NOT EXISTS `mg_member_group_extend` (
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `unit` enum('y','m','d') NOT NULL DEFAULT 'y',
  `price` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `number` smallint(5) unsigned NOT NULL DEFAULT '0',
  `amount` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `startdate` date NOT NULL DEFAULT '0000-00-00',
  `enddate` date NOT NULL DEFAULT '0000-00-00',
  `ip` char(15) NOT NULL,
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`userid`,`groupid`),
  KEY `groupid` (`groupid`,`disabled`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# Dumping data for table mg_wlsm.mg_member_group_extend: 0 rows
DELETE FROM `mg_member_group_extend`;
/*!40000 ALTER TABLE `mg_member_group_extend` DISABLE KEYS */;
/*!40000 ALTER TABLE `mg_member_group_extend` ENABLE KEYS */;


# Dumping structure for table mg_wlsm.mg_member_group_priv
DROP TABLE IF EXISTS `mg_member_group_priv`;
CREATE TABLE IF NOT EXISTS `mg_member_group_priv` (
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `field` char(15) NOT NULL,
  `value` char(15) NOT NULL,
  `priv` char(15) NOT NULL,
  PRIMARY KEY (`groupid`,`field`,`value`,`priv`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# Dumping data for table mg_wlsm.mg_member_group_priv: 1,007 rows
DELETE FROM `mg_member_group_priv`;
/*!40000 ALTER TABLE `mg_member_group_priv` DISABLE KEYS */;
INSERT INTO `mg_member_group_priv` (`groupid`, `field`, `value`, `priv`) VALUES
	(0, 'catid', '1', ''),
	(0, 'catid', '13', ''),
	(0, 'catid', '14', ''),
	(0, 'catid', '15', ''),
	(0, 'catid', '16', ''),
	(0, 'catid', '17', ''),
	(0, 'catid', '19', ''),
	(0, 'catid', '2', ''),
	(0, 'catid', '29', ''),
	(0, 'catid', '3', ''),
	(0, 'catid', '30', ''),
	(0, 'catid', '31', ''),
	(0, 'catid', '32', ''),
	(0, 'catid', '33', ''),
	(0, 'catid', '34', ''),
	(0, 'catid', '35', ''),
	(0, 'catid', '36', ''),
	(0, 'catid', '37', ''),
	(0, 'catid', '39', ''),
	(0, 'catid', '4', ''),
	(0, 'catid', '40', ''),
	(0, 'catid', '41', ''),
	(0, 'catid', '42', ''),
	(0, 'catid', '43', ''),
	(0, 'catid', '44', ''),
	(0, 'catid', '45', ''),
	(0, 'catid', '46', ''),
	(0, 'catid', '47', ''),
	(0, 'catid', '48', ''),
	(0, 'catid', '49', ''),
	(0, 'catid', '5', ''),
	(0, 'catid', '50', ''),
	(0, 'catid', '51', ''),
	(0, 'catid', '52', ''),
	(0, 'catid', '53', ''),
	(0, 'catid', '54', ''),
	(0, 'catid', '6', ''),
	(0, 'catid', '62', ''),
	(0, 'catid', '63', ''),
	(0, 'catid', '65', ''),
	(0, 'catid', '67', ''),
	(0, 'catid', '69', ''),
	(0, 'catid', '7', ''),
	(0, 'catid', '72', ''),
	(0, 'catid', '73', ''),
	(0, 'catid', '74', ''),
	(0, 'catid', '76', ''),
	(0, 'catid', '77', ''),
	(0, 'catid', '78', ''),
	(0, 'catid', '79', ''),
	(0, 'catid', '80', ''),
	(0, 'catid', '81', ''),
	(0, 'catid', '82', ''),
	(1, 'catid', '1', 'browse'),
	(1, 'catid', '1', 'input'),
	(1, 'catid', '1', 'view'),
	(1, 'catid', '13', 'browse'),
	(1, 'catid', '13', 'input'),
	(1, 'catid', '13', 'view'),
	(1, 'catid', '14', 'browse'),
	(1, 'catid', '14', 'input'),
	(1, 'catid', '14', 'view'),
	(1, 'catid', '15', 'browse'),
	(1, 'catid', '15', 'input'),
	(1, 'catid', '15', 'view'),
	(1, 'catid', '16', 'browse'),
	(1, 'catid', '16', 'input'),
	(1, 'catid', '16', 'view'),
	(1, 'catid', '17', 'browse'),
	(1, 'catid', '17', 'input'),
	(1, 'catid', '17', 'view'),
	(1, 'catid', '19', 'browse'),
	(1, 'catid', '19', 'input'),
	(1, 'catid', '19', 'view'),
	(1, 'catid', '2', 'browse'),
	(1, 'catid', '2', 'input'),
	(1, 'catid', '2', 'view'),
	(1, 'catid', '29', 'browse'),
	(1, 'catid', '29', 'input'),
	(1, 'catid', '29', 'view'),
	(1, 'catid', '3', 'browse'),
	(1, 'catid', '3', 'input'),
	(1, 'catid', '3', 'view'),
	(1, 'catid', '30', 'browse'),
	(1, 'catid', '30', 'input'),
	(1, 'catid', '30', 'view'),
	(1, 'catid', '31', 'browse'),
	(1, 'catid', '31', 'input'),
	(1, 'catid', '31', 'view'),
	(1, 'catid', '32', 'browse'),
	(1, 'catid', '32', 'input'),
	(1, 'catid', '32', 'view'),
	(1, 'catid', '33', 'browse'),
	(1, 'catid', '33', 'input'),
	(1, 'catid', '33', 'view'),
	(1, 'catid', '34', 'browse'),
	(1, 'catid', '34', 'input'),
	(1, 'catid', '34', 'view'),
	(1, 'catid', '35', 'browse'),
	(1, 'catid', '35', 'input'),
	(1, 'catid', '35', 'view'),
	(1, 'catid', '36', 'browse'),
	(1, 'catid', '36', 'input'),
	(1, 'catid', '36', 'view'),
	(1, 'catid', '37', 'browse'),
	(1, 'catid', '37', 'input'),
	(1, 'catid', '37', 'view'),
	(1, 'catid', '39', 'browse'),
	(1, 'catid', '39', 'input'),
	(1, 'catid', '39', 'view'),
	(1, 'catid', '4', 'browse'),
	(1, 'catid', '4', 'input'),
	(1, 'catid', '4', 'view'),
	(1, 'catid', '40', 'browse'),
	(1, 'catid', '40', 'input'),
	(1, 'catid', '40', 'view'),
	(1, 'catid', '41', 'browse'),
	(1, 'catid', '41', 'input'),
	(1, 'catid', '41', 'view'),
	(1, 'catid', '42', 'browse'),
	(1, 'catid', '42', 'input'),
	(1, 'catid', '42', 'view'),
	(1, 'catid', '43', 'browse'),
	(1, 'catid', '43', 'input'),
	(1, 'catid', '43', 'view'),
	(1, 'catid', '44', 'browse'),
	(1, 'catid', '44', 'input'),
	(1, 'catid', '44', 'view'),
	(1, 'catid', '45', 'browse'),
	(1, 'catid', '45', 'input'),
	(1, 'catid', '45', 'view'),
	(1, 'catid', '46', 'browse'),
	(1, 'catid', '46', 'input'),
	(1, 'catid', '46', 'view'),
	(1, 'catid', '47', 'browse'),
	(1, 'catid', '47', 'input'),
	(1, 'catid', '47', 'view'),
	(1, 'catid', '48', 'browse'),
	(1, 'catid', '48', 'input'),
	(1, 'catid', '48', 'view'),
	(1, 'catid', '49', 'browse'),
	(1, 'catid', '49', 'input'),
	(1, 'catid', '49', 'view'),
	(1, 'catid', '5', 'browse'),
	(1, 'catid', '5', 'input'),
	(1, 'catid', '5', 'view'),
	(1, 'catid', '50', 'browse'),
	(1, 'catid', '50', 'input'),
	(1, 'catid', '50', 'view'),
	(1, 'catid', '51', 'browse'),
	(1, 'catid', '51', 'input'),
	(1, 'catid', '51', 'view'),
	(1, 'catid', '52', 'browse'),
	(1, 'catid', '52', 'input'),
	(1, 'catid', '52', 'view'),
	(1, 'catid', '53', 'browse'),
	(1, 'catid', '53', 'input'),
	(1, 'catid', '53', 'view'),
	(1, 'catid', '54', 'browse'),
	(1, 'catid', '54', 'input'),
	(1, 'catid', '54', 'view'),
	(1, 'catid', '6', 'browse'),
	(1, 'catid', '6', 'input'),
	(1, 'catid', '6', 'view'),
	(1, 'catid', '62', 'browse'),
	(1, 'catid', '62', 'input'),
	(1, 'catid', '62', 'view'),
	(1, 'catid', '63', 'browse'),
	(1, 'catid', '63', 'input'),
	(1, 'catid', '63', 'view'),
	(1, 'catid', '65', 'browse'),
	(1, 'catid', '65', 'input'),
	(1, 'catid', '65', 'view'),
	(1, 'catid', '67', 'browse'),
	(1, 'catid', '67', 'input'),
	(1, 'catid', '67', 'view'),
	(1, 'catid', '69', 'browse'),
	(1, 'catid', '69', 'input'),
	(1, 'catid', '69', 'view'),
	(1, 'catid', '7', 'browse'),
	(1, 'catid', '7', 'input'),
	(1, 'catid', '7', 'view'),
	(1, 'catid', '72', 'browse'),
	(1, 'catid', '72', 'input'),
	(1, 'catid', '72', 'view'),
	(1, 'catid', '73', 'browse'),
	(1, 'catid', '73', 'input'),
	(1, 'catid', '73', 'view'),
	(1, 'catid', '74', 'browse'),
	(1, 'catid', '74', 'input'),
	(1, 'catid', '74', 'view'),
	(1, 'catid', '76', 'browse'),
	(1, 'catid', '76', 'input'),
	(1, 'catid', '76', 'view'),
	(1, 'catid', '77', 'browse'),
	(1, 'catid', '77', 'input'),
	(1, 'catid', '77', 'view'),
	(1, 'catid', '78', 'browse'),
	(1, 'catid', '78', 'input'),
	(1, 'catid', '78', 'view'),
	(1, 'catid', '79', 'browse'),
	(1, 'catid', '79', 'input'),
	(1, 'catid', '79', 'view'),
	(1, 'catid', '80', 'browse'),
	(1, 'catid', '80', 'input'),
	(1, 'catid', '80', 'view'),
	(1, 'catid', '81', 'browse'),
	(1, 'catid', '81', 'input'),
	(1, 'catid', '81', 'view'),
	(1, 'catid', '82', 'browse'),
	(1, 'catid', '82', 'input'),
	(1, 'catid', '82', 'view'),
	(2, 'catid', '1', 'browse'),
	(2, 'catid', '1', 'input'),
	(2, 'catid', '1', 'view'),
	(2, 'catid', '13', 'browse'),
	(2, 'catid', '13', 'input'),
	(2, 'catid', '13', 'view'),
	(2, 'catid', '14', 'browse'),
	(2, 'catid', '14', 'input'),
	(2, 'catid', '14', 'view'),
	(2, 'catid', '15', 'browse'),
	(2, 'catid', '15', 'input'),
	(2, 'catid', '15', 'view'),
	(2, 'catid', '16', 'browse'),
	(2, 'catid', '16', 'input'),
	(2, 'catid', '16', 'view'),
	(2, 'catid', '17', 'browse'),
	(2, 'catid', '17', 'input'),
	(2, 'catid', '17', 'view'),
	(2, 'catid', '19', 'browse'),
	(2, 'catid', '19', 'input'),
	(2, 'catid', '19', 'view'),
	(2, 'catid', '2', 'browse'),
	(2, 'catid', '2', 'input'),
	(2, 'catid', '2', 'view'),
	(2, 'catid', '29', 'browse'),
	(2, 'catid', '29', 'input'),
	(2, 'catid', '29', 'view'),
	(2, 'catid', '3', 'browse'),
	(2, 'catid', '3', 'input'),
	(2, 'catid', '3', 'view'),
	(2, 'catid', '30', 'browse'),
	(2, 'catid', '30', 'input'),
	(2, 'catid', '30', 'view'),
	(2, 'catid', '31', 'browse'),
	(2, 'catid', '31', 'input'),
	(2, 'catid', '31', 'view'),
	(2, 'catid', '32', 'browse'),
	(2, 'catid', '32', 'input'),
	(2, 'catid', '32', 'view'),
	(2, 'catid', '33', 'browse'),
	(2, 'catid', '33', 'input'),
	(2, 'catid', '33', 'view'),
	(2, 'catid', '34', 'browse'),
	(2, 'catid', '34', 'input'),
	(2, 'catid', '34', 'view'),
	(2, 'catid', '35', 'browse'),
	(2, 'catid', '35', 'input'),
	(2, 'catid', '35', 'view'),
	(2, 'catid', '36', 'browse'),
	(2, 'catid', '36', 'input'),
	(2, 'catid', '36', 'view'),
	(2, 'catid', '37', 'browse'),
	(2, 'catid', '37', 'input'),
	(2, 'catid', '37', 'view'),
	(2, 'catid', '39', 'browse'),
	(2, 'catid', '39', 'input'),
	(2, 'catid', '39', 'view'),
	(2, 'catid', '4', 'browse'),
	(2, 'catid', '4', 'input'),
	(2, 'catid', '4', 'view'),
	(2, 'catid', '40', 'browse'),
	(2, 'catid', '40', 'input'),
	(2, 'catid', '40', 'view'),
	(2, 'catid', '41', 'browse'),
	(2, 'catid', '41', 'input'),
	(2, 'catid', '41', 'view'),
	(2, 'catid', '42', 'browse'),
	(2, 'catid', '42', 'input'),
	(2, 'catid', '42', 'view'),
	(2, 'catid', '43', 'browse'),
	(2, 'catid', '43', 'input'),
	(2, 'catid', '43', 'view'),
	(2, 'catid', '44', 'browse'),
	(2, 'catid', '44', 'input'),
	(2, 'catid', '44', 'view'),
	(2, 'catid', '45', 'browse'),
	(2, 'catid', '45', 'input'),
	(2, 'catid', '45', 'view'),
	(2, 'catid', '46', 'browse'),
	(2, 'catid', '46', 'input'),
	(2, 'catid', '46', 'view'),
	(2, 'catid', '47', 'browse'),
	(2, 'catid', '47', 'input'),
	(2, 'catid', '47', 'view'),
	(2, 'catid', '48', 'browse'),
	(2, 'catid', '48', 'input'),
	(2, 'catid', '48', 'view'),
	(2, 'catid', '49', 'browse'),
	(2, 'catid', '49', 'input'),
	(2, 'catid', '49', 'view'),
	(2, 'catid', '5', 'browse'),
	(2, 'catid', '5', 'input'),
	(2, 'catid', '5', 'view'),
	(2, 'catid', '50', 'browse'),
	(2, 'catid', '50', 'input'),
	(2, 'catid', '50', 'view'),
	(2, 'catid', '51', 'browse'),
	(2, 'catid', '51', 'input'),
	(2, 'catid', '51', 'view'),
	(2, 'catid', '52', 'browse'),
	(2, 'catid', '52', 'input'),
	(2, 'catid', '52', 'view'),
	(2, 'catid', '53', 'browse'),
	(2, 'catid', '53', 'input'),
	(2, 'catid', '53', 'view'),
	(2, 'catid', '54', 'browse'),
	(2, 'catid', '54', 'input'),
	(2, 'catid', '54', 'view'),
	(2, 'catid', '6', 'browse'),
	(2, 'catid', '6', 'input'),
	(2, 'catid', '6', 'view'),
	(2, 'catid', '62', 'browse'),
	(2, 'catid', '62', 'input'),
	(2, 'catid', '62', 'view'),
	(2, 'catid', '63', 'browse'),
	(2, 'catid', '63', 'input'),
	(2, 'catid', '63', 'view'),
	(2, 'catid', '65', 'browse'),
	(2, 'catid', '65', 'input'),
	(2, 'catid', '65', 'view'),
	(2, 'catid', '67', 'browse'),
	(2, 'catid', '67', 'input'),
	(2, 'catid', '67', 'view'),
	(2, 'catid', '69', 'browse'),
	(2, 'catid', '69', 'input'),
	(2, 'catid', '69', 'view'),
	(2, 'catid', '7', 'browse'),
	(2, 'catid', '7', 'input'),
	(2, 'catid', '7', 'view'),
	(2, 'catid', '72', 'browse'),
	(2, 'catid', '72', 'input'),
	(2, 'catid', '72', 'view'),
	(2, 'catid', '73', 'browse'),
	(2, 'catid', '73', 'input'),
	(2, 'catid', '73', 'view'),
	(2, 'catid', '74', 'browse'),
	(2, 'catid', '74', 'input'),
	(2, 'catid', '74', 'view'),
	(2, 'catid', '76', 'browse'),
	(2, 'catid', '76', 'input'),
	(2, 'catid', '76', 'view'),
	(2, 'catid', '77', 'browse'),
	(2, 'catid', '77', 'input'),
	(2, 'catid', '77', 'view'),
	(2, 'catid', '78', 'browse'),
	(2, 'catid', '78', 'input'),
	(2, 'catid', '78', 'view'),
	(2, 'catid', '79', 'browse'),
	(2, 'catid', '79', 'input'),
	(2, 'catid', '79', 'view'),
	(2, 'catid', '80', 'browse'),
	(2, 'catid', '80', 'input'),
	(2, 'catid', '80', 'view'),
	(2, 'catid', '81', 'browse'),
	(2, 'catid', '81', 'input'),
	(2, 'catid', '81', 'view'),
	(2, 'catid', '82', 'browse'),
	(2, 'catid', '82', 'input'),
	(2, 'catid', '82', 'view'),
	(3, 'catid', '1', 'browse'),
	(3, 'catid', '1', 'input'),
	(3, 'catid', '1', 'view'),
	(3, 'catid', '13', 'browse'),
	(3, 'catid', '13', 'input'),
	(3, 'catid', '13', 'view'),
	(3, 'catid', '14', 'browse'),
	(3, 'catid', '14', 'input'),
	(3, 'catid', '14', 'view'),
	(3, 'catid', '15', 'browse'),
	(3, 'catid', '15', 'input'),
	(3, 'catid', '15', 'view'),
	(3, 'catid', '16', 'browse'),
	(3, 'catid', '16', 'input'),
	(3, 'catid', '16', 'view'),
	(3, 'catid', '17', 'browse'),
	(3, 'catid', '17', 'input'),
	(3, 'catid', '17', 'view'),
	(3, 'catid', '19', 'browse'),
	(3, 'catid', '19', 'input'),
	(3, 'catid', '19', 'view'),
	(3, 'catid', '2', 'browse'),
	(3, 'catid', '2', 'input'),
	(3, 'catid', '2', 'view'),
	(3, 'catid', '29', 'browse'),
	(3, 'catid', '29', 'input'),
	(3, 'catid', '29', 'view'),
	(3, 'catid', '3', 'browse'),
	(3, 'catid', '3', 'input'),
	(3, 'catid', '3', 'view'),
	(3, 'catid', '30', 'browse'),
	(3, 'catid', '30', 'input'),
	(3, 'catid', '30', 'view'),
	(3, 'catid', '31', 'browse'),
	(3, 'catid', '31', 'input'),
	(3, 'catid', '31', 'view'),
	(3, 'catid', '32', 'browse'),
	(3, 'catid', '32', 'input'),
	(3, 'catid', '32', 'view'),
	(3, 'catid', '33', 'browse'),
	(3, 'catid', '33', 'input'),
	(3, 'catid', '33', 'view'),
	(3, 'catid', '34', 'browse'),
	(3, 'catid', '34', 'input'),
	(3, 'catid', '34', 'view'),
	(3, 'catid', '35', 'browse'),
	(3, 'catid', '35', 'input'),
	(3, 'catid', '35', 'view'),
	(3, 'catid', '36', 'browse'),
	(3, 'catid', '36', 'input'),
	(3, 'catid', '36', 'view'),
	(3, 'catid', '37', 'browse'),
	(3, 'catid', '37', 'input'),
	(3, 'catid', '37', 'view'),
	(3, 'catid', '39', 'browse'),
	(3, 'catid', '39', 'input'),
	(3, 'catid', '39', 'view'),
	(3, 'catid', '4', 'browse'),
	(3, 'catid', '4', 'input'),
	(3, 'catid', '4', 'view'),
	(3, 'catid', '40', 'browse'),
	(3, 'catid', '40', 'input'),
	(3, 'catid', '40', 'view'),
	(3, 'catid', '41', 'browse'),
	(3, 'catid', '41', 'input'),
	(3, 'catid', '41', 'view'),
	(3, 'catid', '42', 'browse'),
	(3, 'catid', '42', 'input'),
	(3, 'catid', '42', 'view'),
	(3, 'catid', '43', 'browse'),
	(3, 'catid', '43', 'input'),
	(3, 'catid', '43', 'view'),
	(3, 'catid', '44', 'browse'),
	(3, 'catid', '44', 'input'),
	(3, 'catid', '44', 'view'),
	(3, 'catid', '45', 'browse'),
	(3, 'catid', '45', 'input'),
	(3, 'catid', '45', 'view'),
	(3, 'catid', '46', 'browse'),
	(3, 'catid', '46', 'input'),
	(3, 'catid', '46', 'view'),
	(3, 'catid', '47', 'browse'),
	(3, 'catid', '47', 'input'),
	(3, 'catid', '47', 'view'),
	(3, 'catid', '48', 'browse'),
	(3, 'catid', '48', 'input'),
	(3, 'catid', '48', 'view'),
	(3, 'catid', '49', 'browse'),
	(3, 'catid', '49', 'input'),
	(3, 'catid', '49', 'view'),
	(3, 'catid', '5', 'browse'),
	(3, 'catid', '5', 'input'),
	(3, 'catid', '5', 'view'),
	(3, 'catid', '50', 'browse'),
	(3, 'catid', '50', 'input'),
	(3, 'catid', '50', 'view'),
	(3, 'catid', '51', 'browse'),
	(3, 'catid', '51', 'input'),
	(3, 'catid', '51', 'view'),
	(3, 'catid', '52', 'browse'),
	(3, 'catid', '52', 'input'),
	(3, 'catid', '52', 'view'),
	(3, 'catid', '53', 'browse'),
	(3, 'catid', '53', 'input'),
	(3, 'catid', '53', 'view'),
	(3, 'catid', '54', 'browse'),
	(3, 'catid', '54', 'input'),
	(3, 'catid', '54', 'view'),
	(3, 'catid', '6', 'browse'),
	(3, 'catid', '6', 'input'),
	(3, 'catid', '6', 'view'),
	(3, 'catid', '62', 'browse'),
	(3, 'catid', '62', 'input'),
	(3, 'catid', '62', 'view'),
	(3, 'catid', '63', 'browse'),
	(3, 'catid', '63', 'input'),
	(3, 'catid', '63', 'view'),
	(3, 'catid', '65', 'browse'),
	(3, 'catid', '65', 'input'),
	(3, 'catid', '65', 'view'),
	(3, 'catid', '67', 'browse'),
	(3, 'catid', '67', 'input'),
	(3, 'catid', '67', 'view'),
	(3, 'catid', '69', 'browse'),
	(3, 'catid', '69', 'input'),
	(3, 'catid', '69', 'view'),
	(3, 'catid', '7', 'browse'),
	(3, 'catid', '7', 'input'),
	(3, 'catid', '7', 'view'),
	(3, 'catid', '72', 'browse'),
	(3, 'catid', '72', 'input'),
	(3, 'catid', '72', 'view'),
	(3, 'catid', '73', 'browse'),
	(3, 'catid', '73', 'input'),
	(3, 'catid', '73', 'view'),
	(3, 'catid', '74', 'browse'),
	(3, 'catid', '74', 'input'),
	(3, 'catid', '74', 'view'),
	(3, 'catid', '76', 'browse'),
	(3, 'catid', '76', 'input'),
	(3, 'catid', '76', 'view'),
	(3, 'catid', '77', 'browse'),
	(3, 'catid', '77', 'input'),
	(3, 'catid', '77', 'view'),
	(3, 'catid', '78', 'browse'),
	(3, 'catid', '78', 'input'),
	(3, 'catid', '78', 'view'),
	(3, 'catid', '79', 'browse'),
	(3, 'catid', '79', 'input'),
	(3, 'catid', '79', 'view'),
	(3, 'catid', '80', 'browse'),
	(3, 'catid', '80', 'input'),
	(3, 'catid', '80', 'view'),
	(3, 'catid', '81', 'browse'),
	(3, 'catid', '81', 'input'),
	(3, 'catid', '81', 'view'),
	(3, 'catid', '82', 'browse'),
	(3, 'catid', '82', 'input'),
	(3, 'catid', '82', 'view'),
	(4, 'catid', '1', 'browse'),
	(4, 'catid', '1', 'input'),
	(4, 'catid', '1', 'view'),
	(4, 'catid', '13', 'browse'),
	(4, 'catid', '13', 'input'),
	(4, 'catid', '13', 'view'),
	(4, 'catid', '14', 'browse'),
	(4, 'catid', '14', 'input'),
	(4, 'catid', '14', 'view'),
	(4, 'catid', '15', 'browse'),
	(4, 'catid', '15', 'input'),
	(4, 'catid', '15', 'view'),
	(4, 'catid', '16', 'browse'),
	(4, 'catid', '16', 'input'),
	(4, 'catid', '16', 'view'),
	(4, 'catid', '17', 'browse'),
	(4, 'catid', '17', 'input'),
	(4, 'catid', '17', 'view'),
	(4, 'catid', '19', 'browse'),
	(4, 'catid', '19', 'input'),
	(4, 'catid', '19', 'view'),
	(4, 'catid', '2', 'browse'),
	(4, 'catid', '2', 'input'),
	(4, 'catid', '2', 'view'),
	(4, 'catid', '29', 'browse'),
	(4, 'catid', '29', 'input'),
	(4, 'catid', '29', 'view'),
	(4, 'catid', '3', 'browse'),
	(4, 'catid', '3', 'input'),
	(4, 'catid', '3', 'view'),
	(4, 'catid', '30', 'browse'),
	(4, 'catid', '30', 'input'),
	(4, 'catid', '30', 'view'),
	(4, 'catid', '31', 'browse'),
	(4, 'catid', '31', 'input'),
	(4, 'catid', '31', 'view'),
	(4, 'catid', '32', 'browse'),
	(4, 'catid', '32', 'input'),
	(4, 'catid', '32', 'view'),
	(4, 'catid', '33', 'browse'),
	(4, 'catid', '33', 'input'),
	(4, 'catid', '33', 'view'),
	(4, 'catid', '34', 'browse'),
	(4, 'catid', '34', 'input'),
	(4, 'catid', '34', 'view'),
	(4, 'catid', '35', 'browse'),
	(4, 'catid', '35', 'input'),
	(4, 'catid', '35', 'view'),
	(4, 'catid', '36', 'browse'),
	(4, 'catid', '36', 'input'),
	(4, 'catid', '36', 'view'),
	(4, 'catid', '37', 'browse'),
	(4, 'catid', '37', 'input'),
	(4, 'catid', '37', 'view'),
	(4, 'catid', '39', 'browse'),
	(4, 'catid', '39', 'input'),
	(4, 'catid', '39', 'view'),
	(4, 'catid', '4', 'browse'),
	(4, 'catid', '4', 'input'),
	(4, 'catid', '4', 'view'),
	(4, 'catid', '40', 'browse'),
	(4, 'catid', '40', 'input'),
	(4, 'catid', '40', 'view'),
	(4, 'catid', '41', 'browse'),
	(4, 'catid', '41', 'input'),
	(4, 'catid', '41', 'view'),
	(4, 'catid', '42', 'browse'),
	(4, 'catid', '42', 'input'),
	(4, 'catid', '42', 'view'),
	(4, 'catid', '43', 'browse'),
	(4, 'catid', '43', 'input'),
	(4, 'catid', '43', 'view'),
	(4, 'catid', '44', 'browse'),
	(4, 'catid', '44', 'input'),
	(4, 'catid', '44', 'view'),
	(4, 'catid', '45', 'browse'),
	(4, 'catid', '45', 'input'),
	(4, 'catid', '45', 'view'),
	(4, 'catid', '46', 'browse'),
	(4, 'catid', '46', 'input'),
	(4, 'catid', '46', 'view'),
	(4, 'catid', '47', 'browse'),
	(4, 'catid', '47', 'input'),
	(4, 'catid', '47', 'view'),
	(4, 'catid', '48', 'browse'),
	(4, 'catid', '48', 'input'),
	(4, 'catid', '48', 'view'),
	(4, 'catid', '49', 'browse'),
	(4, 'catid', '49', 'input'),
	(4, 'catid', '49', 'view'),
	(4, 'catid', '5', 'browse'),
	(4, 'catid', '5', 'input'),
	(4, 'catid', '5', 'view'),
	(4, 'catid', '50', 'browse'),
	(4, 'catid', '50', 'input'),
	(4, 'catid', '50', 'view'),
	(4, 'catid', '51', 'browse'),
	(4, 'catid', '51', 'input'),
	(4, 'catid', '51', 'view'),
	(4, 'catid', '52', 'browse'),
	(4, 'catid', '52', 'input'),
	(4, 'catid', '52', 'view'),
	(4, 'catid', '53', 'browse'),
	(4, 'catid', '53', 'input'),
	(4, 'catid', '53', 'view'),
	(4, 'catid', '54', 'browse'),
	(4, 'catid', '54', 'input'),
	(4, 'catid', '54', 'view'),
	(4, 'catid', '6', 'browse'),
	(4, 'catid', '6', 'input'),
	(4, 'catid', '6', 'view'),
	(4, 'catid', '62', 'browse'),
	(4, 'catid', '62', 'input'),
	(4, 'catid', '62', 'view'),
	(4, 'catid', '63', 'browse'),
	(4, 'catid', '63', 'input'),
	(4, 'catid', '63', 'view'),
	(4, 'catid', '65', 'browse'),
	(4, 'catid', '65', 'input'),
	(4, 'catid', '65', 'view'),
	(4, 'catid', '67', 'browse'),
	(4, 'catid', '67', 'input'),
	(4, 'catid', '67', 'view'),
	(4, 'catid', '69', 'browse'),
	(4, 'catid', '69', 'input'),
	(4, 'catid', '69', 'view'),
	(4, 'catid', '7', 'browse'),
	(4, 'catid', '7', 'input'),
	(4, 'catid', '7', 'view'),
	(4, 'catid', '72', 'browse'),
	(4, 'catid', '72', 'input'),
	(4, 'catid', '72', 'view'),
	(4, 'catid', '73', 'browse'),
	(4, 'catid', '73', 'input'),
	(4, 'catid', '73', 'view'),
	(4, 'catid', '74', 'browse'),
	(4, 'catid', '74', 'input'),
	(4, 'catid', '74', 'view'),
	(4, 'catid', '76', 'browse'),
	(4, 'catid', '76', 'input'),
	(4, 'catid', '76', 'view'),
	(4, 'catid', '77', 'browse'),
	(4, 'catid', '77', 'input'),
	(4, 'catid', '77', 'view'),
	(4, 'catid', '78', 'browse'),
	(4, 'catid', '78', 'input'),
	(4, 'catid', '78', 'view'),
	(4, 'catid', '79', 'browse'),
	(4, 'catid', '79', 'input'),
	(4, 'catid', '79', 'view'),
	(4, 'catid', '80', 'browse'),
	(4, 'catid', '80', 'input'),
	(4, 'catid', '80', 'view'),
	(4, 'catid', '81', 'browse'),
	(4, 'catid', '81', 'input'),
	(4, 'catid', '81', 'view'),
	(4, 'catid', '82', 'browse'),
	(4, 'catid', '82', 'input'),
	(4, 'catid', '82', 'view'),
	(5, 'catid', '1', 'browse'),
	(5, 'catid', '1', 'input'),
	(5, 'catid', '1', 'view'),
	(5, 'catid', '13', 'browse'),
	(5, 'catid', '13', 'input'),
	(5, 'catid', '13', 'view'),
	(5, 'catid', '14', 'browse'),
	(5, 'catid', '14', 'input'),
	(5, 'catid', '14', 'view'),
	(5, 'catid', '15', 'browse'),
	(5, 'catid', '15', 'input'),
	(5, 'catid', '15', 'view'),
	(5, 'catid', '16', 'browse'),
	(5, 'catid', '16', 'input'),
	(5, 'catid', '16', 'view'),
	(5, 'catid', '17', 'browse'),
	(5, 'catid', '17', 'input'),
	(5, 'catid', '17', 'view'),
	(5, 'catid', '19', 'browse'),
	(5, 'catid', '19', 'input'),
	(5, 'catid', '19', 'view'),
	(5, 'catid', '2', 'browse'),
	(5, 'catid', '2', 'input'),
	(5, 'catid', '2', 'view'),
	(5, 'catid', '29', 'browse'),
	(5, 'catid', '29', 'input'),
	(5, 'catid', '29', 'view'),
	(5, 'catid', '3', 'browse'),
	(5, 'catid', '3', 'input'),
	(5, 'catid', '3', 'view'),
	(5, 'catid', '30', 'browse'),
	(5, 'catid', '30', 'input'),
	(5, 'catid', '30', 'view'),
	(5, 'catid', '31', 'browse'),
	(5, 'catid', '31', 'input'),
	(5, 'catid', '31', 'view'),
	(5, 'catid', '32', 'browse'),
	(5, 'catid', '32', 'input'),
	(5, 'catid', '32', 'view'),
	(5, 'catid', '33', 'browse'),
	(5, 'catid', '33', 'input'),
	(5, 'catid', '33', 'view'),
	(5, 'catid', '34', 'browse'),
	(5, 'catid', '34', 'input'),
	(5, 'catid', '34', 'view'),
	(5, 'catid', '35', 'browse'),
	(5, 'catid', '35', 'input'),
	(5, 'catid', '35', 'view'),
	(5, 'catid', '36', 'browse'),
	(5, 'catid', '36', 'input'),
	(5, 'catid', '36', 'view'),
	(5, 'catid', '37', 'browse'),
	(5, 'catid', '37', 'input'),
	(5, 'catid', '37', 'view'),
	(5, 'catid', '39', 'browse'),
	(5, 'catid', '39', 'input'),
	(5, 'catid', '39', 'view'),
	(5, 'catid', '4', 'browse'),
	(5, 'catid', '4', 'input'),
	(5, 'catid', '4', 'view'),
	(5, 'catid', '40', 'browse'),
	(5, 'catid', '40', 'input'),
	(5, 'catid', '40', 'view'),
	(5, 'catid', '41', 'browse'),
	(5, 'catid', '41', 'input'),
	(5, 'catid', '41', 'view'),
	(5, 'catid', '42', 'browse'),
	(5, 'catid', '42', 'input'),
	(5, 'catid', '42', 'view'),
	(5, 'catid', '43', 'browse'),
	(5, 'catid', '43', 'input'),
	(5, 'catid', '43', 'view'),
	(5, 'catid', '44', 'browse'),
	(5, 'catid', '44', 'input'),
	(5, 'catid', '44', 'view'),
	(5, 'catid', '45', 'browse'),
	(5, 'catid', '45', 'input'),
	(5, 'catid', '45', 'view'),
	(5, 'catid', '46', 'browse'),
	(5, 'catid', '46', 'input'),
	(5, 'catid', '46', 'view'),
	(5, 'catid', '47', 'browse'),
	(5, 'catid', '47', 'input'),
	(5, 'catid', '47', 'view'),
	(5, 'catid', '48', 'browse'),
	(5, 'catid', '48', 'input'),
	(5, 'catid', '48', 'view'),
	(5, 'catid', '49', 'browse'),
	(5, 'catid', '49', 'input'),
	(5, 'catid', '49', 'view'),
	(5, 'catid', '5', 'browse'),
	(5, 'catid', '5', 'input'),
	(5, 'catid', '5', 'view'),
	(5, 'catid', '50', 'browse'),
	(5, 'catid', '50', 'input'),
	(5, 'catid', '50', 'view'),
	(5, 'catid', '51', 'browse'),
	(5, 'catid', '51', 'input'),
	(5, 'catid', '51', 'view'),
	(5, 'catid', '52', 'browse'),
	(5, 'catid', '52', 'input'),
	(5, 'catid', '52', 'view'),
	(5, 'catid', '53', 'browse'),
	(5, 'catid', '53', 'input'),
	(5, 'catid', '53', 'view'),
	(5, 'catid', '54', 'browse'),
	(5, 'catid', '54', 'input'),
	(5, 'catid', '54', 'view'),
	(5, 'catid', '6', 'browse'),
	(5, 'catid', '6', 'input'),
	(5, 'catid', '6', 'view'),
	(5, 'catid', '62', 'browse'),
	(5, 'catid', '62', 'input'),
	(5, 'catid', '62', 'view'),
	(5, 'catid', '63', 'browse'),
	(5, 'catid', '63', 'input'),
	(5, 'catid', '63', 'view'),
	(5, 'catid', '65', 'browse'),
	(5, 'catid', '65', 'input'),
	(5, 'catid', '65', 'view'),
	(5, 'catid', '67', 'browse'),
	(5, 'catid', '67', 'input'),
	(5, 'catid', '67', 'view'),
	(5, 'catid', '69', 'browse'),
	(5, 'catid', '69', 'input'),
	(5, 'catid', '69', 'view'),
	(5, 'catid', '7', 'browse'),
	(5, 'catid', '7', 'input'),
	(5, 'catid', '7', 'view'),
	(5, 'catid', '72', 'browse'),
	(5, 'catid', '72', 'input'),
	(5, 'catid', '72', 'view'),
	(5, 'catid', '73', 'browse'),
	(5, 'catid', '73', 'input'),
	(5, 'catid', '73', 'view'),
	(5, 'catid', '74', 'browse'),
	(5, 'catid', '74', 'input'),
	(5, 'catid', '74', 'view'),
	(5, 'catid', '76', 'browse'),
	(5, 'catid', '76', 'input'),
	(5, 'catid', '76', 'view'),
	(5, 'catid', '77', 'browse'),
	(5, 'catid', '77', 'input'),
	(5, 'catid', '77', 'view'),
	(5, 'catid', '78', 'browse'),
	(5, 'catid', '78', 'input'),
	(5, 'catid', '78', 'view'),
	(5, 'catid', '79', 'browse'),
	(5, 'catid', '79', 'input'),
	(5, 'catid', '79', 'view'),
	(5, 'catid', '80', 'browse'),
	(5, 'catid', '80', 'input'),
	(5, 'catid', '80', 'view'),
	(5, 'catid', '81', 'browse'),
	(5, 'catid', '81', 'input'),
	(5, 'catid', '81', 'view'),
	(5, 'catid', '82', 'browse'),
	(5, 'catid', '82', 'input'),
	(5, 'catid', '82', 'view'),
	(6, 'catid', '1', 'browse'),
	(6, 'catid', '1', 'input'),
	(6, 'catid', '1', 'view'),
	(6, 'catid', '13', 'browse'),
	(6, 'catid', '13', 'input'),
	(6, 'catid', '13', 'view'),
	(6, 'catid', '14', 'browse'),
	(6, 'catid', '14', 'input'),
	(6, 'catid', '14', 'view'),
	(6, 'catid', '15', 'browse'),
	(6, 'catid', '15', 'input'),
	(6, 'catid', '15', 'view'),
	(6, 'catid', '16', 'browse'),
	(6, 'catid', '16', 'input'),
	(6, 'catid', '16', 'view'),
	(6, 'catid', '17', 'browse'),
	(6, 'catid', '17', 'input'),
	(6, 'catid', '17', 'view'),
	(6, 'catid', '19', 'browse'),
	(6, 'catid', '19', 'input'),
	(6, 'catid', '19', 'view'),
	(6, 'catid', '2', 'browse'),
	(6, 'catid', '2', 'input'),
	(6, 'catid', '2', 'view'),
	(6, 'catid', '29', 'browse'),
	(6, 'catid', '29', 'input'),
	(6, 'catid', '29', 'view'),
	(6, 'catid', '3', 'browse'),
	(6, 'catid', '3', 'input'),
	(6, 'catid', '3', 'view'),
	(6, 'catid', '30', 'browse'),
	(6, 'catid', '30', 'input'),
	(6, 'catid', '30', 'view'),
	(6, 'catid', '31', 'browse'),
	(6, 'catid', '31', 'input'),
	(6, 'catid', '31', 'view'),
	(6, 'catid', '32', 'browse'),
	(6, 'catid', '32', 'input'),
	(6, 'catid', '32', 'view'),
	(6, 'catid', '33', 'browse'),
	(6, 'catid', '33', 'input'),
	(6, 'catid', '33', 'view'),
	(6, 'catid', '34', 'browse'),
	(6, 'catid', '34', 'input'),
	(6, 'catid', '34', 'view'),
	(6, 'catid', '35', 'browse'),
	(6, 'catid', '35', 'input'),
	(6, 'catid', '35', 'view'),
	(6, 'catid', '36', 'browse'),
	(6, 'catid', '36', 'input'),
	(6, 'catid', '36', 'view'),
	(6, 'catid', '37', 'browse'),
	(6, 'catid', '37', 'input'),
	(6, 'catid', '37', 'view'),
	(6, 'catid', '39', 'browse'),
	(6, 'catid', '39', 'input'),
	(6, 'catid', '39', 'view'),
	(6, 'catid', '4', 'browse'),
	(6, 'catid', '4', 'input'),
	(6, 'catid', '4', 'view'),
	(6, 'catid', '40', 'browse'),
	(6, 'catid', '40', 'input'),
	(6, 'catid', '40', 'view'),
	(6, 'catid', '41', 'browse'),
	(6, 'catid', '41', 'input'),
	(6, 'catid', '41', 'view'),
	(6, 'catid', '42', 'browse'),
	(6, 'catid', '42', 'input'),
	(6, 'catid', '42', 'view'),
	(6, 'catid', '43', 'browse'),
	(6, 'catid', '43', 'input'),
	(6, 'catid', '43', 'view'),
	(6, 'catid', '44', 'browse'),
	(6, 'catid', '44', 'input'),
	(6, 'catid', '44', 'view'),
	(6, 'catid', '45', 'browse'),
	(6, 'catid', '45', 'input'),
	(6, 'catid', '45', 'view'),
	(6, 'catid', '46', 'browse'),
	(6, 'catid', '46', 'input'),
	(6, 'catid', '46', 'view'),
	(6, 'catid', '47', 'browse'),
	(6, 'catid', '47', 'input'),
	(6, 'catid', '47', 'view'),
	(6, 'catid', '48', 'browse'),
	(6, 'catid', '48', 'input'),
	(6, 'catid', '48', 'view'),
	(6, 'catid', '49', 'browse'),
	(6, 'catid', '49', 'input'),
	(6, 'catid', '49', 'view'),
	(6, 'catid', '5', 'browse'),
	(6, 'catid', '5', 'input'),
	(6, 'catid', '5', 'view'),
	(6, 'catid', '50', 'browse'),
	(6, 'catid', '50', 'input'),
	(6, 'catid', '50', 'view'),
	(6, 'catid', '51', 'browse'),
	(6, 'catid', '51', 'input'),
	(6, 'catid', '51', 'view'),
	(6, 'catid', '52', 'browse'),
	(6, 'catid', '52', 'input'),
	(6, 'catid', '52', 'view'),
	(6, 'catid', '53', 'browse'),
	(6, 'catid', '53', 'input'),
	(6, 'catid', '53', 'view'),
	(6, 'catid', '54', 'browse'),
	(6, 'catid', '54', 'input'),
	(6, 'catid', '54', 'view'),
	(6, 'catid', '6', 'browse'),
	(6, 'catid', '6', 'input'),
	(6, 'catid', '6', 'view'),
	(6, 'catid', '62', 'browse'),
	(6, 'catid', '62', 'input'),
	(6, 'catid', '62', 'view'),
	(6, 'catid', '63', 'browse'),
	(6, 'catid', '63', 'input'),
	(6, 'catid', '63', 'view'),
	(6, 'catid', '65', 'browse'),
	(6, 'catid', '65', 'input'),
	(6, 'catid', '65', 'view'),
	(6, 'catid', '67', 'browse'),
	(6, 'catid', '67', 'input'),
	(6, 'catid', '67', 'view'),
	(6, 'catid', '69', 'browse'),
	(6, 'catid', '69', 'input'),
	(6, 'catid', '69', 'view'),
	(6, 'catid', '7', 'browse'),
	(6, 'catid', '7', 'input'),
	(6, 'catid', '7', 'view'),
	(6, 'catid', '72', 'browse'),
	(6, 'catid', '72', 'input'),
	(6, 'catid', '72', 'view'),
	(6, 'catid', '73', 'browse'),
	(6, 'catid', '73', 'input'),
	(6, 'catid', '73', 'view'),
	(6, 'catid', '74', 'browse'),
	(6, 'catid', '74', 'input'),
	(6, 'catid', '74', 'view'),
	(6, 'catid', '76', 'browse'),
	(6, 'catid', '76', 'input'),
	(6, 'catid', '76', 'view'),
	(6, 'catid', '77', 'browse'),
	(6, 'catid', '77', 'input'),
	(6, 'catid', '77', 'view'),
	(6, 'catid', '78', 'browse'),
	(6, 'catid', '78', 'input'),
	(6, 'catid', '78', 'view'),
	(6, 'catid', '79', 'browse'),
	(6, 'catid', '79', 'input'),
	(6, 'catid', '79', 'view'),
	(6, 'catid', '80', 'browse'),
	(6, 'catid', '80', 'input'),
	(6, 'catid', '80', 'view'),
	(6, 'catid', '81', 'browse'),
	(6, 'catid', '81', 'input'),
	(6, 'catid', '81', 'view'),
	(6, 'catid', '82', 'browse'),
	(6, 'catid', '82', 'input'),
	(6, 'catid', '82', 'view');
/*!40000 ALTER TABLE `mg_member_group_priv` ENABLE KEYS */;


# Dumping structure for table mg_wlsm.mg_member_info
DROP TABLE IF EXISTS `mg_member_info`;
CREATE TABLE IF NOT EXISTS `mg_member_info` (
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `question` char(50) NOT NULL,
  `answer` char(32) NOT NULL,
  `avatar` int(10) unsigned NOT NULL DEFAULT '0',
  `regip` char(15) NOT NULL,
  `regtime` int(10) unsigned NOT NULL DEFAULT '0',
  `lastloginip` char(15) NOT NULL,
  `lastlogintime` int(10) unsigned NOT NULL DEFAULT '0',
  `logintimes` smallint(5) unsigned NOT NULL DEFAULT '0',
  `note` char(255) NOT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# Dumping data for table mg_wlsm.mg_member_info: 1 rows
DELETE FROM `mg_member_info`;
/*!40000 ALTER TABLE `mg_member_info` DISABLE KEYS */;
INSERT INTO `mg_member_info` (`userid`, `question`, `answer`, `avatar`, `regip`, `regtime`, `lastloginip`, `lastlogintime`, `logintimes`, `note`) VALUES
	(1, '', '', 0, '127.0.0.1', 1332600903, '127.0.0.1', 1332836694, 14, '');
/*!40000 ALTER TABLE `mg_member_info` ENABLE KEYS */;


# Dumping structure for table mg_wlsm.mg_menu
DROP TABLE IF EXISTS `mg_menu`;
CREATE TABLE IF NOT EXISTS `mg_menu` (
  `menuid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `parentid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` char(20) NOT NULL,
  `image` char(100) NOT NULL,
  `url` char(100) NOT NULL,
  `description` char(100) NOT NULL,
  `target` char(15) NOT NULL DEFAULT 'right',
  `style` char(15) NOT NULL,
  `js` char(100) NOT NULL,
  `groupids` char(60) NOT NULL,
  `roleids` char(60) NOT NULL,
  `isfolder` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isopen` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `keyid` char(30) NOT NULL,
  PRIMARY KEY (`menuid`),
  KEY `userid` (`userid`),
  KEY `keyid` (`keyid`),
  KEY `parentid` (`parentid`,`listorder`,`menuid`)
) ENGINE=MyISAM AUTO_INCREMENT=998 DEFAULT CHARSET=utf8;

# Dumping data for table mg_wlsm.mg_menu: 310 rows
DELETE FROM `mg_menu`;
/*!40000 ALTER TABLE `mg_menu` DISABLE KEYS */;
INSERT INTO `mg_menu` (`menuid`, `parentid`, `name`, `image`, `url`, `description`, `target`, `style`, `js`, `groupids`, `roleids`, `isfolder`, `isopen`, `listorder`, `userid`, `keyid`) VALUES
	(1, 0, '后台顶部菜单', '', '', '', '_self', '', '', '', '', 1, 0, 0, 0, ''),
	(20, 0, '会员中心', '', '', '', '_self', '', '', '', '', 1, 0, 0, 0, 'member_0'),
	(40, 0, '会员中心快捷菜单', '', '', '', '_self', '', '', '', '', 1, 0, 0, 0, 'member_1'),
	(2, 1, '我的面板', '', '', '', 'left', '', '', '', '', 1, 0, 0, 0, ''),
	(3, 1, '系统设置', '', '', '', 'left', '', '', '', '1,2', 1, 0, 0, 0, ''),
	(4, 1, '内容管理', '', '', '', 'left', '', '', '', '1,2,3', 1, 0, 0, 0, ''),
	(5, 1, '模块管理', '', '', '', 'left', '', '', '', '1,2,3,5', 1, 0, 0, 0, ''),
	(6, 1, '会员管理', '', '', '', 'left', '', '', '', '1,2,3', 1, 0, 0, 0, ''),
	(7, 1, '模板风格', '', '', '', 'left', '', '', '', '1,4', 1, 0, 0, 0, ''),
	(61, 4, '全部内容', '', '?mod=wslm&file=content_all', '', 'right', '', '', '', '', 0, 0, 0, 0, ''),
	(62, 4, '内容审核', '', '?mod=wslm&file=content_all&action=inspect', '', 'right', '', '', '', '', 0, 0, 0, 0, ''),
	(64, 4, '碎片管理', '', '?mod=wslm&file=block&action=list', '', 'right', '', '', '', '', 0, 0, 0, 0, ''),
	(65, 4, '推荐位管理', '', '?mod=wslm&file=position&action=list', '', 'right', '', '', '', '', 0, 0, 0, 0, ''),
	(99, 2, '常用操作', '', '', '', '_self', '', '', '', '', 1, 1, 0, 0, ''),
	(100, 2, '个人信息', '', '', '', '_self', '', '', '', '', 1, 1, 0, 0, ''),
	(917, 300, '新闻中心', '', '', '', 'right', '', '', '', '', 1, 0, 0, 0, 'catid_2'),
	(102, 100, '修改密码', '', 'member/editpwd.php', '', 'right', '', '', '', '', 0, 0, 0, 0, ''),
	(916, 300, '关于我们', '', '', '', 'right', '', '', '', '', 1, 0, 0, 0, 'catid_1'),
	(110, 99, '添加常用菜单', '', '?mod=wslm&file=menu&action=add&parentid=99&parentname=常用操作', '', 'right', '', '', '', '', 0, 0, 0, 0, ''),
	(111, 99, '管理常用菜单', '', '?mod=wslm&file=menu&action=manage&parentid=99&parentname=常用操作', '', 'right', '', '', '', '', 0, 0, 0, 0, ''),
	(112, 99, '后台首页', '', '?mod=wslm&file=index&action=main', '', 'right', '', '', '', '', 0, 0, 0, 0, ''),
	(113, 99, '更新首页', '', '?mod=wslm&file=html&action=index', '', 'right', '', '', '', '', 0, 0, 0, 1, ''),
	(114, 99, '更新缓存', '', '?mod=wslm&file=cache', '', 'right', '', '', '', '', 0, 0, 0, 1, ''),
	(115, 99, '添加栏目', '', '?mod=wslm&file=category&action=add', '', 'right', '', '', '', '', 0, 0, 0, 1, ''),
	(116, 99, '管理栏目', '', '?mod=wslm&file=category&action=manage', '', 'right', '', '', '', '', 0, 0, 0, 1, ''),
	(117, 99, '管理会员', '', '?mod=member&file=member&action=manage', '', 'right', '', '', '', '', 0, 0, 0, 1, ''),
	(118, 99, '添加管理员', '', '?mod=wslm&file=admin&action=add', '', 'right', '', '', '', '', 0, 0, 0, 1, ''),
	(600, 99, '添加地区', '', '?mod=wslm&file=area&action=add', '', 'right', '', '', '', '', 0, 0, 0, 1, ''),
	(601, 99, '管理内容模型', '', '?mod=wslm&file=model&action=manage', '', 'right', '', '', '', '', 0, 0, 0, 1, ''),
	(602, 99, '数据库备份', '', '?mod=wslm&file=database&action=export', '', 'right', '', '', '', '', 0, 0, 0, 1, ''),
	(603, 99, '网站配置', '', '?mod=wslm&file=setting&tab=0', '', 'right', '', '', '', '', 0, 0, 0, 1, ''),
	(120, 3, '栏目管理', '', '', '', '_self', '', '', '', '1,2', 1, 1, 0, 0, ''),
	(121, 120, '添加栏目', '', '?mod=wslm&file=category&action=add', '', 'right', '', '', '', '1,2', 0, 0, 0, 0, ''),
	(122, 120, '管理栏目', '', '?mod=wslm&file=category&action=manage', '', 'right', '', '', '', '1,2', 0, 0, 0, 0, ''),
	(123, 120, '合并栏目', '', '?mod=wslm&file=category&action=join', '', 'right', '', '', '', '1,2', 0, 0, 0, 0, ''),
	(124, 120, '更新栏目缓存', '', '?mod=wslm&file=category&action=updatecache', '', 'right', '', '', '', '1,2', 0, 0, 0, 0, ''),
	(125, 120, '修复栏目数据', '', '?mod=wslm&file=category&action=repair', '', 'right', '', '', '', '1,2', 0, 0, 0, 0, ''),
	(126, 120, '批量添加栏目', '', '?mod=wslm&file=category&action=more', '', 'right', '', '', '', '1,2', 0, 0, 0, 0, ''),
	(130, 3, '模型管理', '', '', '', '_self', '', '', '', '1', 1, 1, 0, 0, ''),
	(131, 130, '添加模型', '', '?mod=wslm&file=model&action=add', '', 'right', '', '', '', '1', 0, 0, 0, 0, ''),
	(132, 130, '管理模型', '', '?mod=wslm&file=model&action=manage', '', 'right', '', '', '', '1', 0, 0, 0, 0, ''),
	(133, 130, '导入模型', '', '?mod=wslm&file=model&action=import', '', 'right', '', '', '', '1', 0, 0, 0, 0, ''),
	(140, 3, '模块管理', '', '', '', '_self', '', '', '', '1', 1, 1, 0, 0, ''),
	(141, 140, '安装模块', '', '?mod=wslm&file=module&action=install', '', 'right', '', '', '', '1', 0, 0, 0, 0, ''),
	(142, 140, '管理模块', '', '?mod=wslm&file=module&action=manage', '', 'right', '', '', '', '1', 0, 0, 0, 0, ''),
	(143, 140, '新建模块', '', '?mod=wslm&file=module&action=add', '', 'right', '', '', '', '1', 0, 0, 0, 0, ''),
	(150, 3, '管理员设置', '', '', '', '_self', '', '', '', '1', 1, 0, 0, 0, ''),
	(151, 150, '添加管理员', '', '?mod=wslm&file=admin&action=add', '', 'right', '', '', '', '1', 0, 0, 0, 0, ''),
	(152, 150, '管理员列表', '', '?mod=wslm&file=admin&action=manage', '', 'right', '', '', '', '1', 0, 0, 0, 0, ''),
	(153, 150, '添加角色', '', '?mod=wslm&file=role&action=add', '', 'right', '', '', '', '1', 0, 0, 0, 0, ''),
	(154, 150, '管理角色', '', '?mod=wslm&file=role&action=manage', '', 'right', '', '', '', '1', 0, 0, 0, 0, ''),
	(160, 3, '数据库管理', '', '', '', '_self', '', '', '', '1', 1, 0, 0, 0, ''),
	(161, 160, '数据库备份', '', '?mod=wslm&file=database&action=export', '', 'right', '', '', '', '1', 0, 0, 0, 0, ''),
	(162, 160, '数据库恢复', '', '?mod=wslm&file=database&action=import', '', 'right', '', '', '', '1', 0, 0, 0, 0, ''),
	(163, 160, '数据库修复', '', '?mod=wslm&file=database&action=repair', '', 'right', '', '', '', '1', 0, 0, 0, 0, ''),
	(164, 160, '字符串替换', '', '?mod=wslm&file=database&action=replace', '', 'right', '', '', '', '1', 0, 0, 0, 0, ''),
	(165, 160, '执行SQL', '', '?mod=wslm&file=database&action=executesql', '', 'right', '', '', '', '1', 0, 0, 0, 0, ''),
	(166, 160, '数据库策略', '', '?mod=wslm&file=database&action=dbsolution', '', 'right', '', '', '', '1', 0, 0, 0, 0, ''),
	(170, 3, '相关设置', '', '', '', '_self', '', '', '', '', 1, 0, 0, 0, ''),
	(171, 170, '类别管理', '', '', '', 'right', '', '', '', '', 1, 0, 0, 0, ''),
	(500, 171, '添加类别', '', '?mod=wslm&file=type&action=add', '', 'right', '', '', '', '', 0, 0, 0, 0, ''),
	(501, 171, '管理类别', '', '?mod=wslm&file=type&action=manage', '', 'right', '', '', '', '', 0, 0, 0, 0, ''),
	(172, 170, '地区管理', '', '', '', 'right', '', '', '', '', 1, 0, 0, 0, ''),
	(505, 172, '添加地区', '', '?mod=wslm&file=area&action=add', '', 'right', '', '', '', '', 0, 0, 0, 0, ''),
	(506, 172, '管理地区', '', '?mod=wslm&file=area&action=manage', '', 'right', '', '', '', '', 0, 0, 0, 0, ''),
	(507, 172, '更新地区缓存', '', '?mod=wslm&file=area&action=updatecache', '', 'right', '', '', '', '', 0, 0, 0, 0, ''),
	(508, 172, '修复地区数据', '', '?mod=wslm&file=area&action=repair', '', 'right', '', '', '', '', 0, 0, 0, 0, ''),
	(173, 170, '菜单管理', '', '', '', 'right', '', '', '', '', 1, 0, 0, 0, ''),
	(510, 173, '添加菜单', '', '?mod=wslm&file=menu&action=add', '', 'right', '', '', '', '', 0, 0, 0, 0, ''),
	(511, 173, '管理菜单', '', '?mod=wslm&file=menu', '', 'right', '', '', '', '', 0, 0, 0, 0, ''),
	(174, 170, '推荐位管理', '', '', '', 'right', '', '', '', '', 1, 0, 0, 0, ''),
	(515, 174, '添加推荐位', '', '?mod=wslm&file=position&action=add', '', 'right', '', '', '', '', 0, 0, 0, 0, ''),
	(516, 174, '管理推荐位', '', '?mod=wslm&file=position&action=manage', '', 'right', '', '', '', '', 0, 0, 0, 0, ''),
	(175, 170, '关键词管理', '', '', '', 'right', '', '', '', '', 1, 0, 0, 0, ''),
	(520, 175, '添加关键词', '', '?mod=wslm&file=keyword&action=add', '', 'right', '', '', '', '', 0, 0, 0, 0, ''),
	(521, 175, '管理关键词', '', '?mod=wslm&file=keyword&action=manage', '', 'right', '', '', '', '', 0, 0, 0, 0, ''),
	(176, 170, '作者管理', '', '', '', 'right', '', '', '', '', 1, 0, 0, 0, ''),
	(525, 176, '添加作者', '', '?mod=wslm&file=author&action=add', '', 'right', '', '', '', '', 0, 0, 0, 0, ''),
	(526, 176, '管理作者', '', '?mod=wslm&file=author&action=manage', '', 'right', '', '', '', '', 0, 0, 0, 0, ''),
	(177, 170, '来源管理', '', '', '', 'right', '', '', '', '', 1, 0, 0, 0, ''),
	(530, 177, '添加来源', '', '?mod=wslm&file=copyfrom&action=add', '', 'right', '', '', '', '', 0, 0, 0, 0, ''),
	(531, 177, '管理来源', '', '?mod=wslm&file=copyfrom&action=manage', '', 'right', '', '', '', '', 0, 0, 0, 0, ''),
	(178, 170, '关联链接管理', '', '', '', 'right', '', '', '', '', 1, 0, 0, 0, ''),
	(535, 178, '添加关联链接', '', '?mod=wslm&file=keylink&action=add', '', 'right', '', '', '', '', 0, 0, 0, 0, ''),
	(536, 178, '管理关联链接', '', '?mod=wslm&file=keylink&action=manage', '', 'right', '', '', '', '', 0, 0, 0, 0, ''),
	(180, 170, '工作流管理', '', '', '', 'right', '', '', '', '', 1, 0, 0, 0, ''),
	(540, 180, '添加工作流方案', '', '?mod=wslm&file=workflow&action=add', '', 'right', '', '', '', '', 0, 0, 0, 0, ''),
	(541, 180, '管理工作流方案', '', '?mod=wslm&file=workflow', '', 'right', '', '', '', '', 0, 0, 0, 0, ''),
	(181, 170, '稿件状态管理', '', '', '', 'right', '', '', '', '', 1, 0, 0, 0, ''),
	(545, 181, '添加状态', '', '?mod=wslm&file=status&action=add', '', 'right', '', '', '', '', 0, 0, 0, 0, ''),
	(546, 181, '管理状态', '', '?mod=wslm&file=status', '', 'right', '', '', '', '', 0, 0, 0, 0, ''),
	(200, 170, '数据源管理', '', '', '', 'right', '', '', '', '', 1, 0, 0, 0, ''),
	(201, 200, '添加数据源', '', '?mod=wslm&file=datasource&action=add', '', 'right', '', '', '', '', 0, 0, 0, 0, ''),
	(202, 200, '管理数据源', '', '?mod=wslm&file=datasource&action=manage', '', 'right', '', '', '', '', 0, 0, 0, 0, ''),
	(205, 170, 'URL规则管理', '', '', '', 'right', '', '', '', '', 1, 0, 0, 0, ''),
	(206, 205, '添加URL规则', '', '?mod=wslm&file=urlrule&action=add', '', 'right', '', '', '', '', 0, 0, 0, 0, ''),
	(207, 205, '管理URL规则', '', '?mod=wslm&file=urlrule&action=manage', '', 'right', '', '', '', '', 0, 0, 0, 0, ''),
	(208, 170, '联动菜单管理', '', '?mod=wslm&file=linkage', '', 'right', '', '', '', '', 0, 0, 0, 0, ''),
	(210, 3, '系统工具', '', '', '', '_self', '', '', '', '', 1, 0, 0, 0, ''),
	(211, 210, '木马扫描', '', '', '', '_self', '', '', '', '', 1, 0, 0, 0, ''),
	(212, 211, '扫描木马', '', '?mod=wslm&file=safe', '', 'right', '', '', '', '', 0, 0, 0, 0, ''),
	(213, 211, '文件安全校验', '', '?mod=wslm&file=filecheck', '', 'right', '', '', '', '', 0, 0, 0, 0, ''),
	(214, 211, '创建文件校验镜像', '', '?mod=wslm&file=filecheck&action=make', '', 'right', '', '', '', '', 0, 0, 0, 0, ''),
	(215, 210, '外部数据导入', '', '', '', '_self', '', '', '', '', 1, 0, 0, 0, ''),
	(216, 215, '添加数据导入规则', '', '?mod=wslm&file=import&action=add', '', 'right', '', '', '', '', 0, 0, 0, 0, ''),
	(217, 215, '资讯数据导入', '', '?mod=wslm&file=import&action=manage&type=content', '', 'right', '', '', '', '', 0, 0, 0, 0, ''),
	(218, 215, '会员数据导入', '', '?mod=wslm&file=import&action=manage&type=member', '', 'right', '', '', '', '', 0, 0, 0, 0, ''),
	(219, 210, '更新缓存', '', '?mod=wslm&file=cache', '', 'right', '', '', '', '', 0, 0, 0, 0, ''),
	(220, 210, 'Baibu/Google地图', '', '?mod=wslm&file=googlemap', '', 'right', '', '', '', '', 0, 0, 0, 0, ''),
	(221, 210, '系统运行环境诊断', '', '?mod=wslm&file=system', '', 'right', '', '', '', '', 0, 0, 0, 0, ''),
	(222, 210, 'IP 禁止', '', '?mod=wslm&file=ipbanned', '', 'right', '', '', '', '', 0, 0, 0, 0, ''),
	(223, 210, '非法信息屏蔽日志', '', '?mod=wslm&file=filterword', '', 'right', '', '', '', '', 0, 0, 0, 0, ''),
	(224, 210, '后台操作日志', '', '?mod=wslm&file=log', '', 'right', '', '', '', '', 0, 0, 0, 0, ''),
	(225, 210, 'php 错误日志', '', '?mod=wslm&file=errorlog', '', 'right', '', '', '', '', 0, 0, 0, 0, ''),
	(226, 210, '文件管理器', '', '?mod=wslm&file=filemanager', '', 'right', '', '', '', '', 0, 0, 0, 0, ''),
	(227, 210, '网站地图', '', '?mod=wslm&file=sitemap', '', 'right', '', '', '', '', 0, 0, 0, 0, ''),
	(230, 210, '数据字典', '', '?mod=wslm&file=datadict', '', 'right', '', '', '', '', 0, 0, 0, 0, ''),
	(231, 210, '附件管理', '', '?mod=wslm&file=attachment&action=manage', '', 'right', '', '', '', '', 0, 0, 0, 0, ''),
	(232, 210, '播放器管理', '', '?mod=wslm&file=player&action=manage', '', 'right', '', '', '', '', 0, 0, 0, 0, ''),
	(233, 210, 'CNZZ站长统计', '', '?mod=wslm&file=wss', '', 'right', '', '', '', '', 0, 0, 0, 0, ''),
	(234, 210, 'CNZZ统计配置', '', '?mod=wslm&file=wss&action=setting', '', 'right', '', '', '', '', 0, 0, 0, 0, ''),
	(235, 210, '稿件统计', '', '?mod=wslm&file=statistics', '', 'right', '', '', '', '', 0, 0, 0, 0, ''),
	(236, 210, '栏目访问统计', '', '?mod=wslm&file=count', '', 'right', '', '', '', '', 0, 0, 0, 0, ''),
	(250, 3, '网站配置', '', '', '', '_self', '', '', '', '1', 1, 0, 0, 0, ''),
	(251, 250, '基本信息', '', '?mod=wslm&file=setting&tab=0', '', 'right', '', '', '', '1', 0, 0, 0, 0, ''),
	(252, 250, '网站设置', '', '?mod=wslm&file=setting&tab=1', '', 'right', '', '', '', '1', 0, 0, 0, 0, ''),
	(253, 250, '性能优化', '', '?mod=wslm&file=setting&tab=2', '', 'right', '', '', '', '1', 0, 0, 0, 0, ''),
	(254, 250, '安全设置', '', '?mod=wslm&file=setting&tab=3', '', 'right', '', '', '', '1', 0, 0, 0, 0, ''),
	(255, 250, '附件设置', '', '?mod=wslm&file=setting&tab=4', '', 'right', '', '', '', '1', 0, 0, 0, 0, ''),
	(256, 250, '邮件设置', '', '?mod=wslm&file=setting&tab=5', '', 'right', '', '', '', '1', 0, 0, 0, 0, ''),
	(257, 250, 'FTP设置', '', '?mod=wslm&file=setting&tab=6', '', 'right', '', '', '', '1', 0, 0, 0, 0, ''),
	(258, 250, '通行证', '', '?mod=wslm&file=setting&tab=7', '', 'right', '', '', '', '1', 0, 0, 0, 0, ''),
	(259, 250, '扩展设置', '', '?mod=wslm&file=setting&tab=8', '', 'right', '', '', '', '1', 0, 0, 0, 0, ''),
	(300, 4, '内容发布管理', '', '', '', '_self', '', '', '', '', 1, 0, 0, 0, 'catid_0'),
	(319, 4, '生成HTML', '', '', '', '_self', '', '', '', '', 1, 0, 0, 0, ''),
	(320, 319, '更新首页', '', '?mod=wslm&file=html&action=index', '', 'right', '', '', '', '', 0, 0, 0, 0, ''),
	(321, 319, '更新栏目页', '', '?mod=wslm&file=html&action=category', '', 'right', '', '', '', '', 0, 0, 0, 0, ''),
	(918, 300, '服务管理', '', '', '', 'right', '', '', '', '', 1, 0, 0, 0, 'catid_3'),
	(324, 319, '更新内容页', '', '?mod=wslm&file=html&action=show', '', 'right', '', '', '', '', 0, 0, 0, 0, ''),
	(325, 319, '更新URL', '', '?mod=wslm&file=url', '', 'right', '', '', '', '', 0, 0, 0, 0, ''),
	(326, 319, '更新全站索引', '', '?mod=wslm&file=category&action=update_search', '', 'right', '', '', '', '', 0, 0, 0, 0, ''),
	(350, 7, '模板方案', '', '?mod=wslm&file=templateproject&action=manage', '', 'right', '', '', '', '', 0, 0, 0, 0, ''),
	(351, 7, '风格方案', '', '?mod=wslm&file=skin&action=manage', '', 'right', '', '', '', '', 0, 0, 0, 0, ''),
	(352, 7, '碎片管理', '', '?mod=wslm&file=block', '', 'right', '', '', '', '', 0, 0, 0, 0, ''),
	(353, 7, '更新模板缓存', '', '?mod=wslm&file=template&action=cache', '', 'right', '', '', '', '', 0, 0, 0, 0, ''),
	(360, 7, 'Wslm', '', '', '', '_self', '', '', '', '', 1, 1, 0, 0, ''),
	(361, 360, '新建模板', '', '?mod=wslm&file=template&action=add', '', 'right', '', '', '', '', 0, 0, 0, 0, ''),
	(362, 360, '管理模板', '', '?mod=wslm&file=template&action=manage&module=wslm', '', 'right', '', '', '', '', 0, 0, 0, 0, ''),
	(363, 360, '添加内容标签', '', '?mod=wslm&file=tag&action=add&module=wslm&type=content', '', 'right', '', '', '', '', 0, 0, 0, 0, ''),
	(364, 360, '管理内容标签', '', '?mod=wslm&file=tag&action=manage&module=wslm&type=content', '', 'right', '', '', '', '', 0, 0, 0, 0, ''),
	(365, 360, '添加栏目标签', '', '?mod=wslm&file=tag&action=add&type=category', '', 'right', '', '', '', '', 0, 0, 0, 0, ''),
	(366, 360, '管理栏目标签', '', '?mod=wslm&file=tag&action=manage&type=category', '', 'right', '', '', '', '', 0, 0, 0, 0, ''),
	(604, 6, '会员管理', '', '', '', '_self', '', '', '', '', 1, 1, 0, 0, 'member'),
	(605, 604, '添加会员', '', '?mod=member&file=member&action=add', '', 'right', '', '', '', '', 0, 0, 0, 0, 'member'),
	(606, 604, '审核会员', '', '?mod=member&file=member&action=check', '', 'right', '', '', '', '', 0, 0, 0, 0, 'member'),
	(607, 604, '管理会员', '', '?mod=member&file=member&action=manage', '', 'right', '', '', '', '', 0, 0, 0, 0, 'member'),
	(608, 604, '管理扩展组会员', '', '?mod=member&file=extend&action=manage', '', 'right', '', '', '', '', 0, 0, 0, 0, 'member'),
	(609, 604, '搜索会员', '', '?mod=member&file=member&action=search', '', 'right', '', '', '', '', 0, 0, 0, 0, 'member'),
	(610, 604, '模块配置', '', '?mod=member&file=setting', '', 'right', '', '', '', '', 0, 0, 0, 0, 'member'),
	(611, 604, '权限设置', '', '?mod=member&file=priv', '', 'right', '', '', '', '', 0, 0, 0, 0, 'member'),
	(612, 6, '会员组管理', '', '', '', '_self', '', '', '', '', 1, 1, 0, 0, 'member'),
	(613, 612, '添加会员组', '', '?mod=member&file=group&action=add', '', 'right', '', '', '', '', 0, 0, 0, 0, 'member'),
	(614, 612, '管理会员组', '', '?mod=member&file=group&action=manage', '', 'right', '', '', '', '', 0, 0, 0, 0, 'member'),
	(615, 6, '会员模型管理', '', '', '', '_self', '', '', '', '', 1, 1, 0, 0, 'member'),
	(616, 615, '添加会员模型', '', '?mod=member&file=member_model&action=add', '', 'right', '', '', '', '', 0, 0, 0, 0, 'member'),
	(617, 615, '管理会员模型', '', '?mod=member&file=member_model&action=manage', '', 'right', '', '', '', '', 0, 0, 0, 0, 'member'),
	(618, 615, '导入会员模型', '', '?mod=member&file=member_model&action=import', '', 'right', '', '', '', '', 0, 0, 0, 0, 'member'),
	(619, 7, '会员', '', '', '', '_self', '', '', '', '', 1, 0, 0, 0, 'member'),
	(620, 619, '新建模板', '', '?mod=wslm&file=template&action=add&module=member', '', 'right', '', '', '', '', 0, 0, 0, 0, 'member'),
	(621, 619, '管理模板', '', '?mod=wslm&file=template&action=manage&module=member', '', 'right', '', '', '', '', 0, 0, 0, 0, 'member'),
	(622, 619, '添加会员标签', '', '?mod=member&file=tag&action=add&module=member', '', 'right', '', '', '', '', 0, 0, 0, 0, 'member'),
	(623, 619, '管理会员标签', 'member', '?mod=member&file=tag&action=manage&module=member', '', 'right', '', '', '', '', 0, 0, 0, 0, ''),
	(624, 20, '首页', '', '', '', 'right', '', '', '', '', 0, 0, 0, 0, 'member'),
	(625, 20, '会员中心', '', 'member/index.php', '', 'right', '', '', '', '', 0, 0, 0, 0, 'member'),
	(626, 20, '信息管理', '', 'manage.php', '', 'right', '', '', '', '', 0, 0, 0, 0, 'member'),
	(683, 5, '友情链接', '', '', '', '_self', '', '', '', '', 1, 0, 0, 0, 'link'),
	(684, 683, '添加友情链接', '', '?mod=link&file=link&action=add', '', 'right', '', '', '', '', 0, 0, 0, 0, 'link'),
	(685, 683, '管理友情链接', '', '?mod=link&file=link&action=manage&passed=1', '', 'right', '', '', '', '', 0, 0, 0, 0, 'link'),
	(686, 683, '添加分类', '', '?mod=link&file=type&action=add', '', 'right', '', '', '', '', 0, 0, 0, 0, 'link'),
	(687, 683, '管理分类', '', '?mod=link&file=type&action=manage', '', 'right', '', '', '', '', 0, 0, 0, 0, 'link'),
	(688, 683, '模块配置', '', '?mod=link&file=setting', '', 'right', '', '', '', '', 0, 0, 0, 0, 'link'),
	(689, 683, '权限设置', '', '?mod=link&file=priv', '', 'right', '', '', '', '', 0, 0, 0, 0, 'link'),
	(690, 7, '友情链接', '', '', '', '_self', '', '', '', '', 1, 0, 0, 0, 'link'),
	(691, 690, '新建模板', '', '?mod=wslm&file=template&action=add&module=link', '', 'right', '', '', '', '', 0, 0, 0, 0, 'link'),
	(692, 690, '管理模板', '', '?mod=wslm&file=template&action=manage&module=link', '', 'right', '', '', '', '', 0, 0, 0, 0, 'link'),
	(693, 690, '添加标签', '', '?mod=link&file=tag&action=add', '', 'right', '', '', '', '', 0, 0, 0, 0, 'link'),
	(694, 690, '管理标签', '', '?mod=link&file=tag', '', 'right', '', '', '', '', 0, 0, 0, 0, 'link'),
	(958, 920, '日用家居', '', '?mod=wslm&file=content&action=manage&catid=43', '', 'right', '', '', '', '', 0, 0, 0, 0, 'catid_43'),
	(957, 920, '包', '', '?mod=wslm&file=content&action=manage&catid=42', '', 'right', '', '', '', '', 0, 0, 0, 0, 'catid_42'),
	(956, 920, '兵器', '', '?mod=wslm&file=content&action=manage&catid=41', '', 'right', '', '', '', '', 0, 0, 0, 0, 'catid_41'),
	(955, 920, 'COS道具', '', '?mod=wslm&file=content&action=manage&catid=40', '', 'right', '', '', '', '', 0, 0, 0, 0, 'catid_40'),
	(954, 920, '公仔', '', '?mod=wslm&file=content&action=manage&catid=39', '', 'right', '', '', '', '', 0, 0, 0, 0, 'catid_39'),
	(953, 920, '饰品', '', '?mod=wslm&file=content&action=manage&catid=38', '', 'right', '', '', '', '', 0, 0, 0, 0, 'catid_38'),
	(710, 5, '邮件订阅', '', '', '', '_self', '', '', '', '', 1, 0, 0, 0, 'mail'),
	(711, 710, '群发期刊', '', '?mod=mail&file=subscription&action=send', '', 'right', '', '', '', '', 0, 0, 3, 0, ''),
	(712, 710, '添加期刊', '', '?mod=mail&file=subscription&action=add', '', 'right', '', '', '', '', 0, 0, 4, 0, ''),
	(713, 710, '管理期刊', '', '?mod=mail&file=subscription&action=list', '', 'right', '', '', '', '', 0, 0, 5, 0, ''),
	(714, 710, '管理订阅邮箱', '', '?mod=mail&file=email&action=list', '', 'right', '', '', '', '', 0, 0, 2, 0, ''),
	(715, 710, '管理订阅分类', '', '?mod=mail&file=type', '', 'right', '', '', '', '', 0, 0, 6, 0, ''),
	(716, 710, '发送邮件', '', '?mod=mail&file=send', '', 'right', '', '', '', '', 0, 0, 1, 0, ''),
	(717, 710, '管理邮件列表', '', '?mod=mail&file=maillist&action=list', '', 'right', '', '', '', '', 0, 0, 8, 0, ''),
	(718, 710, '获取邮箱列表', '', '?mod=mail&file=importmail&action=choice', '', 'right', '', '', '', '', 0, 0, 9, 0, ''),
	(719, 710, '邮件配置', '', '?mod=wslm&file=setting&tab=5', '', 'right', '', '', '', '', 0, 0, 10, 0, ''),
	(720, 710, '模块配置', '', '?mod=mail&file=setting', '', 'right', '', '', '', '', 0, 0, 11, 0, ''),
	(721, 710, '权限设置', '', '?mod=mail&file=priv', '', 'right', '', '', '', '', 0, 0, 12, 0, ''),
	(722, 710, '添加订阅类别', '', '?mod=mail&file=type&action=add', '', 'right', '', '', '', '', 0, 0, 7, 0, ''),
	(723, 40, '邮件订阅', '', 'mail/', '', '', '', '', '', '', 0, 0, 0, 0, 'mail'),
	(724, 20, '邮件订阅', '', 'mail/', '', '', '', '', '', '', 0, 0, 0, 0, 'mail'),
	(725, 7, '邮件订阅', '', '', '', '_self', '', '', '', '', 1, 0, 0, 0, 'member'),
	(726, 725, '新建模板', '', '?mod=wslm&file=template&action=add&module=mail', '', 'right', '', '', '', '', 0, 0, 0, 0, 'member'),
	(727, 725, '管理模板', '', '?mod=wslm&file=template&action=manage&module=mail', '', 'right', '', '', '', '', 0, 0, 0, 0, 'member'),
	(728, 5, '留言板', '', '', '', '_self', '', '', '', '', 1, 0, 0, 0, 'guestbook'),
	(729, 728, '管理留言板', '', '?mod=guestbook&file=guestbook&action=manage', '', 'right', '', '', '', '', 0, 0, 0, 0, 'guestbook'),
	(730, 728, '模块配置', '', '?mod=guestbook&file=setting', '', 'right', '', '', '', '', 0, 0, 0, 0, 'guestbook'),
	(731, 728, '权限设置', '', '?mod=guestbook&file=priv', '', 'right', '', '', '', '', 0, 0, 0, 0, 'guestbook'),
	(732, 7, '留言板', '', '', '', '_self', '', '', '', '', 1, 0, 0, 0, 'guestbook'),
	(733, 732, '新建模板', '', '?mod=wslm&file=template&action=add&module=guestbook', '', 'right', '', '', '', '', 0, 0, 0, 0, 'guestbook'),
	(734, 732, '管理模板', '', '?mod=wslm&file=template&action=manage&module=guestbook', '', 'right', '', '', '', '', 0, 0, 0, 0, 'guestbook'),
	(735, 732, '添加标签', '', '?mod=guestbook&file=tag&action=add', '', 'right', '', '', '', '', 0, 0, 0, 0, 'guestbook'),
	(736, 732, '管理标签', '', '?mod=guestbook&file=tag&action=manage', '', 'right', '', '', '', '', 0, 0, 0, 0, 'guestbook'),
	(779, 5, '全站搜索', '', '', '', '_self', '', '', '', '', 1, 0, 0, 0, 'search'),
	(780, 779, '重建索引', '', '?mod=search&file=search&action=createindex', '', 'right', '', '', '', '', 0, 0, 0, 0, 'search'),
	(781, 779, '添加分类', '', '?mod=search&file=type&action=add', '', 'right', '', '', '', '', 0, 0, 0, 0, 'search'),
	(782, 779, '管理分类', '', '?mod=search&file=type&action=manage', '', 'right', '', '', '', '', 0, 0, 0, 0, 'search'),
	(783, 779, '模块配置', '', '?mod=search&file=setting', '', 'right', '', '', '', '', 0, 0, 0, 0, 'search'),
	(784, 7, '全站搜索', '', '', '', '_self', '', '', '', '', 1, 0, 0, 0, 'search'),
	(785, 784, '新建模板', '', '?mod=wslm&file=template&action=add&module=search', '', 'right', '', '', '', '', 0, 0, 0, 0, 'search'),
	(786, 784, '管理模板', '', '?mod=wslm&file=template&action=manage&module=search', '', 'right', '', '', '', '', 0, 0, 0, 0, 'search'),
	(943, 918, '运营流程', '', '?mod=wslm&file=content&action=manage&catid=28', '', 'right', '', '', '', '', 0, 0, 0, 0, 'catid_28'),
	(942, 934, '动漫终端营销策划', '', '?mod=wslm&file=content&action=manage&catid=27', '', 'right', '', '', '', '', 0, 0, 0, 0, 'catid_27'),
	(941, 934, '动漫终端设计策划', '', '?mod=wslm&file=content&action=manage&catid=26', '', 'right', '', '', '', '', 0, 0, 0, 0, 'catid_26'),
	(940, 934, '动漫展会活动策划', '', '?mod=wslm&file=content&action=manage&catid=25', '', 'right', '', '', '', '', 0, 0, 0, 0, 'catid_25'),
	(939, 934, '动漫网络营销策划', '', '?mod=wslm&file=content&action=manage&catid=24', '', 'right', '', '', '', '', 0, 0, 0, 0, 'catid_24'),
	(938, 934, '动漫推广策划', '', '?mod=wslm&file=content&action=manage&catid=23', '', 'right', '', '', '', '', 0, 0, 0, 0, 'catid_23'),
	(937, 934, '动漫渠道建设策划', '', '?mod=wslm&file=content&action=manage&catid=22', '', 'right', '', '', '', '', 0, 0, 0, 0, 'catid_22'),
	(936, 934, '动漫产品形象策划', '', '?mod=wslm&file=content&action=manage&catid=21', '', 'right', '', '', '', '', 0, 0, 0, 0, 'catid_21'),
	(935, 934, '动漫COSPLAY策划', '', '?mod=wslm&file=content&action=manage&catid=20', '', 'right', '', '', '', '', 0, 0, 0, 0, 'catid_20'),
	(934, 918, '服务范围', '', '', '', 'right', '', '', '', '', 1, 0, 0, 0, 'catid_19'),
	(933, 918, '服务理念', '', '?mod=wslm&file=content&action=manage&catid=18', '', 'right', '', '', '', '', 0, 0, 0, 0, 'catid_18'),
	(952, 920, '模型', '', '', '', 'right', '', '', '', '', 1, 0, 0, 0, 'catid_37'),
	(951, 919, 'TOP动漫展示', '', '?mod=wslm&file=content&action=manage&catid=36', '', 'right', '', '', '', '', 0, 0, 0, 0, 'catid_36'),
	(950, 919, '桌游文化', '', '?mod=wslm&file=content&action=manage&catid=35', '', 'right', '', '', '', '', 0, 0, 0, 0, 'catid_35'),
	(949, 919, '模型文化', '', '?mod=wslm&file=content&action=manage&catid=34', '', 'right', '', '', '', '', 0, 0, 0, 0, 'catid_34'),
	(948, 919, 'Cosplay文化', '', '?mod=wslm&file=content&action=manage&catid=33', '', 'right', '', '', '', '', 0, 0, 0, 0, 'catid_33'),
	(947, 919, '欧美动漫文化', '', '?mod=wslm&file=content&action=manage&catid=32', '', 'right', '', '', '', '', 0, 0, 0, 0, 'catid_32'),
	(946, 919, '日本动漫文化', '', '?mod=wslm&file=content&action=manage&catid=31', '', 'right', '', '', '', '', 0, 0, 0, 0, 'catid_31'),
	(945, 919, '国产动漫文化', '', '?mod=wslm&file=content&action=manage&catid=30', '', 'right', '', '', '', '', 0, 0, 0, 0, 'catid_30'),
	(944, 919, '动漫常识', '', '?mod=wslm&file=content&action=manage&catid=29', '', 'right', '', '', '', '', 0, 0, 0, 0, 'catid_29'),
	(808, 5, '表单向导', '', '', '', '_self', '', '', '', '', 1, 0, 0, 0, 'formguide'),
	(809, 808, '添加表单', '', '?mod=formguide&file=manage&action=add', '', 'right', '', '', '', '', 0, 0, 0, 0, 'formguide'),
	(810, 808, '管理表单', '', '?mod=formguide&file=manage&action=manage', '', 'right', '', '', '', '', 0, 0, 0, 0, 'formguide'),
	(811, 808, '模块设置', '', '?mod=formguide&file=setting', '', 'right', '', '', '', '', 0, 0, 0, 0, 'formguide'),
	(812, 808, '权限设置', '', '?mod=formguide&file=priv', '', 'right', '', '', '', '', 0, 0, 0, 0, 'formguide'),
	(813, 7, '表单向导', '', '', '', '_self', '', '', '', '', 1, 0, 0, 0, 'formguide'),
	(814, 813, '新建模板', '', '?mod=wslm&file=template&action=add&module=formguide', '', 'right', '', '', '', '', 0, 0, 0, 0, 'formguide'),
	(815, 813, '管理模板', '', '?mod=wslm&file=template&action=manage&module=formguide', '', 'right', '', '', '', '', 0, 0, 0, 0, 'formguide'),
	(816, 40, '我的简历', '', 'yp/apply.php', '', '_self', '', '', '', '', 0, 0, 0, 0, ''),
	(989, 977, '首页12', '', '?mod=wslm&file=content&action=manage&catid=75', '', 'right', '', '', '', '', 0, 0, 0, 0, 'catid_75'),
	(988, 977, '首页11', '', '?mod=wslm&file=content&action=manage&catid=74', '', 'right', '', '', '', '', 0, 0, 0, 0, 'catid_74'),
	(987, 977, '首页10', '', '?mod=wslm&file=content&action=manage&catid=73', '', 'right', '', '', '', '', 0, 0, 0, 0, 'catid_73'),
	(986, 977, '首页09', '', '?mod=wslm&file=content&action=manage&catid=72', '', 'right', '', '', '', '', 0, 0, 0, 0, 'catid_72'),
	(985, 977, '首页08', '', '?mod=wslm&file=content&action=manage&catid=71', '', 'right', '', '', '', '', 0, 0, 0, 0, 'catid_71'),
	(984, 977, '首页07', '', '?mod=wslm&file=content&action=manage&catid=70', '', 'right', '', '', '', '', 0, 0, 0, 0, 'catid_70'),
	(983, 977, '首页06', '', '?mod=wslm&file=content&action=manage&catid=69', '', 'right', '', '', '', '', 0, 0, 0, 0, 'catid_69'),
	(982, 977, '首页05', '', '?mod=wslm&file=content&action=manage&catid=68', '', 'right', '', '', '', '', 0, 0, 0, 0, 'catid_68'),
	(981, 977, '首页04', '', '?mod=wslm&file=content&action=manage&catid=67', '', 'right', '', '', '', '', 0, 0, 0, 0, 'catid_67'),
	(980, 977, '首页03', '', '?mod=wslm&file=content&action=manage&catid=66', '', 'right', '', '', '', '', 0, 0, 0, 0, 'catid_66'),
	(979, 977, '首页02', '', '?mod=wslm&file=content&action=manage&catid=65', '', 'right', '', '', '', '', 0, 0, 0, 0, 'catid_65'),
	(978, 977, '首页01', '', '?mod=wslm&file=content&action=manage&catid=64', '', 'right', '', '', '', '', 0, 0, 0, 0, 'catid_64'),
	(977, 976, '首页十二幅', '', '', '', 'right', '', '', '', '', 1, 0, 0, 0, 'catid_63'),
	(976, 300, '其他管理', '', '', '', 'right', '', '', '', '', 1, 0, 0, 0, 'catid_62'),
	(975, 923, '在线留言', '', '?mod=wslm&file=content&action=manage&catid=61', '', 'right', '', '', '', '', 0, 0, 0, 0, 'catid_61'),
	(974, 923, '联系方式', '', '?mod=wslm&file=content&action=manage&catid=60', '', 'right', '', '', '', '', 0, 0, 0, 0, 'catid_60'),
	(973, 922, '营销支持', '', '?mod=wslm&file=content&action=manage&catid=58', '', 'right', '', '', '', '', 0, 0, 0, 0, 'catid_58'),
	(972, 922, '合作政策', '', '?mod=wslm&file=content&action=manage&catid=57', '', 'right', '', '', '', '', 0, 0, 0, 0, 'catid_57'),
	(971, 922, '顾问流程', '', '?mod=wslm&file=content&action=manage&catid=56', '', 'right', '', '', '', '', 0, 0, 0, 0, 'catid_56'),
	(970, 922, '投资分析', '', '?mod=wslm&file=content&action=manage&catid=55', '', 'right', '', '', '', '', 0, 0, 0, 0, 'catid_55'),
	(969, 921, '桌游吧', '', '?mod=wslm&file=content&action=manage&catid=54', '', 'right', '', '', '', '', 0, 0, 0, 0, 'catid_54'),
	(968, 921, '婴幼店', '', '?mod=wslm&file=content&action=manage&catid=53', '', 'right', '', '', '', '', 0, 0, 0, 0, 'catid_53'),
	(967, 921, '玩具店', '', '?mod=wslm&file=content&action=manage&catid=52', '', 'right', '', '', '', '', 0, 0, 0, 0, 'catid_52'),
	(966, 921, '动漫店', '', '?mod=wslm&file=content&action=manage&catid=51', '', 'right', '', '', '', '', 0, 0, 0, 0, 'catid_51'),
	(965, 920, '其他', '', '?mod=wslm&file=content&action=manage&catid=50', '', 'right', '', '', '', '', 0, 0, 0, 0, 'catid_50'),
	(964, 920, '热门产品', '', '?mod=wslm&file=content&action=manage&catid=49', '', 'right', '', '', '', '', 0, 0, 0, 0, 'catid_49'),
	(963, 920, '最新产品', '', '?mod=wslm&file=content&action=manage&catid=48', '', 'right', '', '', '', '', 0, 0, 0, 0, 'catid_48'),
	(962, 920, '毛绒', '', '?mod=wslm&file=content&action=manage&catid=47', '', 'right', '', '', '', '', 0, 0, 0, 0, 'catid_47'),
	(961, 920, '数码', '', '?mod=wslm&file=content&action=manage&catid=46', '', 'right', '', '', '', '', 0, 0, 0, 0, 'catid_46'),
	(960, 920, '桌游', '', '?mod=wslm&file=content&action=manage&catid=45', '', 'right', '', '', '', '', 0, 0, 0, 0, 'catid_45'),
	(959, 920, '文体用品', '', '?mod=wslm&file=content&action=manage&catid=44', '', 'right', '', '', '', '', 0, 0, 0, 0, 'catid_44'),
	(932, 917, '行业资讯', '', '?mod=wslm&file=content&action=manage&catid=17', '', 'right', '', '', '', '', 0, 0, 0, 0, 'catid_17'),
	(931, 917, '企业新闻', '', '?mod=wslm&file=content&action=manage&catid=16', '', 'right', '', '', '', '', 0, 0, 0, 0, 'catid_16'),
	(930, 917, '网站公告', '', '?mod=wslm&file=content&action=manage&catid=15', '', 'right', '', '', '', '', 0, 0, 0, 0, 'catid_15'),
	(929, 916, '合作伙伴', '', '?mod=wslm&file=content&action=manage&catid=14', '', 'right', '', '', '', '', 0, 0, 0, 0, 'catid_14'),
	(928, 916, '企业团队', '', '?mod=wslm&file=content&action=manage&catid=13', '', 'right', '', '', '', '', 0, 0, 0, 0, 'catid_13'),
	(927, 916, '组织架构', '', '?mod=wslm&file=content&action=manage&catid=12', '', 'right', '', '', '', '', 0, 0, 0, 0, 'catid_12'),
	(926, 916, '资质荣誉', '', '?mod=wslm&file=content&action=manage&catid=11', '', 'right', '', '', '', '', 0, 0, 0, 0, 'catid_11'),
	(925, 916, '企业文化', '', '?mod=wslm&file=content&action=manage&catid=10', '', 'right', '', '', '', '', 0, 0, 0, 0, 'catid_10'),
	(924, 916, '企业简介', '', '?mod=wslm&file=content&action=manage&catid=9', '', 'right', '', '', '', '', 0, 0, 0, 0, 'catid_9'),
	(923, 300, '联系我们', '', '', '', 'right', '', '', '', '', 1, 0, 0, 0, 'catid_8'),
	(922, 300, '投资合作', '', '', '', 'right', '', '', '', '', 1, 0, 0, 0, 'catid_7'),
	(921, 300, '成功案例', '', '', '', 'right', '', '', '', '', 1, 0, 0, 0, 'catid_6'),
	(920, 300, '产品展示', '', '', '', 'right', '', '', '', '', 1, 0, 0, 0, 'catid_5'),
	(919, 300, '动漫文化', '', '', '', 'right', '', '', '', '', 1, 0, 0, 0, 'catid_4'),
	(990, 976, '首页策划图片', '', '?mod=wslm&file=content&action=manage&catid=76', '', 'right', '', '', '', '', 0, 0, 0, 0, 'catid_76'),
	(991, 976, '产品栏目页滑动门', '', '?mod=wslm&file=content&action=manage&catid=77', '', 'right', '', '', '', '', 0, 0, 0, 0, 'catid_77'),
	(992, 952, '飞机', '', '?mod=wslm&file=content&action=manage&catid=78', '', 'right', '', '', '', '', 0, 0, 0, 0, 'catid_78'),
	(993, 952, '轮船', '', '?mod=wslm&file=content&action=manage&catid=79', '', 'right', '', '', '', '', 0, 0, 0, 0, 'catid_79'),
	(994, 952, '汽车', '', '?mod=wslm&file=content&action=manage&catid=80', '', 'right', '', '', '', '', 0, 0, 0, 0, 'catid_80'),
	(995, 952, '人模', '', '?mod=wslm&file=content&action=manage&catid=81', '', 'right', '', '', '', '', 0, 0, 0, 0, 'catid_81'),
	(996, 952, '圣斗士', '', '?mod=wslm&file=content&action=manage&catid=82', '', 'right', '', '', '', '', 0, 0, 0, 0, 'catid_82'),
	(997, 922, '常见问题', '', '?mod=wslm&file=content&action=manage&catid=83', '', 'right', '', '', '', '', 0, 0, 0, 0, 'catid_83');
/*!40000 ALTER TABLE `mg_menu` ENABLE KEYS */;


# Dumping structure for table mg_wlsm.mg_model
DROP TABLE IF EXISTS `mg_model`;
CREATE TABLE IF NOT EXISTS `mg_model` (
  `modelid` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `description` varchar(255) NOT NULL,
  `tablename` varchar(20) NOT NULL,
  `itemname` varchar(10) NOT NULL,
  `itemunit` varchar(10) NOT NULL,
  `workflowid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `template_category` varchar(30) NOT NULL,
  `template_list` varchar(30) NOT NULL,
  `template_show` varchar(30) NOT NULL,
  `template_print` varchar(30) NOT NULL,
  `ishtml` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `category_urlruleid` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `show_urlruleid` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `enablesearch` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `ischeck` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `isrelated` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `modeltype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`modelid`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

# Dumping data for table mg_wlsm.mg_model: 15 rows
DELETE FROM `mg_model`;
/*!40000 ALTER TABLE `mg_model` DISABLE KEYS */;
INSERT INTO `mg_model` (`modelid`, `name`, `description`, `tablename`, `itemname`, `itemunit`, `workflowid`, `template_category`, `template_list`, `template_show`, `template_print`, `ishtml`, `category_urlruleid`, `show_urlruleid`, `enablesearch`, `ischeck`, `isrelated`, `disabled`, `modeltype`) VALUES
	(21, '新闻', '', 'picdesart', '新闻', '篇', 1, 'category', 'list', 'show', 'print', 1, 3, 7, 1, 0, 1, 0, 0),
	(22, '产品', '', 'picart', '产品', '篇', 1, 'category', 'list', 'show', 'print', 1, 3, 7, 1, 0, 1, 0, 0),
	(23, '首页banner滑过', '', 'picdeslink', '简介图片外链', '幅', 1, 'category', 'list', 'show', 'print', 0, 4, 10, 0, 0, 1, 0, 0),
	(24, '图片链接', '', 'piclink', '图片链接', '幅', 1, 'category', 'list', 'show', 'print', 0, 4, 10, 0, 0, 1, 0, 0),
	(25, '定位图片', '', 'pic', '图片', '幅', 1, 'category', 'list', 'show', 'print', 0, 4, 10, 0, 0, 1, 0, 0),
	(10, '普通会员', '', 'detail', '', '', 0, '', '', '', '', 0, 0, 0, 1, 0, 1, 0, 2),
	(26, '图文描述推荐', '', 'picdesartsug', '图文描述推荐', '', 1, 'category', 'list', 'show', 'print', 1, 3, 7, 1, 0, 1, 0, 0),
	(27, '文件夹', '', 'foder', '文件夹', '个', 1, 'category', 'list', 'show', 'print', 1, 3, 7, 1, 0, 1, 0, 0),
	(16, '视频模块', '独立视频模块', 'data', '视频', '条', 1, 'category_video', 'list_video', 'show_video', 'print', 0, 0, 0, 1, 1, 1, 0, 10),
	(28, '前景背景切换', '', 'backfront', '前景背景切换', '对', 1, 'category', 'list', 'show', 'print', 1, 3, 7, 1, 0, 1, 0, 0),
	(29, '企业团队', '', 'team', '企业团队', '企业团队', 1, 'category', 'list', 'show', 'print', 1, 3, 7, 1, 0, 1, 0, 0),
	(30, '产品栏目页滑动门', '', 'catproslider', '产品栏目页滑动门', '条', 1, 'category', 'list', 'show', 'print', 1, 3, 7, 1, 0, 1, 0, 0),
	(31, '动漫文化', '', 'culture', '动漫文化', '动漫文化', 1, 'category', 'list', 'show', 'print', 1, 3, 7, 1, 1, 1, 0, 0),
	(32, '合作伙伴', '', 'partner', '合作伙伴', '合作伙伴', 1, 'category', 'list', 'show', 'print', 1, 3, 7, 1, 1, 1, 0, 0),
	(33, '简单新闻', '', 'simplenews', '简单新闻', '篇', 1, 'category', 'list', 'show', 'print', 1, 3, 7, 1, 1, 1, 0, 0);
/*!40000 ALTER TABLE `mg_model` ENABLE KEYS */;


# Dumping structure for table mg_wlsm.mg_model_field
DROP TABLE IF EXISTS `mg_model_field`;
CREATE TABLE IF NOT EXISTS `mg_model_field` (
  `fieldid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `modelid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `field` varchar(20) NOT NULL,
  `name` varchar(30) NOT NULL,
  `tips` text NOT NULL,
  `css` varchar(30) NOT NULL,
  `minlength` int(10) unsigned NOT NULL DEFAULT '0',
  `maxlength` int(10) unsigned NOT NULL DEFAULT '0',
  `pattern` varchar(255) NOT NULL,
  `errortips` varchar(255) NOT NULL,
  `formtype` varchar(20) NOT NULL,
  `setting` mediumtext NOT NULL,
  `formattribute` varchar(255) NOT NULL,
  `unsetgroupids` varchar(255) NOT NULL,
  `unsetroleids` varchar(255) NOT NULL,
  `iscore` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `issystem` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isunique` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isbase` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `issearch` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isselect` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `iswhere` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isorder` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islist` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isshow` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isadd` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `isfulltext` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `listorder` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`fieldid`),
  KEY `modelid` (`modelid`,`disabled`),
  KEY `field` (`field`,`modelid`)
) ENGINE=MyISAM AUTO_INCREMENT=974 DEFAULT CHARSET=utf8;

# Dumping data for table mg_wlsm.mg_model_field: 367 rows
DELETE FROM `mg_model_field`;
/*!40000 ALTER TABLE `mg_model_field` DISABLE KEYS */;
INSERT INTO `mg_model_field` (`fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isselect`, `iswhere`, `isorder`, `islist`, `isshow`, `isadd`, `isfulltext`, `listorder`, `disabled`) VALUES
	(847, 27, 'content', '内容', '', '', 1, 99999, '', '', 'editor', 'array (\n  \'toolbar\' => \'standard\',\n  \'width\' => \'700\',\n  \'height\' => \'550\',\n  \'defaultvalue\' => \'\',\n  \'storage\' => \'database\',\n  \'enablekeylink\' => \'0\',\n  \'enablefilterword\' => \'0\',\n  \'enablesaveimage\' => \'1\',\n)', '', '', '', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 11, 0),
	(845, 27, 'status', '状态', '', '', 0, 2, '', '', 'box', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 98, 1),
	(846, 27, 'template', '内容页模板', '', '', 0, 255, '', '', 'template', '', '', '', '', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 99, 1),
	(844, 27, 'prefix', 'html文件名', '', '', 0, 20, '', '', 'text', 'array (\n  \'size\' => \'12\',\n  \'defaultvalue\' => \'\',\n  \'ispassword\' => \'0\',\n)', '', '-99', '-99', 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 19, 1),
	(843, 27, 'islink', '转向链接', '', '', 0, 0, '', '', 'islink', '', '', '', '', 0, 1, 0, 1, 0, 1, 0, 0, 1, 1, 1, 0, 32, 1),
	(842, 27, 'inputtime', '发布时间', '', '', 0, 0, '', '', 'datetime', 'array (\r\n  \'dateformat\' => \'int\',\r\n  \'format\' => \'Y-m-d H:i:s\',\r\n  \'defaulttype\' => \'1\',\r\n  \'defaultvalue\' => \'\',\r\n)', '', '', '', 0, 1, 0, 1, 0, 1, 1, 1, 0, 0, 0, 0, 12, 0),
	(841, 27, 'updatetime', '更新时间', '', '', 0, 0, '', '', 'datetime', 'array (\r\n  \'dateformat\' => \'int\',\r\n  \'format\' => \'Y-m-d H:i:s\',\r\n  \'defaulttype\' => \'1\',\r\n  \'defaultvalue\' => \'\',\r\n)', '', '', '', 1, 1, 0, 1, 0, 1, 1, 1, 0, 0, 1, 0, 10, 0),
	(837, 27, 'posids', '推荐位', '全选<input boxid=\'posids\' type=\'checkbox\' onclick="checkall(\'posids\')" >', '', 0, 0, '', '', 'posid', 'array (\r\n  \'cols\' => \'4\',\r\n  \'width\' => \'125\',\r\n)', '', '', '', 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 13, 1),
	(838, 27, 'listorder', '排序', '', '', 1, 1, '', '', 'number', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 1, 0, 0, 1, 0, 97, 0),
	(839, 27, 'url', 'URL', '', '', 0, 100, '', '', 'text', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 96, 0),
	(840, 27, 'userid', '发布人', '', '', 0, 0, '', '', 'userid', '', '', '', '', 1, 1, 0, 1, 0, 1, 1, 0, 0, 0, 1, 0, 9, 0),
	(820, 26, 'userid', '发布人', '', '', 0, 0, '', '', 'userid', '', '', '', '', 1, 1, 0, 1, 0, 1, 1, 0, 0, 0, 1, 0, 9, 0),
	(821, 26, 'updatetime', '更新时间', '', '', 0, 0, '', '', 'datetime', 'array (\r\n  \'dateformat\' => \'int\',\r\n  \'format\' => \'Y-m-d H:i:s\',\r\n  \'defaulttype\' => \'1\',\r\n  \'defaultvalue\' => \'\',\r\n)', '', '', '', 1, 1, 0, 1, 0, 1, 1, 1, 0, 0, 1, 0, 10, 0),
	(822, 26, 'inputtime', '发布时间', '', '', 0, 0, '', '', 'datetime', 'array (\r\n  \'dateformat\' => \'int\',\r\n  \'format\' => \'Y-m-d H:i:s\',\r\n  \'defaulttype\' => \'1\',\r\n  \'defaultvalue\' => \'\',\r\n)', '', '', '', 0, 1, 0, 1, 0, 1, 1, 1, 0, 0, 0, 0, 12, 0),
	(823, 26, 'islink', '转向链接', '', '', 0, 0, '', '', 'islink', '', '', '', '', 0, 1, 0, 1, 0, 1, 0, 0, 1, 1, 1, 0, 32, 1),
	(824, 26, 'prefix', 'html文件名', '', '', 0, 20, '', '', 'text', 'array (\n  \'size\' => \'12\',\n  \'defaultvalue\' => \'\',\n  \'ispassword\' => \'0\',\n)', '', '-99', '-99', 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 19, 1),
	(825, 26, 'status', '状态', '', '', 0, 2, '', '', 'box', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 98, 1),
	(826, 26, 'template', '内容页模板', '', '', 0, 255, '', '', 'template', '', '', '', '', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 99, 1),
	(827, 26, 'content', '内容', '', '', 1, 99999, '', '', 'editor', 'array (\n  \'toolbar\' => \'standard\',\n  \'width\' => \'700\',\n  \'height\' => \'550\',\n  \'defaultvalue\' => \'\',\n  \'storage\' => \'database\',\n  \'enablekeylink\' => \'0\',\n  \'enablefilterword\' => \'0\',\n  \'enablesaveimage\' => \'1\',\n)', '', '', '', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 11, 0),
	(828, 27, 'contentid', 'ID', '', '', 0, 0, '', '', 'number', '', '', '', '', 1, 1, 0, 1, 0, 1, 0, 1, 1, 1, 1, 0, 0, 0),
	(829, 27, 'catid', '栏目', '', '', 1, 9999, '/^[0-9]+$/', '请选择所属栏目', 'catid', 'array (\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 0),
	(830, 27, 'typeid', '类别', '', '', 0, 0, '', '', 'typeid', 'array (\n  \'minnumber\' => \'\',\n  \'maxnumber\' => \'\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 2, 1),
	(831, 27, 'areaid', '地区', '', '', 0, 0, '', '', 'areaid', 'array (\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 3, 1),
	(832, 27, 'title', '标题', '', 'inputtitle', 1, 200, '', '', 'title', 'array (\n  \'size\' => \'60\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 4, 0),
	(833, 27, 'style', '颜色和字型', '', '', 0, 0, '', '', 'style', '', '', '', '', 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0, 5, 1),
	(834, 27, 'thumb', '缩略图', '', '', 0, 100, '', '', 'image', 'array (\n  \'size\' => \'60\',\n  \'defaultvalue\' => \'\',\n  \'upload_maxsize\' => \'1024\',\n  \'upload_allowext\' => \'jpg|jpeg|gif|png|bmp\',\n  \'isselectimage\' => \'1\',\n  \'isthumb\' => \'0\',\n  \'thumb_width\' => \'300\',\n  \'thumb_height\' => \'300\',\n  \'iswatermark\' => \'0\',\n  \'watermark_img\' => \'images/watermark.gif\',\n)', '', '-99', '-99', 0, 1, 0, 1, 0, 1, 1, 0, 1, 1, 1, 0, 6, 0),
	(835, 27, 'keywords', '关键词', '多个关键词之间用空格隔开', '', 0, 40, '', '', 'keyword', 'array (\n  \'size\' => \'60\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 1, 0, 0, 1, 1, 1, 7, 1),
	(836, 27, 'description', '摘要', '', '', 0, 500, '', '', 'textarea', 'array (\n  \'rows\' => \'5\',\n  \'cols\' => \'60\',\n  \'defaultvalue\' => \'\',\n  \'enablehtml\' => \'0\',\n  \'enablekeylink\' => \'0\',\n  \'enablefilterword\' => \'0\',\n \'checkcharacter\' => \'1\',\n)', '', '', '', 0, 1, 0, 1, 0, 1, 0, 0, 1, 1, 1, 1, 8, 0),
	(819, 26, 'url', 'URL', '', '', 0, 100, '', '', 'text', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 96, 0),
	(818, 26, 'listorder', '排序', '', '', 1, 1, '', '', 'number', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 1, 0, 0, 1, 0, 97, 0),
	(817, 26, 'posids', '推荐位', '全选<input boxid=\'posids\' type=\'checkbox\' onclick="checkall(\'posids\')" >', '', 0, 0, '', '', 'posid', 'array (\r\n  \'cols\' => \'4\',\r\n  \'width\' => \'125\',\r\n)', '', '', '', 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 13, 0),
	(816, 26, 'description', '摘要', '', '', 0, 500, '', '', 'textarea', 'array (\n  \'rows\' => \'5\',\n  \'cols\' => \'60\',\n  \'defaultvalue\' => \'\',\n  \'enablehtml\' => \'0\',\n  \'enablekeylink\' => \'0\',\n  \'enablefilterword\' => \'0\',\n \'checkcharacter\' => \'1\',\n)', '', '', '', 0, 1, 0, 1, 0, 1, 0, 0, 1, 1, 1, 1, 8, 0),
	(815, 26, 'keywords', '关键词', '多个关键词之间用空格隔开', '', 0, 40, '', '', 'keyword', 'array (\n  \'size\' => \'60\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 1, 0, 0, 1, 1, 1, 7, 1),
	(814, 26, 'thumb', '缩略图', '', '', 0, 100, '', '', 'image', 'array (\n  \'size\' => \'60\',\n  \'defaultvalue\' => \'\',\n  \'upload_maxsize\' => \'1024\',\n  \'upload_allowext\' => \'jpg|jpeg|gif|png|bmp\',\n  \'isselectimage\' => \'1\',\n  \'isthumb\' => \'1\',\n  \'thumb_width\' => \'300\',\n  \'thumb_height\' => \'300\',\n  \'iswatermark\' => \'1\',\n  \'watermark_img\' => \'images/watermark.gif\',\n)', '', '', '', 0, 1, 0, 1, 0, 1, 1, 0, 1, 1, 1, 0, 6, 0),
	(813, 26, 'style', '颜色和字型', '', '', 0, 0, '', '', 'style', '', '', '', '', 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0, 5, 1),
	(812, 26, 'title', '标题', '', 'inputtitle', 1, 200, '', '', 'title', 'array (\n  \'size\' => \'60\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 4, 0),
	(811, 26, 'areaid', '地区', '', '', 0, 0, '', '', 'areaid', 'array (\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 3, 1),
	(808, 26, 'contentid', 'ID', '', '', 0, 0, '', '', 'number', '', '', '', '', 1, 1, 0, 1, 0, 1, 0, 1, 1, 1, 1, 0, 0, 0),
	(809, 26, 'catid', '栏目', '', '', 1, 9999, '/^[0-9]+$/', '请选择所属栏目', 'catid', 'array (\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 0),
	(810, 26, 'typeid', '类别', '', '', 0, 0, '', '', 'typeid', 'array (\n  \'minnumber\' => \'\',\n  \'maxnumber\' => \'\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 2, 1),
	(806, 25, 'template', '内容页模板', '', '', 0, 255, '', '', 'template', '', '', '', '', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 99, 1),
	(807, 25, 'content', '内容', '', '', 1, 99999, '', '', 'editor', 'array (\n  \'toolbar\' => \'standard\',\n  \'width\' => \'700\',\n  \'height\' => \'550\',\n  \'defaultvalue\' => \'\',\n  \'storage\' => \'database\',\n  \'enablekeylink\' => \'0\',\n  \'enablefilterword\' => \'0\',\n  \'enablesaveimage\' => \'1\',\n)', '', '', '', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 11, 1),
	(804, 25, 'prefix', 'html文件名', '', '', 0, 20, '', '', 'text', 'array (\n  \'size\' => \'12\',\n  \'defaultvalue\' => \'\',\n  \'ispassword\' => \'0\',\n)', '', '-99', '-99', 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 19, 1),
	(805, 25, 'status', '状态', '', '', 0, 2, '', '', 'box', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 98, 1),
	(803, 25, 'islink', '转向链接', '', '', 0, 0, '', '', 'islink', '', '', '', '', 0, 1, 0, 1, 0, 1, 0, 0, 1, 1, 1, 0, 32, 1),
	(802, 25, 'inputtime', '发布时间', '', '', 0, 0, '', '', 'datetime', 'array (\r\n  \'dateformat\' => \'int\',\r\n  \'format\' => \'Y-m-d H:i:s\',\r\n  \'defaulttype\' => \'1\',\r\n  \'defaultvalue\' => \'\',\r\n)', '', '', '', 0, 1, 0, 1, 0, 1, 1, 1, 0, 0, 0, 0, 12, 0),
	(800, 25, 'userid', '发布人', '', '', 0, 0, '', '', 'userid', '', '', '', '', 1, 1, 0, 1, 0, 1, 1, 0, 0, 0, 1, 0, 9, 0),
	(801, 25, 'updatetime', '更新时间', '', '', 0, 0, '', '', 'datetime', 'array (\r\n  \'dateformat\' => \'int\',\r\n  \'format\' => \'Y-m-d H:i:s\',\r\n  \'defaulttype\' => \'1\',\r\n  \'defaultvalue\' => \'\',\r\n)', '', '', '', 1, 1, 0, 1, 0, 1, 1, 1, 0, 0, 1, 0, 10, 0),
	(799, 25, 'url', 'URL', '', '', 0, 100, '', '', 'text', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 96, 0),
	(798, 25, 'listorder', '排序', '', '', 1, 1, '', '', 'number', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 1, 0, 0, 1, 0, 97, 0),
	(706, 21, 'contentid', 'ID', '', '', 0, 0, '', '', 'number', '', '', '', '', 1, 1, 0, 1, 0, 1, 0, 1, 1, 1, 1, 0, 0, 0),
	(707, 21, 'catid', '栏目', '', '', 1, 9999, '/^[0-9]+$/', '请选择所属栏目', 'catid', 'array (\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 0),
	(708, 21, 'typeid', '类别', '', '', 0, 0, '', '', 'typeid', 'array (\n  \'minnumber\' => \'\',\n  \'maxnumber\' => \'\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 2, 1),
	(709, 21, 'areaid', '地区', '', '', 0, 0, '', '', 'areaid', 'array (\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 3, 1),
	(710, 21, 'title', '标题', '', 'inputtitle', 1, 200, '', '', 'title', 'array (\n  \'size\' => \'60\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 4, 0),
	(711, 21, 'style', '颜色和字型', '', '', 0, 0, '', '', 'style', '', '', '', '', 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0, 5, 1),
	(712, 21, 'thumb', '缩略图', '', '', 0, 100, '', '', 'image', 'array (\n  \'size\' => \'60\',\n  \'defaultvalue\' => \'\',\n  \'upload_maxsize\' => \'1024\',\n  \'upload_allowext\' => \'jpg|jpeg|gif|png|bmp\',\n  \'isselectimage\' => \'1\',\n  \'isthumb\' => \'1\',\n  \'thumb_width\' => \'300\',\n  \'thumb_height\' => \'300\',\n  \'iswatermark\' => \'1\',\n  \'watermark_img\' => \'images/watermark.gif\',\n)', '', '', '', 0, 1, 0, 1, 0, 1, 1, 0, 1, 1, 1, 0, 6, 0),
	(713, 21, 'keywords', '关键词', '多个关键词之间用空格隔开', '', 0, 40, '', '', 'keyword', 'array (\n  \'size\' => \'60\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 1, 0, 0, 1, 1, 1, 7, 1),
	(714, 21, 'description', '摘要', '', '', 0, 500, '', '', 'textarea', 'array (\n  \'rows\' => \'5\',\n  \'cols\' => \'60\',\n  \'defaultvalue\' => \'\',\n  \'enablehtml\' => \'0\',\n  \'enablekeylink\' => \'0\',\n  \'enablefilterword\' => \'0\',\n \'checkcharacter\' => \'1\',\n)', '', '', '', 0, 1, 0, 1, 0, 1, 0, 0, 1, 1, 1, 1, 8, 0),
	(715, 21, 'posids', '推荐位', '全选<input boxid=\'posids\' type=\'checkbox\' onclick="checkall(\'posids\')" >', '', 0, 0, '', '', 'posid', 'array (\r\n  \'cols\' => \'4\',\r\n  \'width\' => \'125\',\r\n)', '', '', '', 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 13, 0),
	(716, 21, 'listorder', '排序', '', '', 1, 1, '', '', 'number', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 1, 0, 0, 1, 0, 97, 0),
	(717, 21, 'url', 'URL', '', '', 0, 100, '', '', 'text', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 96, 0),
	(718, 21, 'userid', '发布人', '', '', 0, 0, '', '', 'userid', '', '', '', '', 1, 1, 0, 1, 0, 1, 1, 0, 0, 0, 1, 0, 9, 0),
	(719, 21, 'updatetime', '更新时间', '', '', 0, 0, '', '', 'datetime', 'array (\r\n  \'dateformat\' => \'int\',\r\n  \'format\' => \'Y-m-d H:i:s\',\r\n  \'defaulttype\' => \'1\',\r\n  \'defaultvalue\' => \'\',\r\n)', '', '', '', 1, 1, 0, 1, 0, 1, 1, 1, 0, 0, 1, 0, 10, 0),
	(720, 21, 'inputtime', '发布时间', '', '', 0, 0, '', '', 'datetime', 'array (\r\n  \'dateformat\' => \'int\',\r\n  \'format\' => \'Y-m-d H:i:s\',\r\n  \'defaulttype\' => \'1\',\r\n  \'defaultvalue\' => \'\',\r\n)', '', '', '', 0, 1, 0, 1, 0, 1, 1, 1, 0, 0, 0, 0, 12, 0),
	(721, 21, 'islink', '转向链接', '', '', 0, 0, '', '', 'islink', '', '', '', '', 0, 1, 0, 1, 0, 1, 0, 0, 1, 1, 1, 0, 32, 1),
	(722, 21, 'prefix', 'html文件名', '', '', 0, 20, '', '', 'text', 'array (\n  \'size\' => \'12\',\n  \'defaultvalue\' => \'\',\n  \'ispassword\' => \'0\',\n)', '', '-99', '-99', 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 19, 1),
	(723, 21, 'status', '状态', '', '', 0, 2, '', '', 'box', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 98, 1),
	(724, 21, 'template', '内容页模板', '', '', 0, 255, '', '', 'template', '', '', '', '', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 99, 1),
	(725, 21, 'content', '内容', '', '', 1, 99999, '', '', 'editor', 'array (\n  \'toolbar\' => \'standard\',\n  \'width\' => \'700\',\n  \'height\' => \'550\',\n  \'defaultvalue\' => \'\',\n  \'storage\' => \'database\',\n  \'enablekeylink\' => \'0\',\n  \'enablefilterword\' => \'0\',\n  \'enablesaveimage\' => \'1\',\n)', '', '', '', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 11, 0),
	(726, 22, 'contentid', 'ID', '', '', 0, 0, '', '', 'number', '', '', '', '', 1, 1, 0, 1, 0, 1, 0, 1, 1, 1, 1, 0, 0, 0),
	(727, 22, 'catid', '栏目', '', '', 1, 9999, '/^[0-9]+$/', '请选择所属栏目', 'catid', 'array (\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 0),
	(728, 22, 'typeid', '类别', '', '', 0, 0, '', '', 'typeid', 'array (\n  \'minnumber\' => \'\',\n  \'maxnumber\' => \'\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 2, 1),
	(729, 22, 'areaid', '地区', '', '', 0, 0, '', '', 'areaid', 'array (\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 3, 1),
	(730, 22, 'title', '标题', '', 'inputtitle', 1, 200, '', '', 'title', 'array (\n  \'size\' => \'60\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 4, 0),
	(731, 22, 'style', '颜色和字型', '', '', 0, 0, '', '', 'style', '', '', '', '', 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0, 5, 1),
	(732, 22, 'thumb', '缩略图', '', '', 0, 100, '', '', 'image', 'array (\n  \'size\' => \'60\',\n  \'defaultvalue\' => \'\',\n  \'upload_maxsize\' => \'1024\',\n  \'upload_allowext\' => \'jpg|jpeg|gif|png|bmp\',\n  \'isselectimage\' => \'1\',\n  \'isthumb\' => \'1\',\n  \'thumb_width\' => \'200\',\n  \'thumb_height\' => \'200\',\n  \'iswatermark\' => \'0\',\n  \'watermark_img\' => \'images/watermark.gif\',\n)', '', '-99', '-99', 0, 1, 0, 1, 0, 1, 1, 0, 1, 1, 1, 0, 6, 0),
	(733, 22, 'keywords', '关键词', '多个关键词之间用空格隔开', '', 0, 40, '', '', 'keyword', 'array (\n  \'size\' => \'60\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 1, 0, 0, 1, 1, 1, 7, 1),
	(734, 22, 'description', '摘要', '', '', 0, 500, '', '', 'textarea', 'array (\n  \'rows\' => \'5\',\n  \'cols\' => \'60\',\n  \'defaultvalue\' => \'\',\n  \'enablehtml\' => \'0\',\n  \'enablekeylink\' => \'0\',\n  \'enablefilterword\' => \'0\',\n \'checkcharacter\' => \'1\',\n)', '', '', '', 0, 1, 0, 1, 0, 1, 0, 0, 1, 1, 1, 1, 8, 1),
	(735, 22, 'posids', '推荐位', '全选<input boxid=\'posids\' type=\'checkbox\' onclick="checkall(\'posids\')" >', '', 0, 0, '', '', 'posid', 'array (\r\n  \'cols\' => \'4\',\r\n  \'width\' => \'125\',\r\n)', '', '', '', 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 13, 1),
	(736, 22, 'listorder', '排序', '', '', 1, 1, '', '', 'number', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 1, 0, 0, 1, 0, 97, 0),
	(737, 22, 'url', 'URL', '', '', 0, 100, '', '', 'text', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 96, 0),
	(738, 22, 'userid', '发布人', '', '', 0, 0, '', '', 'userid', '', '', '', '', 1, 1, 0, 1, 0, 1, 1, 0, 0, 0, 1, 0, 9, 0),
	(739, 22, 'updatetime', '更新时间', '', '', 0, 0, '', '', 'datetime', 'array (\r\n  \'dateformat\' => \'int\',\r\n  \'format\' => \'Y-m-d H:i:s\',\r\n  \'defaulttype\' => \'1\',\r\n  \'defaultvalue\' => \'\',\r\n)', '', '', '', 1, 1, 0, 1, 0, 1, 1, 1, 0, 0, 1, 0, 10, 0),
	(740, 22, 'inputtime', '发布时间', '', '', 0, 0, '', '', 'datetime', 'array (\r\n  \'dateformat\' => \'int\',\r\n  \'format\' => \'Y-m-d H:i:s\',\r\n  \'defaulttype\' => \'1\',\r\n  \'defaultvalue\' => \'\',\r\n)', '', '', '', 0, 1, 0, 1, 0, 1, 1, 1, 0, 0, 0, 0, 12, 0),
	(741, 22, 'islink', '转向链接', '', '', 0, 0, '', '', 'islink', '', '', '', '', 0, 1, 0, 1, 0, 1, 0, 0, 1, 1, 1, 0, 32, 1),
	(742, 22, 'prefix', 'html文件名', '', '', 0, 20, '', '', 'text', 'array (\n  \'size\' => \'12\',\n  \'defaultvalue\' => \'\',\n  \'ispassword\' => \'0\',\n)', '', '-99', '-99', 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 19, 1),
	(743, 22, 'status', '状态', '', '', 0, 2, '', '', 'box', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 98, 1),
	(744, 22, 'template', '内容页模板', '', '', 0, 255, '', '', 'template', '', '', '', '', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 99, 1),
	(745, 22, 'content', '内容', '', '', 1, 99999, '', '', 'editor', 'array (\n  \'toolbar\' => \'standard\',\n  \'width\' => \'700\',\n  \'height\' => \'550\',\n  \'defaultvalue\' => \'\',\n  \'storage\' => \'database\',\n  \'enablekeylink\' => \'0\',\n  \'enablefilterword\' => \'0\',\n  \'enablesaveimage\' => \'1\',\n)', '', '', '', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 11, 0),
	(746, 23, 'contentid', 'ID', '', '', 0, 0, '', '', 'number', '', '', '', '', 1, 1, 0, 1, 0, 1, 0, 1, 1, 1, 1, 0, 0, 0),
	(747, 23, 'catid', '栏目', '', '', 1, 9999, '/^[0-9]+$/', '请选择所属栏目', 'catid', 'array (\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 0),
	(748, 23, 'typeid', '类别', '', '', 0, 0, '', '', 'typeid', 'array (\n  \'minnumber\' => \'\',\n  \'maxnumber\' => \'\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 2, 1),
	(749, 23, 'areaid', '地区', '', '', 0, 0, '', '', 'areaid', 'array (\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 3, 1),
	(750, 23, 'title', '标题', '', 'inputtitle', 1, 200, '', '', 'title', 'array (\n  \'size\' => \'60\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 4, 0),
	(751, 23, 'style', '颜色和字型', '', '', 0, 0, '', '', 'style', '', '', '', '', 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0, 5, 1),
	(752, 23, 'thumb', '缩略图', '', '', 0, 100, '', '', 'image', 'array (\n  \'size\' => \'60\',\n  \'defaultvalue\' => \'\',\n  \'upload_maxsize\' => \'1024\',\n  \'upload_allowext\' => \'jpg|jpeg|gif|png|bmp\',\n  \'isselectimage\' => \'1\',\n  \'isthumb\' => \'1\',\n  \'thumb_width\' => \'300\',\n  \'thumb_height\' => \'300\',\n  \'iswatermark\' => \'1\',\n  \'watermark_img\' => \'images/watermark.gif\',\n)', '', '', '', 0, 1, 0, 1, 0, 1, 1, 0, 1, 1, 1, 0, 6, 0),
	(753, 23, 'keywords', '关键词', '多个关键词之间用空格隔开', '', 0, 40, '', '', 'keyword', 'array (\n  \'size\' => \'60\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 1, 0, 0, 1, 1, 1, 7, 1),
	(754, 23, 'description', '摘要', '', '', 0, 500, '', '', 'textarea', 'array (\n  \'rows\' => \'5\',\n  \'cols\' => \'60\',\n  \'defaultvalue\' => \'\',\n  \'enablehtml\' => \'0\',\n  \'enablekeylink\' => \'0\',\n  \'enablefilterword\' => \'0\',\n \'checkcharacter\' => \'1\',\n)', '', '', '', 0, 1, 0, 1, 0, 1, 0, 0, 1, 1, 1, 1, 8, 0),
	(755, 23, 'posids', '推荐位', '全选<input boxid=\'posids\' type=\'checkbox\' onclick="checkall(\'posids\')" >', '', 0, 0, '', '', 'posid', 'array (\r\n  \'cols\' => \'4\',\r\n  \'width\' => \'125\',\r\n)', '', '', '', 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 13, 1),
	(756, 23, 'listorder', '排序', '', '', 1, 1, '', '', 'number', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 1, 0, 0, 1, 0, 97, 0),
	(757, 23, 'url', 'URL', '', '', 0, 100, '', '', 'text', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 96, 0),
	(758, 23, 'userid', '发布人', '', '', 0, 0, '', '', 'userid', '', '', '', '', 1, 1, 0, 1, 0, 1, 1, 0, 0, 0, 1, 0, 9, 0),
	(759, 23, 'updatetime', '更新时间', '', '', 0, 0, '', '', 'datetime', 'array (\r\n  \'dateformat\' => \'int\',\r\n  \'format\' => \'Y-m-d H:i:s\',\r\n  \'defaulttype\' => \'1\',\r\n  \'defaultvalue\' => \'\',\r\n)', '', '', '', 1, 1, 0, 1, 0, 1, 1, 1, 0, 0, 1, 0, 10, 0),
	(760, 23, 'inputtime', '发布时间', '', '', 0, 0, '', '', 'datetime', 'array (\r\n  \'dateformat\' => \'int\',\r\n  \'format\' => \'Y-m-d H:i:s\',\r\n  \'defaulttype\' => \'1\',\r\n  \'defaultvalue\' => \'\',\r\n)', '', '', '', 0, 1, 0, 1, 0, 1, 1, 1, 0, 0, 0, 0, 12, 0),
	(761, 23, 'islink', '转向链接', '', '', 0, 0, '', '', 'islink', '', '', '', '', 0, 1, 0, 1, 0, 1, 0, 0, 1, 1, 1, 0, 32, 1),
	(762, 23, 'prefix', 'html文件名', '', '', 0, 20, '', '', 'text', 'array (\n  \'size\' => \'12\',\n  \'defaultvalue\' => \'\',\n  \'ispassword\' => \'0\',\n)', '', '-99', '-99', 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 19, 1),
	(763, 23, 'status', '状态', '', '', 0, 2, '', '', 'box', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 98, 1),
	(764, 23, 'template', '内容页模板', '', '', 0, 255, '', '', 'template', '', '', '', '', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 99, 1),
	(765, 23, 'content', '内容', '', '', 1, 99999, '', '', 'editor', 'array (\n  \'toolbar\' => \'standard\',\n  \'width\' => \'700\',\n  \'height\' => \'550\',\n  \'defaultvalue\' => \'\',\n  \'storage\' => \'database\',\n  \'enablekeylink\' => \'0\',\n  \'enablefilterword\' => \'0\',\n  \'enablesaveimage\' => \'1\',\n)', '', '', '', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 11, 1),
	(766, 23, 'link', '链接地址', '', '', 0, 0, '', '', 'text', 'array (\n  \'size\' => \'60\',\n  \'defaultvalue\' => \'\',\n  \'ispassword\' => \'0\',\n)', '', '-99', '-99', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 9, 0),
	(767, 24, 'contentid', 'ID', '', '', 0, 0, '', '', 'number', '', '', '', '', 1, 1, 0, 1, 0, 1, 0, 1, 1, 1, 1, 0, 0, 0),
	(768, 24, 'catid', '栏目', '', '', 1, 9999, '/^[0-9]+$/', '请选择所属栏目', 'catid', 'array (\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 0),
	(769, 24, 'typeid', '类别', '', '', 0, 0, '', '', 'typeid', 'array (\n  \'minnumber\' => \'\',\n  \'maxnumber\' => \'\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 2, 1),
	(770, 24, 'areaid', '地区', '', '', 0, 0, '', '', 'areaid', 'array (\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 3, 1),
	(771, 24, 'title', '标题', '', 'inputtitle', 1, 200, '', '', 'title', 'array (\n  \'size\' => \'60\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 4, 0),
	(772, 24, 'style', '颜色和字型', '', '', 0, 0, '', '', 'style', '', '', '', '', 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0, 5, 1),
	(773, 24, 'thumb', '缩略图', '', '', 0, 100, '', '', 'image', 'array (\n  \'size\' => \'60\',\n  \'defaultvalue\' => \'\',\n  \'upload_maxsize\' => \'1024\',\n  \'upload_allowext\' => \'jpg|jpeg|gif|png|bmp\',\n  \'isselectimage\' => \'1\',\n  \'isthumb\' => \'1\',\n  \'thumb_width\' => \'300\',\n  \'thumb_height\' => \'300\',\n  \'iswatermark\' => \'1\',\n  \'watermark_img\' => \'images/watermark.gif\',\n)', '', '', '', 0, 1, 0, 1, 0, 1, 1, 0, 1, 1, 1, 0, 6, 0),
	(774, 24, 'keywords', '关键词', '多个关键词之间用空格隔开', '', 0, 40, '', '', 'keyword', 'array (\n  \'size\' => \'60\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 1, 0, 0, 1, 1, 1, 7, 1),
	(775, 24, 'description', '摘要', '', '', 0, 500, '', '', 'textarea', 'array (\n  \'rows\' => \'5\',\n  \'cols\' => \'60\',\n  \'defaultvalue\' => \'\',\n  \'enablehtml\' => \'0\',\n  \'enablekeylink\' => \'0\',\n  \'enablefilterword\' => \'0\',\n \'checkcharacter\' => \'1\',\n)', '', '', '', 0, 1, 0, 1, 0, 1, 0, 0, 1, 1, 1, 1, 8, 1),
	(776, 24, 'posids', '推荐位', '全选<input boxid=\'posids\' type=\'checkbox\' onclick="checkall(\'posids\')" >', '', 0, 0, '', '', 'posid', 'array (\r\n  \'cols\' => \'4\',\r\n  \'width\' => \'125\',\r\n)', '', '', '', 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 13, 1),
	(777, 24, 'listorder', '排序', '', '', 1, 1, '', '', 'number', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 1, 0, 0, 1, 0, 97, 0),
	(778, 24, 'url', 'URL', '', '', 0, 100, '', '', 'text', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 96, 0),
	(779, 24, 'userid', '发布人', '', '', 0, 0, '', '', 'userid', '', '', '', '', 1, 1, 0, 1, 0, 1, 1, 0, 0, 0, 1, 0, 9, 0),
	(780, 24, 'updatetime', '更新时间', '', '', 0, 0, '', '', 'datetime', 'array (\r\n  \'dateformat\' => \'int\',\r\n  \'format\' => \'Y-m-d H:i:s\',\r\n  \'defaulttype\' => \'1\',\r\n  \'defaultvalue\' => \'\',\r\n)', '', '', '', 1, 1, 0, 1, 0, 1, 1, 1, 0, 0, 1, 0, 10, 0),
	(781, 24, 'inputtime', '发布时间', '', '', 0, 0, '', '', 'datetime', 'array (\r\n  \'dateformat\' => \'int\',\r\n  \'format\' => \'Y-m-d H:i:s\',\r\n  \'defaulttype\' => \'1\',\r\n  \'defaultvalue\' => \'\',\r\n)', '', '', '', 0, 1, 0, 1, 0, 1, 1, 1, 0, 0, 0, 0, 12, 0),
	(782, 24, 'islink', '转向链接', '', '', 0, 0, '', '', 'islink', '', '', '', '', 0, 1, 0, 1, 0, 1, 0, 0, 1, 1, 1, 0, 32, 1),
	(783, 24, 'prefix', 'html文件名', '', '', 0, 20, '', '', 'text', 'array (\n  \'size\' => \'12\',\n  \'defaultvalue\' => \'\',\n  \'ispassword\' => \'0\',\n)', '', '-99', '-99', 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 19, 1),
	(784, 24, 'status', '状态', '', '', 0, 2, '', '', 'box', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 98, 1),
	(785, 24, 'template', '内容页模板', '', '', 0, 255, '', '', 'template', '', '', '', '', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 99, 1),
	(786, 24, 'content', '内容', '', '', 1, 99999, '', '', 'editor', 'array (\n  \'toolbar\' => \'standard\',\n  \'width\' => \'700\',\n  \'height\' => \'550\',\n  \'defaultvalue\' => \'\',\n  \'storage\' => \'database\',\n  \'enablekeylink\' => \'0\',\n  \'enablefilterword\' => \'0\',\n  \'enablesaveimage\' => \'1\',\n)', '', '', '', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 11, 1),
	(787, 24, 'link', '链接地址', '', '', 0, 255, '', '', 'text', 'array (\n  \'size\' => \'60\',\n  \'defaultvalue\' => \'\',\n  \'ispassword\' => \'0\',\n)', '', '-99', '-99', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 9, 0),
	(788, 25, 'contentid', 'ID', '', '', 0, 0, '', '', 'number', '', '', '', '', 1, 1, 0, 1, 0, 1, 0, 1, 1, 1, 1, 0, 0, 0),
	(789, 25, 'catid', '栏目', '', '', 1, 9999, '/^[0-9]+$/', '请选择所属栏目', 'catid', 'array (\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 0),
	(790, 25, 'typeid', '类别', '', '', 0, 0, '', '', 'typeid', 'array (\n  \'minnumber\' => \'\',\n  \'maxnumber\' => \'\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 2, 1),
	(791, 25, 'areaid', '地区', '', '', 0, 0, '', '', 'areaid', 'array (\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 3, 1),
	(792, 25, 'title', '标题', '', 'inputtitle', 1, 200, '', '', 'title', 'array (\n  \'size\' => \'60\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 4, 0),
	(793, 25, 'style', '颜色和字型', '', '', 0, 0, '', '', 'style', '', '', '', '', 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0, 5, 1),
	(794, 25, 'thumb', '缩略图', '', '', 0, 100, '', '', 'image', 'array (\n  \'size\' => \'60\',\n  \'defaultvalue\' => \'\',\n  \'upload_maxsize\' => \'1024\',\n  \'upload_allowext\' => \'jpg|jpeg|gif|png|bmp\',\n  \'isselectimage\' => \'1\',\n  \'isthumb\' => \'1\',\n  \'thumb_width\' => \'300\',\n  \'thumb_height\' => \'300\',\n  \'iswatermark\' => \'1\',\n  \'watermark_img\' => \'images/watermark.gif\',\n)', '', '', '', 0, 1, 0, 1, 0, 1, 1, 0, 1, 1, 1, 0, 6, 0),
	(795, 25, 'keywords', '关键词', '多个关键词之间用空格隔开', '', 0, 40, '', '', 'keyword', 'array (\n  \'size\' => \'60\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 1, 0, 0, 1, 1, 1, 7, 1),
	(796, 25, 'description', '摘要', '', '', 0, 500, '', '', 'textarea', 'array (\n  \'rows\' => \'5\',\n  \'cols\' => \'60\',\n  \'defaultvalue\' => \'\',\n  \'enablehtml\' => \'0\',\n  \'enablekeylink\' => \'0\',\n  \'enablefilterword\' => \'0\',\n \'checkcharacter\' => \'1\',\n)', '', '', '', 0, 1, 0, 1, 0, 1, 0, 0, 1, 1, 1, 1, 8, 1),
	(797, 25, 'posids', '推荐位', '全选<input boxid=\'posids\' type=\'checkbox\' onclick="checkall(\'posids\')" >', '', 0, 0, '', '', 'posid', 'array (\r\n  \'cols\' => \'4\',\r\n  \'width\' => \'125\',\r\n)', '', '', '', 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 13, 1),
	(500, 10, 'truename', '姓名', '', '', 0, 0, '', '', 'text', 'array (\n  \'size\' => \'12\',\n  \'defaultvalue\' => \'\',\n  \'ispassword\' => \'0\',\n)', '', '-99', '-99', 0, 0, 0, 1, 1, 1, 0, 0, 1, 0, 1, 0, 0, 0),
	(501, 10, 'gender', '性别', '', '', 0, 1, '', '', 'box', 'array (\n  \'options\' => \'男|0\r\n女|1\',\n  \'boxtype\' => \'radio\',\n  \'fieldtype\' => \'TINYINT\',\n  \'cols\' => \'5\',\n  \'width\' => \'80\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'0\',\n)', '', '-99', '-99', 0, 0, 0, 1, 1, 1, 1, 0, 1, 0, 1, 0, 0, 0),
	(502, 10, 'birthday', '生日', '', '', 0, 0, '', '', 'datetime', 'array (\n  \'dateformat\' => \'date\',\n  \'format\' => \'Y-m-d H:i:s\',\n  \'defaulttype\' => \'0\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', 0, 0, 0, 1, 1, 1, 1, 0, 1, 0, 1, 1, 0, 0),
	(503, 10, 'mobile', '手机', '', '', 0, 0, '/^(13|15)[0-9]{9}$/', '手机号格式不对', 'text', 'array (\n  \'size\' => \'15\',\n  \'defaultvalue\' => \'\',\n  \'ispassword\' => \'0\',\n)', '', '-99', '-99', 0, 0, 0, 1, 1, 1, 0, 0, 1, 0, 1, 1, 0, 0),
	(504, 10, 'telephone', '电话', '', '', 0, 0, '/^[0-9-]{6,13}$/', '电话格式不对', 'text', 'array (\n  \'size\' => \'20\',\n  \'defaultvalue\' => \'\',\n  \'ispassword\' => \'0\',\n)', '', '-99', '-99', 0, 0, 0, 1, 1, 1, 0, 0, 1, 0, 1, 1, 0, 0),
	(505, 10, 'qq', 'QQ', '', '', 0, 0, '/^[0-9]{5,20}$/', 'QQ号格式不对', 'text', 'array (\n  \'size\' => \'20\',\n  \'defaultvalue\' => \'\',\n  \'ispassword\' => \'0\',\n)', '', '-99', '-99', 0, 0, 0, 1, 1, 1, 0, 0, 1, 0, 1, 1, 0, 0),
	(506, 10, 'msn', 'MSN', '', '', 0, 0, '/^[\\w\\-\\.]+@[\\w\\-\\.]+(\\.\\w+)+$/', 'MSN格式不对', 'text', 'array (\n  \'size\' => \'40\',\n  \'defaultvalue\' => \'\',\n  \'ispassword\' => \'0\',\n)', '', '-99', '-99', 0, 0, 0, 1, 1, 1, 0, 0, 1, 0, 1, 1, 0, 0),
	(507, 10, 'address', '地址', '', '', 0, 0, '', '', 'text', 'array (\n  \'size\' => \'50\',\n  \'defaultvalue\' => \'\',\n  \'ispassword\' => \'0\',\n)', '', '-99', '-99', 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 1, 1, 0, 0),
	(508, 10, 'postcode', '邮编', '', '', 0, 0, '/^[0-9]{6}$/', '邮编格式不对', 'text', 'array (\n  \'size\' => \'6\',\n  \'defaultvalue\' => \'\',\n  \'ispassword\' => \'0\',\n)', '', '-99', '-99', 0, 0, 0, 1, 1, 1, 1, 0, 1, 0, 1, 1, 0, 0),
	(534, 11, 'companyname', '企业名称', '', '', 0, 100, '', '', 'text', 'array (\n  \'size\' => \'35\',\n  \'defaultvalue\' => \'\',\n  \'ispassword\' => \'0\',\n)', '', '-99', '-99', 0, 0, 0, 1, 1, 1, 0, 0, 1, 0, 1, 1, 0, 0),
	(535, 11, 'catids', '企业库', '', 'size="8" style="width:195px;"', 0, 200, '', '', 'catids', 'array (\n  \'defaultvalue\' => \'\',\n)', 'onchange="select_catids();"', '-99', '-99', 0, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0),
	(536, 11, 'pattern', '经营模式', '', '', 0, 255, '', '', 'box', 'array (\n  \'options\' => \'生产型|生产型\r\n贸易型|贸易型\r\n服务型|服务型\r\n政府或其他机构|政府或其他机构\',\n  \'boxtype\' => \'checkbox\',\n  \'fieldtype\' => \'CHAR\',\n  \'cols\' => \'5\',\n  \'width\' => \'80\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', 0, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0),
	(537, 11, 'products', '主营产品或服务', '', '', 0, 0, '', '', 'textarea', 'array (\n  \'rows\' => \'4\',\n  \'cols\' => \'80\',\n  \'defaultvalue\' => \'\',\n  \'enablehtml\' => \'0\',\n  \'enablekeylink\' => \'0\',\n)', '', '-99', '-99', 0, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 1, 1, 0),
	(538, 11, 'genre', '公司类型', '', '', 0, 30, '', '', 'box', 'array (\n  \'options\' => \'企业单位|企业单位\r\n个体经营|个体经营\r\n事业单位或社会团体|事业单位或社会团体\r\n未经工商注册，个人|未经工商注册，个人\',\n  \'boxtype\' => \'radio\',\n  \'fieldtype\' => \'VARCHAR\',\n  \'cols\' => \'5\',\n  \'width\' => \'80\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'未经工商注册，个人\',\n)', '', '-99', '-99', 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 1, 1, 2, 0),
	(539, 11, 'areaname', '公司所在地', '', '', 0, 10, '', '', 'box', 'array (\n  \'options\' => \'北京|北京\r\n上海|上海\r\n杭州|杭州\r\n广州|广州\r\n深圳|深圳\r\n南京|南京\r\n武汉|武汉\r\n天津|天津\r\n成都|成都\r\n哈尔滨|哈尔滨\r\n重庆|重庆\r\n宁波|宁波\r\n无锡|无锡\r\n济南|济南\r\n苏州|苏州\r\n温州|温州\r\n青岛|青岛\r\n沈阳|沈阳\r\n福州|福州\r\n西安|西安\r\n长沙|长沙\r\n合肥|合肥\r\n南宁|南宁\r\n南昌|南昌\r\n郑州|郑州\r\n厦门|厦门\r\n大连|大连\r\n常州|常州\r\n石家庄|石家庄\r\n东莞|东莞\r\n安徽|安徽\r\n福建|福建\r\n甘肃|甘肃\r\n广东|广东\r\n广西|广西\r\n贵州|贵州\r\n海南|海南\r\n河北|河北\r\n黑龙江|黑龙江\r\n河南|河南\r\n湖北|湖北\r\n湖南|湖南\r\n江苏|江苏\r\n江西|江西\r\n吉林|吉林\r\n辽宁|辽宁\r\n内蒙古|内蒙古\r\n宁夏|宁夏\r\n青海|青海\r\n山东|山东\r\n山西|山西\r\n陕西|陕西\r\n四川|四川\r\n新疆|新疆\r\n西藏|西藏\r\n云南|云南\r\n浙江|浙江\r\n澳门|澳门\r\n台湾|台湾\r\n香港|香港\r\n惠州|惠州\r\n佛山|佛山\r\n珠海|珠海\r\n中山|中山\r\n海外|海外\r\n其它|其它\',\n  \'boxtype\' => \'select\',\n  \'fieldtype\' => \'CHAR\',\n  \'cols\' => \'\',\n  \'width\' => \'\',\n  \'size\' => \'\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 1, 1, 3, 0),
	(540, 11, 'address', '经营地址', '', '', 0, 100, '', '', 'text', 'array (\n  \'size\' => \'50\',\n  \'defaultvalue\' => \'\',\n  \'ispassword\' => \'0\',\n)', '', '-99', '-99', 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 1, 1, 4, 0),
	(541, 12, 'id', 'ID', '', '', 0, 0, '', '', 'number', '', '', '', '', 1, 1, 0, 1, 0, 1, 0, 1, 1, 1, 1, 0, 0, 0),
	(542, 12, 'title', '标题', '', 'inputtitle', 0, 255, '', '', 'text', 'array (\n  \'size\' => \'80\',\n  \'defaultvalue\' => \'\',\n  \'ispassword\' => \'0\',\n)', '', '-99', '-99', 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 1, 1, 4, 0),
	(543, 12, 'style', '颜色和字型', '', '', 0, 0, '', '', 'style', '', '', '-99', '-99', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 5, 0),
	(544, 12, 'keywords', '关键字', '', '', 0, 30, '', '', 'keyword', 'array (\n  \'size\' => \'30\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 6, 0),
	(545, 12, 'thumb', '缩略图', '', '', 0, 100, '', '', 'image', 'array (\n  \'size\' => \'50\',\n  \'defaultvalue\' => \'\',\n  \'upload_maxsize\' => \'1024\',\n  \'upload_allowext\' => \'gif|jpg|jpeg|png|bmp\',\n  \'isselectimage\' => \'0\',\n  \'isthumb\' => \'1\',\n  \'thumb_width\' => \'300\',\n  \'thumb_height\' => \'300\',\n  \'iswatermark\' => \'1\',\n  \'watermark_img\' => \'images/watermark.gif\',\n)', '', '-99', '-99', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 7, 0),
	(546, 12, 'content', '内容', '', '', 0, 0, '', '', 'editor', 'array (\n  \'toolbar\' => \'standard\',\n  \'width\' => \'100%\',\n  \'height\' => \'300\',\n  \'defaultvalue\' => \'\',\n  \'storage\' => \'database\',\n  \'enablekeylink\' => \'0\',\n  \'replacenum\' => \'1\',\n  \'enablesaveimage\' => \'1\',\n)', '', '-99', '-99', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 10, 0),
	(547, 12, 'elite', '推荐', '', '', 0, 255, '', '', 'box', 'array (\n  \'options\' => \'推荐|1\r\n不推荐|0\',\n  \'boxtype\' => \'radio\',\n  \'fieldtype\' => \'TINYINT\',\n  \'cols\' => \'5\',\n  \'width\' => \'80\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'0\',\n)', '', '-99', '-99', 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 11, 0),
	(548, 12, 'listorder', '排序', '', '', 0, 0, '', '', 'number', 'array (\n  \'minnumber\' => \'1\',\n  \'maxnumber\' => \'\',\n  \'decimaldigits\' => \'0\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 12, 0),
	(549, 12, 'inputtime', '添加时间', '', '', 0, 0, '', '', 'number', 'array (\n  \'minnumber\' => \'1\',\n  \'maxnumber\' => \'\',\n  \'decimaldigits\' => \'0\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', 1, 1, 0, 1, 0, 0, 0, 1, 0, 0, 1, 1, 20, 0),
	(550, 12, 'updatetime', '更新时间', '', '', 0, 0, '', '', 'number', 'array (\n  \'minnumber\' => \'1\',\n  \'maxnumber\' => \'\',\n  \'decimaldigits\' => \'0\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', 1, 1, 0, 1, 0, 0, 0, 1, 0, 0, 1, 1, 21, 0),
	(551, 12, 'status', '状态', '', '', 0, 0, '', '', 'number', 'array (\n  \'minnumber\' => \'1\',\n  \'maxnumber\' => \'99\',\n  \'decimaldigits\' => \'0\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 22, 0),
	(552, 12, 'userid', '发布人', '', '', 0, 0, '', '', 'userid', '', '', '-99', '-99', 1, 1, 0, 1, 0, 0, 1, 0, 0, 0, 1, 1, 23, 0),
	(553, 13, 'id', 'ID', '', '', 0, 0, '', '', 'number', '', '', '', '', 1, 1, 0, 1, 0, 1, 0, 1, 1, 1, 1, 0, 0, 0),
	(554, 13, 'title', '产品名称', '', 'inputtitle', 3, 80, '', '', 'text', 'array (\n  \'size\' => \'80\',\n  \'defaultvalue\' => \'\',\n  \'ispassword\' => \'0\',\n)', '', '-99', '-99', 0, 1, 0, 1, 1, 1, 0, 0, 0, 0, 1, 1, 2, 0),
	(555, 13, 'catid', '所属分类', '', '', 0, 6, '', '', 'catid', 'array (\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 1, 1, 3, 0),
	(556, 13, 'standard', '产品型号', '', '', 0, 50, '', '', 'text', 'array (\n  \'size\' => \'50\',\n  \'defaultvalue\' => \'\',\n  \'ispassword\' => \'0\',\n)', '', '-99', '-99', 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 20, 0),
	(557, 13, 'listorder', '排序', '', '', 0, 0, '', '', 'number', 'array (\n  \'minnumber\' => \'1\',\n  \'maxnumber\' => \'\',\n  \'decimaldigits\' => \'0\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 20, 0),
	(558, 13, 'style', '颜色和字型', '', '', 0, 0, '', '', 'style', '', '', '-99', '-99', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 20, 0),
	(559, 13, 'keywords', '关键字', '', '', 0, 30, '', '', 'keyword', 'array (\n  \'size\' => \'30\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 1, 1, 20, 0),
	(560, 13, 'thumb', '缩略图', '', '', 0, 100, '', '', 'image', 'array (\n  \'size\' => \'50\',\n  \'defaultvalue\' => \'\',\n  \'upload_maxsize\' => \'1024\',\n  \'upload_allowext\' => \'gif|jpg|jpeg|png|bmp\',\n  \'isselectimage\' => \'0\',\n  \'isthumb\' => \'1\',\n  \'thumb_width\' => \'800\',\n  \'thumb_height\' => \'600\',\n  \'iswatermark\' => \'1\',\n  \'watermark_img\' => \'images/watermark.gif\',\n)', '', '-99', '-99', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 20, 0),
	(561, 13, 'content', '详细说明', '', '', 0, 0, '', '', 'editor', 'array (\n  \'toolbar\' => \'standard\',\n  \'width\' => \'100%\',\n  \'height\' => \'300\',\n  \'defaultvalue\' => \'\',\n  \'storage\' => \'database\',\n  \'enablekeylink\' => \'1\',\n  \'replacenum\' => \'1\',\n  \'enablesaveimage\' => \'1\',\n)', '', '-99', '-99', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 20, 0),
	(562, 13, 'userid', '发布人', '', '', 0, 0, '', '', 'number', 'array (\n  \'minnumber\' => \'0\',\n  \'maxnumber\' => \'\',\n  \'decimaldigits\' => \'0\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', 1, 1, 0, 1, 1, 0, 1, 0, 0, 0, 1, 1, 22, 0),
	(563, 13, 'price', '产品价格', '单位（元）', '', 0, 0, '', '', 'number', 'array (\n  \'minnumber\' => \'0\',\n  \'maxnumber\' => \'\',\n  \'decimaldigits\' => \'2\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', 0, 0, 0, 1, 1, 0, 1, 0, 0, 0, 1, 1, 23, 0),
	(564, 13, 'quantifier', '计量单位', '', '', 0, 6, '', '', 'box', 'array (\n  \'options\' => \'把|把\r\n包|包\r\n本|本\r\n部|部\r\n打|打\r\n袋|袋\r\n单|单\r\n刀|刀\r\n吊|吊\r\n顶|顶\r\n对|对\r\n吨|吨\r\n幅|幅\r\n个|个\r\n根|根\r\n公斤|公斤\r\n公升|公升\r\n罐|罐\r\n毫米|毫米\r\n毫升|毫升\r\n盒|盒\r\n架|架\r\n件|件\r\n节|节\r\n具|具\r\n卷|卷\r\n卡|卡\r\n棵|棵\r\n颗|颗\r\n克|克\r\n块|块\r\n款|款\r\n厘米|厘米\r\n立方|立方\r\n立方根|立方根\r\n粒|粒\r\n辆|辆\r\n码|码\r\n枚|枚\r\n米|米\r\n面|面\r\n盆|盆\r\n片|片\r\n票|票\r\n平方厘米|平方厘米\r\n平方米|平方米\r\n平方英尺|平方英尺\r\n瓶|瓶\r\n千克|千克\r\n升|升\r\n束|束\r\n双|双\r\n台|台\r\n套|套\r\n条|条\r\n桶|桶\r\n头|头\r\n箱|箱\r\n英寸|英寸\r\n盏|盏\r\n张|张\r\n支|支\r\n只|只\r\n株|株\r\n组|组\r\n尊|尊\r\n座|座\',\n  \'boxtype\' => \'select\',\n  \'fieldtype\' => \'VARCHAR\',\n  \'cols\' => \'5\',\n  \'width\' => \'80\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 1, 1, 24, 0),
	(565, 13, 'elite', '推荐', '', '', 0, 1, '', '', 'box', 'array (\n  \'options\' => \'推荐|1\r\n不推荐|0\',\n  \'boxtype\' => \'radio\',\n  \'fieldtype\' => \'TINYINT\',\n  \'cols\' => \'5\',\n  \'width\' => \'80\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'0\',\n)', '', '-99', '-99', 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 25, 0),
	(566, 13, 'status', '状态', '', '', 0, 2, '', '', 'box', 'array (\n  \'options\' => \'\',\n  \'boxtype\' => \'radio\',\n  \'fieldtype\' => \'CHAR\',\n  \'cols\' => \'\',\n  \'width\' => \'\',\n  \'size\' => \'\',\n  \'defaultvalue\' => \'0\',\n)', '', '-99', '-99', 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 26, 0),
	(567, 13, 'inputtime', '添加时间', '', '', 0, 0, '', '', 'number', 'array (\n  \'minnumber\' => \'1\',\n  \'maxnumber\' => \'\',\n  \'decimaldigits\' => \'0\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', 1, 1, 0, 1, 0, 0, 0, 1, 0, 0, 1, 1, 27, 0),
	(568, 13, 'updatetime', '更新时间', '', '', 0, 0, '', '', 'number', 'array (\n  \'minnumber\' => \'1\',\n  \'maxnumber\' => \'\',\n  \'decimaldigits\' => \'0\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', 1, 1, 0, 1, 0, 0, 0, 1, 0, 0, 1, 1, 28, 0),
	(569, 14, 'id', 'ID', '', '', 0, 0, '', '', 'number', '', '', '', '', 1, 1, 0, 1, 0, 1, 0, 1, 1, 1, 1, 0, 0, 0),
	(570, 14, 'tid', '商机类型', '', '', 0, 1, '', '', 'box', 'array (\n  \'options\' => \'供应|1\r\n求购|2\r\n二手|3\r\n促销|4\',\n  \'boxtype\' => \'radio\',\n  \'fieldtype\' => \'TINYINT\',\n  \'cols\' => \'5\',\n  \'width\' => \'80\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'1\',\n)', 'onclick="buy_tid(this.value)"', '-99', '-99', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0),
	(571, 14, 'title', '产品名称', '', 'inputtitle', 3, 80, '', '', 'text', 'array (\n  \'size\' => \'80\',\n  \'defaultvalue\' => \'\',\n  \'ispassword\' => \'0\',\n)', '', '-99', '-99', 0, 1, 0, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 0),
	(572, 14, 'catid', '所属分类', '', '', 0, 6, '', '', 'catid', 'array (\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 2, 0),
	(573, 14, 'standard', '产品型号', '', '', 0, 50, '', '', 'text', 'array (\n  \'size\' => \'50\',\n  \'defaultvalue\' => \'\',\n  \'ispassword\' => \'0\',\n)', '', '-99', '-99', 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 20, 0),
	(574, 14, 'listorder', '排序', '', '', 0, 0, '', '', 'number', 'array (\n  \'minnumber\' => \'1\',\n  \'maxnumber\' => \'\',\n  \'decimaldigits\' => \'0\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 20, 0),
	(575, 14, 'style', '颜色和字型', '', '', 0, 0, '', '', 'style', '', '', '2,3,4,5,6,7,8', '-99', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 20, 0),
	(576, 14, 'keywords', '关键字', '', '', 0, 30, '', '', 'keyword', 'array (\n  \'size\' => \'30\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 1, 1, 20, 0),
	(577, 14, 'thumb', '缩略图', '', '', 0, 100, '', '', 'image', 'array (\n  \'size\' => \'50\',\n  \'defaultvalue\' => \'\',\n  \'upload_maxsize\' => \'1024\',\n  \'upload_allowext\' => \'gif|jpg|jpeg|png|bmp\',\n  \'isselectimage\' => \'0\',\n  \'isthumb\' => \'1\',\n  \'thumb_width\' => \'800\',\n  \'thumb_height\' => \'600\',\n  \'iswatermark\' => \'1\',\n  \'watermark_img\' => \'images/watermark.gif\',\n)', '', '-99', '-99', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 20, 0),
	(578, 14, 'content', '详细说明', '', '', 0, 0, '', '', 'editor', 'array (\n  \'toolbar\' => \'standard\',\n  \'width\' => \'100%\',\n  \'height\' => \'300\',\n  \'defaultvalue\' => \'\',\n  \'storage\' => \'database\',\n  \'enablekeylink\' => \'1\',\n  \'replacenum\' => \'1\',\n  \'enablesaveimage\' => \'1\',\n)', '', '-99', '-99', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 20, 0),
	(579, 14, 'userid', '发布人', '', '', 0, 0, '', '', 'number', 'array (\n  \'minnumber\' => \'0\',\n  \'maxnumber\' => \'\',\n  \'decimaldigits\' => \'0\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 20, 0),
	(580, 14, 'price', '产品价格', '单位（元）', '', 0, 0, '', '', 'number', 'array (\n  \'minnumber\' => \'0\',\n  \'maxnumber\' => \'\',\n  \'decimaldigits\' => \'2\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', 0, 0, 0, 1, 1, 0, 1, 0, 0, 0, 1, 1, 20, 0),
	(581, 14, 'quantifier', '计量单位', '', '', 0, 6, '', '', 'box', 'array (\n  \'options\' => \'把|把\r\n包|包\r\n本|本\r\n部|部\r\n打|打\r\n袋|袋\r\n单|单\r\n刀|刀\r\n吊|吊\r\n顶|顶\r\n对|对\r\n吨|吨\r\n幅|幅\r\n个|个\r\n根|根\r\n公斤|公斤\r\n公升|公升\r\n罐|罐\r\n毫米|毫米\r\n毫升|毫升\r\n盒|盒\r\n架|架\r\n件|件\r\n节|节\r\n具|具\r\n卷|卷\r\n卡|卡\r\n棵|棵\r\n颗|颗\r\n克|克\r\n块|块\r\n款|款\r\n厘米|厘米\r\n立方|立方\r\n立方根|立方根\r\n粒|粒\r\n辆|辆\r\n码|码\r\n枚|枚\r\n米|米\r\n面|面\r\n盆|盆\r\n片|片\r\n票|票\r\n平方厘米|平方厘米\r\n平方米|平方米\r\n平方英尺|平方英尺\r\n瓶|瓶\r\n千克|千克\r\n升|升\r\n束|束\r\n双|双\r\n台|台\r\n套|套\r\n条|条\r\n桶|桶\r\n头|头\r\n箱|箱\r\n英寸|英寸\r\n盏|盏\r\n张|张\r\n支|支\r\n只|只\r\n株|株\r\n组|组\r\n尊|尊\r\n座|座\',\n  \'boxtype\' => \'select\',\n  \'fieldtype\' => \'CHAR\',\n  \'cols\' => \'5\',\n  \'width\' => \'80\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 1, 1, 21, 0),
	(582, 14, 'period', '信息有效期', '', '', 0, 3, '', '', 'box', 'array (\n  \'options\' => \'10天|10\r\n20天|20\r\n1个月|30\r\n3个月|90\r\n6个月|180\',\n  \'boxtype\' => \'radio\',\n  \'fieldtype\' => \'TINYINT\',\n  \'cols\' => \'5\',\n  \'width\' => \'80\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'180\',\n)', '', '-99', '-99', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 24, 0),
	(583, 14, 'elite', '推荐', '', '', 0, 255, '', '', 'box', 'array (\n  \'options\' => \'推荐|1\r\n不推荐|0\',\n  \'boxtype\' => \'radio\',\n  \'fieldtype\' => \'TINYINT\',\n  \'cols\' => \'5\',\n  \'width\' => \'80\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'0\',\n)', '', '-99', '-99', 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 26, 0),
	(584, 14, 'status', '状态', '', '', 0, 0, '', '', 'box', '', '', '-99', '-99', 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 27, 0),
	(585, 14, 'inputtime', '添加时间', '', '', 0, 0, '', '', 'number', 'array (\n  \'minnumber\' => \'1\',\n  \'maxnumber\' => \'\',\n  \'decimaldigits\' => \'0\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', 1, 1, 0, 1, 0, 0, 0, 1, 0, 0, 1, 1, 30, 0),
	(586, 14, 'updatetime', '更新时间', '', '', 0, 0, '', '', 'number', 'array (\n  \'minnumber\' => \'1\',\n  \'maxnumber\' => \'\',\n  \'decimaldigits\' => \'0\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', 1, 1, 0, 1, 0, 0, 0, 1, 0, 0, 1, 1, 31, 0),
	(587, 15, 'station', '岗位', '', '', 1, 0, '', '', 'typeid', 'array (\n  \'minnumber\' => \'1\',\n  \'maxnumber\' => \'\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', 0, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0),
	(588, 15, 'title', '职位名称', '', '', 3, 80, '', '', 'text', 'array (\n  \'size\' => \'50\',\n  \'defaultvalue\' => \'\',\n  \'ispassword\' => \'0\',\n)', '', '-99', '-99', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0),
	(589, 15, 'workplace', '工作地点', '', '', 0, 10, '', '', 'box', 'array (\n  \'options\' => \'北京|北京\r\n上海|上海\r\n杭州|杭州\r\n广州|广州\r\n深圳|深圳\r\n南京|南京\r\n武汉|武汉\r\n天津|天津\r\n成都|成都\r\n哈尔滨|哈尔滨\r\n重庆|重庆\r\n宁波|宁波\r\n无锡|无锡\r\n济南|济南\r\n苏州|苏州\r\n温州|温州\r\n青岛|青岛\r\n沈阳|沈阳\r\n福州|福州\r\n西安|西安\r\n长沙|长沙\r\n合肥|合肥\r\n南宁|南宁\r\n南昌|南昌\r\n郑州|郑州\r\n厦门|厦门\r\n大连|大连\r\n常州|常州\r\n石家庄|石家庄\r\n东莞|东莞\r\n安徽|安徽\r\n福建|福建\r\n甘肃|甘肃\r\n广东|广东\r\n广西|广西\r\n贵州|贵州\r\n海南|海南\r\n河北|河北\r\n黑龙江|黑龙江\r\n河南|河南\r\n湖北|湖北\r\n湖南|湖南\r\n江苏|江苏\r\n江西|江西\r\n吉林|吉林\r\n辽宁|辽宁\r\n内蒙古|内蒙古\r\n宁夏|宁夏\r\n青海|青海\r\n山东|山东\r\n山西|山西\r\n陕西|陕西\r\n四川|四川\r\n新疆|新疆\r\n西藏|西藏\r\n云南|云南\r\n浙江|浙江\r\n江苏|江苏\r\n浙江|浙江\r\n上海|上海\r\n广州|广州\r\n深圳|深圳\r\n中山|中山\r\n珠海|珠海\r\n佛山|佛山\r\n东莞|东莞\r\n惠州|惠州\r\n香港|香港\r\n澳门|澳门\r\n台湾|台湾\r\n海外|海外\r\n其它|其它\',\n  \'boxtype\' => \'select\',\n  \'fieldtype\' => \'VARCHAR\',\n  \'cols\' => \'\',\n  \'width\' => \'\',\n  \'size\' => \'\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0),
	(590, 15, 'status', '状态', '', '', 0, 0, '', '', 'number', 'array (\n  \'minnumber\' => \'1\',\n  \'maxnumber\' => \'99\',\n  \'decimaldigits\' => \'0\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	(591, 15, 'style', '颜色和字型', '', '', 0, 0, '', '', 'style', '', '', '2,3,4,5,6,7,8', '-99', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0),
	(592, 15, 'employ', '招聘人数', '', '', 0, 5, '', '', 'number', 'array (\n  \'minnumber\' => \'1\',\n  \'maxnumber\' => \'1000\',\n  \'decimaldigits\' => \'0\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 2, 0),
	(593, 15, 'experience', '工作经验', '', '', 0, 6, '', '', 'box', 'array (\n  \'options\' => \'不限|不限\r\n1年|1年\r\n2年|2年\r\n3年|3年\r\n4年|4年\r\n5年|5年\r\n6年以上|6年以上\',\n  \'boxtype\' => \'select\',\n  \'fieldtype\' => \'VARCHAR\',\n  \'cols\' => \'5\',\n  \'width\' => \'80\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'1年\',\n)', '', '-99', '-99', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 3, 0),
	(594, 15, 'worktype', '工作性质', '', '', 0, 6, '', '', 'box', 'array (\n  \'options\' => \'不限|不限\r\n全职|全职\r\n兼职|兼职\',\n  \'boxtype\' => \'select\',\n  \'fieldtype\' => \'VARCHAR\',\n  \'cols\' => \'5\',\n  \'width\' => \'80\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'全职\',\n)', '', '-99', '-99', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 4, 0),
	(595, 15, 'sex', '性别要求', '', '', 0, 10, '', '', 'box', 'array (\n  \'options\' => \'不限|不限\r\n男|男\r\n女|女\',\n  \'boxtype\' => \'select\',\n  \'fieldtype\' => \'VARCHAR\',\n  \'cols\' => \'5\',\n  \'width\' => \'80\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'不限\',\n)', '', '-99', '-99', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 5, 0),
	(596, 15, 'degree', '学历要求', '', '', 0, 6, '', '', 'box', 'array (\n  \'options\' => \'不限|不限\r\n高中|高中\r\n大专|大专\r\n本科|本科\r\n研究生|研究生\r\n硕士|硕士\r\n博士|博士\',\n  \'boxtype\' => \'select\',\n  \'fieldtype\' => \'VARCHAR\',\n  \'cols\' => \'5\',\n  \'width\' => \'80\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'大专\',\n)', '', '-99', '-99', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 6, 0),
	(597, 15, 'pay', '月薪', '单位：元', '', 0, 8, '', '', 'number', 'array (\n  \'minnumber\' => \'1\',\n  \'maxnumber\' => \'\',\n  \'decimaldigits\' => \'0\',\n  \'defaultvalue\' => \'面议\',\n)', '', '-99', '-99', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 7, 0),
	(598, 15, 'period', '有效期', '', '', 0, 3, '', '', 'box', 'array (\n  \'options\' => \'三天|3\r\n一周|7\r\n两周|14\r\n三周|21\r\n一个月|30\r\n两个月|60\r\n三个月|90\r\n不限制|0\',\n  \'boxtype\' => \'select\',\n  \'fieldtype\' => \'TINYINT\',\n  \'cols\' => \'5\',\n  \'width\' => \'80\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'7\',\n)', '', '-99', '-99', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 8, 0),
	(599, 15, 'listorder', '排序', '', '', 0, 0, '', '', 'number', 'array (\n  \'minnumber\' => \'1\',\n  \'maxnumber\' => \'\',\n  \'decimaldigits\' => \'0\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 20, 0),
	(600, 15, 'content', '职位描述', '', '', 0, 0, '', '', 'editor', 'array (\n  \'toolbar\' => \'basic\',\n  \'width\' => \'100%\',\n  \'height\' => \'300\',\n  \'defaultvalue\' => \'\',\n  \'storage\' => \'database\',\n  \'enablekeylink\' => \'1\',\n  \'replacenum\' => \'1\',\n  \'enablesaveimage\' => \'1\',\n)', '', '-99', '-99', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 20, 0),
	(601, 15, 'elite', '推荐', '', '', 0, 1, '', '', 'box', 'array (\n  \'options\' => \'推荐|1\r\n不推荐|0\',\n  \'boxtype\' => \'radio\',\n  \'fieldtype\' => \'TINYINT\',\n  \'cols\' => \'5\',\n  \'width\' => \'80\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'0\',\n)', '', '-99', '-99', 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 21, 0),
	(602, 15, 'userid', '发布人', '', '', 0, 0, '', '', 'number', 'array (\n  \'minnumber\' => \'0\',\n  \'maxnumber\' => \'\',\n  \'decimaldigits\' => \'0\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 22, 0),
	(603, 15, 'inputtime', '添加时间', '', '', 0, 0, '', '', 'number', 'array (\n  \'minnumber\' => \'1\',\n  \'maxnumber\' => \'\',\n  \'decimaldigits\' => \'0\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', 1, 1, 0, 1, 0, 0, 0, 1, 0, 0, 1, 1, 30, 0),
	(604, 15, 'updatetime', '更新时间', '', '', 0, 0, '', '', 'number', 'array (\n  \'minnumber\' => \'1\',\n  \'maxnumber\' => \'\',\n  \'decimaldigits\' => \'0\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', 1, 1, 0, 1, 0, 0, 0, 1, 0, 0, 1, 1, 31, 0),
	(605, 16, 'vid', '视频ID', '', '', 0, 0, '', '', 'number', 'array (\n  \'minnumber\' => \'0\',\n  \'maxnumber\' => \'\',\n  \'decimaldigits\' => \'0\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', 1, 1, 0, 1, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0),
	(606, 16, 'catid', '栏目', '', '', 1, 6, '/^[0-9]{1,6}$/', '请选择栏目', 'catid', 'array (\n  \'defaultvalue\' => \'\',\n)', 'require="true" compare=">0" datatype="compare" msgid="specialmsg" msg="请选择所属类别"', '-99', '-99', 0, 1, 0, 1, 0, 1, 1, 0, 1, 1, 1, 0, 1, 0),
	(607, 16, 'timelen', '视频时长', '', '', 0, 0, '', '', 'number', 'array (\n  \'minnumber\' => \'1\',\n  \'maxnumber\' => \'10\',\n  \'decimaldigits\' => \'0\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', 0, 1, 0, 0, 0, 1, 0, 0, 1, 1, 0, 1, 13, 0),
	(608, 16, 'title', '标题', '', 'inputtitle', 1, 80, '', '', 'title', 'array (\n  \'size\' => \'80\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', 0, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 4, 0),
	(609, 16, 'style', '颜色和字型', '', '', 0, 0, '', '', 'style', '', '', '-99', '-99', 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 5, 0),
	(610, 16, 'thumb', '缩略图', '', '', 0, 100, '', '', 'image', 'array (\n  \'size\' => \'50\',\n  \'defaultvalue\' => \'\',\n  \'upload_maxsize\' => \'1024\',\n  \'upload_allowext\' => \'jpg|jpeg|gif|png|bmp\',\n  \'isselectimage\' => \'1\',\n  \'isthumb\' => \'1\',\n  \'thumb_width\' => \'300\',\n  \'thumb_height\' => \'300\',\n  \'iswatermark\' => \'1\',\n  \'watermark_img\' => \'images/watermark.gif\',\n)', '', '', '', 0, 1, 0, 1, 0, 1, 1, 0, 1, 1, 1, 0, 6, 0),
	(611, 16, 'keywords', '关键词', '多关键词之间用空格隔开', '', 0, 40, '', '', 'keyword', 'array (\n  \'size\' => \'50\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', 0, 1, 0, 1, 1, 1, 1, 0, 0, 1, 1, 1, 7, 0),
	(612, 16, 'author', '作者', '', '', 0, 30, '', '', 'author', 'array (\n  \'size\' => \'30\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', 0, 0, 0, 1, 1, 0, 0, 0, 1, 1, 1, 1, 8, 0),
	(613, 16, 'copyfrom', '来源', '', '', 0, 0, '', '', 'copyfrom', 'array (\n  \'size\' => \'30\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 1, 9, 0),
	(614, 16, 'description', '摘要', '', '', 0, 255, '', '', 'textarea', 'array (\n  \'rows\' => \'4\',\n  \'cols\' => \'50\',\n  \'defaultvalue\' => \'\',\n  \'enablekeylink\' => \'0\',\n  \'replacenum\' => \'\',\n)', 'style="width:80%"', '-99', '-99', 0, 1, 0, 1, 0, 1, 0, 0, 1, 1, 1, 1, 10, 0),
	(615, 16, 'userid', '发布人', '', '', 0, 0, '', '', 'userid', '', '', '', '', 1, 1, 0, 1, 0, 1, 1, 0, 0, 0, 1, 0, 11, 0),
	(616, 16, 'updatetime', '更新时间', '', '', 0, 0, '', '', 'datetime', 'array (\r\n  \'dateformat\' => \'int\',\r\n  \'format\' => \'Y-m-d H:i:s\',\r\n  \'defaulttype\' => \'1\',\r\n  \'defaultvalue\' => \'\',\r\n)', '', '', '', 1, 1, 0, 1, 0, 1, 1, 1, 0, 0, 1, 0, 12, 0),
	(617, 16, 'content', '内容', '', '', 1, 999999, '', '', 'editor', 'array (\n  \'toolbar\' => \'standard\',\n  \'width\' => \'100%\',\n  \'height\' => \'150\',\n  \'defaultvalue\' => \'\',\n  \'storage\' => \'database\',\n  \'enablekeylink\' => \'1\',\n  \'replacenum\' => \'2\',\n  \'enablesaveimage\' => \'1\',\n)', '', '-99', '-99', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 13, 0),
	(618, 16, 'islink', '转向链接', '', '', 0, 0, '', '', 'islink', '', '', '-99', '-99', 0, 1, 0, 0, 0, 1, 0, 0, 1, 1, 0, 0, 14, 0),
	(619, 16, 'inputtime', '发布时间', '', '', 0, 0, '', '', 'datetime', 'array (\n  \'dateformat\' => \'int\',\n  \'format\' => \'Y-m-d H:i:s\',\n  \'defaulttype\' => \'1\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', 0, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 15, 0),
	(620, 16, 'posids', '推荐位', '全选<input boxid=\'posids\' type=\'checkbox\' onclick="checkall(\'posids\')" >', '', 0, 0, '', '', 'posid', 'array (\n  \'cols\' => \'4\',\n  \'width\' => \'125\',\n)', '', '', '', 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 16, 0),
	(621, 16, 'groupids_view', '阅读权限', '全选<input boxid=\'groupids_view\' type=\'checkbox\' onclick="checkall(\'groupids_view\')" >', '', 0, 0, '', '', 'groupid', 'array (\n  \'priv\' => \'view\',\n  \'cols\' => \'4\',\n  \'width\' => \'125\',\n)', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 17, 0),
	(622, 16, 'readpoint', '阅读所需点数', '', '', 0, 5, '', '', 'number', 'array (\n  \'minnumber\' => \'1\',\n  \'maxnumber\' => \'99999\',\n  \'decimaldigits\' => \'0\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 18, 0),
	(623, 16, 'listorder', '排序', '', '', 0, 6, '', '', 'number', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 1, 0, 0, 1, 0, 97, 0),
	(624, 16, 'status', '状态', '', '', 0, 2, '', '', 'box', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 98, 0),
	(625, 16, 'template', '内容页模板', '', '', 0, 30, '', '', 'template', 'array (\n  \'size\' => \'\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 99, 0),
	(848, 28, 'contentid', 'ID', '', '', 0, 0, '', '', 'number', '', '', '', '', 1, 1, 0, 1, 0, 1, 0, 1, 1, 1, 1, 0, 0, 0),
	(849, 28, 'catid', '栏目', '', '', 1, 9999, '/^[0-9]+$/', '请选择所属栏目', 'catid', 'array (\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 0),
	(850, 28, 'typeid', '类别', '', '', 0, 0, '', '', 'typeid', 'array (\n  \'minnumber\' => \'\',\n  \'maxnumber\' => \'\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 2, 1),
	(851, 28, 'areaid', '地区', '', '', 0, 0, '', '', 'areaid', 'array (\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 3, 1),
	(852, 28, 'title', '标题', '', 'inputtitle', 1, 200, '', '', 'title', 'array (\n  \'size\' => \'60\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 4, 0),
	(853, 28, 'style', '颜色和字型', '', '', 0, 0, '', '', 'style', '', '', '', '', 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0, 5, 1),
	(854, 28, 'thumb', '前景图片', '', '', 0, 100, '', '', 'image', 'array (\n  \'size\' => \'60\',\n  \'defaultvalue\' => \'\',\n  \'upload_maxsize\' => \'1024\',\n  \'upload_allowext\' => \'jpg|jpeg|gif|png|bmp\',\n  \'isselectimage\' => \'1\',\n  \'isthumb\' => \'0\',\n  \'thumb_width\' => \'300\',\n  \'thumb_height\' => \'300\',\n  \'iswatermark\' => \'0\',\n  \'watermark_img\' => \'images/watermark.gif\',\n)', '', '-99', '-99', 0, 1, 0, 1, 0, 1, 1, 0, 1, 1, 1, 0, 6, 0),
	(855, 28, 'keywords', '关键词', '多个关键词之间用空格隔开', '', 0, 40, '', '', 'keyword', 'array (\n  \'size\' => \'60\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 1, 0, 0, 1, 1, 1, 7, 1),
	(856, 28, 'description', '摘要', '', '', 0, 500, '', '', 'textarea', 'array (\n  \'rows\' => \'5\',\n  \'cols\' => \'60\',\n  \'defaultvalue\' => \'\',\n  \'enablehtml\' => \'0\',\n  \'enablekeylink\' => \'0\',\n  \'enablefilterword\' => \'0\',\n \'checkcharacter\' => \'1\',\n)', '', '', '', 0, 1, 0, 1, 0, 1, 0, 0, 1, 1, 1, 1, 8, 1),
	(857, 28, 'posids', '推荐位', '全选<input boxid=\'posids\' type=\'checkbox\' onclick="checkall(\'posids\')" >', '', 0, 0, '', '', 'posid', 'array (\r\n  \'cols\' => \'4\',\r\n  \'width\' => \'125\',\r\n)', '', '', '', 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 13, 1),
	(858, 28, 'listorder', '排序', '', '', 1, 1, '', '', 'number', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 1, 0, 0, 1, 0, 97, 0),
	(859, 28, 'url', 'URL', '', '', 0, 100, '', '', 'text', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 96, 0),
	(860, 28, 'userid', '发布人', '', '', 0, 0, '', '', 'userid', '', '', '', '', 1, 1, 0, 1, 0, 1, 1, 0, 0, 0, 1, 0, 9, 0),
	(861, 28, 'updatetime', '更新时间', '', '', 0, 0, '', '', 'datetime', 'array (\r\n  \'dateformat\' => \'int\',\r\n  \'format\' => \'Y-m-d H:i:s\',\r\n  \'defaulttype\' => \'1\',\r\n  \'defaultvalue\' => \'\',\r\n)', '', '', '', 1, 1, 0, 1, 0, 1, 1, 1, 0, 0, 1, 0, 10, 0),
	(862, 28, 'inputtime', '发布时间', '', '', 0, 0, '', '', 'datetime', 'array (\r\n  \'dateformat\' => \'int\',\r\n  \'format\' => \'Y-m-d H:i:s\',\r\n  \'defaulttype\' => \'1\',\r\n  \'defaultvalue\' => \'\',\r\n)', '', '', '', 0, 1, 0, 1, 0, 1, 1, 1, 0, 0, 0, 0, 12, 0),
	(863, 28, 'islink', '转向链接', '', '', 0, 0, '', '', 'islink', '', '', '', '', 0, 1, 0, 1, 0, 1, 0, 0, 1, 1, 1, 0, 32, 1),
	(864, 28, 'prefix', 'html文件名', '', '', 0, 20, '', '', 'text', 'array (\n  \'size\' => \'12\',\n  \'defaultvalue\' => \'\',\n  \'ispassword\' => \'0\',\n)', '', '-99', '-99', 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 19, 1),
	(865, 28, 'status', '状态', '', '', 0, 2, '', '', 'box', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 98, 1),
	(866, 28, 'template', '内容页模板', '', '', 0, 255, '', '', 'template', '', '', '', '', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 99, 1),
	(867, 28, 'content', '内容', '', '', 1, 99999, '', '', 'editor', 'array (\n  \'toolbar\' => \'standard\',\n  \'width\' => \'700\',\n  \'height\' => \'550\',\n  \'defaultvalue\' => \'\',\n  \'storage\' => \'database\',\n  \'enablekeylink\' => \'0\',\n  \'enablefilterword\' => \'0\',\n  \'enablesaveimage\' => \'1\',\n)', '', '', '', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 11, 1),
	(868, 28, 'background', '背景图片', '', '', 0, 255, '', '', 'image', 'array (\n  \'size\' => \'70\',\n  \'defaultvalue\' => \'\',\n  \'upload_maxsize\' => \'1024\',\n  \'upload_allowext\' => \'gif|jpg|jpeg|png|bmp\',\n  \'isselectimage\' => \'0\',\n  \'isthumb\' => \'0\',\n  \'thumb_width\' => \'300\',\n  \'thumb_height\' => \'300\',\n  \'iswatermark\' => \'0\',\n  \'watermark_img\' => \'images/watermark.gif\',\n)', '', '-99', '-99', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 8, 0),
	(869, 28, 'link', '链接', '', '', 0, 0, '', '', 'text', 'array (\n  \'size\' => \'60\',\n  \'defaultvalue\' => \'\',\n  \'ispassword\' => \'0\',\n)', '', '-99', '-99', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 9, 0),
	(870, 29, 'contentid', 'ID', '', '', 0, 0, '', '', 'number', '', '', '', '', 1, 1, 0, 1, 0, 1, 0, 1, 1, 1, 1, 0, 0, 0),
	(871, 29, 'catid', '栏目', '', '', 1, 9999, '/^[0-9]+$/', '请选择所属栏目', 'catid', 'array (\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 0),
	(872, 29, 'typeid', '类别', '', '', 0, 0, '', '', 'typeid', 'array (\n  \'minnumber\' => \'\',\n  \'maxnumber\' => \'\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 2, 1),
	(873, 29, 'areaid', '地区', '', '', 0, 0, '', '', 'areaid', 'array (\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 3, 1),
	(874, 29, 'title', '标题', '', 'inputtitle', 1, 200, '', '', 'title', 'array (\n  \'size\' => \'60\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 4, 0),
	(875, 29, 'style', '颜色和字型', '', '', 0, 0, '', '', 'style', '', '', '', '', 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0, 5, 1),
	(876, 29, 'thumb', '缩略图', '', '', 0, 100, '', '', 'image', 'array (\n  \'size\' => \'70\',\n  \'defaultvalue\' => \'\',\n  \'upload_maxsize\' => \'1024\',\n  \'upload_allowext\' => \'jpg|jpeg|gif|png|bmp\',\n  \'isselectimage\' => \'1\',\n  \'isthumb\' => \'1\',\n  \'thumb_width\' => \'140\',\n  \'thumb_height\' => \'96\',\n  \'iswatermark\' => \'0\',\n  \'watermark_img\' => \'images/watermark.gif\',\n)', '', '-99', '-99', 0, 1, 0, 1, 0, 1, 1, 0, 1, 1, 1, 0, 6, 0),
	(877, 29, 'keywords', '关键词', '多个关键词之间用空格隔开', '', 0, 40, '', '', 'keyword', 'array (\n  \'size\' => \'60\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 1, 0, 0, 1, 1, 1, 7, 1),
	(878, 29, 'description', '摘要', '', '', 0, 500, '', '', 'textarea', 'array (\n  \'rows\' => \'5\',\n  \'cols\' => \'60\',\n  \'defaultvalue\' => \'\',\n  \'enablehtml\' => \'0\',\n  \'enablekeylink\' => \'0\',\n  \'enablefilterword\' => \'0\',\n \'checkcharacter\' => \'1\',\n)', '', '', '', 0, 1, 0, 1, 0, 1, 0, 0, 1, 1, 1, 1, 8, 0),
	(879, 29, 'posids', '推荐位', '全选<input boxid=\'posids\' type=\'checkbox\' onclick="checkall(\'posids\')" >', '', 0, 0, '', '', 'posid', 'array (\r\n  \'cols\' => \'4\',\r\n  \'width\' => \'125\',\r\n)', '', '', '', 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 13, 0),
	(880, 29, 'listorder', '排序', '', '', 1, 1, '', '', 'number', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 1, 0, 0, 1, 0, 97, 0),
	(881, 29, 'url', 'URL', '', '', 0, 100, '', '', 'text', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 96, 0),
	(882, 29, 'userid', '发布人', '', '', 0, 0, '', '', 'userid', '', '', '', '', 1, 1, 0, 1, 0, 1, 1, 0, 0, 0, 1, 0, 9, 0),
	(883, 29, 'updatetime', '更新时间', '', '', 0, 0, '', '', 'datetime', 'array (\r\n  \'dateformat\' => \'int\',\r\n  \'format\' => \'Y-m-d H:i:s\',\r\n  \'defaulttype\' => \'1\',\r\n  \'defaultvalue\' => \'\',\r\n)', '', '', '', 1, 1, 0, 1, 0, 1, 1, 1, 0, 0, 1, 0, 10, 0),
	(884, 29, 'inputtime', '发布时间', '', '', 0, 0, '', '', 'datetime', 'array (\r\n  \'dateformat\' => \'int\',\r\n  \'format\' => \'Y-m-d H:i:s\',\r\n  \'defaulttype\' => \'1\',\r\n  \'defaultvalue\' => \'\',\r\n)', '', '', '', 0, 1, 0, 1, 0, 1, 1, 1, 0, 0, 0, 0, 12, 0),
	(885, 29, 'islink', '转向链接', '', '', 0, 0, '', '', 'islink', '', '', '', '', 0, 1, 0, 1, 0, 1, 0, 0, 1, 1, 1, 0, 32, 1),
	(886, 29, 'prefix', 'html文件名', '', '', 0, 20, '', '', 'text', 'array (\n  \'size\' => \'12\',\n  \'defaultvalue\' => \'\',\n  \'ispassword\' => \'0\',\n)', '', '-99', '-99', 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 19, 1),
	(887, 29, 'status', '状态', '', '', 0, 2, '', '', 'box', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 98, 1),
	(888, 29, 'template', '内容页模板', '', '', 0, 255, '', '', 'template', '', '', '', '', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 99, 1),
	(933, 29, 'content', '内容', '', '', 0, 9999, '', '', 'editor', 'array (\n  \'toolbar\' => \'standard\',\n  \'width\' => \'700\',\n  \'height\' => \'550\',\n  \'defaultvalue\' => \'\',\n  \'storage\' => \'database\',\n  \'enablekeylink\' => \'0\',\n  \'replacenum\' => \'1\',\n  \'enablesaveimage\' => \'0\',\n)', '', '-99', '-99', 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 1, 11, 0),
	(890, 30, 'contentid', 'ID', '', '', 0, 0, '', '', 'number', '', '', '', '', 1, 1, 0, 1, 0, 1, 0, 1, 1, 1, 1, 0, 0, 0),
	(891, 30, 'catid', '栏目', '', '', 1, 9999, '/^[0-9]+$/', '请选择所属栏目', 'catid', 'array (\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 0),
	(892, 30, 'typeid', '类别', '', '', 0, 0, '', '', 'typeid', 'array (\n  \'minnumber\' => \'\',\n  \'maxnumber\' => \'\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 2, 1),
	(893, 30, 'areaid', '地区', '', '', 0, 0, '', '', 'areaid', 'array (\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 3, 1),
	(894, 30, 'title', '标题', '', 'inputtitle', 1, 200, '', '', 'title', 'array (\n  \'size\' => \'60\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 4, 0),
	(895, 30, 'style', '颜色和字型', '', '', 0, 0, '', '', 'style', '', '', '', '', 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0, 5, 1),
	(896, 30, 'thumb', '小图', '', '', 0, 100, '', '', 'image', 'array (\n  \'size\' => \'70\',\n  \'defaultvalue\' => \'\',\n  \'upload_maxsize\' => \'1024\',\n  \'upload_allowext\' => \'jpg|jpeg|gif|png|bmp\',\n  \'isselectimage\' => \'1\',\n  \'isthumb\' => \'0\',\n  \'thumb_width\' => \'300\',\n  \'thumb_height\' => \'300\',\n  \'iswatermark\' => \'0\',\n  \'watermark_img\' => \'images/watermark.gif\',\n)', '', '-99', '-99', 0, 1, 0, 1, 0, 1, 1, 0, 1, 1, 1, 0, 6, 0),
	(897, 30, 'keywords', '关键词', '多个关键词之间用空格隔开', '', 0, 40, '', '', 'keyword', 'array (\n  \'size\' => \'60\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 1, 0, 0, 1, 1, 1, 7, 1),
	(898, 30, 'description', '摘要', '', '', 0, 500, '', '', 'textarea', 'array (\n  \'rows\' => \'5\',\n  \'cols\' => \'60\',\n  \'defaultvalue\' => \'\',\n  \'enablehtml\' => \'0\',\n  \'enablekeylink\' => \'0\',\n  \'enablefilterword\' => \'0\',\n \'checkcharacter\' => \'1\',\n)', '', '', '', 0, 1, 0, 1, 0, 1, 0, 0, 1, 1, 1, 1, 8, 1),
	(899, 30, 'posids', '推荐位', '全选<input boxid=\'posids\' type=\'checkbox\' onclick="checkall(\'posids\')" >', '', 0, 0, '', '', 'posid', 'array (\r\n  \'cols\' => \'4\',\r\n  \'width\' => \'125\',\r\n)', '', '', '', 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 13, 1),
	(900, 30, 'listorder', '排序', '', '', 1, 1, '', '', 'number', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 1, 0, 0, 1, 0, 97, 0),
	(901, 30, 'url', 'URL', '', '', 0, 100, '', '', 'text', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 96, 0),
	(902, 30, 'userid', '发布人', '', '', 0, 0, '', '', 'userid', '', '', '', '', 1, 1, 0, 1, 0, 1, 1, 0, 0, 0, 1, 0, 9, 0),
	(903, 30, 'updatetime', '更新时间', '', '', 0, 0, '', '', 'datetime', 'array (\r\n  \'dateformat\' => \'int\',\r\n  \'format\' => \'Y-m-d H:i:s\',\r\n  \'defaulttype\' => \'1\',\r\n  \'defaultvalue\' => \'\',\r\n)', '', '', '', 1, 1, 0, 1, 0, 1, 1, 1, 0, 0, 1, 0, 10, 0),
	(904, 30, 'inputtime', '发布时间', '', '', 0, 0, '', '', 'datetime', 'array (\r\n  \'dateformat\' => \'int\',\r\n  \'format\' => \'Y-m-d H:i:s\',\r\n  \'defaulttype\' => \'1\',\r\n  \'defaultvalue\' => \'\',\r\n)', '', '', '', 0, 1, 0, 1, 0, 1, 1, 1, 0, 0, 0, 0, 12, 0),
	(905, 30, 'islink', '转向链接', '', '', 0, 0, '', '', 'islink', '', '', '', '', 0, 1, 0, 1, 0, 1, 0, 0, 1, 1, 1, 0, 32, 1),
	(906, 30, 'prefix', 'html文件名', '', '', 0, 20, '', '', 'text', 'array (\n  \'size\' => \'12\',\n  \'defaultvalue\' => \'\',\n  \'ispassword\' => \'0\',\n)', '', '-99', '-99', 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 19, 1),
	(907, 30, 'status', '状态', '', '', 0, 2, '', '', 'box', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 98, 1),
	(908, 30, 'template', '内容页模板', '', '', 0, 255, '', '', 'template', '', '', '', '', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 99, 1),
	(909, 30, 'content', '内容', '', '', 1, 99999, '', '', 'editor', 'array (\n  \'toolbar\' => \'standard\',\n  \'width\' => \'700\',\n  \'height\' => \'550\',\n  \'defaultvalue\' => \'\',\n  \'storage\' => \'database\',\n  \'enablekeylink\' => \'0\',\n  \'enablefilterword\' => \'0\',\n  \'enablesaveimage\' => \'1\',\n)', '', '', '', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 11, 1),
	(910, 30, 'bigpic', '大图', '', '', 0, 255, '', '', 'image', 'array (\n  \'size\' => \'70\',\n  \'defaultvalue\' => \'\',\n  \'upload_maxsize\' => \'1024\',\n  \'upload_allowext\' => \'gif|jpg|jpeg|png|bmp\',\n  \'isselectimage\' => \'0\',\n  \'isthumb\' => \'0\',\n  \'thumb_width\' => \'300\',\n  \'thumb_height\' => \'300\',\n  \'iswatermark\' => \'0\',\n  \'watermark_img\' => \'images/watermark.gif\',\n)', '', '-99', '-99', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 7, 0),
	(911, 30, 'link', '链接', '', '', 0, 255, '', '', 'text', 'array (\n  \'size\' => \'70\',\n  \'defaultvalue\' => \'\',\n  \'ispassword\' => \'0\',\n)', '', '-99', '-99', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 8, 0),
	(912, 31, 'contentid', 'ID', '', '', 0, 0, '', '', 'number', '', '', '', '', 1, 1, 0, 1, 0, 1, 0, 1, 1, 1, 1, 0, 0, 0),
	(913, 31, 'catid', '栏目', '', '', 1, 9999, '/^[0-9]+$/', '请选择所属栏目', 'catid', 'array (\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 0),
	(914, 31, 'typeid', '类别', '', '', 0, 0, '', '', 'typeid', 'array (\n  \'minnumber\' => \'\',\n  \'maxnumber\' => \'\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 2, 1),
	(915, 31, 'areaid', '地区', '', '', 0, 0, '', '', 'areaid', 'array (\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 3, 1),
	(916, 31, 'title', '标题', '', 'inputtitle', 1, 200, '', '', 'title', 'array (\n  \'size\' => \'60\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 4, 0),
	(917, 31, 'style', '颜色和字型', '', '', 0, 0, '', '', 'style', '', '', '', '', 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0, 5, 1),
	(918, 31, 'thumb', '缩略图', '', '', 0, 100, '', '', 'image', 'array (\n  \'size\' => \'70\',\n  \'defaultvalue\' => \'\',\n  \'upload_maxsize\' => \'1024\',\n  \'upload_allowext\' => \'jpg|jpeg|gif|png|bmp\',\n  \'isselectimage\' => \'1\',\n  \'isthumb\' => \'0\',\n  \'thumb_width\' => \'300\',\n  \'thumb_height\' => \'300\',\n  \'iswatermark\' => \'0\',\n  \'watermark_img\' => \'images/watermark.gif\',\n)', '', '', '', 0, 1, 0, 1, 0, 1, 1, 0, 1, 1, 1, 0, 6, 0),
	(919, 31, 'keywords', '关键词', '多个关键词之间用空格隔开', '', 0, 40, '', '', 'keyword', 'array (\n  \'size\' => \'60\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 1, 0, 0, 1, 1, 1, 7, 1),
	(920, 31, 'description', '摘要', '', '', 0, 500, '', '', 'textarea', 'array (\n  \'rows\' => \'5\',\n  \'cols\' => \'60\',\n  \'defaultvalue\' => \'\',\n  \'enablehtml\' => \'0\',\n  \'enablekeylink\' => \'0\',\n  \'enablefilterword\' => \'0\',\n \'checkcharacter\' => \'1\',\n)', '', '', '', 0, 1, 0, 1, 0, 1, 0, 0, 1, 1, 1, 1, 8, 0),
	(921, 31, 'posids', '推荐位', '全选<input boxid=\'posids\' type=\'checkbox\' onclick="checkall(\'posids\')" >', '', 0, 0, '', '', 'posid', 'array (\r\n  \'cols\' => \'4\',\r\n  \'width\' => \'125\',\r\n)', '', '', '', 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 13, 1),
	(922, 31, 'listorder', '排序', '', '', 1, 1, '', '', 'number', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 1, 0, 0, 1, 0, 97, 0),
	(923, 31, 'url', 'URL', '', '', 0, 100, '', '', 'text', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 96, 0),
	(924, 31, 'userid', '发布人', '', '', 0, 0, '', '', 'userid', '', '', '', '', 1, 1, 0, 1, 0, 1, 1, 0, 0, 0, 1, 0, 9, 0),
	(925, 31, 'updatetime', '更新时间', '', '', 0, 0, '', '', 'datetime', 'array (\r\n  \'dateformat\' => \'int\',\r\n  \'format\' => \'Y-m-d H:i:s\',\r\n  \'defaulttype\' => \'1\',\r\n  \'defaultvalue\' => \'\',\r\n)', '', '', '', 1, 1, 0, 1, 0, 1, 1, 1, 0, 0, 1, 0, 10, 0),
	(926, 31, 'inputtime', '发布时间', '', '', 0, 0, '', '', 'datetime', 'array (\r\n  \'dateformat\' => \'int\',\r\n  \'format\' => \'Y-m-d H:i:s\',\r\n  \'defaulttype\' => \'1\',\r\n  \'defaultvalue\' => \'\',\r\n)', '', '', '', 0, 1, 0, 1, 0, 1, 1, 1, 0, 0, 0, 0, 12, 0),
	(927, 31, 'islink', '转向链接', '', '', 0, 0, '', '', 'islink', '', '', '', '', 0, 1, 0, 1, 0, 1, 0, 0, 1, 1, 1, 0, 32, 1),
	(928, 31, 'prefix', 'html文件名', '', '', 0, 20, '', '', 'text', 'array (\n  \'size\' => \'12\',\n  \'defaultvalue\' => \'\',\n  \'ispassword\' => \'0\',\n)', '', '-99', '-99', 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 19, 1),
	(929, 31, 'status', '状态', '', '', 0, 2, '', '', 'box', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 98, 1),
	(930, 31, 'template', '内容页模板', '', '', 0, 255, '', '', 'template', '', '', '', '', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 99, 1),
	(931, 31, 'content', '内容', '', '', 1, 99999, '', '', 'editor', 'array (\n  \'toolbar\' => \'standard\',\n  \'width\' => \'700\',\n  \'height\' => \'550\',\n  \'defaultvalue\' => \'\',\n  \'storage\' => \'database\',\n  \'enablekeylink\' => \'0\',\n  \'enablefilterword\' => \'0\',\n  \'enablesaveimage\' => \'1\',\n)', '', '', '', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 11, 0),
	(934, 32, 'contentid', 'ID', '', '', 0, 0, '', '', 'number', '', '', '', '', 1, 1, 0, 1, 0, 1, 0, 1, 1, 1, 1, 0, 0, 0),
	(935, 32, 'catid', '栏目', '', '', 1, 9999, '/^[0-9]+$/', '请选择所属栏目', 'catid', 'array (\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 0),
	(936, 32, 'typeid', '类别', '', '', 0, 0, '', '', 'typeid', 'array (\n  \'minnumber\' => \'\',\n  \'maxnumber\' => \'\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 2, 1),
	(937, 32, 'areaid', '地区', '', '', 0, 0, '', '', 'areaid', 'array (\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 3, 1),
	(938, 32, 'title', '标题', '', 'inputtitle', 1, 200, '', '', 'title', 'array (\n  \'size\' => \'60\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 4, 0),
	(939, 32, 'style', '颜色和字型', '', '', 0, 0, '', '', 'style', '', '', '', '', 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0, 5, 1),
	(940, 32, 'thumb', '缩略图', '', '', 0, 100, '', '', 'image', 'array (\n  \'size\' => \'70\',\n  \'defaultvalue\' => \'\',\n  \'upload_maxsize\' => \'1024\',\n  \'upload_allowext\' => \'jpg|jpeg|gif|png|bmp\',\n  \'isselectimage\' => \'1\',\n  \'isthumb\' => \'0\',\n  \'thumb_width\' => \'300\',\n  \'thumb_height\' => \'300\',\n  \'iswatermark\' => \'0\',\n  \'watermark_img\' => \'images/watermark.gif\',\n)', '', '', '', 0, 1, 0, 1, 0, 1, 1, 0, 1, 1, 1, 0, 6, 0),
	(941, 32, 'keywords', '关键词', '多个关键词之间用空格隔开', '', 0, 40, '', '', 'keyword', 'array (\n  \'size\' => \'60\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 1, 0, 0, 1, 1, 1, 7, 1),
	(942, 32, 'description', '摘要', '', '', 0, 500, '', '', 'textarea', 'array (\n  \'rows\' => \'5\',\n  \'cols\' => \'60\',\n  \'defaultvalue\' => \'\',\n  \'enablehtml\' => \'0\',\n  \'enablekeylink\' => \'0\',\n  \'enablefilterword\' => \'0\',\n \'checkcharacter\' => \'1\',\n)', '', '', '', 0, 1, 0, 1, 0, 1, 0, 0, 1, 1, 1, 1, 8, 0),
	(943, 32, 'posids', '推荐位', '全选<input boxid=\'posids\' type=\'checkbox\' onclick="checkall(\'posids\')" >', '', 0, 0, '', '', 'posid', 'array (\r\n  \'cols\' => \'4\',\r\n  \'width\' => \'125\',\r\n)', '', '', '', 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 13, 1),
	(944, 32, 'listorder', '排序', '', '', 1, 1, '', '', 'number', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 1, 0, 0, 1, 0, 97, 0),
	(945, 32, 'url', 'URL', '', '', 0, 100, '', '', 'text', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 96, 0),
	(946, 32, 'userid', '发布人', '', '', 0, 0, '', '', 'userid', '', '', '', '', 1, 1, 0, 1, 0, 1, 1, 0, 0, 0, 1, 0, 9, 0),
	(947, 32, 'updatetime', '更新时间', '', '', 0, 0, '', '', 'datetime', 'array (\r\n  \'dateformat\' => \'int\',\r\n  \'format\' => \'Y-m-d H:i:s\',\r\n  \'defaulttype\' => \'1\',\r\n  \'defaultvalue\' => \'\',\r\n)', '', '', '', 1, 1, 0, 1, 0, 1, 1, 1, 0, 0, 1, 0, 10, 0),
	(948, 32, 'inputtime', '发布时间', '', '', 0, 0, '', '', 'datetime', 'array (\r\n  \'dateformat\' => \'int\',\r\n  \'format\' => \'Y-m-d H:i:s\',\r\n  \'defaulttype\' => \'1\',\r\n  \'defaultvalue\' => \'\',\r\n)', '', '', '', 0, 1, 0, 1, 0, 1, 1, 1, 0, 0, 0, 0, 12, 0),
	(949, 32, 'islink', '转向链接', '', '', 0, 0, '', '', 'islink', '', '', '', '', 0, 1, 0, 1, 0, 1, 0, 0, 1, 1, 1, 0, 32, 1),
	(950, 32, 'prefix', 'html文件名', '', '', 0, 20, '', '', 'text', 'array (\n  \'size\' => \'12\',\n  \'defaultvalue\' => \'\',\n  \'ispassword\' => \'0\',\n)', '', '-99', '-99', 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 19, 1),
	(951, 32, 'status', '状态', '', '', 0, 2, '', '', 'box', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 98, 1),
	(952, 32, 'template', '内容页模板', '', '', 0, 255, '', '', 'template', '', '', '', '', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 99, 1),
	(953, 32, 'content', '内容', '', '', 1, 99999, '', '', 'editor', 'array (\n  \'toolbar\' => \'standard\',\n  \'width\' => \'700\',\n  \'height\' => \'550\',\n  \'defaultvalue\' => \'\',\n  \'storage\' => \'database\',\n  \'enablekeylink\' => \'0\',\n  \'enablefilterword\' => \'0\',\n  \'enablesaveimage\' => \'1\',\n)', '', '', '', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 11, 1),
	(954, 33, 'contentid', 'ID', '', '', 0, 0, '', '', 'number', '', '', '', '', 1, 1, 0, 1, 0, 1, 0, 1, 1, 1, 1, 0, 0, 0),
	(955, 33, 'catid', '栏目', '', '', 1, 9999, '/^[0-9]+$/', '请选择所属栏目', 'catid', 'array (\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 0),
	(956, 33, 'typeid', '类别', '', '', 0, 0, '', '', 'typeid', 'array (\n  \'minnumber\' => \'\',\n  \'maxnumber\' => \'\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 2, 1),
	(957, 33, 'areaid', '地区', '', '', 0, 0, '', '', 'areaid', 'array (\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 3, 1),
	(958, 33, 'title', '标题', '', 'inputtitle', 1, 200, '', '', 'title', 'array (\n  \'size\' => \'60\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 4, 0),
	(959, 33, 'style', '颜色和字型', '', '', 0, 0, '', '', 'style', '', '', '', '', 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0, 5, 1),
	(960, 33, 'thumb', '缩略图', '', '', 0, 100, '', '', 'image', 'array (\n  \'size\' => \'70\',\n  \'defaultvalue\' => \'\',\n  \'upload_maxsize\' => \'1024\',\n  \'upload_allowext\' => \'jpg|jpeg|gif|png|bmp\',\n  \'isselectimage\' => \'1\',\n  \'isthumb\' => \'0\',\n  \'thumb_width\' => \'300\',\n  \'thumb_height\' => \'300\',\n  \'iswatermark\' => \'0\',\n  \'watermark_img\' => \'images/watermark.gif\',\n)', '', '', '', 0, 1, 0, 1, 0, 1, 1, 0, 1, 1, 1, 0, 6, 1),
	(961, 33, 'keywords', '关键词', '多个关键词之间用空格隔开', '', 0, 40, '', '', 'keyword', 'array (\n  \'size\' => \'60\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 1, 0, 0, 1, 1, 1, 7, 1),
	(962, 33, 'description', '摘要', '', '', 0, 500, '', '', 'textarea', 'array (\n  \'rows\' => \'5\',\n  \'cols\' => \'60\',\n  \'defaultvalue\' => \'\',\n  \'enablehtml\' => \'0\',\n  \'enablekeylink\' => \'0\',\n  \'enablefilterword\' => \'0\',\n \'checkcharacter\' => \'1\',\n)', '', '', '', 0, 1, 0, 1, 0, 1, 0, 0, 1, 1, 1, 1, 8, 1),
	(963, 33, 'posids', '推荐位', '全选<input boxid=\'posids\' type=\'checkbox\' onclick="checkall(\'posids\')" >', '', 0, 0, '', '', 'posid', 'array (\r\n  \'cols\' => \'4\',\r\n  \'width\' => \'125\',\r\n)', '', '', '', 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 13, 1),
	(964, 33, 'listorder', '排序', '', '', 1, 1, '', '', 'number', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 1, 0, 0, 1, 0, 97, 0),
	(965, 33, 'url', 'URL', '', '', 0, 100, '', '', 'text', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 96, 0),
	(966, 33, 'userid', '发布人', '', '', 0, 0, '', '', 'userid', '', '', '', '', 1, 1, 0, 1, 0, 1, 1, 0, 0, 0, 1, 0, 9, 0),
	(967, 33, 'updatetime', '更新时间', '', '', 0, 0, '', '', 'datetime', 'array (\r\n  \'dateformat\' => \'int\',\r\n  \'format\' => \'Y-m-d H:i:s\',\r\n  \'defaulttype\' => \'1\',\r\n  \'defaultvalue\' => \'\',\r\n)', '', '', '', 1, 1, 0, 1, 0, 1, 1, 1, 0, 0, 1, 0, 10, 0),
	(968, 33, 'inputtime', '发布时间', '', '', 0, 0, '', '', 'datetime', 'array (\r\n  \'dateformat\' => \'int\',\r\n  \'format\' => \'Y-m-d H:i:s\',\r\n  \'defaulttype\' => \'1\',\r\n  \'defaultvalue\' => \'\',\r\n)', '', '', '', 0, 1, 0, 1, 0, 1, 1, 1, 0, 0, 0, 0, 12, 0),
	(969, 33, 'islink', '转向链接', '', '', 0, 0, '', '', 'islink', '', '', '', '', 0, 1, 0, 1, 0, 1, 0, 0, 1, 1, 1, 0, 32, 1),
	(970, 33, 'prefix', 'html文件名', '', '', 0, 20, '', '', 'text', 'array (\n  \'size\' => \'12\',\n  \'defaultvalue\' => \'\',\n  \'ispassword\' => \'0\',\n)', '', '-99', '-99', 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 19, 1),
	(971, 33, 'status', '状态', '', '', 0, 2, '', '', 'box', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 98, 1),
	(972, 33, 'template', '内容页模板', '', '', 0, 255, '', '', 'template', '', '', '', '', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 99, 1),
	(973, 33, 'content', '内容', '', '', 1, 99999, '', '', 'editor', 'array (\n  \'toolbar\' => \'standard\',\n  \'width\' => \'700\',\n  \'height\' => \'550\',\n  \'defaultvalue\' => \'\',\n  \'storage\' => \'database\',\n  \'enablekeylink\' => \'0\',\n  \'enablefilterword\' => \'0\',\n  \'enablesaveimage\' => \'1\',\n)', '', '', '', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 11, 0);
/*!40000 ALTER TABLE `mg_model_field` ENABLE KEYS */;


# Dumping structure for table mg_wlsm.mg_module
DROP TABLE IF EXISTS `mg_module`;
CREATE TABLE IF NOT EXISTS `mg_module` (
  `module` varchar(15) NOT NULL,
  `name` varchar(20) NOT NULL,
  `path` varchar(50) NOT NULL,
  `url` varchar(50) NOT NULL,
  `iscore` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `version` varchar(50) NOT NULL DEFAULT '',
  `author` varchar(50) NOT NULL DEFAULT '',
  `site` varchar(100) NOT NULL DEFAULT '',
  `email` varchar(50) NOT NULL DEFAULT '',
  `description` mediumtext NOT NULL,
  `license` mediumtext NOT NULL,
  `faq` mediumtext NOT NULL,
  `tagtypes` mediumtext NOT NULL,
  `setting` mediumtext NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `publishdate` date NOT NULL DEFAULT '0000-00-00',
  `installdate` date NOT NULL DEFAULT '0000-00-00',
  `updatedate` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`module`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# Dumping data for table mg_wlsm.mg_module: 7 rows
DELETE FROM `mg_module`;
/*!40000 ALTER TABLE `mg_module` DISABLE KEYS */;
INSERT INTO `mg_module` (`module`, `name`, `path`, `url`, `iscore`, `version`, `author`, `site`, `email`, `description`, `license`, `faq`, `tagtypes`, `setting`, `listorder`, `disabled`, `publishdate`, `installdate`, `updatedate`) VALUES
	('wslm', 'Wslm', '', '', 1, '1.0.0.0', 'Wslm Team', 'http://www.wslm.cn/', 'wslm@163.com', 'Wslm Content Manage System', '', '', 'array (\r\n \'wslm-content\'=>\'wslm\',\r\n \'wslm-category\'=>\'栏目标签\',\r\n)', 'array (\n  \'sitename\' => \'济南青春咨询有限公司\',\n  \'siteurl\' => \'http://127.0.0.1/wslm/\',\n  \'ishtml\' => \'1\',\n  \'fileext\' => \'html\',\n  \'enable_urlencode\' => \'0\',\n  \'meta_title\' => \'济南青春咨询有限公司\',\n  \'meta_keywords\' => \'动漫,咨询,案例,服务\',\n  \'meta_description\' => \'济南青春咨询有限公司是由工商行政管理部门比准注册的国内第一家专门为动漫产品经营管理行业提供管理咨询服务的专业机构。公司凭借多年的行业管理经验和咨询案例经验，为动漫行业从业者提供产品。济南青春咨询有限公司是由工商行政管理部门比准注册的国内第一家专门为动漫产品经营管理行业提供管理咨询服务的专业机构。\',\n  \'copyright\' => \'<p>&nbsp;济南青春动漫咨询有限公司 联系地址：山东省济南市 咨询电话：0531-88888888&nbsp;</p>\r\n<p>Copyright &copy; 济南青春动漫咨询有限公司 2012All rights reserved&nbsp;</p>\',\n  \'icpno\' => \'鲁ICP备XXXXX\',\n  \'pagemode\' => \'1\',\n  \'pageshtml\' => \'总数：<b>{$total}</b>\r\n<a href="{$firstpage}">首页</a><a href="{$prepage}">上一页</a><a href="{$nextpage}">下一页</a><a href="{$lastpage}">尾页</a>\r\n页次：<b><font color="red">{$page}</font>/{$pages}</b>\r\n<input type="text" name="page" id="page" size="2" onKeyDown="if(event.keyCode==13) {redirect(\\\'{$urlpre}\\\'+this.value); return false;}"> \r\n<input type="button" value="GO" class="gotopage" onclick="redirect(\\\'{$urlpre}\\\'+$(\\\'#page\\\').val())">\',\n  \'segmentclass\' => \'segment\',\n  \'enablegetscrollbar\' => \'1\',\n  \'enablegetkeywords\' => \'1\',\n  \'areaid\' => \'1\',\n  \'editor_max_data_hour\' => \'4\',\n  \'editor_interval_data\' => \'30\',\n  \'category_count\' => \'1\',\n  \'show_hits\' => \'1\',\n  \'maxpage\' => \'100\',\n  \'pagesize\' => \'20\',\n  \'autoupdatelist\' => \'5\',\n  \'search_time\' => \'10\',\n  \'search_maxresults\' => \'500\',\n  \'search_pagesize\' => \'10\',\n  \'adminaccessip\' => \'\',\n  \'maxloginfailedtimes\' => \'5\',\n  \'maxiplockedtime\' => \'1\',\n  \'enable_ipbanned\' => \'0\',\n  \'minrefreshtime\' => \'0\',\n  \'filter_word\' => \'\',\n  \'allowtourist\' => \'0\',\n  \'thumb_enable\' => \'1\',\n  \'thumb_width\' => \'667\',\n  \'thumb_height\' => \'0\',\n  \'watermark_enable\' => \'0\',\n  \'watermark_minwidth\' => \'300\',\n  \'watermark_minheight\' => \'300\',\n  \'watermark_img\' => \'images/watermark.gif\',\n  \'watermark_pct\' => \'100\',\n  \'watermark_quality\' => \'80\',\n  \'watermark_pos\' => \'9\',\n  \'mail_type\' => \'1\',\n  \'mail_server\' => \'smtp.163.com\',\n  \'mail_port\' => \'25\',\n  \'mail_user\' => \'wslm@163.com\',\n  \'mail_password\' => \'\',\n  \'mail_sign\' => \'&nbsp;\',\n  \'enablepassport\' => \'0\',\n  \'passport_file\' => \'discuz\',\n  \'passport_charset\' => \'gbk\',\n  \'passport_url\' => \'http://www.***.com/bbs/api/passport.php\',\n  \'passport_key\' => \'\',\n  \'enableserverpassport\' => \'0\',\n  \'passport_serverurl\' => \'http://www.***.com/bbs/\',\n  \'passport_registerurl\' => \'register.php\',\n  \'passport_loginurl\' => \'login.php\',\n  \'passport_logouturl\' => \'login.php?action=quit\',\n  \'passport_getpasswordurl\' => \'sendpwd.php\',\n  \'passport_serverkey\' => \'\',\n  \'passport_expire\' => \'\',\n  \'uc\' => \'0\',\n  \'uc_api\' => \'http://uc.wslm.cn/uc\',\n  \'uc_ip\' => \'\',\n  \'uc_dbhost\' => \'localhost\',\n  \'uc_dbuser\' => \'dbuser\',\n  \'uc_dbpwd\' => \'dbpw\',\n  \'uc_dbname\' => \'dbname\',\n  \'uc_dbpre\' => \'uc_\',\n  \'uc_charset\' => \'gbk\',\n  \'uc_appid\' => \'3\',\n  \'uc_key\' => \'\',\n  \'enabletm\' => \'1\',\n  \'qq\' => \'408128151\',\n  \'msn\' => \'\',\n  \'skype\' => \'\',\n  \'taobao\' => \'\',\n  \'alibaba\' => \'\',\n  \'version\' => \'2008 sp4\',\n  \'wss_enable\' => \'\',\n  \'wss_site_id\' => \'\',\n  \'wss_password\' => \'\',\n)', 0, 0, '2008-10-28', '2008-10-28', '2008-10-28'),
	('member', '会员', 'member/', 'member/', 1, '1.0.0.0', 'Wslm Team', 'http://www.wslm.cn/', 'wslm@163.com', '', '', '', 'array (\r\n  \'member\'=>\'会员类型\',\r\n)\r\n\r\n\r\n', 'array (\n  \'allowregister\' => \'1\',\n  \'choosemodel\' => \'1\',\n  \'enablemailcheck\' => \'0\',\n  \'enableshowlist\' => \'1\',\n  \'enableadmincheck\' => \'0\',\n  \'enablecheckcodeofreg\' => \'1\',\n  \'enableQchk\' => \'0\',\n  \'paytype\' => \'point\',\n  \'defualtpoint\' => \'0\',\n  \'defualtamount\' => \'0.00\',\n  \'reglicense\' => \' 欢迎您注册成为wslm用户\r\n             请仔细阅读下面的协议，只有接受协议才能继续进行注册。 \r\n             1．服务条款的确认和接纳\r\n            　　wslm用户服务的所有权和运作权归wslm拥有。wslm所提供的服务将按照有关章程、服务条款和操作规则严格执行。用户通过注册程序点击“我同意” 按钮，即表示用户与wslm达成协议并接受所有的服务条款。\r\n             2． wslm服务简介\r\n            　　wslm通过国际互联网为用户提供新闻及文章浏览、图片浏览、软件下载、网上留言和BBS论坛等服务。\r\n            　　用户必须： \r\n            　　1)购置设备，包括个人电脑一台、调制解调器一个及配备上网装置。 \r\n            　　2)个人上网和支付与此服务有关的电话费用、网络费用。\r\n            　　用户同意： \r\n            　　1)提供及时、详尽及准确的个人资料。 \r\n            　　2)不断更新注册资料，符合及时、详尽、准确的要求。所有原始键入的资料将引用为注册资料。 \r\n            　　3)用户同意遵守《中华人民共和国保守国家秘密法》、《中华人民共和国计算机信息系统安全保护条例》、《计算机软件保护条例》等有关计算机及互联网规定的法律和法规、实施办法。在任何情况下，wslm合理地认为用户的行为可能违反上述法律、法规，wslm可以在任何时候，不经事先通知终止向该用户提供服务。用户应了解国际互联网的无国界性，应特别注意遵守当地所有有关的法律和法规。\r\n             3． 服务条款的修改\r\n            　　wslm会不定时地修改服务条款，服务条款一旦发生变动，将会在相关页面上提示修改内容。如果您同意改动，则再一次点击“我同意”按钮。 如果您不接受，则及时取消您的用户使用服务资格。\r\n             4． 服务修订\r\n            　　wslm保留随时修改或中断服务而不需知照用户的权利。wslm行使修改或中断服务的权利，不需对用户或第三方负责。\r\n             5． 用户隐私制度\r\n            　　尊重用户个人隐私是wslm的 基本政策。wslm不会公开、编辑或透露用户的注册信息，除非有法律许可要求，或wslm在诚信的基础上认为透露这些信息在以下三种情况是必要的： \r\n            　　1)遵守有关法律规定，遵从合法服务程序。 \r\n            　　2)保持维护wslm的商标所有权。 \r\n            　　3)在紧急情况下竭力维护用户个人和社会大众的隐私安全。 \r\n            　　4)符合其他相关的要求。 \r\n             6．用户的帐号，密码和安全性\r\n            　　一旦注册成功成为wslm用户，您将得到一个密码和帐号。如果您不保管好自己的帐号和密码安全，将对因此产生的后果负全部责任。另外，每个用户都要对其帐户中的所有活动和事件负全责。您可随时根据指示改变您的密码，也可以结束旧的帐户重开一个新帐户。用户同意若发现任何非法使用用户帐号或安全漏洞的情况，立即通知wslm。\r\n             7． 免责条款\r\n            　　用户明确同意网站服务的使用由用户个人承担风险。 　　 \r\n            　　wslm不作任何类型的担保，不担保服务一定能满足用户的要求，也不担保服务不会受中断，对服务的及时性，安全性，出错发生都不作担保。用户理解并接受：任何通过wslm服务取得的信息资料的可靠性取决于用户自己，用户自己承担所有风险和责任。 \r\n             8．有限责任\r\n            　　wslm对任何直接、间接、偶然、特殊及继起的损害不负责任。\r\n             9． 不提供零售和商业性服务 \r\n            　　用户使用网站服务的权利是个人的。用户只能是一个单独的个体而不能是一个公司或实体商业性组织。用户承诺不经wslm同意，不能利用网站服务进行销售或其他商业用途。\r\n             10．用户责任 \r\n            　　用户单独承担传输内容的责任。用户必须遵循： \r\n            　　1)从中国境内向外传输技术性资料时必须符合中国有关法规。 \r\n            　　2)使用网站服务不作非法用途。 \r\n            　　3)不干扰或混乱网络服务。 \r\n            　　4)不在论坛BBS或留言簿发表任何与政治相关的信息。 \r\n            　　5)遵守所有使用网站服务的网络协议、规定、程序和惯例。\r\n            　　6)不得利用本站危害国家安全、泄露国家秘密，不得侵犯国家社会集体的和公民的合法权益。\r\n            　　7)不得利用本站制作、复制和传播下列信息： \r\n            　　　1、煽动抗拒、破坏宪法和法律、行政法规实施的；\r\n            　　　2、煽动颠覆国家政权，推翻社会主义制度的；\r\n            　　　3、煽动分裂国家、破坏国家统一的；\r\n            　　　4、煽动民族仇恨、民族歧视，破坏民族团结的；\r\n            　　　5、捏造或者歪曲事实，散布谣言，扰乱社会秩序的；\r\n            　　　6、宣扬封建迷信、淫秽、色情、赌博、暴力、凶杀、恐怖、教唆犯罪的；\r\n            　　　7、公然侮辱他人或者捏造事实诽谤他人的，或者进行其他恶意攻击的；\r\n            　　　8、损害国家机关信誉的；\r\n            　　　9、其他违反宪法和法律行政法规的；\r\n            　　　10、进行商业广告行为的。\r\n            　　用户不能传输任何教唆他人构成犯罪行为的资料；不能传输长国内不利条件和涉及国家安全的资料；不能传输任何不符合当地法规、国家法律和国际法 律的资料。未经许可而非法进入其它电脑系统是禁止的。若用户的行为不符合以上的条款，wslm将取消用户服务帐号。\r\n             11．网站内容的所有权\r\n            　　wslm定义的内容包括：文字、软件、声音、相片、录象、图表；在广告中全部内容；电子邮件的全部内容；wslm为用户提供的商业信息。所有这些内容受版权、商标、标签和其它财产所有权法律的保护。所以，用户只能在wslm和广告商授权下才能使用这些内容，而不能擅自复制、篡改这些内容、或创造与内容有关的派生产品。\r\n             12．附加信息服务\r\n            　　用户在享用wslm提供的免费服务的同时，同意接受wslm提供的各类附加信息服务。\r\n             13．解释权\r\n            　　本注册协议的解释权归wslm所有。如果其中有任何条款与国家的有关法律相抵触，则以国家法律的明文规定为准。\r\n            \',\n)', 0, 0, '2008-10-28', '2008-10-28', '2008-10-28'),
	('link', '友情链接', 'link/', 'link/', 0, '1.0.0.0', 'Wslm Team', 'http://www.wslm.cn/', 'wslm@163.com', '', '', '', '', 'array (\n  \'seo_keywords\' => \'友情链接\',\n  \'seo_description\' => \'友情链接\',\n  \'enablecheckcode\' => \'0\',\n  \'ischeck\' => \'1\',\n)', 0, 0, '2008-10-28', '2008-10-28', '2008-10-28'),
	('mail', '邮箱订阅', 'mail/', 'mail/', 0, '1.0.0.0', 'Wslm Team', 'http://www.wslm.cn/', 'wslm@163.com', '', '', '', '', 'array (\n  \'validation\' => \'0\',\n  \'maxnum\' => \'5\',\n  \'ischeckcode\' => \'1\',\n  \'enabledkey\' => \',\',\n)', 0, 0, '2008-10-28', '2008-10-28', '2008-10-28'),
	('guestbook', '留言板', 'guestbook/', 'guestbook/', 0, '1.0.0.0', 'Wslm Team', 'http://www.wslm.cn/', 'wslm@163.com', '', '', '', '', 'array (\n  \'seo_keywords\' => \'wslm留言板\',\n  \'seo_description\' => \'wslm留言板\',\n  \'pagesize\' => \'20\',\n  \'maxcontent\' => \'1000\',\n  \'enablecheckcode\' => \'1\',\n  \'show\' => \'1\',\n  \'enableTourist\' => \'1\',\n  \'checkpass\' => \'1\',\n)', 0, 0, '2008-10-28', '2008-10-28', '2008-10-28'),
	('search', '全站搜索', 'search/', 'search/', 0, '1.0.0.0', 'Wslm Team', 'http://www.wslm.cn/', 'wslm@163.com', '全站搜索', '', '', '', 'array (\n  \'titlelen\' => \'80\',\n  \'descriptionlen\' => \'480\',\n  \'type_urlruleid\' => \'\',\n  \'show_urlruleid\' => \'\',\n)', 0, 0, '2008-10-28', '2008-10-28', '2008-10-28'),
	('formguide', '表单向导', 'formguide/', 'formguide/', 0, '1.0.0.0', 'Wslm Team', 'http://www.wslm.cn/', 'wslm@163.com', '', '', '', '', 'array (\n  \'allowmultisubmit\' => \'1\',\n  \'allowunregsubmit\' => \'1\',\n  \'allowsendemail\' => \'0\',\n)', 0, 0, '2008-10-28', '2008-10-28', '2008-10-28');
/*!40000 ALTER TABLE `mg_module` ENABLE KEYS */;


# Dumping structure for table mg_wlsm.mg_player
DROP TABLE IF EXISTS `mg_player`;
CREATE TABLE IF NOT EXISTS `mg_player` (
  `playerid` smallint(3) unsigned NOT NULL AUTO_INCREMENT,
  `subject` char(20) NOT NULL,
  `code` mediumtext NOT NULL,
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`playerid`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

# Dumping data for table mg_wlsm.mg_player: 5 rows
DELETE FROM `mg_player`;
/*!40000 ALTER TABLE `mg_player` DISABLE KEYS */;
INSERT INTO `mg_player` (`playerid`, `subject`, `code`, `disabled`) VALUES
	(1, 'RealPlayer', '<script language="javascript">\r\nvar ERR_FileNotFind="播放器提示：未找到点播文件！请报告影片错误给管理员";\r\nvar ERR_NotLocateServer="播放器提示：无法连接服务器或连接服务器超时！";\r\nvar ERR_UnkownError="播放器提示：发生了未知错误！";\r\n</script>\r\n<script LANGUAGE="VBScript">                                    \r\non error resume next \r\nSub player_OnBuffering(lFlags,lPercentage)\r\nif (lPercentage=100) then\r\nStartPlay=false\r\nif (FirstPlay) then\r\nFirstPlay=false\r\nend if\r\nexit sub\r\nend if\r\nEnd Sub\r\nSub player_OnErrorMessage(uSeverity, uRMACode, uUserCode, pUserString, pMoreInfoURL, pErrorString)\r\nselect case player.GetLastErrorRMACode()\r\n   case -2147221496\r\nwindow.alert(ERR_FileNotFind)\r\n   case -2147221433,-2147221428,-2147221417,-2147217468\r\nwindow.alert(ERR_NotLocateServer)\r\ncase -2147221436\r\nwindow.alert("系统提示！播放器无法连接到点播文件服务器")\r\n   case else\r\nwindow.alert(ERR_UnkownError)\r\nend select\r\nEnd Sub\r\n</script>\r\n<center>\r\n<TABLE cellPadding=0 cellSpacing=0 border=1 height="100%" width="100%" id="table2">\r\n<TR>\r\n<TD>\r\n<OBJECT classid="clsid:CFCDAA03-8BE4-11cf-B84B-0020AFBBCCFA" height="100%" id=RP1 name=RP1 width="100%">\r\n<PARAM NAME="AUTOSTART" VALUE="-1">\r\n<PARAM NAME="SHUFFLE" VALUE="0">\r\n<PARAM NAME="PREFETCH" VALUE="0">\r\n<PARAM NAME="NOLABELS" VALUE="0">\r\n<PARAM NAME="CONTROLS" VALUE="Imagewindow">\r\n<PARAM NAME="CONSOLE" VALUE="clip1">\r\n<PARAM NAME="LOOP" VALUE="0">\r\n<PARAM NAME="NUMLOOP" VALUE="0">\r\n<PARAM NAME="CENTER" VALUE="0">\r\n<PARAM NAME="MAINTAINASPECT" VALUE="1">\r\n<PARAM NAME="BACKGROUNDCOLOR" VALUE="#000000">\r\n</OBJECT>\r\n</TD></TR><TR><TD height=60>\r\n<TABLE align=center border=0 cellPadding=0 cellSpacing=0 width="100%" id="table3">\r\n<TR><TD align=middle bgColor=#000000>\r\n<TABLE border=1 cellPadding=0 cellSpacing=0 width="100%" id="table4">\r\n<TR><TD width=50>\r\n<IMG border=0 height=30 onclick=document.RP1.SetFullScreen() src="{$WSLM[siteurl]}images/player/full.gif" width=50></TD>\r\n<TD>\r\n<OBJECT classid=clsid:CFCDAA03-8BE4-11cf-B84B-0020AFBBCCFA  height=30 id=player name=player width="100%">\r\n<PARAM NAME="_ExtentX" VALUE="4657">\r\n<PARAM NAME="_ExtentY" VALUE="794">\r\n<PARAM NAME="AUTOSTART" VALUE="-1">\r\n<PARAM NAME="SRC" VALUE="{$filepath}">\r\n<PARAM NAME="SHUFFLE" VALUE="0">\r\n<PARAM NAME="PREFETCH" VALUE="0">\r\n<PARAM NAME="NOLABELS" VALUE="-1">\r\n<PARAM NAME="CONTROLS" VALUE="ControlPanel">\r\n<PARAM NAME="CONSOLE" VALUE="clip1">\r\n<PARAM NAME="LOOP" VALUE="0">\r\n<PARAM NAME="NUMLOOP" VALUE="0">\r\n<PARAM NAME="CENTER" VALUE="0">\r\n<PARAM NAME="MAINTAINASPECT" VALUE="1">\r\n<PARAM NAME="BACKGROUNDCOLOR" VALUE="#000000">\r\n</OBJECT>\r\n</TD></TR></TABLE></TD></TR>\r\n<TR>\r\n<TD align=middle bgColor=#000000>\r\n<OBJECT classid=clsid:CFCDAA03-8BE4-11cf-B84B-0020AFBBCCFA height=30 id=RP3 name=RP3 width="100%">\r\n<PARAM NAME="_ExtentX" VALUE="4657">\r\n<PARAM NAME="_ExtentY" VALUE="794">\r\n<PARAM NAME="AUTOSTART" VALUE="-1">\r\n<PARAM NAME="SHUFFLE" VALUE="0">\r\n<PARAM NAME="PREFETCH" VALUE="0">\r\n<PARAM NAME="NOLABELS" VALUE="-1">\r\n<PARAM NAME="CONTROLS" VALUE="StatusBar">\r\n<PARAM NAME="CONSOLE" VALUE="clip1">\r\n<PARAM NAME="LOOP" VALUE="0">\r\n<PARAM NAME="NUMLOOP" VALUE="0">\r\n<PARAM NAME="CENTER" VALUE="0">\r\n<PARAM NAME="MAINTAINASPECT" VALUE="1">\r\n<PARAM NAME="BACKGROUNDCOLOR" VALUE="#000000">\r\n</OBJECT>\r\n</TD></TR></TABLE></TD></TR></TABLE>', 0),
	(2, 'window media player', '<object classid="clsid:22D6F312-B0F6-11D0-94AB-0080C74C7E95" id="MediaPlayer1" width="100%" height="100%">\r\n<param name="AudioStream" value="-1">\r\n<param name="AutoSize" value="-1">\r\n<!--是否自动调整播放大小-->\r\n<param name="AutoStart" value="-1">\r\n<!--是否自动播放-->\r\n<param name="AnimationAtStart" value="-1">\r\n<param name="AllowScan" value="-1">\r\n<param name="AllowChangeDisplaySize" value="-1">\r\n<param name="AutoRewind" value="0">\r\n<param name="Balance" value="0">\r\n<!--左右声道平衡,最左-9640,最右9640-->\r\n<param name="BaseURL" value>\r\n<param name="BufferingTime" value="15">\r\n<!--缓冲时间-->\r\n<param name="CaptioningID" value>\r\n<param name="ClickToPlay" value="-1">\r\n<param name="CursorType" value="0">\r\n<param name="CurrentPosition" value="0">\r\n<!--当前播放进度 -1 表示不变,0表示开头 单位是秒,比如10表示从第10秒处开始播放,值必须是-1.0或大于等于0-->\r\n<param name="CurrentMarker" value="0">\r\n<param name="DefaultFrame" value>\r\n<param name="DisplayBackColor" value="0">\r\n<param name="DisplayForeColor" value="16777215">\r\n<param name="DisplayMode" value="0">\r\n<param name="DisplaySize" value="0">\r\n<!--视频1-50%, 0-100%, 2-200%,3-全屏 其它的值作0处理,小数则采用四舍五入然后按前的处理-->\r\n<param name="Enabled" value="-1">\r\n<param name="EnableContextMenu" value="-1">\r\n<!-是否用右键弹出菜单控制-->\r\n<param name="EnablePositionControls" value="-1">\r\n<param name="EnableFullScreenControls" value="-1">\r\n<param name="EnableTracker" value="-1">\r\n<!--是否允许拉动播放进度条到任意地方播放-->\r\n<param name="Filename" value="{$filepath}" valuetype="ref">\r\n<!--播放的文件地址-->\r\n<param name="InvokeURLs" value="-1">\r\n<param name="Language" value="-1">\r\n<param name="Mute" value="0">\r\n<!--是否静音-->\r\n<param name="PlayCount" value="1">\r\n<!--重复播放次数,0为始终重复-->\r\n<param name="PreviewMode" value="-1">\r\n<param name="Rate" value="1">\r\n<!--播放速率控制,1为正常,允许小数-->\r\n<param name="SAMIStyle" value="1">\r\n<!--SAMI样式-->\r\n<param name="SAMILang" value>\r\n<!--SAMI语言-->\r\n<param name="SAMIFilename" value>\r\n<!--字幕ID-->\r\n<param name="SelectionStart" value="-1">\r\n<param name="SelectionEnd" value="-1">\r\n<param name="SendOpenStateChangeEvents" value="-1">\r\n<param name="SendWarningEvents" value="-1">\r\n<param name="SendErrorEvents" value="-1">\r\n<param name="SendKeyboardEvents" value="0">\r\n<param name="SendMouseClickEvents" value="0">\r\n<param name="SendMousemovieeEvents" value="0">\r\n<param name="SendPlayStateChangeEvents" value="-1">\r\n<param name="ShowCaptioning" value="0">\r\n<!--是否显示字幕,为一块黑色,下面会有一大块黑色,一般不显示-->\r\n<param name="ShowControls" value="-1">\r\n<!--是否显示控制,比如播放,停止,暂停-->\r\n<param name="ShowAudioControls" value="-1">\r\n<!--是否显示音量控制-->\r\n<param name="ShowDisplay" value="0">\r\n<!--显示节目信息,比如版权等-->\r\n<param name="ShowGotoBar" value="0">\r\n<!--是否启用上下文菜单-->\r\n<param name="ShowPositionControls" value="-1">\r\n<!--是否显示往前往后及列表,如果显示一般也都是灰色不可控制-->\r\n<param name="ShowStatusBar" value="-1">\r\n<!--当前播放信息,显示是否正在播放,及总播放时间和当前播放到的时间-->\r\n<param name="ShowTracker" value="-1">\r\n<!--是否显示当前播放跟踪条,即当前的播放进度条-->\r\n<param name="TransparentAtStart" value="-1">\r\n<param name="VideoBorderWidth" value="0">\r\n<!--显示部的宽部,如果小于视频宽,则最小为视频宽,或者加大到指定值,并自动加大高度.此改变只改变四周的黑框大小,不改变视频大小-->\r\n<param name="VideoBorderColor" value="0">\r\n<!--显示黑色框的颜色, 为RGB值,比如ffff00为黄色-->\r\n<param name="VideoBorder3D" value="0">\r\n<param name="Volume" value="0">\r\n<!--音量大小,负值表示是当前音量的减值,值自动会取绝对值,最大为0,最小为-9640-->\r\n<param name="WindowlessVideo" value="0">\r\n<!--如果是0可以允许全屏,否则只能在窗口中查看-->\r\n</object>', 0),
	(3, '精美real播放器', '<Script Language="JavaScript">\r\nIEvar=navigator.appVersion.substring(navigator.appVersion.indexOf(\'MSIE\')+5,navigator.appVersion.indexOf(\';\',17));\r\nif(IEvar=="6.0")\r\n{\r\n  ie6 = true;\r\n  width_add = 10;\r\n  height_add = 29;\r\n  jjjj = 5;\r\n  hand_add = -14;\r\n}\r\nelse\r\n{\r\n  ie6 = false;\r\n  width_add = 0;\r\n  height_add = 0;\r\n  jjjj = 0;\r\n  hand_add = 0;\r\n}\r\nb_width = 0;\r\nb_height = 0;\r\n\r\n//屏蔽右键\r\n   function no_newwin(){\r\n   if((event.ctrlKey)&&(event.keyCode==78)){\r\n   event.keyCode=0;\r\n   event.returnValue=false;\r\n   }\r\n}\r\n\r\nfunction click()\r\n{\r\n   return false;\r\n}\r\ndocument.oncontextmenu=click;\r\ndocument.onmousemoviee=click;\r\n\r\ndocument.ondragstart=doDragStart\r\nfunction doDragStart() {event.returnValue=false}\r\n\r\n\r\n//-------------------------\r\n\r\nvar Real;\r\nReal=\'rPlayer.\';\r\nvar Mute=false;\r\nvar CanSetPos=true;\r\nvar SetPosStart=false;\r\nvar SetVolStart=false;\r\nvar loop, timer, initialised;\r\nvar speed=50;\r\nvar oldwidth=566,oldheight=502;\r\nmovieeon=false;movieelen=300;rm_tollen=0;timelen=0;volumlen=56;iScrollLength=140;\r\n\r\ndocument.onmouseup=Total_Up;\r\n\r\nfunction Total_Up(){\r\nif(event.button!=2){\r\nif(SetPosStart){\r\nsetpos();\r\nballmoviee();\r\n}\r\nif(SetVolStart) setvol();\r\n }\r\n}\r\n\r\nfunction moviees()\r\n{\r\nif(CanSetPos&&event.button!=2)\r\n{\r\norix=event.x;\r\norileft=mblock.style.pixelLeft;\r\nif(movieeon)\r\n{\r\nclearTimeout(balltime);\r\n}\r\nSetPosStart=true;\r\n}\r\nelse\r\n  return false;\r\n}\r\n\r\nfunction ChangePos() {\r\nnewleft=event.x;\r\n{\r\nSetPosStart=false;\r\nif (event.x < movieelen+10)\r\n  newleft=event.x-10;\r\nelse\r\n  newleft=movieelen-1;\r\nif (event.x < 10)\r\n  newleft=0;\r\nrm_tollen = GetLength();\r\nrcp=Math.round((newleft/movieelen)*rm_tollen);\r\nSetPosition(rcp);\r\nmblock.style.left = newleft;\r\nplay()\r\n}\r\n}\r\n\r\nfunction movieego()\r\n{\r\nif(SetPosStart)\r\n{\r\nnewx=event.x;\r\ndisx=newx-orix;\r\nnewleft=orileft+disx;\r\nif(newleft>-1&&newleft<movieelen) mblock.style.left=newleft;\r\n}\r\n}\r\n\r\nfunction setpos()\r\n{\r\nSetPosStart=false;\r\nnewleft=mblock.style.pixelLeft;\r\nrm_tollen = GetLength();\r\nrcp=Math.round((newleft/movieelen)*rm_tollen);\r\nSetPosition(rcp);\r\n}\r\n\r\nfunction vols()\r\n{\r\nif(event.button!=2)\r\n{\r\norix=event.x;\r\norileft=vblock.style.pixelLeft;\r\nSetVolStart=true;\r\n}\r\n}\r\n\r\nfunction volgo()\r\n{\r\nif(SetVolStart)\r\n{\r\nnewx=event.x;\r\ndisx=newx-orix;\r\nnewleft=orileft+disx;\r\nif(newleft>5&&newleft<=volumlen) vblock.style.left=newleft;\r\n}\r\n}\r\n\r\nfunction setvol()\r\n{//设置音量\r\nSetVolStart=false;\r\nnewleft=vblock.style.pixelLeft;\r\nnewvol=-(Math.round((volumlen-newleft)*2000/(volumlen-6)));\r\nSetVolume(newvol);\r\n}\r\nfunction RealincreaseVolume(){\r\nif(window.rPlayer!=null)\r\n{\r\nif(volumlen >= 100 )\r\nvolumlen = 100;\r\nelse\r\nvolumlen += 10;\r\nrPlayer.SetVolume(volumlen);\r\n}}\r\nfunction RealdecreseVolume()\r\n{\r\n   if(window.rPlayer!=null)\r\n{\r\nif(volumlen <= 0 )\r\nvolumlen = 0;\r\nelse\r\nvolumlen -= 10;\r\nrPlayer.SetVolume(volumlen);\r\n}}\r\n  \r\n//-------------------------\r\n\r\nfunction ballmoviee()\r\n{//移动进度条\r\nmovieelen = movie.style.pixelWidth-20;\r\naa = rPlayer.GetPosition();\r\ndd = rPlayer.Getlength();\r\nif (rPlayer.FILENAME!="" && isFinite(Math.round(aa/dd*movieelen)))\r\n{\r\n  mblock.style.left = Math.round(aa/dd*movieelen);\r\n}\r\nballtime = setTimeout(\'ballmoviee();\',1000);\r\n}\r\n\r\nfunction SetPosition(Pos)\r\n{\r\neval(Real+\'SetPosition(Pos)\');\r\n}\r\nfunction SetVolume(Pos)\r\n{\r\neval(Real+\'Volume=Pos\');\r\n}\r\nfunction SetFastForward()\r\n{\r\nif (rPlayer.CanScan)\r\neval(Real+\'FastForward()\');\r\n}\r\nfunction SetFastReverse()\r\n{\r\nif (rPlayer.CanScan)\r\neval(Real+\'FastReverse()\');\r\n}\r\nfunction GetLength()\r\n{\r\nreturn eval(Real+\'GetLength()\');\r\n}\r\nfunction GetPosition()\r\n{\r\ntt=eval(Real+\'GetPosition()\');\r\nreturn tt*1000;\r\n}\r\nfunction SetMute(Status)\r\n{\r\nif (Status)\r\n{\r\neval(Real+\'Mute=true\');\r\n}\r\nelse\r\neval(Real+\'Mute=false\');\r\neval(Real+\'Play()\');\r\n}\r\nfunction FastpositionSet() {\r\n  if(window.rPlayer!=null)\r\n  {\r\n var iLength=rPlayer.GetLength();\r\n var iPosition=rPlayer.GetPosition();\r\n var FastPosition=iLength/20;\r\n if ((iPosition+FastPosition)<=iLength) \r\n {\r\n   iPosition=iPosition+FastPosition;\r\n   rPlayer.SetPosition(iPosition);\r\n }\r\n  }  \r\n  }  \r\nfunction BackpositionSet() {\r\nif(window.rPlayer!=null)\r\n  {\r\n var iLength=rPlayer.GetLength();\r\n var iPosition=rPlayer.GetPosition();\r\n var BackPosition=iLength/20;\r\n if (iPosition>=BackPosition) \r\n {\r\n   iPosition=iPosition-BackPosition;\r\n   rPlayer.SetPosition(iPosition);\r\n }\r\n  }\r\n}\r\nfunction ClickSound(aa)\r\n{\r\nif (Mute)\r\n{\r\nMute=false;\r\nSetMute(Mute);\r\naa.src=\'{$WSLM[siteurl]}images/mediaplayer/toole_08_over.gif\';\r\n}\r\nelse\r\n{\r\nMute=true;\r\nSetMute(Mute);\r\naa.src=\'{$WSLM[siteurl]}images/mediaplayer/toole_08_down.gif\';\r\n}\r\n}\r\n\r\n\r\n//------------------------\r\n\r\nvar PauseStatus = 0;\r\nvar Fill = false;\r\nvar Playing=true;\r\nfunction Playorpasue()\r\n{\r\nif (Playing)\r\n{\r\npause();\r\n}\r\nelse\r\n{\r\nplay();\r\n}\r\n}\r\n\r\nfunction Stop() {\r\n\r\n{\r\nrPlayer.DoStop();\r\nif (Playing)\r\n{\r\nPlaying = false;\r\npp001.src = "{$WSLM[siteurl]}images/mediaplayer/toole_03.gif";\r\npp001.onmouseover=new Function("this.src = \'{$WSLM[siteurl]}images/mediaplayer/toole_03_over.gif\'");\r\npp001.onmouseout=new Function("this.src = \'{$WSLM[siteurl]}images/mediaplayer/toole_03.gif\'");\r\n}\r\nif (PauseStatus==0)\r\n{\r\nPauseStatus = 1;\r\n}\r\nmblock.style.left=0;\r\n\r\n}\r\n}\r\n\r\nfunction pause(){\r\npp001.src = "{$WSLM[siteurl]}images/mediaplayer/toole_03.gif";\r\npp001.onmouseover=new Function("this.src = \'{$WSLM[siteurl]}images/mediaplayer/toole_03_over.gif\'");\r\npp001.onmouseout=new Function("this.src = \'{$WSLM[siteurl]}images/mediaplayer/toole_03.gif\'");\r\nPlaying = false;\r\n\r\n{\r\n   \r\n{\r\nif (PauseStatus==0)\r\n{\r\nPauseStatus = 1;\r\n}\r\n rPlayer.DoPause();\r\n}\r\n}\r\n}\r\nfunction play(){\r\npp001.src = "{$WSLM[siteurl]}images/mediaplayer/toole_04.gif";\r\npp001.onmouseover=new Function("this.src = \'{$WSLM[siteurl]}images/mediaplayer/toole_04_over.gif\'");\r\npp001.onmouseout=new Function("this.src = \'{$WSLM[siteurl]}images/mediaplayer/toole_04.gif\'");\r\nPlaying = true;\r\n\r\n{\r\nif (PauseStatus==1)\r\n{\r\nPauseStatus = 0;\r\n}\r\n rPlayer.DoPlay();\r\n}\r\n}\r\n\r\n//-----------------\r\n\r\nfunction DoFill()\r\n{//最大化/还原窗口\r\nif (Fill) \r\n{//还原窗口\r\nwindow.movieeTo((screen.width-b_width)/2,(screen.height-b_height)/2);\r\nwindow.resizeTo(b_width+width_add,b_height+height_add);\r\nfill001.src = "{$WSLM[siteurl]}images/mediaplayer/Header_06.gif";\r\nFill = false;\r\nfill001.alt = "最大化";\r\n}\r\nelse \r\n{//最大化窗口\r\nwindow.movieeTo(0,0);\r\nb_width = document.body.clientWidth;\r\nb_height = document.body.clientHeight;\r\nwindow.resizeTo(screen.width,screen.height);\r\nfill001.src = "{$WSLM[siteurl]}images/mediaplayer/Header_08.gif";\r\nFill = true;\r\nfill001.alt = "还原";\r\n}\r\n}\r\n\r\nfunction closewin()\r\n{//关闭窗口\r\n  \r\nrPlayer.DoStop();\r\n  window.close();\r\n}\r\n\r\nfunction DoFull()\r\n{//全屏播放\r\neval(Real+\'SetFullScreen()\');\r\n}\r\n\r\nfunction DoMin() \r\n{//最小化窗口\r\noldwidth=window.screenLeft;\r\noldheight=window.screenTop;\r\nwindow.movieeTo(-2000,-2000);\r\nwindow.attachEvent("onfocus",res);\r\n}\r\nfunction res() {\r\nwindow.movieeTo(oldwidth,oldheight);\r\nwindow.detachEvent("onfocus",res)\r\n}\r\n</Script>\r\n\r\n<script language="VBScript">\r\n\r\nsub Mute\r\n   imagesrc=document.all("silent").src\r\n   singlechar=mid(imagesrc,instr(imagesrc,".gif")-1,1)\r\n   if singlechar="8" then\r\n   document.all("silent").src="{$WSLM[siteurl]}images/mediaplayer/toole_08_down.gif"\r\n   document.all("silent").alt="恢复"\r\n   else\r\n   document.all("silent").src="{$WSLM[siteurl]}images/mediaplayer/toole_08.gif"\r\n   document.all("silent").alt="静音"\r\n   end if\r\n   rPlayer.setMute(not rPlayer.GetMute())\r\nend sub\r\n</script>\r\n\r\n<script for="window" event="onresize" LANGUAGE="JavaScript">\r\n//改变窗口大小了限制\r\nif (toole.style.display==\'block\' && ((document.body.clientWidth<440) || (document.body.clientHeight<300+hand_add)))\r\n{\r\n   window.resizeTo(440+width_add,428+height_add+hand_add);\r\n}\r\nif (toole.style.display==\'none\' && ((document.body.clientWidth<262) || (document.body.clientHeight<252+hand_add)))\r\n{\r\n   window.resizeTo(262+width_add,252+height_add+hand_add);\r\n}\r\n//Image1.style.height = MP1.style.pixelHeight-24;\r\n</script>\r\n<SCRIPT FOR="rPlayer" EVENT="PlayStateChange(lOldState, lNewState)" LANGUAGE="JavaScript">\r\nif (lNewState==0 || lNewState==8){\r\nPlayorpasue();\r\n}\r\n</SCRIPT>\r\n\r\n<SCRIPT FOR="rPlayer" EVENT="OpenStateChange(lOldState, lNewState)" LANGUAGE="JavaScript">\r\nif (lNewState==0){\r\nPlayorpasue();\r\n}\r\n</SCRIPT>\r\n\r\n<SCRIPT FOR="rPlayer" EVENT="Error()" LANGUAGE="JavaScript">\r\nif (rPlayer.ErrorCode==-1072889837)\r\nPlay_Mess.innerHTML="<font color=red size=3>无法连接到服务器，可能是网络问题，请重试。</font>";\r\nif (rPlayer.ErrorCode==-2147220992)\r\nPlay_Mess.innerHTML="<font color=red size=3>没有适当的解码器，请重试或安装新的微软播放器。</font>";\r\nif (rPlayer.ErrorCode==-2147220945)\r\nPlay_Mess.innerHTML="<font color=red size=3>文件格式错，请通知我们，我们将尽快进行维修。</font>";\r\nif (rPlayer.ErrorCode==-1072889830)\r\nPlay_Mess.innerHTML="<font color=red size=3>文件打不开，请通知我们，我们将尽快进行维修。</font>";\r\nif (rPlayer.ErrorCode==-2146697211)\r\nPlay_Mess.innerHTML="<font color=red size=3>无法访问这个服务器，可能是代理服务器不可用。</font>";\r\nif (rPlayer.ErrorCode==-1072887822)\r\nPlay_Mess.innerHTML="<font color=red size=3>无法连接到一个广播频道。</font>";\r\n</SCRIPT>\r\n\r\n<SCRIPT FOR="rPlayer" EVENT="Warning(lType, lParam, sDescription)" LANGUAGE="JScript">\r\nPlay_Mess.innerHTML="<font color=red size=3>"+sDescription+"</font>";\r\n</SCRIPT>\r\n\r\n<SCRIPT LANGUAGE="VBScript">\r\nSub rplayer_OnBuffering(lFlags,lPercentage)\r\n  if (lPercentage=100) then\r\n  StartPlay=false\r\n  if (FirstPlay) then\r\n///Image1.style.visibility = "visible"\r\n  else\r\nMP1.style.visibility = "visible"\r\n//Image1.style.visibility = "hidden"\r\n  end if\r\n  exit sub\r\n  end if\r\nEnd Sub\r\nSub rplayer_OnErrorMessage(uSeverity, uRMACode, uUserCode, pUserString, pMoreInfoURL, pErrorString)\r\nselect case rPlayer.GetLastErrorRMACode()\r\ncase -2147221496\r\n  window.alert("您的网络繁忙暂时中断！")\r\ncase -2147221433,-2147221428,-2147221417,-2147217468\r\n  window.alert("您的网络繁忙暂时中断！")\r\ncase else\r\n  window.alert("在线用户过多，服务器限制，请抢线或稍后观看！")\r\nend select\r\nend sub\r\n</SCRIPT>\r\n\r\n<script language="JavaScript">\r\nvar dragapproved=false;\r\nvar eventsource,x,y;\r\nfunction moviee()\r\n{//移动窗口\r\n  if (event.button==1&&dragapproved) //改变被拖动元素在页面上的位置\r\n  {\r\ntop.window.movieeBy(event.clientX-x, event.clientY-y);\r\nreturn false;\r\n  }\r\n}\r\nfunction size()\r\n{//改变窗口大小\r\n  if (event.button==1&&dragapproved) \r\n  {\r\ntop.window.resizeTo(event.clientX+5+width_add-jjjj, event.clientY+5+height_add-jjjj);\r\nreturn false;\r\n  }\r\n}\r\nfunction drags()\r\n{\r\n  if (event.srcElement.className=="drag") //捕捉鼠标和被拖动元素的当前位置\r\n  {\r\ndragapproved=true;\r\nx=event.clientX;\r\ny=event.clientY;\r\ndocument.onmousemoviee=moviee;\r\n  }\r\n  if (event.srcElement.className=="rs001") //捕捉鼠标和被拖动元素的当前位置\r\n  {\r\ndragapproved=true;\r\ndocument.onmousemoviee=size;\r\n  }\r\n}\r\n\r\ndocument.onmousedown=drags;   //鼠标左键按下时,准备拖动\r\ndocument.onmouseup=new Function("dragapproved=false");//鼠标左键放开时,拖动停止\r\n\r\nfunction mini(type)\r\n{//精简与正常窗口切换\r\n  if (type==1)\r\n  {\r\ntoole.style.display=\'none\';\r\nscroll01.style.display=\'none\';\r\nminitoole.style.display=\'block\';\r\nwindow.resizeTo(333+width_add,305+height_add+hand_add);\r\n  }\r\n  if (type==0)\r\n  {\r\ntoole.style.display=\'block\';\r\nscroll01.style.display=\'block\';\r\nminitoole.style.display=\'none\';\r\nwindow.resizeTo((440+width_add),428+height_add+hand_add);\r\n  }\r\n}\r\n\r\n//-----------------\r\n\r\n//显示影片进度条时间\r\nfunction scrollPositionMousemoviee(obj, event)\r\n{\r\n  iCurrentX=event.x;\r\n  if(parseInt(iCurrentX)>=movieelen+20)\r\nreturn;\r\n  if(window.MP1!=null)\r\n  {\r\niTotalTime=GetLength();\r\niPlayTime=parseInt(iCurrentX*iTotalTime/(movieelen+20));\r\nHour=parseInt(iPlayTime/(60*60*1000));\r\nMin=parseInt((iPlayTime-Hour*60*60*1000)/(60*1000));\r\nSec=parseInt((iPlayTime-Hour*60*60*1000-Min*60*1000)/1000);\r\nif(String(Hour).length<2)\r\n  strHour="0"+String(Hour);\r\nelse\r\n  strHour=String(Hour);\r\nif(String(Min).length<2)\r\n  strMin="0"+String(Min);\r\nelse\r\n  strMin=String(Min);\r\nif(String(Sec).length<2)\r\n  strSec="0"+String(Sec);\r\nelse\r\n  strSec=+String(Sec);\r\n \r\nif(Hour!=0)\r\nscrollInfo.replaceAdjacentText("afterBegin",strHour+":"+strMin+":"+strSec);\r\nelse\r\nscrollInfo.replaceAdjacentText("afterBegin",strMin+":"+strSec);\r\n\r\nscrollInfo.style.top=event.y+12;\r\nscrollInfo.style.left=event.x+15;\r\nscrollInfo.style.visibility = "visible";\r\n  }\r\n}\r\nfunction scrollPositionMouseOut()\r\n{\r\n  scrollInfo.style.visibility = "hidden";\r\n}\r\n\r\n//---------------------\r\n\r\nfunction onLond001()\r\n{\r\n  setvol();\r\n  ballmoviee();\r\n}\r\n\r\n</script>\r\n  \r\n</head>\r\n<body bgcolor="#000000" scroll="no" leftmargin="0" topmargin="0" onLoad="onLond001();" onkeydown="no_newwin()">\r\n<center>\r\n<TABLE width="100%" height="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">\r\n<TR>\r\n<TD colspan="3">\r\n<table id="mini_head" border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse; display: block;" bordercolor="#111111" width="100%">\r\n<tr>\r\n<td background="{$WSLM[siteurl]}images/mediaplayer/mini_Header_02.gif">\r\n<img border="0" src="{$WSLM[siteurl]}images/mediaplayer/mini_Header_01.gif" width="4" height="6"></td>\r\n<td background="{$WSLM[siteurl]}images/mediaplayer/mini_Header_02.gif" align="right">\r\n<img border="0" src="{$WSLM[siteurl]}images/mediaplayer/mini_Header_03.gif" width="3" height="6"></td>\r\n</tr>\r\n</table>\r\n<table id="head" border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse; display: none;" bordercolor="#111111" width="100%">\r\n<tr>\r\n<td background="{$WSLM[siteurl]}images/mediaplayer/Header_02.gif">\r\n<img border="0" src="{$WSLM[siteurl]}images/mediaplayer/Header_01.gif" width="135" height="20" onmouseover="this.style.cursor=\'moviee\'" id="mydiv1" class="drag" alt="移动窗口"><img border="0" src="{$WSLM[siteurl]}images/mediaplayer/Header_03.gif" width="2" height="20"></td>\r\n<td background="{$WSLM[siteurl]}images/mediaplayer/Header_02.gif"></td>\r\n<td align="right" background="{$WSLM[siteurl]}images/mediaplayer/Header_02.gif">\r\n<img border="0" src="{$WSLM[siteurl]}images/mediaplayer/Header_07.gif" align="absmiddle" width="9" height="9" alt="最小化" onmousedown="DoMin()" onmouseover="this.style.cursor=\'hand\'"><img border="0" src="{$WSLM[siteurl]}images/mediaplayer/1pix.gif" width="8" height="1"><img border="0" src="{$WSLM[siteurl]}images/mediaplayer/Header_06.gif" align="absmiddle" width="9" height="9" id="fill001" ALT="最大化" onmousedown="DoFill()" onmouseover="this.style.cursor=\'hand\'"><img border="0" src="{$WSLM[siteurl]}images/mediaplayer/1pix.gif" width="10" height="1"><img border="0" src="{$WSLM[siteurl]}images/mediaplayer/Header_05.gif" align="absmiddle" width="9" height="9" ALT="关闭窗口" onmousedown="closewin()" onmouseover="this.style.cursor=\'hand\'"><img border="0" src="{$WSLM[siteurl]}images/mediaplayer/1pix.gif" width="3" height="1"><img border="0" src="{$WSLM[siteurl]}images/mediaplayer/Header_04.gif" align="absmiddle" width="5" height="20" onmouseover="this.style.cursor=\'hand\'"></td>\r\n</tr>\r\n</table>\r\n<Script language="JavaScript">\r\nif (!ie6)\r\n{\r\nmini_head.style.display = "none";\r\nhead.style.display = "block";\r\n}\r\n</Script>\r\n</TD>\r\n</TR>\r\n<TR>\r\n<TD background="{$WSLM[siteurl]}images/mediaplayer/player_01.gif"><IMG SRC="images/Spacer.gif" WIDTH="7" HEIGHT="1" id="left002"></TD>\r\n<TD><IMG SRC="{$WSLM[siteurl]}images/mediaplayer/1pix.gif" WIDTH="200" HEIGHT="1" id="temp002"></TD>\r\n<TD background="{$WSLM[siteurl]}images/mediaplayer/player_02.gif" style="background-position:right;"><IMG SRC="images/Spacer.gif" WIDTH="6" HEIGHT="1" id="right002"></TD>\r\n</TR>\r\n<TR>\r\n<TD background="{$WSLM[siteurl]}images/mediaplayer/player_01.gif" width="7" HEIGHT="99%" id="left001"></TD>\r\n<TD width="99%">\r\n<DIV id="MP1" style="HEIGHT: 100%; POSITION: relative; TOP: 0px; WIDTH: 100%; Z-INDEX: 1;">\r\n<object ID="rPlayer" CLASSID="clsid:CFCDAA03-8BE4-11cf-B84B-0020AFBBCCFA" HEIGHT="100%" WIDTH="100%">\r\n  <param name="_ExtentX" value="20055">\r\n  <param name="_ExtentY" value="7064">\r\n  <param name="AUTOSTART" value="-1">\r\n  <param name="SHUFFLE" value="0">\r\n  <param name="PREFETCH" value="0">\r\n  <param name="NOLABELS" value="0">\r\n  <param name="SRC" value="{$filepath}">\r\n  <param name="CONTROLS" value="ImageWindow">\r\n  <param name="CONSOLE" value="Clip1">\r\n  <param name="LOOP" value="0">\r\n  <param name="NUMLOOP" value="0">\r\n  <param name="CENTER" value="0">\r\n  <param name="MAINTAINASPECT" value="0">\r\n  <param name="BACKGROUNDCOLOR" value="#000000">\r\n  </object>\r\n</DIV>\r\n<script language="javascript"> \r\nrPlayer.SetEnableContextMenu(false);\r\nrPlayer.SetWantErrors(true);\r\n</script>\r\n</TD>\r\n<TD background="{$WSLM[siteurl]}images/mediaplayer/player_02.gif" style="background-position:right;" width="6" HEIGHT="99%" id="right001"></TD>\r\n</TR>\r\n<tr>\r\n<td colspan="3">\r\n<table id="scroll01" border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%">\r\n<tr>\r\n<td background="{$WSLM[siteurl]}images/mediaplayer/scroll_02.gif" width="3%">\r\n<img border="0" src="{$WSLM[siteurl]}images/mediaplayer/scroll_01.gif" width="3" height="15"></td>\r\n<td background="{$WSLM[siteurl]}images/mediaplayer/scroll_02.gif" width="2%" align="right">\r\n<img border="0" src="{$WSLM[siteurl]}images/mediaplayer/scroll_03.gif" width="2" height="15"></td>\r\n<td background="{$WSLM[siteurl]}images/mediaplayer/scroll_04.gif" width="70%">\r\n<DIV onmouseup="Total_Up()" onmousemoviee="scrollPositionMousemoviee(this, event)" onmouseout="scrollPositionMouseOut()" onmousedown="ChangePos()" id="movie" style="CURSOR: hand; POSITION: relative; TOP: 1px; LEFT: 0px; WIDTH: 100%; HEIGHT: 8px"><DIV id="mblock" style="LEFT: 0px; POSITION: absolute; TOP: 0px; HEIGHT: 8px"><IMG alt="播放进度" src="{$WSLM[siteurl]}images/mediaplayer/scroll_07.gif" width="20" height="8" border="0"></DIV>\r\n<DIV id="scrollInfo" style="BORDER: orange 1px ridge; FONT-SIZE: 9px; VISIBILITY: hidden; BACKGROUND: #c0c0c0; POSITION: absolute; zIndex: 9">00:00</DIV>\r\n</DIV>\r\n</td>\r\n<td background="{$WSLM[siteurl]}images/mediaplayer/scroll_02.gif" width="10%">\r\n<img border="0" src="{$WSLM[siteurl]}images/mediaplayer/scroll_05.gif" width="2" height="15"></td>\r\n<td align="center" background="{$WSLM[siteurl]}images/mediaplayer/scroll_02.gif" width="9%">\r\n<img border="0" src="{$WSLM[siteurl]}images/mediaplayer/scroll_08.gif" width="2" height="14"><img border="0" src="{$WSLM[siteurl]}images/mediaplayer/1pix.gif" width="1" height="1"><img border="0" src="{$WSLM[siteurl]}images/mediaplayer/scroll_09.gif" width="7" height="15" alt="左声道" onmousedown="rPlayer.Balance=-10000" onmouseover="this.style.cursor=\'hand\'"><img border="0" src="{$WSLM[siteurl]}images/mediaplayer/1pix.gif" width="1" height="1"><img border="0" src="{$WSLM[siteurl]}images/mediaplayer/scroll_08.gif" width="2" height="14"><img border="0" src="{$WSLM[siteurl]}images/mediaplayer/1pix.gif" width="1" height="1"><img border="0" src="{$WSLM[siteurl]}images/mediaplayer/scroll_10.gif" width="7" height="15" alt="立体声" onmousedown="rPlayer.Balance=0" onmouseover="this.style.cursor=\'hand\'"><img border="0" src="{$WSLM[siteurl]}images/mediaplayer/1pix.gif" width="1" height="1"><img border="0" src="{$WSLM[siteurl]}images/mediaplayer/scroll_08.gif" width="2" height="14"><img border="0" src="{$WSLM[siteurl]}images/mediaplayer/1pix.gif" width="1" height="1"><img border="0" src="{$WSLM[siteurl]}images/mediaplayer/scroll_11.gif" width="7" height="15" alt="右声道" onmousedown="rPlayer.Balance=10000" onmouseover="this.style.cursor=\'hand\'"><img border="0" src="{$WSLM[siteurl]}images/mediaplayer/1pix.gif" width="1" height="1"><img border="0" src="{$WSLM[siteurl]}images/mediaplayer/scroll_08.gif" width="2" height="14"></td>\r\n<td align="right" background="{$WSLM[siteurl]}images/mediaplayer/scroll_02.gif" width="6%">\r\n<img border="0" src="{$WSLM[siteurl]}images/mediaplayer/scroll_06.gif" width="4" height="15"></td>\r\n</tr>\r\n</table>\r\n<table id="toole" border="0" cellpadding="0" cellspacing="0" style="display:block; border-collapse: collapse" bordercolor="#111111" width="100%" background="{$WSLM[siteurl]}images/mediaplayer/toole_02.gif">\r\n<tr>\r\n<td background="{$WSLM[siteurl]}images/mediaplayer/toole_02.gif">\r\n<img border="0" src="{$WSLM[siteurl]}images/mediaplayer/toole_01.gif" width="4" height="49"><img border="0" src="{$WSLM[siteurl]}images/mediaplayer/1pix.gif" width="10" height="1"><img id="pp001" border="0" src="{$WSLM[siteurl]}images/mediaplayer/toole_04.gif" width="36" height="49" ALT="播放" onmousedown="Playorpasue()" onmouseout="this.src=\'{$WSLM[siteurl]}images/mediaplayer/toole_04.gif\'" onmouseover="this.src=\'{$WSLM[siteurl]}images/mediaplayer/toole_04_over.gif\';this.style.cursor=\'hand\'"><img border="0" src="{$WSLM[siteurl]}images/mediaplayer/toole_05.gif" width="25" height="49" ALT="停止" onmousedown="Stop()" onmouseout="this.src=\'{$WSLM[siteurl]}images/mediaplayer/toole_05.gif\'" onmouseover="this.src=\'{$WSLM[siteurl]}images/mediaplayer/toole_05_over.gif\';this.style.cursor=\'hand\'"><img border="0" src="{$WSLM[siteurl]}images/mediaplayer/1pix.gif" width="10" height="1"><img border="0" src="{$WSLM[siteurl]}images/mediaplayer/toole_06.gif" width="25" height="49" ALT="快退" onmousedown="BackpositionSet()" onmouseout="this.src=\'{$WSLM[siteurl]}images/mediaplayer/toole_06.gif\'" onmouseover="this.src=\'{$WSLM[siteurl]}images/mediaplayer/toole_06_over.gif\';this.style.cursor=\'hand\'"><img border="0" src="{$WSLM[siteurl]}images/mediaplayer/toole_07.gif" width="25" height="49" ALT="快进" onmousedown="FastpositionSet()" onmouseout="this.src=\'{$WSLM[siteurl]}images/mediaplayer/toole_07.gif\'" onmouseover="this.src=\'{$WSLM[siteurl]}images/mediaplayer/toole_07_over.gif\';this.style.cursor=\'hand\'"><img border="0" src="{$WSLM[siteurl]}images/mediaplayer/1pix.gif" width="6" height="1"></td>\r\n<td background="{$WSLM[siteurl]}images/mediaplayer/toole_02.gif" align="right">\r\n<img src="{$WSLM[siteurl]}images/mediaplayer/toole_08.gif" style="cursor:hand;" alt="静音" name="silent" width="26" height="49" onclick="vbscript:Mute" border="0"></td>\r\n<td background="{$WSLM[siteurl]}images/mediaplayer/toole_02.gif" style="background-repeat: no-repeat;">\r\n<DIV onmouseup="Total_Up()" onmousemoviee="volgo()" id="volume" style="LEFT: 0px; WIDTH: 70px; POSITION: relative;HEIGHT: 23px" valgin="top" align="center"><DIV id="vblock"><IMG src="{$WSLM[siteurl]}images/mediaplayer/toole_16.gif" width="25" height="49" border="0" ALT="减小音量" onmousedown="RealdecreseVolume()" onmouseout="this.src=\'{$WSLM[siteurl]}images/mediaplayer/toole_16.gif\'" onmouseover="this.src=\'{$WSLM[siteurl]}images/mediaplayer/toole_16_over.gif\';this.style.cursor=\'hand\'"><IMG src="{$WSLM[siteurl]}images/mediaplayer/toole_17.gif" width="25" height="49" border="0" ALT="增强音量" onmousedown="RealincreaseVolume()" onmouseout="this.src=\'{$WSLM[siteurl]}images/mediaplayer/toole_17.gif\'" onmouseover="this.src=\'{$WSLM[siteurl]}images/mediaplayer/toole_17_over.gif\';this.style.cursor=\'hand\'"></DIV>\r\n</DIV>\r\n</td>\r\n<td background="{$WSLM[siteurl]}images/mediaplayer/toole_12.gif" style="background-repeat: no-repeat;">\r\n<MARQUEE id="Play_Mess" WIDTH="100" SCROLLAMOUNT="8" SCROLLDELAY="200" style="margin-left: 8; margin-right: 10;"><FONT color=#284717 size=2>{$WSLM[sitename]}欢迎您观看：</FONT></MARQUEE>\r\n</td>\r\n<td background="{$WSLM[siteurl]}images/mediaplayer/toole_02.gif">\r\n<img border="0" src="{$WSLM[siteurl]}images/mediaplayer/1pix.gif" width="6" height="1"><img border="0" src="{$WSLM[siteurl]}images/mediaplayer/toole_09.gif" width="25" height="49" alt="全屏播放" onmousedown="DoFull()" onmouseout="this.src=\'{$WSLM[siteurl]}images/mediaplayer/toole_09.gif\'" onmouseover="this.src=\'{$WSLM[siteurl]}images/mediaplayer/toole_09_over.gif\';this.style.cursor=\'hand\'"><img border="0" src="{$WSLM[siteurl]}images/mediaplayer/toole_10.gif" width="25" height="49" alt="精简模式" onclick="mini(1);" onmouseout="this.src=\'{$WSLM[siteurl]}images/mediaplayer/toole_10.gif\'" onmouseover="this.src=\'{$WSLM[siteurl]}images/mediaplayer/toole_10_over.gif\';this.style.cursor=\'hand\'"></td>\r\n<td background="{$WSLM[siteurl]}images/mediaplayer/toole_02.gif" align="right">\r\n<img border="0" src="{$WSLM[siteurl]}images/mediaplayer/toole_13.gif" width="13" height="17" onmouseover="this.style.cursor=\'se-resize\'" id="mydiv100" class="rs001" alt="改变窗口大小"><img border="0" src="{$WSLM[siteurl]}images/mediaplayer/toole_14.gif" width="4" height="49"></td>\r\n</tr>\r\n</table>\r\n<table id="minitoole" border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse; display:none;" bordercolor="#111111" width="100%">\r\n<tr>\r\n<td width="33%" background="{$WSLM[siteurl]}images/mediaplayer/miniToole_02.gif">\r\n<img border="0" src="{$WSLM[siteurl]}images/mediaplayer/miniToole_01.gif" width="3" height="20"><img border="0" src="{$WSLM[siteurl]}images/mediaplayer/1pix.gif" width="10" height="1"><img border="0" src="{$WSLM[siteurl]}images/mediaplayer/miniToole_03.gif" width="6" height="20"><img border="0" src="{$WSLM[siteurl]}images/mediaplayer/miniToole_03.gif" width="6" height="20"><img border="0" src="{$WSLM[siteurl]}images/mediaplayer/miniToole_04.gif" width="18" height="20" ALT="播放" onmousedown="play()" onmouseover="this.style.cursor=\'hand\'"><img border="0" src="{$WSLM[siteurl]}images/mediaplayer/miniToole_03.gif" width="6" height="20"><img border="0" src="{$WSLM[siteurl]}images/mediaplayer/miniToole_05.gif" width="18" height="20" ALT="暂停" onmousedown="pause()" onmouseover="this.style.cursor=\'hand\'"><img border="0" src="{$WSLM[siteurl]}images/mediaplayer/miniToole_03.gif" width="6" height="20"><img border="0" src="{$WSLM[siteurl]}images/mediaplayer/miniToole_06.gif" width="18" height="20" ALT="停止" onmousedown="Stop()" onmouseover="this.style.cursor=\'hand\'"><img border="0" src="{$WSLM[siteurl]}images/mediaplayer/miniToole_03.gif" width="6" height="20"><img border="0" src="{$WSLM[siteurl]}images/mediaplayer/miniToole_03.gif" width="6" height="20"><img border="0" src="{$WSLM[siteurl]}images/mediaplayer/miniToole_07.gif" width="18" height="20" ALT="快退" onmousedown="BackpositionSet()" onmouseover="this.style.cursor=\'hand\'"><img border="0" src="{$WSLM[siteurl]}images/mediaplayer/miniToole_03.gif" width="6" height="20"><img border="0" src="{$WSLM[siteurl]}images/mediaplayer/miniToole_08.gif" width="18" height="20" ALT="快进" onmousedown="FastpositionSet()" onmouseover="this.style.cursor=\'hand\'"><img border="0" src="{$WSLM[siteurl]}images/mediaplayer/miniToole_03.gif" width="6" height="20"><img border="0" src="{$WSLM[siteurl]}images/mediaplayer/miniToole_03.gif" width="6" height="20"><img border="0" src="{$WSLM[siteurl]}images/mediaplayer/miniToole_09.gif" width="33" height="20" alt="全屏播放" onmousedown="DoFull()" onmouseover="this.style.cursor=\'hand\'"><img border="0" src="{$WSLM[siteurl]}images/mediaplayer/miniToole_03.gif" width="6" height="20"><img border="0" src="{$WSLM[siteurl]}images/mediaplayer/miniToole_10.gif" width="33" height="20" alt="正常模式" onclick="mini(0);" onmouseover="this.style.cursor=\'hand\'"><img border="0" src="{$WSLM[siteurl]}images/mediaplayer/miniToole_03.gif" width="6" height="20"><img border="0" src="{$WSLM[siteurl]}images/mediaplayer/miniToole_03.gif" width="6" height="20"></td>\r\n<td width="33%" background="{$WSLM[siteurl]}images/mediaplayer/miniToole_02.gif">\r\n</td>\r\n<td width="34%" background="{$WSLM[siteurl]}images/mediaplayer/miniToole_02.gif" align="right">\r\n<img class="rs001" border="0" src="{$WSLM[siteurl]}images/mediaplayer/miniToole_12.gif" width="8" height="11" onmouseover="this.style.cursor=\'se-resize\'" alt="改变窗口大小"><img border="0" src="{$WSLM[siteurl]}images/mediaplayer/miniToole_11.gif" width="3" height="20"></td>\r\n</tr>\r\n</table>\r\n</td>\r\n</tr>\r\n</TABLE>\r\n', 0),
	(4, 'Flv播放器', '<object type="application/x-shockwave-flash" data="{$WSLM[siteurl]}images/flvplayer.swf" width="100%" height="100%">\r\n  <param name="movie" value="{$WSLM[siteurl]}images/flvplayer.swf?autostart=true&file={$filepath}">\r\n</object>', 0),
	(5, 'flash 播放器', '<object width="100%" height="100%"><param name="movie" value="{$filepath}"></param><param name="allowscriptaccess" value="always"><embed src="{$filepath}" type="application/x-shockwave-flash" width="100%" height="100%"></embed></object>\r\n', 0);
/*!40000 ALTER TABLE `mg_player` ENABLE KEYS */;


# Dumping structure for table mg_wlsm.mg_position
DROP TABLE IF EXISTS `mg_position`;
CREATE TABLE IF NOT EXISTS `mg_position` (
  `posid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '',
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`posid`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

# Dumping data for table mg_wlsm.mg_position: 5 rows
DELETE FROM `mg_position`;
/*!40000 ALTER TABLE `mg_position` DISABLE KEYS */;
INSERT INTO `mg_position` (`posid`, `name`, `listorder`) VALUES
	(6, '栏目-团队', 0),
	(7, '栏目-新闻', 0),
	(8, '栏目-产品', 0),
	(9, '栏目-案例', 0),
	(10, '栏目-投资案例', 0);
/*!40000 ALTER TABLE `mg_position` ENABLE KEYS */;


# Dumping structure for table mg_wlsm.mg_process
DROP TABLE IF EXISTS `mg_process`;
CREATE TABLE IF NOT EXISTS `mg_process` (
  `processid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `workflowid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `passname` varchar(20) NOT NULL,
  `passstatus` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rejectname` varchar(20) NOT NULL,
  `rejectstatus` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`processid`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

# Dumping data for table mg_wlsm.mg_process: 1 rows
DELETE FROM `mg_process`;
/*!40000 ALTER TABLE `mg_process` DISABLE KEYS */;
INSERT INTO `mg_process` (`processid`, `workflowid`, `name`, `description`, `passname`, `passstatus`, `rejectname`, `rejectstatus`) VALUES
	(8, 1, '审核', '', '通过', 99, '删除', 0);
/*!40000 ALTER TABLE `mg_process` ENABLE KEYS */;


# Dumping structure for table mg_wlsm.mg_process_status
DROP TABLE IF EXISTS `mg_process_status`;
CREATE TABLE IF NOT EXISTS `mg_process_status` (
  `processid` smallint(5) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL,
  KEY `processid` (`processid`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# Dumping data for table mg_wlsm.mg_process_status: 20 rows
DELETE FROM `mg_process_status`;
/*!40000 ALTER TABLE `mg_process_status` DISABLE KEYS */;
INSERT INTO `mg_process_status` (`processid`, `status`) VALUES
	(8, 99),
	(8, 0),
	(2, 1),
	(2, 3),
	(2, 4),
	(2, 7),
	(3, 4),
	(3, 7),
	(3, 99),
	(4, 1),
	(4, 3),
	(4, 4),
	(4, 5),
	(5, 4),
	(5, 5),
	(5, 6),
	(5, 7),
	(6, 6),
	(6, 7),
	(6, 99);
/*!40000 ALTER TABLE `mg_process_status` ENABLE KEYS */;


# Dumping structure for table mg_wlsm.mg_role
DROP TABLE IF EXISTS `mg_role`;
CREATE TABLE IF NOT EXISTS `mg_role` (
  `roleid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `ipaccess` text NOT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`roleid`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

# Dumping data for table mg_wlsm.mg_role: 5 rows
DELETE FROM `mg_role`;
/*!40000 ALTER TABLE `mg_role` DISABLE KEYS */;
INSERT INTO `mg_role` (`roleid`, `name`, `description`, `ipaccess`, `listorder`, `disabled`) VALUES
	(1, '超级管理员', '超级管理员', '', 0, 0),
	(2, '总编', '拥有所有栏目和所有专题的所有权限，并且可以添加栏目和专题', '', 0, 0),
	(3, '栏目编辑', '拥有某些栏目的信息录入、审核及管理权限，需要进一步详细设置。', '', 0, 0),
	(4, '设计师', '拥有模板与标签管理权限', '', 0, 0),
	(5, '财务人员', '拥有订单查看、录入银行汇款、开发票等权限。', '', 0, 0);
/*!40000 ALTER TABLE `mg_role` ENABLE KEYS */;


# Dumping structure for table mg_wlsm.mg_search
DROP TABLE IF EXISTS `mg_search`;
CREATE TABLE IF NOT EXISTS `mg_search` (
  `searchid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(15) NOT NULL,
  `data` mediumtext NOT NULL,
  PRIMARY KEY (`searchid`),
  KEY `type` (`type`),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

# Dumping data for table mg_wlsm.mg_search: 46 rows
DELETE FROM `mg_search`;
/*!40000 ALTER TABLE `mg_search` DISABLE KEYS */;
INSERT INTO `mg_search` (`searchid`, `type`, `data`) VALUES
	(1, 'picdesart', '《铁甲龙》演绎火一般的热血之路！ 《铁甲龙》 演绎 火 一般 的 热血 之路 《铁甲龙》 演绎 火 一般 的 热血 之路 《铁甲龙》 演绎 火 一般 的 热血 之路'),
	(2, 'picdesart', '《铁甲龙》演绎火一般的热血之路！ 《铁甲龙》 演绎 火 一般 的 热血 之路 《铁甲龙》 演绎 火 一般 的 热血 之路 做 4 月新 番 到了 第 5 个 年头 居然 还没 有 审美 疲劳 这本 身 就是 件 可喜 可贺 的 事情 了 吧 … 今年 的 4 月 番 岁 不及 去年 但 可圈可点 之作 也非 常 之多 希望 能有 神 作出 现 小编 依旧 会在 微 博 中 进行 及时 扫 番 敬请 关注 = w ='),
	(3, 'picdesart', '4月新番《散华礼弥》追加声优公开 4 月新 番 《散华礼弥》 追加 声优 公开 4 月新 番 《散华礼弥》 追加 声优 公开 预定 于 4 月 开播 的 新 番 《散华礼弥》 原作 是由 曾经 创作 过 《 GO 纯情 水 泳 社 》 的 服部 充 创作 目前 连载 于 讲 谈 社 《别册少年 Magazine 》 的 一部 关于 人与 僵尸 之间 的 搞 笑 恋爱 漫画 作品 讲述 了高 中美 少女 散 华 礼 弥 被 父亲 不小 心 打落 悬崖 而特 别 喜欢 僵尸 的 高'),
	(4, 'picdesart', '4月新番《散华礼弥》追加声优公开 4 月新 番 《散华礼弥》 追加 声优 公开 4 月新 番 《散华礼弥》 追加 声优 公开 预定 于 4 月 开播 的 新 番 《散华礼弥》 原作 是由 曾经 创作 过 《 GO 纯情 水 泳 社 》 的 服部 充 创作 目前 连载 于 讲 谈 社 《别册少年 Magazine 》 的 一部 关于 人与 僵尸 之间 的 搞 笑 恋爱 漫画 作品 讲述 了高 中美 少女 散 华 礼 弥 被 父亲 不小 心 打落 悬崖 而特 别 喜欢 僵尸 的 高中 生降 谷 千 纮 目击 了这 一切 机缘 巧合 的 情况 下意 外地 令 本来 已死 的 女主 角 散 华 礼 弥 因 复活 术 而成 为 僵尸'),
	(5, 'picdesart', '高中生降谷千纮目击了这一切，机缘巧合的情况下 高中 生降 谷 千 纮 目击 了这 一切 机缘 巧合 的 情况 下高 中生 降 谷 千 纮 目击 了这 一切 机缘 巧合 的 情况 下 意外 地 令 本来 已死 的 女主 角 散 华 礼 弥 因 复活 术 而成 为 僵尸 变成 了 僵尸 的 散 华 礼 弥 顺理 成章 地 开始 寄居 在 降 谷 千 纮 家里 就这 样 降 谷 千 纮 开始 了 与 一直 憧憬 的 僵尸 共同 生活'),
	(6, 'picdesart', '谷千纮目击了这一切，机缘巧合的情况下，意外地令本来已死的女主角散华礼弥因复活术而成为僵尸，变成了僵尸的散 谷 千 纮 目击 了这 一切 机缘 巧合 的 情况 下意 外地 令 本来 已死 的 女主 角 散 华 礼 弥 因 复活 术 而成 为 僵尸 变成 了 僵尸 的 散 谷 千 纮 目击 了这 一切 机缘 巧合 的 情况 下意 外地 令 本来 已死 的 女主 角 散 华 礼 弥 因 复活 术 而成 为 僵尸 变成 了 僵尸 的 散 作 是由 曾经 创作 过 《 GO 纯情 水 泳 社 》 的 服部 充 创作 目前 连载 于 讲 谈 社 《别册少年 Magazine 》 的 一部 关于 人与 僵尸 之间 的 搞 笑 恋爱 漫画 作品 讲述 了高 中美 少女 散 华 礼 弥 被 父亲 不小 心 打落 悬崖 而特 别 喜欢 僵尸 的 高中 生降 谷 千 纮 目击 了这 一切 机缘 巧合 的 情况 下意 外地 令 本来 已死 的 女主 角 散 华 礼 弥 因 复活 术 而成 为 僵尸 变成 了 僵'),
	(7, 'picdesart', '变成了僵尸的散华礼弥顺理成章地开始寄居在降谷千纮家 变成 了 僵尸 的 散 华 礼 弥 顺理 成章 地 开始 寄居 在 降 谷 千 纮 家 变成 了 僵尸 的 散 华 礼 弥 顺理 成章 地 开始 寄居 在 降 谷 千 纮 家 由 曾经 创作 过 《 GO 纯情 水 泳 社 》 的 服部 充 创作 目前 连载 于 讲 谈 社 《别册少年 Magazine 》 的 一部 关于 人与 僵尸 之间 的 搞 笑 恋爱 漫画 作品 讲述 了高 中美 少女 散 华 礼 弥 被 父亲 不小 心 打落 悬崖 而特 别 喜欢 僵尸 的 高中 生降 谷 千'),
	(8, 'picdesart', '就这样降谷千纮开始了与一直憧憬的僵尸共同生活。 就这 样 降 谷 千 纮 开始 了 与 一直 憧憬 的 僵尸 共同 生活 就这 样 降 谷 千 纮 开始 了 与 一直 憧憬 的 僵尸 共同 生活 《散华礼弥》 原作 是由 曾经 创作 过 《 GO 纯情 水 泳 社 》 的 服部 充 创作 目前 连载 于 讲 谈 社 《别册少年 Magazine 》 的一的'),
	(9, 'picdesart', '预定于4月开播的新番《散华礼弥》 预定 于 4 月 开播 的 新 番 《散华礼弥》 预定 于 4 月 开播 的 新 番 《散华礼弥》 经 创作 过 《 GO 纯情 水 泳 社 》 的 服部 充 创作 目前 连载 于 讲 谈 社 《别册少年 Magazine 》 的 一部 关于 人与 僵尸 之间 的 搞 笑 恋爱 漫画 作品 讲述 了高 中美 少女 散 华 礼 弥 被 父亲 不小 心 打落 悬崖 而特 别 喜欢 僵尸 的 高中 生降 谷 千 纮 目击 了这 一切 机缘 巧合 的 情况 下意 外地 令 本来 已死 的 女主 角 散 华 礼 弥 因 复活 术 而成 为 僵尸'),
	(10, 'backfront', '动漫COSPLAY策划 动漫 COSPLAY 策划 动漫 COSPLAY 策划 uploadfile/2012/0326/20120326095712599.jpg'),
	(11, 'backfront', '动漫产品形象策划 动漫 产品 形象 策划 动漫 产品 形象 策划 uploadfile/2012/0326/20120326095930804.jpg'),
	(12, 'backfront', '动漫渠道建设策划 动漫 渠道 建设 策划 动漫 渠道 建设 策划 uploadfile/2012/0326/20120326100022136.jpg'),
	(13, 'backfront', '动漫推广策划 动漫 推广 策划 动漫 推广 策划 uploadfile/2012/0326/20120326100050514.jpg'),
	(14, 'backfront', '动漫网络营销策划 动漫 网络 营销 策划 动漫 网络 营销 策划 uploadfile/2012/0326/20120326100114719.jpg'),
	(15, 'backfront', '动漫展会活动策划 动漫 展会 活动 策划 动漫 展会 活动 策划 uploadfile/2012/0326/20120326100141288.jpg'),
	(16, 'backfront', '动漫终端设计策划 动漫 终端 设计 策划 动漫 终端 设计 策划 uploadfile/2012/0326/20120326100231958.jpg'),
	(17, 'backfront', '动漫终端营销策划 动漫 终端 营销 策划 动漫 终端 营销 策划 uploadfile/2012/0326/20120326100301117.jpg http: //www.baidu.com'),
	(18, 'team', '团队管理 团队 管理 团队 管理'),
	(19, 'team', '企业团队2 企业 团队 2 企业 团队 2 企业 团队 2 企业 团队 2 企业 团队 2'),
	(20, 'team', '企业团队2 企业 团队 2 企业 团队 2 企业 团队 2'),
	(21, 'team', '企业团队444 企业 团队 444 企业 团队 444 企业 团队 444 企业 团队 444 企业 团队 444 企业 团队 444'),
	(22, 'team', '企业团队5 企业 团队 5 企业 团队 5 企业 团队 5 企业 团队 5 企业 团队 5 企业 团队 52225554545 & nbsp ; 得到 地地 道道 地地 道道'),
	(23, 'catproslider', '链接01 链接 01 链接 01 uploadfile/2012/0326/20120326100654389.jpg http: //baidu.com'),
	(24, 'catproslider', '链接02 链接 02 链接 02 uploadfile/2012/0326/20120326100731954.png http: //www.zgweb.com'),
	(25, 'catproslider', '链接03 链接 03 链接 03 uploadfile/2012/0326/20120326100805548.jpg http.//music365.ac.cn'),
	(26, 'catproslider', '链接04 链接 04 链接 04 uploadfile/2012/0326/20120326100831495.jpg http: //php.net'),
	(27, 'team', '动画师团队 动画 师团 队 动画 师团 队 动画 师团 队 动画 师团 队 动画 师团 队 动画 师团 队 动画 师团 队 动画 师团 队 & nbsp ; 动画 师团 队 动画 师团 队 动画 师团 队 动画 师团 队 动画 师团 队 动画 师团 队 动画 师团 队 动画 师团 队 动画 师团 队 动画 师团 队 动画 师团 队 动画 师团 队 动画 师团 队 动画 师团 队 动画 师团 队 动画 师团 队 动画 师团 队 动画 师团 队 动画 师团 队 动画 师团 队 动画 师团 队 动画 师团 队 动画 师团 队 动画 师团 队 动画 师团 队 动画 师团 队 动画 师团 队 动画 师团 队 动画 师团 队 动画 师团 队 动画 师团 队 动画 师团 队 动画 师团 队 动画 师团 队'),
	(28, 'team', '设计师团队 设计 师团 队 设计 师团 队 设计 师团 队 设计 师团 队 设计 师团 队 设计 师团 队 设计 师团 队 设计 师团 队 设计 师团 队 设计 师团 队 设计 师团 队 设计 师团 队 设计 师团 队 设计 师团 队 设计 师团 队 设计 师团 队 设计 师团 队 设计 师团 队 设计 师团 队 & nbsp ; 设计 师团 队 设计 师团 队 设计 师团 队 设计 师团 队 设计 师团 队 设计 师团 队 设计 师团 队 设计 师团 队 设计 师团 队 设计 师团 队 设计 师团 队 设计 师团 队 设计 师团 队 设计 师团 队 设计 师团 队 设计 师团 队 设计 师团 队 设计 师团 队 设计 师团 队 设计 师团 队 设计 师团 队 设计 师团 队 设计 师团 队 设计 师团 队 设计 师团 队 设计 师团 队 设计 师团 队 设计 师团 队 设计 师团 队 设计 师团 队 设计 师团 队 设计 师团 队 设计 师团 队 设计 师团 队 设计 师团 队 设计 师团 队 设计 师团 队 设计 师团 队 设计 师团 队 设计 师团 队 设计 师团 队 设计 师团 队 设计 师团 队 设计 师团 队 设计 师团 队 设计 师团 队 设计 师团 队 设计 师团 队 设计 师团 队 设计 师团 队 设计 师团 队 设计 师团 队 设计 师团 队 设计 师团 队 设计 师团 队 设计 师团 队 设计 师团 队 设计 师团 队 设计 师团 队 设计 师团 队 设计 师团 队 设计 师团 队 设计 师团 队 设计 师团 队 设计 师团 队 设计 师团 队 设计 师团 队 设计 师团 队 设计 师团 队 设计 师团 队 设计 师团 队'),
	(29, 'partner', '桂纶镁 桂 纶 镁 桂 纶 镁 桂 纶 镁 女 1983年 12月 25 日出 生中 国 台湾 新生 代 演员 高中 就读 薇 阁 高中 大学 毕业 于 淡 江大 学法 国语 文学 系 曾于 2004年 9 月前 往 法国 里昂 第三 大学 交换 学生 高二时 出演 《蓝色大门》 当中 的 “ 孟 克 柔 ” 跨出 了她 人生 第一 步 表演 生涯 之后 桂 纶 镁 出演 了 《经过》 《危险心灵》 《波丽士大人》 等 影视 剧'),
	(30, 'culture', '国漫精品！夏天岛名家名作集体入驻 国 漫 精品 夏天 岛 名家 名作 集体 入驻 国 漫 精品 夏天 岛 名家 名作 集体 入驻'),
	(31, 'picart', '歼击机 歼击 机歼击 机'),
	(32, 'picart', '直升机 直升 机 直升 机'),
	(33, 'picart', '悟空 悟空 悟空'),
	(34, 'picdesartsug', '美味家居 美味 家居 美味 家居 美味 家居 美味 家居 美味 家居'),
	(35, 'picdesartsug', '味美香 味美 香味 美 香 味美 香味 美 香味 美 香味 美 香味 美 香味 美 香'),
	(36, 'picdesartsug', '怡美家 怡 美 家 怡 美 家 一 咩 价'),
	(37, 'picdesartsug', '味达美味达美味达美味达美味达美味达美味达美味达美味达美味达美味达美味达美味达美味达美味达美 味 达美 味 达美 味 达美 味 达美 味 达美 味 达美 味 达美 味 达美 味 达美 味 达美 味 达美 味 达美 味 达美 味 达美 味 达美 味 达美 味 达美 味 达美 味 达美 味 达美 味 达美 味 达美 味 达美 味 达美 味 达美 味 达美 味 达美 味 达美 味 达美 味 达美 味 达美 味 达美 味 达美 味 达美 味 达美 味 达美 味 达美 味 达美 味 达美 味 达美 味 达美 味 达美 味 达美 味 达美'),
	(38, 'picdesartsug', '成名家 成名 家成 名家 成名 家成 名家 成名 家成 名家 成名 家'),
	(39, 'picdesartsug', '益美鲜 益 美鲜 益 美鲜 益 美鲜 益 美鲜'),
	(40, 'picdesartsug', '益达 益达 益达 益 美鲜 益 美鲜 益 美鲜'),
	(41, 'picdesartsug', '达沃斯 达 沃 斯达 沃 斯 达 沃 斯达 沃 斯达 沃 斯'),
	(42, 'simplenews', '【理财投资】理财规划_家庭理财_生活理财_个人理财 【 理财 投资 】 理财 规划 _ 家庭 理财 _ 生活 理财 _ 个人 理财 【 理财 投资 】 理财 规划 _ 家庭 理财 _ 生活 理财 _ 个人 理财'),
	(43, 'simplenews', '投资（Investment）——投资、出口、消费被称为发展经济的“三驾马车" 投资 Investment ) — — 投资 出口 消费 被称为 发展 经济 的 “ 三 驾 马车 " 投资 Investment ) — — 投资 出口 消费 被称为 发展 经济 的 “ 三 驾 马车 "'),
	(44, 'simplenews', '投资的含义 投资 的 含义 投资 的 含义'),
	(45, 'simplenews', '投资的实质 投资 的 实质 投资 的 实质'),
	(46, 'simplenews', '投资类型 投资 类型 投资 类型'),
	(47, 'picdesart', '4月新番《散华礼弥》追加声优公开 4 月新 番 《散华礼弥》 追加 声优 公开 4 月新 番 《散华礼弥》 追加 声优 公开 4 月新 番 《散华礼弥》 追加 声优 公开'),
	(48, 'picdesart', '4月新番《散华礼弥》追加声优公开 4 月新 番 《散华礼弥》 追加 声优 公开 4 月新 番 《散华礼弥》 追加 声优 公开 4 月新 番 《散华礼弥》 追加 声优 公开'),
	(49, 'picdesart', '4月新番《散华礼弥》追加声优公开 4 月新 番 《散华礼弥》 追加 声优 公开 4 月新 番 《散华礼弥》 追加 声优 公开 4 月新 番 《散华礼弥》 追加 声优 公开'),
	(50, 'picdesart', '4月新番《散华礼弥》追加声优公开 4 月新 番 《散华礼弥》 追加 声优 公开 4 月新 番 《散华礼弥》 追加 声优 公开 4 月新 番 《散华礼弥》 追加 声优 公开'),
	(51, 'picdesart', '4月新番《散华礼弥》追加声优公开 4 月新 番 《散华礼弥》 追加 声优 公开 4 月新 番 《散华礼弥》 追加 声优 公开 4 月新 番 《散华礼弥》 追加 声优 公开'),
	(52, 'picdesart', '4月新番《散华礼弥》追加声优公开 4 月新 番 《散华礼弥》 追加 声优 公开 4 月新 番 《散华礼弥》 追加 声优 公开 4 月新 番 《散华礼弥》 追加 声优 公开'),
	(53, 'picdesart', '4月新番《散华礼弥》追加声优公开 4 月新 番 《散华礼弥》 追加 声优 公开 4 月新 番 《散华礼弥》 追加 声优 公开'),
	(54, 'picdesart', '4月新番《散华礼弥》追加声优公开 4 月新 番 《散华礼弥》 追加 声优 公开 4 月新 番 《散华礼弥》 追加 声优 公开'),
	(55, 'picdesart', '4月新番《散华礼弥》追加声优公开 4 月新 番 《散华礼弥》 追加 声优 公开 4 月新 番 《散华礼弥》 追加 声优 公开 4 月新 番 《散华礼弥》 追加 声优 公开');
/*!40000 ALTER TABLE `mg_search` ENABLE KEYS */;


# Dumping structure for table mg_wlsm.mg_search_type
DROP TABLE IF EXISTS `mg_search_type`;
CREATE TABLE IF NOT EXISTS `mg_search_type` (
  `type` char(15) NOT NULL,
  `name` char(20) NOT NULL,
  `md5key` char(32) NOT NULL,
  `description` char(255) NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# Dumping data for table mg_wlsm.mg_search_type: 6 rows
DELETE FROM `mg_search_type`;
/*!40000 ALTER TABLE `mg_search_type` DISABLE KEYS */;
INSERT INTO `mg_search_type` (`type`, `name`, `md5key`, `description`, `listorder`, `disabled`) VALUES
	('news', '资讯', '', '', 1, 0),
	('picture', '图片', '', '', 2, 0),
	('down', '下载', '', '', 3, 0),
	('info', '信息', '', '', 4, 0),
	('product', '产品', '', '', 5, 0),
	('ask', '问吧', '', '', 6, 0);
/*!40000 ALTER TABLE `mg_search_type` ENABLE KEYS */;


# Dumping structure for table mg_wlsm.mg_session
DROP TABLE IF EXISTS `mg_session`;
CREATE TABLE IF NOT EXISTS `mg_session` (
  `sessionid` char(32) NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ip` char(15) NOT NULL,
  `lastvisit` int(10) unsigned NOT NULL DEFAULT '0',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `module` char(15) NOT NULL,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `contentid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `data` char(255) NOT NULL,
  PRIMARY KEY (`sessionid`),
  KEY `lastvisit` (`lastvisit`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

# Dumping data for table mg_wlsm.mg_session: 2 rows
DELETE FROM `mg_session`;
/*!40000 ALTER TABLE `mg_session` DISABLE KEYS */;
INSERT INTO `mg_session` (`sessionid`, `userid`, `ip`, `lastvisit`, `groupid`, `module`, `catid`, `contentid`, `data`) VALUES
	('5lf4mh5vtogjbs0081kcn40g13', 1, '127.0.0.1', 1332847647, 1, 'wslm', 0, 0, 'admin_groupid|s:1:"1";is_admin|i:1;'),
	('87a7bfcq7e47s44llqej7st4h6', 1, '127.0.0.1', 1332847651, 1, 'wslm', 0, 0, 'admin_groupid|s:1:"1";is_admin|i:1;field_image|i:1;checkcode|s:4:"29rk";');
/*!40000 ALTER TABLE `mg_session` ENABLE KEYS */;


# Dumping structure for table mg_wlsm.mg_status
DROP TABLE IF EXISTS `mg_status`;
CREATE TABLE IF NOT EXISTS `mg_status` (
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `issystem` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# Dumping data for table mg_wlsm.mg_status: 10 rows
DELETE FROM `mg_status`;
/*!40000 ALTER TABLE `mg_status` DISABLE KEYS */;
INSERT INTO `mg_status` (`status`, `name`, `description`, `issystem`) VALUES
	(0, '删除', '已被删除至回收站', 1),
	(1, '退稿', '稿件被退回', 1),
	(2, '草稿', '草稿', 1),
	(3, '待审', '等待审核', 1),
	(99, '终审通过', '已经通过终审', 1),
	(4, '一审通过', '一审通过', 0),
	(5, '二审退稿', '二审退稿', 0),
	(6, '二审通过', '二审通过', 0),
	(7, '终审退稿', '终审退稿', 0),
	(98, '定时发布', '定时发布', 1);
/*!40000 ALTER TABLE `mg_status` ENABLE KEYS */;


# Dumping structure for table mg_wlsm.mg_times
DROP TABLE IF EXISTS `mg_times`;
CREATE TABLE IF NOT EXISTS `mg_times` (
  `action` char(10) NOT NULL,
  `ip` char(15) NOT NULL,
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  `times` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`action`,`ip`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

# Dumping data for table mg_wlsm.mg_times: 0 rows
DELETE FROM `mg_times`;
/*!40000 ALTER TABLE `mg_times` DISABLE KEYS */;
/*!40000 ALTER TABLE `mg_times` ENABLE KEYS */;


# Dumping structure for table mg_wlsm.mg_type
DROP TABLE IF EXISTS `mg_type`;
CREATE TABLE IF NOT EXISTS `mg_type` (
  `typeid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `module` char(15) NOT NULL DEFAULT 'wslm',
  `modelid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `name` char(30) NOT NULL,
  `style` char(5) NOT NULL,
  `typedir` char(20) NOT NULL,
  `description` char(255) NOT NULL,
  `thumb` char(100) NOT NULL,
  `url` char(100) NOT NULL,
  `template` char(50) NOT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`typeid`),
  KEY `module` (`module`,`listorder`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

# Dumping data for table mg_wlsm.mg_type: 32 rows
DELETE FROM `mg_type`;
/*!40000 ALTER TABLE `mg_type` DISABLE KEYS */;
INSERT INTO `mg_type` (`typeid`, `module`, `modelid`, `name`, `style`, `typedir`, `description`, `thumb`, `url`, `template`, `listorder`) VALUES
	(1, 'link', 0, '默认分类', '', '', '', '', '', '', 0),
	(2, 'error_report', 0, '错字', '', '', '', '', '', '', 0),
	(3, 'error_report', 0, '无效URL', '', '', '', '', '', '', 0),
	(4, 'yp', 0, '计算机/互联网类', '', '', '', '', '', '', 0),
	(5, 'yp', 0, '通讯/电子/电力类', '', '', '', '', '', '', 0),
	(6, 'yp', 0, '市场/销售/业务类', '', '', '', '', '', '', 0),
	(7, 'yp', 0, '企业经营/管理类', '', '', '', '', '', '', 0),
	(8, 'yp', 0, '财务类', '', '', '', '', '', '', 0),
	(9, 'yp', 0, '行政/人事类', '', '', '', '', '', '', 0),
	(10, 'yp', 0, '文职类', '', '', '', '', '', '', 0),
	(11, 'yp', 0, '广告/装潢/工业设计类', '', '', '', '', '', '', 0),
	(12, 'yp', 0, '房地产/建筑类', '', '', '', '', '', '', 0),
	(13, 'yp', 0, '翻译类', '', '', '', '', '', '', 0),
	(14, 'yp', 0, '制药类', '', '', '', '', '', '', 0),
	(15, 'yp', 0, '运输/物流类', '', '', '', '', '', '', 0),
	(16, 'yp', 0, '电力/能源/电气类', '', '', '', '', '', '', 0),
	(17, 'yp', 0, '化工类', '', '', '', '', '', '', 0),
	(18, 'yp', 0, '机械/设备类', '', '', '', '', '', '', 0),
	(19, 'yp', 0, '工业/工厂类', '', '', '', '', '', '', 0),
	(20, 'yp', 0, '技工类', '', '', '', '', '', '', 0),
	(21, 'yp', 0, '商业/旅游/服务业类', '', '', '', '', '', '', 0),
	(22, 'yp', 0, '金融/经济类', '', '', '', '', '', '', 0),
	(23, 'yp', 0, '文化/教育/新闻/出版类', '', '', '', '', '', '', 0),
	(24, 'yp', 0, '轻工类', '', '', '', '', '', '', 0),
	(25, 'yp', 0, '医疗/护理/保健类', '', '', '', '', '', '', 0),
	(26, 'yp', 0, '律师/法务类', '', '', '', '', '', '', 0),
	(27, 'yp', 0, '地矿冶金/测绘技术类', '', '', '', '', '', '', 0),
	(28, 'yp', 0, '科学研究类', '', '', '', '', '', '', 0),
	(29, 'yp', 0, '航空航天/核工业类', '', '', '', '', '', '', 0),
	(30, 'yp', 0, '农林牧渔类', '', '', '', '', '', '', 0),
	(31, 'yp', 0, '其它类别', '', '', '', '', '', '', 0),
	(32, 'mail', 0, '网站资讯', '', '', '', '', '', '', 0);
/*!40000 ALTER TABLE `mg_type` ENABLE KEYS */;


# Dumping structure for table mg_wlsm.mg_urlrule
DROP TABLE IF EXISTS `mg_urlrule`;
CREATE TABLE IF NOT EXISTS `mg_urlrule` (
  `urlruleid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `module` varchar(15) NOT NULL,
  `file` varchar(20) NOT NULL,
  `ishtml` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `urlrule` varchar(255) NOT NULL,
  `example` varchar(255) NOT NULL,
  PRIMARY KEY (`urlruleid`)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

# Dumping data for table mg_wlsm.mg_urlrule: 4 rows
DELETE FROM `mg_urlrule`;
/*!40000 ALTER TABLE `mg_urlrule` DISABLE KEYS */;
INSERT INTO `mg_urlrule` (`urlruleid`, `module`, `file`, `ishtml`, `urlrule`, `example`) VALUES
	(3, 'wslm', 'category', 1, 'html/{$categorydir}/index.{$fileext}|{$categorydir}/{$page}.{$fileext}', 'html/it/news/2_1.html'),
	(4, 'wslm', 'category', 0, 'list.php?catid={$catid}|list.php?catid={$catid}&page={$page}', 'list.php?catid=1&page=2'),
	(7, 'wslm', 'show', 1, 'html/{$year}/{$month}{$day}/{$contentid}.{$fileext}|{$year}/{$month}{$day}/{$contentid}_{$page}.{$fileext}', 'html/2012/0102/1_2.html'),
	(10, 'wslm', 'show', 0, 'show.php?contentid={$contentid}|show.php?contentid={$contentid}&page={$page}', 'show.php?contentid=1&page=2');
/*!40000 ALTER TABLE `mg_urlrule` ENABLE KEYS */;


# Dumping structure for table mg_wlsm.mg_vote_useroption
DROP TABLE IF EXISTS `mg_vote_useroption`;
CREATE TABLE IF NOT EXISTS `mg_vote_useroption` (
  `optionid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `subjectid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  KEY `optionid` (`optionid`),
  KEY `subjectid` (`subjectid`),
  KEY `userid` (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# Dumping data for table mg_wlsm.mg_vote_useroption: 0 rows
DELETE FROM `mg_vote_useroption`;
/*!40000 ALTER TABLE `mg_vote_useroption` DISABLE KEYS */;
/*!40000 ALTER TABLE `mg_vote_useroption` ENABLE KEYS */;


# Dumping structure for table mg_wlsm.mg_workflow
DROP TABLE IF EXISTS `mg_workflow`;
CREATE TABLE IF NOT EXISTS `mg_workflow` (
  `workflowid` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`workflowid`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

# Dumping data for table mg_wlsm.mg_workflow: 3 rows
DELETE FROM `mg_workflow`;
/*!40000 ALTER TABLE `mg_workflow` DISABLE KEYS */;
INSERT INTO `mg_workflow` (`workflowid`, `name`, `description`) VALUES
	(1, '一级审核', '一级审核方案，需要经过1次审核才能正式发布'),
	(2, '二级审核', '二级审核方案，需要经过2次审核才能正式发布'),
	(3, '三级审核', '三级审核方案，需要经过3次审核才能正式发布');
/*!40000 ALTER TABLE `mg_workflow` ENABLE KEYS */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
