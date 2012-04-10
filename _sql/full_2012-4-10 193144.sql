# --------------------------------------------------------
# Host:                         127.0.0.1
# Server version:               5.5.20-log
# Server OS:                    Win32
# HeidiSQL version:             6.0.0.3603
# Date/time:                    2012-04-10 19:31:17
# --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

# Dumping structure for table 004_jdweb.mg_admin
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

# Dumping data for table 004_jdweb.mg_admin: 1 rows
DELETE FROM `mg_admin`;
/*!40000 ALTER TABLE `mg_admin` DISABLE KEYS */;
INSERT INTO `mg_admin` (`userid`, `username`, `allowmultilogin`, `alloweditpassword`, `editpasswordnextlogin`, `disabled`) VALUES
	(1, 'admin', 1, 1, 0, 0);
/*!40000 ALTER TABLE `mg_admin` ENABLE KEYS */;


# Dumping structure for table 004_jdweb.mg_admin_role
DROP TABLE IF EXISTS `mg_admin_role`;
CREATE TABLE IF NOT EXISTS `mg_admin_role` (
  `userid` mediumint(8) unsigned NOT NULL,
  `roleid` tinyint(3) unsigned NOT NULL,
  KEY `userid` (`userid`),
  KEY `roleid` (`roleid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# Dumping data for table 004_jdweb.mg_admin_role: 1 rows
DELETE FROM `mg_admin_role`;
/*!40000 ALTER TABLE `mg_admin_role` DISABLE KEYS */;
INSERT INTO `mg_admin_role` (`userid`, `roleid`) VALUES
	(1, 1);
/*!40000 ALTER TABLE `mg_admin_role` ENABLE KEYS */;


# Dumping structure for table 004_jdweb.mg_admin_role_priv
DROP TABLE IF EXISTS `mg_admin_role_priv`;
CREATE TABLE IF NOT EXISTS `mg_admin_role_priv` (
  `roleid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `field` char(15) NOT NULL,
  `value` char(15) NOT NULL,
  `priv` char(15) NOT NULL,
  PRIMARY KEY (`roleid`,`field`,`value`,`priv`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# Dumping data for table 004_jdweb.mg_admin_role_priv: 1 rows
DELETE FROM `mg_admin_role_priv`;
/*!40000 ALTER TABLE `mg_admin_role_priv` DISABLE KEYS */;
INSERT INTO `mg_admin_role_priv` (`roleid`, `field`, `value`, `priv`) VALUES
	(1, 'processid', '8', '');
/*!40000 ALTER TABLE `mg_admin_role_priv` ENABLE KEYS */;


# Dumping structure for table 004_jdweb.mg_area
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

# Dumping data for table 004_jdweb.mg_area: 2 rows
DELETE FROM `mg_area`;
/*!40000 ALTER TABLE `mg_area` DISABLE KEYS */;
INSERT INTO `mg_area` (`areaid`, `name`, `style`, `parentid`, `arrparentid`, `child`, `arrchildid`, `template`, `listorder`, `hits`) VALUES
	(1, '北京', '', 0, '0', 0, '1', '', 1, 0),
	(2, '上海', '', 0, '0', 0, '2', '', 2, 0);
/*!40000 ALTER TABLE `mg_area` ENABLE KEYS */;


# Dumping structure for table 004_jdweb.mg_attachment
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
) ENGINE=MyISAM AUTO_INCREMENT=113 DEFAULT CHARSET=utf8;

# Dumping data for table 004_jdweb.mg_attachment: 13 rows
DELETE FROM `mg_attachment`;
/*!40000 ALTER TABLE `mg_attachment` DISABLE KEYS */;
INSERT INTO `mg_attachment` (`aid`, `module`, `catid`, `contentid`, `field`, `filename`, `filepath`, `filetype`, `filesize`, `fileext`, `description`, `isimage`, `isthumb`, `downloads`, `listorder`, `userid`, `uploadtime`, `uploadip`) VALUES
	(100, 'wslm', 0, 73, 'thumb', 'QQ截图20120410095025.png', '2012/0410/20120410095205203.png', 'image/png', 80519, 'png', '', 1, 0, 0, 0, 1, 1334022725, '127.0.0.1'),
	(101, 'wslm', 0, 74, 'thumb', 'QQ截图20120410095048.jpg', '2012/0410/20120410103602202.jpg', 'image/jpeg', 24767, 'jpg', '', 1, 0, 0, 0, 1, 1334025362, '127.0.0.1'),
	(102, 'wslm', 0, 75, 'thumb', 'QQ截图20120410095025.png', '2012/0410/20120410110527229.png', 'image/png', 80519, 'png', '', 1, 0, 0, 0, 1, 1334027127, '127.0.0.1'),
	(103, 'wslm', 0, 88, 'thumb', 'QQ截图20120410095025.png', '2012/0410/20120410122017621.png', 'image/png', 80519, 'png', '', 1, 0, 0, 0, 1, 1334031617, '127.0.0.1'),
	(104, 'wslm', 0, 89, 'thumb', 'QQ截图20120410095048.jpg', '2012/0410/20120410122040561.jpg', 'image/jpeg', 24767, 'jpg', '', 1, 0, 0, 0, 1, 1334031640, '127.0.0.1'),
	(105, 'wslm', 24, 90, 'pics', 'IMG080606150918437313.gif', '2012/0410/20120410010723503.gif', 'image/gif', 31982, 'gif', '', 1, 0, 0, 0, 1, 1334034443, '127.0.0.1'),
	(106, 'wslm', 24, 90, 'pics', 'IMG080609092834375237.gif', '2012/0410/20120410010723673.gif', 'image/gif', 19350, 'gif', '', 1, 0, 0, 0, 1, 1334034443, '127.0.0.1'),
	(107, 'wslm', 24, 90, 'pics', 'images.jpg', '2012/0410/20120410010723452.jpg', 'image/jpeg', 3871, 'jpg', '', 1, 0, 0, 0, 1, 1334034443, '127.0.0.1'),
	(108, 'wslm', 0, 91, 'thumb', '5副本_r2_c2.jpg', '2012/0410/20120410013600740.jpg', 'image/jpeg', 52542, 'jpg', '', 1, 0, 0, 0, 1, 1334036160, '127.0.0.1'),
	(109, 'wslm', 0, 92, 'thumb', '5副本_r4_c2.jpg', '2012/0410/20120410013655876.jpg', 'image/jpeg', 43744, 'jpg', '', 1, 0, 0, 0, 1, 1334036215, '127.0.0.1'),
	(110, 'wslm', 0, 93, 'thumb', 'baidu_sylogo1.gif', '2012/0410/20120410014116404.gif', 'image/gif', 1630, 'gif', '', 1, 0, 0, 0, 1, 1334036476, '127.0.0.1'),
	(111, 'wslm', 0, 94, 'thumb', 'logo_cn.png', '2012/0410/20120410014245457.png', 'image/png', 7968, 'png', '', 1, 0, 0, 0, 1, 1334036565, '127.0.0.1'),
	(112, 'wslm', 28, 106, 'pics', 'images.jpg', '2012/0410/20120410033224567.jpg', 'image/jpeg', 3871, 'jpg', '', 1, 0, 0, 0, 1, 1334043144, '127.0.0.1');
/*!40000 ALTER TABLE `mg_attachment` ENABLE KEYS */;


# Dumping structure for table 004_jdweb.mg_author
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

# Dumping data for table 004_jdweb.mg_author: 0 rows
DELETE FROM `mg_author`;
/*!40000 ALTER TABLE `mg_author` DISABLE KEYS */;
/*!40000 ALTER TABLE `mg_author` ENABLE KEYS */;


# Dumping structure for table 004_jdweb.mg_block
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
) ENGINE=MyISAM AUTO_INCREMENT=72 DEFAULT CHARSET=utf8;

# Dumping data for table 004_jdweb.mg_block: 8 rows
DELETE FROM `mg_block`;
/*!40000 ALTER TABLE `mg_block` DISABLE KEYS */;
INSERT INTO `mg_block` (`blockid`, `pageid`, `blockno`, `name`, `isarray`, `rows`, `data`, `listorder`, `disabled`) VALUES
	(64, 'index_intro', 1, '_首页 - 企业简介', 0, 6, '聊城市金帝保持器厂成立于1985年,现有员工1500人,主要生产各种轴承保持器架,是目前国内规模最大的保持器生产厂家.', 2, 0),
	(65, 'sidebar_contact', 1, '_左侧 - 联系方式', 0, 6, '                <div class="contact">\n                    <table>\n                        <tr>\n                            <th>TEL:</th>\n                            <td>0635-88888888</td>\n                        </tr>\n                        <tr>\n                            <th>EMAIL:</th>\n                            <td>JINDI@qq.com</td>\n                        </tr>\n                    </table>\n                </div>', 2, 0),
	(66, 'cat_12', 1, '_关于我们 - 企业概况', 0, 6, '<div>聊城市金帝集团是目前国内生产规模最大、品质信誉最好的轴承保持器专业生产厂家。位于著名的轴承保持器生产基地&mdash;&mdash;&ldquo;江北水城&rdquo;山东聊城郑家开发区；309国道和京九铁路贯穿境内，济青、京福、京沪高速公路四通八达，物流交通十分便利。&nbsp;</div><div>金帝集团自1985年建厂以来实现了平稳和快速发展，现有职工2000余名，全厂占地面积67980㎡，总资产4000万元。并设有企管中心、经营中心、生产中心、技术中心、财务中心、行政中心，形成六大中心同时互补、协作迅速的360度可靠运作体系。2009年10月份，金帝集团在城区新成立4个集团分公司。&nbsp;</div><div>金帝集团以深沟球低噪音精密浪形保持器为主导产品，同时生产框形、碗形、蝶形及异型非标，其中深沟球波形静音保持器、不锈钢波形保持器、树脂保持器、渗氮保持器以及七类保持器，内径自7㎜&mdash;&mdash;400㎜不同规格的各类型轴承保持器多达2000多种。2009年金帝集团响应国家政策，成功开发环保风电保持器，现已与多家国内外客户签订批量订单。金帝集团生产的保持器以&ldquo;精度高&rdquo;&ldquo;低噪音&rdquo;&ldquo;使用寿命长&rdquo;等显著特点，享誉海内外。现为SKF、PEER、NSK、GMB、NPB等多家国际知名轴承公司生产配套。&nbsp;</div><div>&nbsp;金帝集团配备具有先进水平的高精度微电子检测设备，在引进关键生产设备基础上实现了全自动、半自动的制造方式，并采用国内最先进的轴承保持器制造工艺。金帝集团是国内率先通过ISO9001国际质量体系的轴承保持器厂家，2008年顺利通过ISO/TS16949标准和ISO14001环境管理体系，成为保持器行业中唯一的&ldquo;高新技术企业&rdquo;，2006年所生产的产品被评为&ldquo;山东省名牌&rdquo;荣誉称号。并先后获得&ldquo;轴承保持器工程研究中心&rdquo;&ldquo;技术中心&rdquo;和&ldquo;中国专利山东明星企业&rdquo;荣誉称号。拥有自主知识产权15项专利，我厂长期与洛阳轴承研究所、江南大学表面处理研究中心、中科院兰州材料应用研究所等大专院校和科研院所合作产品及工艺的开发，产品品质深得国内外广大客户的信赖。1998年在同行业中率先把保持器销到国外轴承的生产厂家，并具有中华人民共和国进出口资格证书。&nbsp;</div><div>在跨越发展战略上金帝集团进行了长远规划，注重以人为本、以市场为准绳；全面推行现代企业管理模式，推进&ldquo;金帝&rdquo;品牌的产业化发展，拟新建高标准、现代化的生产厂区，改善工序环境，扩大生产规模，筹建保持器产品技术研究中心和品质检测中心；以立足中国、面向世界，精工制造最好的保持器为己任；力争到2015年在同行业中实现产品质量和销量亚洲第一、2025年达到世界第一的宏伟目标。为世界十大轴承公司及知名品牌的轴承生产企业配套。在国际市场上拼搏并获得更大发展是金帝人共同的愿望和要求。&nbsp;</div><div>&nbsp;诚心欢迎国内外客户前来指导，共同合作、创造辉煌。我们会以高质量的产品和更全面的服务来满足各公司的需求，实现双赢并举、携手共进﹗</div>', 2, 0),
	(67, 'cat_11', 1, '_关于我们 - 公司概况', 0, 6, '<div>聊城市金帝集团是目前国内生产规模最大、品质信誉最好的轴承保持器专业生产厂家。位于著名的轴承保持器生产基地&mdash;&mdash;&ldquo;江北水城&rdquo;山东聊城郑家开发区；309国道和京九铁路贯穿境内，济青、京福、京沪高速公路四通八达，物流交通十分便利。&nbsp;</div>\n<div>金帝集团自1985年建厂以来实现了平稳和快速发展，现有职工2000余名，全厂占地面积67980㎡，总资产4000万元。并设有企管中心、经营中心、生产中心、技术中心、财务中心、行政中心，形成六大中心同时互补、协作迅速的360度可靠运作体系。2009年10月份，金帝集团在城区新成立4个集团分公司。&nbsp;</div>\n<div>金帝集团以深沟球低噪音精密浪形保持器为主导产品，同时生产框形、碗形、蝶形及异型非标，其中深沟球波形静音保持器、不锈钢波形保持器、树脂保持器、渗氮保持器以及七类保持器，内径自7㎜&mdash;&mdash;400㎜不同规格的各类型轴承保持器多达2000多种。2009年金帝集团响应国家政策，成功开发环保风电保持器，现已与多家国内外客户签订批量订单。金帝集团生产的保持器以&ldquo;精度高&rdquo;&ldquo;低噪音&rdquo;&ldquo;使用寿命长&rdquo;等显著特点，享誉海内外。现为SKF、PEER、NSK、GMB、NPB等多家国际知名轴承公司生产配套。&nbsp;</div>\n<div>金帝集团配备具有先进水平的高精度微电子检测设备，在引进关键生产设备基础上实现了全自动、半自动的制造方式，并采用国内最先进的轴承保持器制造工艺。金帝集团是国内率先通过ISO9001国际质量体系的轴承保持器厂家，2008年顺利通过ISO/TS16949标准和ISO14001环境管理体系，成为保持器行业中唯一的&ldquo;高新技术企业&rdquo;，2006年所生产的产品被评为&ldquo;山东省名牌&rdquo;荣誉称号。并先后获得&ldquo;轴承保持器工程研究中心&rdquo;&ldquo;技术中心&rdquo;和&ldquo;中国专利山东明星企业&rdquo;荣誉称号。拥有自主知识产权15项专利，我厂长期与洛阳轴承研究所、江南大学表面处理研究中心、中科院兰州材料应用研究所等大专院校和科研院所合作产品及工艺的开发，产品品质深得国内外广大客户的信赖。1998年在同行业中率先把保持器销到国外轴承的生产厂家，并具有中华人民共和国进出口资格证书。&nbsp;</div>\n<div>&nbsp;在跨越发展战略上金帝集团进行了长远规划，注重以人为本、以市场为准绳；全面推行现代企业管理模式，推进&ldquo;金帝&rdquo;品牌的产业化发展，拟新建高标准、现代化的生产厂区，改善工序环境，扩大生产规模，筹建保持器产品技术研究中心和品质检测中心；以立足中国、面向世界，精工制造最好的保持器为己任；力争到2015年在同行业中实现产品质量和销量亚洲第一、2025年达到世界第一的宏伟目标。为世界十大轴承公司及知名品牌的轴承生产企业配套。在国际市场上拼搏并获得更大发展是金帝人共同的愿望和要求。&nbsp;</div>\n<div>诚心欢迎国内外客户前来指导，共同合作、创造辉煌。我们会以高质量的产品和更全面的服务来满足各公司的需求，实现双赢并举、携手共进﹗</div>', 2, 0),
	(68, 'cat_13', 1, '_关于我们 - 企业文化', 0, 6, '<div>聊城市金帝集团是目前国内生产规模最大、品质信誉最好的轴承保持器专业生产厂家。位于著名的轴承保持器生产基地&mdash;&mdash;&ldquo;江北水城&rdquo;山东聊城郑家开发区；309国道和京九铁路贯穿境内，济青、京福、京沪高速公路四通八达，物流交通十分便利。&nbsp;</div>\n<div>金帝集团自1985年建厂以来实现了平稳和快速发展，现有职工2000余名，全厂占地面积67980㎡，总资产4000万元。并设有企管中心、经营中心、生产中心、技术中心、财务中心、行政中心，形成六大中心同时互补、协作迅速的360度可靠运作体系。2009年10月份，金帝集团在城区新成立4个集团分公司。&nbsp;</div>\n<div>金帝集团以深沟球低噪音精密浪形保持器为主导产品，同时生产框形、碗形、蝶形及异型非标，其中深沟球波形静音保持器、不锈钢波形保持器、树脂保持器、渗氮保持器以及七类保持器，内径自7㎜&mdash;&mdash;400㎜不同规格的各类型轴承保持器多达2000多种。2009年金帝集团响应国家政策，成功开发环保风电保持器，现已与多家国内外客户签订批量订单。金帝集团生产的保持器以&ldquo;精度高&rdquo;&ldquo;低噪音&rdquo;&ldquo;使用寿命长&rdquo;等显著特点，享誉海内外。现为SKF、PEER、NSK、GMB、NPB等多家国际知名轴承公司生产配套。&nbsp;</div>\n<div>金帝集团配备具有先进水平的高精度微电子检测设备，在引进关键生产设备基础上实现了全自动、半自动的制造方式，并采用国内最先进的轴承保持器制造工艺。金帝集团是国内率先通过ISO9001国际质量体系的轴承保持器厂家，2008年顺利通过ISO/TS16949标准和ISO14001环境管理体系，成为保持器行业中唯一的&ldquo;高新技术企业&rdquo;，2006年所生产的产品被评为&ldquo;山东省名牌&rdquo;荣誉称号。并先后获得&ldquo;轴承保持器工程研究中心&rdquo;&ldquo;技术中心&rdquo;和&ldquo;中国专利山东明星企业&rdquo;荣誉称号。拥有自主知识产权15项专利，我厂长期与洛阳轴承研究所、江南大学表面处理研究中心、中科院兰州材料应用研究所等大专院校和科研院所合作产品及工艺的开发，产品品质深得国内外广大客户的信赖。1998年在同行业中率先把保持器销到国外轴承的生产厂家，并具有中华人民共和国进出口资格证书。&nbsp;</div>\n<div>&nbsp;在跨越发展战略上金帝集团进行了长远规划，注重以人为本、以市场为准绳；全面推行现代企业管理模式，推进&ldquo;金帝&rdquo;品牌的产业化发展，拟新建高标准、现代化的生产厂区，改善工序环境，扩大生产规模，筹建保持器产品技术研究中心和品质检测中心；以立足中国、面向世界，精工制造最好的保持器为己任；力争到2015年在同行业中实现产品质量和销量亚洲第一、2025年达到世界第一的宏伟目标。为世界十大轴承公司及知名品牌的轴承生产企业配套。在国际市场上拼搏并获得更大发展是金帝人共同的愿望和要求。&nbsp;</div>\n<div>诚心欢迎国内外客户前来指导，共同合作、创造辉煌。我们会以高质量的产品和更全面的服务来满足各公司的需求，实现双赢并举、携手共进﹗</div>', 2, 0),
	(69, 'cat_14', 1, '_关于我们 - 组织架构', 0, 6, '<div>聊城市金帝集团是目前国内生产规模最大、品质信誉最好的轴承保持器专业生产厂家。位于著名的轴承保持器生产基地&mdash;&mdash;&ldquo;江北水城&rdquo;山东聊城郑家开发区；309国道和京九铁路贯穿境内，济青、京福、京沪高速公路四通八达，物流交通十分便利。&nbsp;</div>\n<div>金帝集团自1985年建厂以来实现了平稳和快速发展，现有职工2000余名，全厂占地面积67980㎡，总资产4000万元。并设有企管中心、经营中心、生产中心、技术中心、财务中心、行政中心，形成六大中心同时互补、协作迅速的360度可靠运作体系。2009年10月份，金帝集团在城区新成立4个集团分公司。&nbsp;</div>\n<div>金帝集团以深沟球低噪音精密浪形保持器为主导产品，同时生产框形、碗形、蝶形及异型非标，其中深沟球波形静音保持器、不锈钢波形保持器、树脂保持器、渗氮保持器以及七类保持器，内径自7㎜&mdash;&mdash;400㎜不同规格的各类型轴承保持器多达2000多种。2009年金帝集团响应国家政策，成功开发环保风电保持器，现已与多家国内外客户签订批量订单。金帝集团生产的保持器以&ldquo;精度高&rdquo;&ldquo;低噪音&rdquo;&ldquo;使用寿命长&rdquo;等显著特点，享誉海内外。现为SKF、PEER、NSK、GMB、NPB等多家国际知名轴承公司生产配套。&nbsp;</div>\n<div>金帝集团配备具有先进水平的高精度微电子检测设备，在引进关键生产设备基础上实现了全自动、半自动的制造方式，并采用国内最先进的轴承保持器制造工艺。金帝集团是国内率先通过ISO9001国际质量体系的轴承保持器厂家，2008年顺利通过ISO/TS16949标准和ISO14001环境管理体系，成为保持器行业中唯一的&ldquo;高新技术企业&rdquo;，2006年所生产的产品被评为&ldquo;山东省名牌&rdquo;荣誉称号。并先后获得&ldquo;轴承保持器工程研究中心&rdquo;&ldquo;技术中心&rdquo;和&ldquo;中国专利山东明星企业&rdquo;荣誉称号。拥有自主知识产权15项专利，我厂长期与洛阳轴承研究所、江南大学表面处理研究中心、中科院兰州材料应用研究所等大专院校和科研院所合作产品及工艺的开发，产品品质深得国内外广大客户的信赖。1998年在同行业中率先把保持器销到国外轴承的生产厂家，并具有中华人民共和国进出口资格证书。&nbsp;</div>\n<div>&nbsp;在跨越发展战略上金帝集团进行了长远规划，注重以人为本、以市场为准绳；全面推行现代企业管理模式，推进&ldquo;金帝&rdquo;品牌的产业化发展，拟新建高标准、现代化的生产厂区，改善工序环境，扩大生产规模，筹建保持器产品技术研究中心和品质检测中心；以立足中国、面向世界，精工制造最好的保持器为己任；力争到2015年在同行业中实现产品质量和销量亚洲第一、2025年达到世界第一的宏伟目标。为世界十大轴承公司及知名品牌的轴承生产企业配套。在国际市场上拼搏并获得更大发展是金帝人共同的愿望和要求。&nbsp;</div>\n<div>诚心欢迎国内外客户前来指导，共同合作、创造辉煌。我们会以高质量的产品和更全面的服务来满足各公司的需求，实现双赢并举、携手共进﹗</div>', 2, 0),
	(70, 'cat_15', 1, '_关于我们 - 企业荣誉', 0, 6, '<div>聊城市金帝集团是目前国内生产规模最大、品质信誉最好的轴承保持器专业生产厂家。位于著名的轴承保持器生产基地&mdash;&mdash;&ldquo;江北水城&rdquo;山东聊城郑家开发区；309国道和京九铁路贯穿境内，济青、京福、京沪高速公路四通八达，物流交通十分便利。&nbsp;</div>\n<div>金帝集团自1985年建厂以来实现了平稳和快速发展，现有职工2000余名，全厂占地面积67980㎡，总资产4000万元。并设有企管中心、经营中心、生产中心、技术中心、财务中心、行政中心，形成六大中心同时互补、协作迅速的360度可靠运作体系。2009年10月份，金帝集团在城区新成立4个集团分公司。&nbsp;</div>\n<div>金帝集团以深沟球低噪音精密浪形保持器为主导产品，同时生产框形、碗形、蝶形及异型非标，其中深沟球波形静音保持器、不锈钢波形保持器、树脂保持器、渗氮保持器以及七类保持器，内径自7㎜&mdash;&mdash;400㎜不同规格的各类型轴承保持器多达2000多种。2009年金帝集团响应国家政策，成功开发环保风电保持器，现已与多家国内外客户签订批量订单。金帝集团生产的保持器以&ldquo;精度高&rdquo;&ldquo;低噪音&rdquo;&ldquo;使用寿命长&rdquo;等显著特点，享誉海内外。现为SKF、PEER、NSK、GMB、NPB等多家国际知名轴承公司生产配套。&nbsp;</div>\n<div>金帝集团配备具有先进水平的高精度微电子检测设备，在引进关键生产设备基础上实现了全自动、半自动的制造方式，并采用国内最先进的轴承保持器制造工艺。金帝集团是国内率先通过ISO9001国际质量体系的轴承保持器厂家，2008年顺利通过ISO/TS16949标准和ISO14001环境管理体系，成为保持器行业中唯一的&ldquo;高新技术企业&rdquo;，2006年所生产的产品被评为&ldquo;山东省名牌&rdquo;荣誉称号。并先后获得&ldquo;轴承保持器工程研究中心&rdquo;&ldquo;技术中心&rdquo;和&ldquo;中国专利山东明星企业&rdquo;荣誉称号。拥有自主知识产权15项专利，我厂长期与洛阳轴承研究所、江南大学表面处理研究中心、中科院兰州材料应用研究所等大专院校和科研院所合作产品及工艺的开发，产品品质深得国内外广大客户的信赖。1998年在同行业中率先把保持器销到国外轴承的生产厂家，并具有中华人民共和国进出口资格证书。&nbsp;</div>\n<div>&nbsp;在跨越发展战略上金帝集团进行了长远规划，注重以人为本、以市场为准绳；全面推行现代企业管理模式，推进&ldquo;金帝&rdquo;品牌的产业化发展，拟新建高标准、现代化的生产厂区，改善工序环境，扩大生产规模，筹建保持器产品技术研究中心和品质检测中心；以立足中国、面向世界，精工制造最好的保持器为己任；力争到2015年在同行业中实现产品质量和销量亚洲第一、2025年达到世界第一的宏伟目标。为世界十大轴承公司及知名品牌的轴承生产企业配套。在国际市场上拼搏并获得更大发展是金帝人共同的愿望和要求。&nbsp;</div>\n<div>诚心欢迎国内外客户前来指导，共同合作、创造辉煌。我们会以高质量的产品和更全面的服务来满足各公司的需求，实现双赢并举、携手共进﹗</div>', 2, 0),
	(71, 'contact_tel', 1, '_联系我们', 0, 6, '0635-88888888', 2, 0);
/*!40000 ALTER TABLE `mg_block` ENABLE KEYS */;


# Dumping structure for table 004_jdweb.mg_cache_count
DROP TABLE IF EXISTS `mg_cache_count`;
CREATE TABLE IF NOT EXISTS `mg_cache_count` (
  `id` char(32) NOT NULL DEFAULT '',
  `count` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

# Dumping data for table 004_jdweb.mg_cache_count: 66 rows
DELETE FROM `mg_cache_count`;
/*!40000 ALTER TABLE `mg_cache_count` DISABLE KEYS */;
INSERT INTO `mg_cache_count` (`id`, `count`, `updatetime`) VALUES
	('e04dbe748422ceeb59dffeb1503db9f8', 0, 1333964713),
	('d65bda49d93b3213c31f0961a5995e67', 0, 1333964711),
	('19a697ec83c61fd8dde0cddde993519c', 0, 1333964902),
	('e7538aa37c75a0321219a8dc2a963cfc', 2, 1334036705),
	('a118edfda86caf8eb2436e8a5bd96766', 0, 1333964860),
	('3600ffbec607e463854a94a4f9c449b3', 0, 1333964829),
	('d917aa7642a6b50055ef6e1c630673df', 0, 1333964792),
	('1dcd9de1181816e06c863b8da083f52e', 0, 1333979575),
	('929c914b43bafe8771861749d187ee13', 2, 1334048081),
	('1bc17fa2c9660080e354062bfe9b8ff5', 4, 1334047945),
	('17b176f9c48fdf47341b01b9746115e3', 2, 1334048082),
	('7589a22d4faf9c16f32aa322f0ceeae9', 2, 1334048085),
	('9ca883eb1b45cee2a8c282e789ecea42', 13, 1334048087),
	('02ca9f9d16eaad837e2199c058633d34', 2, 1334055244),
	('b3e52007e12fd2751a05cf5a03087815', 0, 1334055167),
	('67ae080f7f72087000df784b73189af1', 0, 1334055168),
	('37aea67756f86217c8558f597e96d1d5', 0, 1334055169),
	('dc9adbc578a5dc3a8418875ff2a43574', 4, 1334048084),
	('949a6483c211737137fb1070c3e1a18d', 9, 1334027223),
	('80f7fae3f5b0c613794b8460499fe23d', 13, 1334043297),
	('f91b5c317938bf5dec44c95eda15ee1f', 0, 1334027151),
	('427f28e15378b2c69657a529b7895d6a', 2, 1334043295),
	('84832d857d9cca1e68f8fb498b6768f5', 0, 1334037224),
	('d86122b5a26af857319d0e0138a98aef', 0, 1334031160),
	('35590becd917315bdfe393be099c60d4', 2, 1334031661),
	('a72d08ffe21daa198fbf9ff1ce5bf130', 1, 1334043127),
	('bfc5246fa6f2296f4da4ac6228098eda', 0, 1334034084),
	('6af06047d4ff7569f7788a4d1ab391ac', 1, 1334043309),
	('f1a18c434a96939a719cd8aadc08f9a6', 2, 1334043289),
	('d959d0c83db3e471918aeb10c701f14f', 0, 1334035977),
	('2ec0661d5f1629fa1ae6f75aa0a1cc9a', 2, 1334037259),
	('86cd94203e615f44cd6981b011e3df6b', 2, 1334049529),
	('70122250249c292d352e4142fcf8cbff', 4, 1334040314),
	('ed4f2227b1f024164a8503a4bf7c745a', 4, 1334043294),
	('82e6c435b959ae3e54c5b3451d4c3161', 3, 1334037472),
	('7fab8a813ce9c0a6733352f353cbbc22', 4, 1334038389),
	('4731ecf229784481522e95352f41201e', 1, 1334040507),
	('3a1c5e4c69efb80e89924d67d84221bd', 0, 1334041046),
	('c652e36435da4225b7686e664b50fff5', 2, 1334043316),
	('5cbc00d7e83c9d0caf1300131bdafdb3', 2, 1334047027),
	('acb63cc3163a20385c947cae7bbd3579', 33, 1334043271),
	('955c30d8f11e708762bd8f937fb0122d', 1, 1334048095),
	('c8a77f66c7b2243918eb5d9553ffd2f8', 0, 1334048096),
	('c58a7e89456667490d6947c50f3dd152', 0, 1334048098),
	('67917c72ac23835d539c1fd757786b79', 0, 1334048099),
	('54ca418e0574eff903bfe18450907f04', 1, 1334048101),
	('b52c5cce6eb6df45f36f62a2ca7e8978', 2, 1334047967),
	('f2da723420a97ff2d6af9e6a1e16c822', 0, 1334043128),
	('b6969aa84a46e2c2359947f75272bd87', 1, 1334043315),
	('69138a7e46fd13daaecbb6b79a5e4baa', 0, 1334047160),
	('db32452b099ef846c357513d605a0c23', 0, 1334047170),
	('6b4dd82887fe4593e2dccd8226596565', 0, 1334047173),
	('f2df73721ca743d87a4adf4e5f6f1dd4', 0, 1334047177),
	('f34410881ba175f3d728986c5853aaad', 0, 1334047178),
	('8c2e8f715c4defd5599c53378e91737c', 0, 1334047181),
	('810423c21d1fa5f672ac3456fe78d3a4', 0, 1334047183),
	('ae3d645915481ef35f062edaabac328f', 0, 1334047185),
	('7153e2853fdd2ad2f18d4d7746c5bb79', 0, 1334047924),
	('d424a9f4bfd3eacd57d4070ab1cd5338', 0, 1334047270),
	('f7baac021aa32e160e8d4714f731af0c', 0, 1334047210),
	('4c6644efe54e3b66c9f6c3700d42f82c', 0, 1334047270),
	('1bba34d7dad834022030eaffab071750', 0, 1334054158),
	('0d506c32e2000988b9d1177690b58d32', 28, 1334050681),
	('a7cf614afa016c6c5bbc495a29421655', 0, 1334050378),
	('870c307366442995c7c105f427ebe375', 2, 1334053910),
	('95db4d0f3c9991fd1e3bfa0061cd7e7f', 1, 1334055630);
/*!40000 ALTER TABLE `mg_cache_count` ENABLE KEYS */;


# Dumping structure for table 004_jdweb.mg_category
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
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

# Dumping data for table 004_jdweb.mg_category: 26 rows
DELETE FROM `mg_category`;
/*!40000 ALTER TABLE `mg_category` DISABLE KEYS */;
INSERT INTO `mg_category` (`catid`, `module`, `type`, `modelid`, `parentid`, `arrparentid`, `child`, `arrchildid`, `catname`, `style`, `image`, `description`, `parentdir`, `catdir`, `url`, `content`, `items`, `hits`, `setting`, `listorder`, `ismenu`, `letter`, `citems`, `pitems`) VALUES
	(1, 'wslm', 0, 41, 0, '0', 1, '1,11,12,13,14,15', '关于我们', '', '', '', '', 'aboutus', 'html/aboutus/', '', 0, 0, 'array (\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'template_category\' => \'category\',\n  \'template_list\' => \'list\',\n  \'template_show\' => \'show\',\n  \'template_print\' => \'print\',\n  \'workflowid\' => \'1\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n)', 1, 1, '', 0, 0),
	(2, 'wslm', 0, 41, 0, '0', 1, '2,16,17', '新闻中心', '', '', '', '', 'news', 'html/news/', '', 0, 0, 'array (\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'template_category\' => \'category\',\n  \'template_list\' => \'list\',\n  \'template_show\' => \'show\',\n  \'template_print\' => \'print\',\n  \'workflowid\' => \'1\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n)', 2, 1, '', 0, 0),
	(3, 'wslm', 0, 38, 0, '0', 1, '3,18,19,20,21', '产品中心', '', '', '', '', 'products', 'html/products/', '', 0, 0, 'array (\n  \'workflowid\' => \'1\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'template_category\' => \'category_products\',\n  \'template_list\' => \'list_products\',\n  \'template_show\' => \'show\',\n  \'template_print\' => \'print\',\n  \'upload_allowext\' => \'\',\n  \'upload_maxsize\' => \'\',\n  \'thumb_enable\' => \'0\',\n  \'thumb_width\' => \'\',\n  \'thumb_height\' => \'\',\n  \'watermark_enable\' => \'0\',\n  \'ishtml\' => \'1\',\n  \'content_ishtml\' => \'1\',\n  \'category_urlruleid\' => \'3\',\n  \'show_urlruleid\' => \'7\',\n)', 3, 1, '', 0, 0),
	(4, 'wslm', 0, 40, 0, '0', 1, '4,24,25,26,27,28', '应用领域', '', '', '', '', 'uses', 'html/uses/', '', 0, 0, 'array (\n  \'workflowid\' => \'1\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'template_category\' => \'category\',\n  \'template_list\' => \'list_use\',\n  \'template_show\' => \'show\',\n  \'template_print\' => \'print\',\n  \'upload_allowext\' => \'\',\n  \'upload_maxsize\' => \'\',\n  \'thumb_enable\' => \'0\',\n  \'thumb_width\' => \'\',\n  \'thumb_height\' => \'\',\n  \'watermark_enable\' => \'0\',\n  \'ishtml\' => \'1\',\n  \'content_ishtml\' => \'1\',\n  \'category_urlruleid\' => \'3\',\n  \'show_urlruleid\' => \'7\',\n)', 4, 1, '', 0, 0),
	(5, 'wslm', 0, 35, 0, '0', 0, '5', '资质荣誉', '', '', '', '', 'honor', 'html/honor/', '', 2, 0, 'array (\n  \'workflowid\' => \'1\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'template_category\' => \'category\',\n  \'template_list\' => \'list_honor\',\n  \'template_show\' => \'show\',\n  \'template_print\' => \'print\',\n  \'upload_allowext\' => \'\',\n  \'upload_maxsize\' => \'\',\n  \'thumb_enable\' => \'0\',\n  \'thumb_width\' => \'\',\n  \'thumb_height\' => \'\',\n  \'watermark_enable\' => \'0\',\n  \'ishtml\' => \'1\',\n  \'content_ishtml\' => \'1\',\n  \'category_urlruleid\' => \'3\',\n  \'show_urlruleid\' => \'10\',\n)', 5, 1, '', 0, 0),
	(6, 'wslm', 0, 39, 0, '0', 0, '6', '发展历程', '', '', '', '', 'progress', 'html/progress/', '', 4, 0, 'array (\n  \'workflowid\' => \'1\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'template_category\' => \'category\',\n  \'template_list\' => \'list_progress\',\n  \'template_show\' => \'show\',\n  \'template_print\' => \'print\',\n  \'upload_allowext\' => \'\',\n  \'upload_maxsize\' => \'\',\n  \'thumb_enable\' => \'0\',\n  \'thumb_width\' => \'\',\n  \'thumb_height\' => \'\',\n  \'watermark_enable\' => \'0\',\n  \'ishtml\' => \'1\',\n  \'content_ishtml\' => \'1\',\n  \'category_urlruleid\' => \'3\',\n  \'show_urlruleid\' => \'7\',\n)', 6, 1, '', 0, 0),
	(7, 'wslm', 0, 42, 0, '0', 0, '7', '合作伙伴', '', '', '', '', 'partner', 'html/partner/', '', 2, 0, 'array (\n  \'workflowid\' => \'1\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'template_category\' => \'category\',\n  \'template_list\' => \'list_partner\',\n  \'template_show\' => \'show\',\n  \'template_print\' => \'print\',\n  \'upload_allowext\' => \'\',\n  \'upload_maxsize\' => \'\',\n  \'thumb_enable\' => \'0\',\n  \'thumb_width\' => \'\',\n  \'thumb_height\' => \'\',\n  \'watermark_enable\' => \'0\',\n  \'ishtml\' => \'1\',\n  \'content_ishtml\' => \'1\',\n  \'category_urlruleid\' => \'3\',\n  \'show_urlruleid\' => \'7\',\n)', 7, 1, '', 0, 0),
	(8, 'wslm', 0, 36, 0, '0', 0, '8', '招聘信息', '', '', '', '', 'jobs', 'html/jobs/', '', 4, 0, 'array (\n  \'workflowid\' => \'1\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'template_category\' => \'category\',\n  \'template_list\' => \'list_jobs\',\n  \'template_show\' => \'show\',\n  \'template_print\' => \'print\',\n  \'upload_allowext\' => \'\',\n  \'upload_maxsize\' => \'\',\n  \'thumb_enable\' => \'0\',\n  \'thumb_width\' => \'\',\n  \'thumb_height\' => \'\',\n  \'watermark_enable\' => \'0\',\n  \'ishtml\' => \'1\',\n  \'content_ishtml\' => \'1\',\n  \'category_urlruleid\' => \'3\',\n  \'show_urlruleid\' => \'10\',\n)', 8, 1, '', 0, 0),
	(22, 'wslm', 1, 0, 0, '0', 0, '22', '在线留言', '', '', '', '', 'message', 'html/message/', '', 0, 0, 'array (\n  \'template\' => \'page\',\n  \'ishtml\' => \'1\',\n  \'category_urlruleid\' => \'3\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n)', 22, 0, '', 0, 0),
	(11, 'wslm', 1, 0, 1, '0,1', 0, '11', '公司概况', '', '', '', 'aboutus/', 'company info', 'html/aboutus/company info/', '', 0, 0, 'array (\n  \'template\' => \'page\',\n  \'ishtml\' => \'1\',\n  \'category_urlruleid\' => \'3\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n)', 11, 0, '', 0, 0),
	(12, 'wslm', 1, 0, 1, '0,1', 0, '12', '企业概况', '', '', '', 'aboutus/', 'Enterprise', 'html/aboutus/Enterprise/', '', 0, 0, 'array (\n  \'template\' => \'page\',\n  \'ishtml\' => \'1\',\n  \'category_urlruleid\' => \'3\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n)', 12, 0, '', 0, 0),
	(13, 'wslm', 1, 0, 1, '0,1', 0, '13', '企业文化', '', '', '', 'aboutus/', 'culture', 'html/aboutus/culture/', '', 0, 0, 'array (\n  \'template\' => \'page\',\n  \'ishtml\' => \'1\',\n  \'category_urlruleid\' => \'3\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n)', 13, 0, '', 0, 0),
	(14, 'wslm', 1, 0, 1, '0,1', 0, '14', '组织架构', '', '', '', 'aboutus/', 'structure', 'html/aboutus/structure/', '', 0, 0, 'array (\n  \'template\' => \'page\',\n  \'ishtml\' => \'1\',\n  \'category_urlruleid\' => \'3\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n)', 14, 0, '', 0, 0),
	(15, 'wslm', 1, 0, 1, '0,1', 0, '15', '企业荣誉', '', '', '', 'aboutus/', 'honor', 'html/aboutus/honor/', '', 0, 0, 'array (\n  \'template\' => \'page\',\n  \'ishtml\' => \'1\',\n  \'category_urlruleid\' => \'3\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n)', 15, 0, '', 0, 0),
	(16, 'wslm', 0, 37, 2, '0,2', 0, '16', '公司动态', '', '', '', 'news/', 'notice', 'html/news/notice/', '', 2, 0, 'array (\n  \'workflowid\' => \'1\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'template_category\' => \'category\',\n  \'template_list\' => \'list_news\',\n  \'template_show\' => \'show\',\n  \'template_print\' => \'print\',\n  \'upload_allowext\' => \'doc|docx|xls|ppt|wps|zip|rar|txt|jpg|jpeg|gif|bmp|swf|png\',\n  \'upload_maxsize\' => \'1024000\',\n  \'thumb_enable\' => \'0\',\n  \'thumb_width\' => \'667\',\n  \'thumb_height\' => \'667\',\n  \'watermark_enable\' => \'0\',\n  \'ishtml\' => \'1\',\n  \'content_ishtml\' => \'1\',\n  \'category_urlruleid\' => \'3\',\n  \'show_urlruleid\' => \'7\',\n)', 16, 1, '', 0, 0),
	(17, 'wslm', 0, 37, 2, '0,2', 0, '17', '行业资讯', '', '', '', 'news/', 'infomation', 'html/news/infomation/', '', 13, 13, 'array (\n  \'workflowid\' => \'1\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'template_category\' => \'category\',\n  \'template_list\' => \'list_news\',\n  \'template_show\' => \'show\',\n  \'template_print\' => \'print\',\n  \'upload_allowext\' => \'doc|docx|xls|ppt|wps|zip|rar|txt|jpg|jpeg|gif|bmp|swf|png\',\n  \'upload_maxsize\' => \'1024000\',\n  \'thumb_enable\' => \'0\',\n  \'thumb_width\' => \'667\',\n  \'thumb_height\' => \'667\',\n  \'watermark_enable\' => \'0\',\n  \'ishtml\' => \'1\',\n  \'content_ishtml\' => \'1\',\n  \'category_urlruleid\' => \'3\',\n  \'show_urlruleid\' => \'7\',\n)', 17, 1, '', 0, 0),
	(18, 'wslm', 0, 38, 3, '0,3', 0, '18', '分类1', '', '', '', 'products/', 'cat1', 'html/products/cat1/', '', 2, 2, 'array (\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'template_category\' => \'category\',\n  \'template_list\' => \'list_products\',\n  \'template_show\' => \'show\',\n  \'template_print\' => \'print\',\n  \'workflowid\' => \'1\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n)', 18, 1, '', 0, 0),
	(19, 'wslm', 0, 38, 3, '0,3', 0, '19', '分类2', '', '', '', 'products/', 'cat2', 'html/products/cat2/', '', 0, 0, 'array (\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'template_category\' => \'category\',\n  \'template_list\' => \'list_products\',\n  \'template_show\' => \'show\',\n  \'template_print\' => \'print\',\n  \'workflowid\' => \'1\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n)', 19, 1, '', 0, 0),
	(20, 'wslm', 0, 38, 3, '0,3', 0, '20', '分类3', '', '', '', 'products/', 'cat3', 'html/products/cat3/', '', 0, 0, 'array (\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'template_category\' => \'category\',\n  \'template_list\' => \'list_products\',\n  \'template_show\' => \'show\',\n  \'template_print\' => \'print\',\n  \'workflowid\' => \'1\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n)', 20, 1, '', 0, 0),
	(21, 'wslm', 0, 38, 3, '0,3', 0, '21', '分类4', '', '', '', 'products/', 'cat4', 'html/products/cat4/', '', 0, 0, 'array (\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'template_category\' => \'category\',\n  \'template_list\' => \'list_products\',\n  \'template_show\' => \'show\',\n  \'template_print\' => \'print\',\n  \'workflowid\' => \'1\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n)', 21, 1, '', 0, 0),
	(24, 'wslm', 0, 40, 4, '0,4', 0, '24', '家电产业', '', '', '', 'uses/', 'Household appliances', 'html/uses/Household appliances/', '', 1, 0, 'array (\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'template_category\' => \'category\',\n  \'template_list\' => \'list_use\',\n  \'template_show\' => \'show\',\n  \'template_print\' => \'print\',\n  \'workflowid\' => \'1\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n)', 24, 1, '', 0, 0),
	(25, 'wslm', 0, 40, 4, '0,4', 0, '25', '机动车产业', '', '', '', 'uses/', 'Motor vehicle', 'html/uses/Motor vehicle/', '', 0, 0, 'array (\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'template_category\' => \'category\',\n  \'template_list\' => \'list_use\',\n  \'template_show\' => \'show\',\n  \'template_print\' => \'print\',\n  \'workflowid\' => \'1\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n)', 25, 1, '', 0, 0),
	(26, 'wslm', 0, 40, 4, '0,4', 0, '26', '工矿机械', '', '', '', 'uses/', 'Mining machinery', 'html/uses/Mining machinery/', '', 0, 0, 'array (\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'template_category\' => \'category\',\n  \'template_list\' => \'list_use\',\n  \'template_show\' => \'show\',\n  \'template_print\' => \'print\',\n  \'workflowid\' => \'1\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n)', 26, 1, '', 0, 0),
	(27, 'wslm', 0, 40, 4, '0,4', 0, '27', '风电产业', '', '', '', 'uses/', 'Wind power', 'html/uses/Wind power/', '', 0, 0, 'array (\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'template_category\' => \'category\',\n  \'template_list\' => \'list_use\',\n  \'template_show\' => \'show\',\n  \'template_print\' => \'print\',\n  \'workflowid\' => \'1\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n)', 27, 1, '', 0, 0),
	(28, 'wslm', 0, 40, 4, '0,4', 0, '28', '航空产业', '', '', '', 'uses/', 'Aviation', 'html/uses/Aviation/', '', 1, 0, 'array (\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'template_category\' => \'category\',\n  \'template_list\' => \'list_use\',\n  \'template_show\' => \'show\',\n  \'template_print\' => \'print\',\n  \'workflowid\' => \'1\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n)', 28, 1, '', 0, 0),
	(31, 'wslm', 0, 34, 0, '0', 0, '31', '联系我们', '', '', '', '', 'contact', 'html/contact/', '', 2, 1, 'array (\n  \'workflowid\' => \'1\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'template_category\' => \'category\',\n  \'template_list\' => \'list_contact\',\n  \'template_show\' => \'show\',\n  \'template_print\' => \'print\',\n  \'upload_allowext\' => \'doc|docx|xls|ppt|wps|zip|rar|txt|jpg|jpeg|gif|bmp|swf|png\',\n  \'upload_maxsize\' => \'1024000\',\n  \'thumb_enable\' => \'0\',\n  \'thumb_width\' => \'667\',\n  \'thumb_height\' => \'667\',\n  \'watermark_enable\' => \'0\',\n  \'ishtml\' => \'1\',\n  \'content_ishtml\' => \'1\',\n  \'category_urlruleid\' => \'3\',\n  \'show_urlruleid\' => \'7\',\n)', 31, 1, '', 0, 0);
/*!40000 ALTER TABLE `mg_category` ENABLE KEYS */;


# Dumping structure for table 004_jdweb.mg_collect
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

# Dumping data for table 004_jdweb.mg_collect: 0 rows
DELETE FROM `mg_collect`;
/*!40000 ALTER TABLE `mg_collect` DISABLE KEYS */;
/*!40000 ALTER TABLE `mg_collect` ENABLE KEYS */;


# Dumping structure for table 004_jdweb.mg_content
DROP TABLE IF EXISTS `mg_content`;
CREATE TABLE IF NOT EXISTS `mg_content` (
  `contentid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `areaid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` char(200) NOT NULL DEFAULT '',
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
) ENGINE=MyISAM AUTO_INCREMENT=107 DEFAULT CHARSET=utf8;

# Dumping data for table 004_jdweb.mg_content: 33 rows
DELETE FROM `mg_content`;
/*!40000 ALTER TABLE `mg_content` DISABLE KEYS */;
INSERT INTO `mg_content` (`contentid`, `catid`, `typeid`, `areaid`, `title`, `style`, `thumb`, `keywords`, `description`, `posids`, `url`, `listorder`, `status`, `userid`, `username`, `inputtime`, `updatetime`, `searchid`, `islink`, `prefix`) VALUES
	(73, 17, 0, 0, '产品主要面向国内外中高端市场产品主要面向国内外中高端市场产品主要面向国内外中高端市场', '', 'uploadfile/2012/0410/20120410095205203.png', '', '', 0, 'html/2012/0410/73.html', 0, 99, 1, 'admin', 1334022718, 1334026884, 1, 0, ''),
	(74, 17, 0, 0, '目前国内规模最大的保持器生产厂家,现正在进行', '', 'uploadfile/2012/0410/20120410103602202.jpg', '', '', 0, 'html/2012/0410/74.html', 0, 99, 1, 'admin', 1334025357, 1334025357, 2, 0, ''),
	(75, 17, 0, 0, '规模最大的保持器生产厂家,现正在进行目前国内规模最大的保持器生产厂家,现正在进', '', 'uploadfile/2012/0410/20120410110527229.png', '', '', 0, 'html/2012/0410/75.html', 0, 99, 1, 'admin', 1334027074, 1334027074, 3, 0, ''),
	(76, 17, 0, 0, '目前国内规模最大的保持器生产厂家,现正在进行目前国内规模最大的保持器生产厂家,现正在进行', '', '', '', '', 0, 'html/2012/0410/76.html', 0, 99, 1, 'admin', 1334027134, 1334027134, 4, 0, ''),
	(77, 16, 0, 0, '目前国内规模最大的保持器生产厂家,现正在进行', '', '', '', '', 0, 'html/2012/0410/77.html', 0, 99, 1, 'admin', 1334027153, 1334027153, 5, 0, ''),
	(78, 16, 0, 0, '目前国内规模最大的保持器生产厂家,现正在进行目前国内规', '', '', '', '', 0, 'html/2012/0410/78.html', 0, 99, 1, 'admin', 1334027160, 1334027160, 6, 0, ''),
	(79, 17, 0, 0, '目前国内规模最大的保持器生产厂家,现正在进行', '', '', '', '', 0, 'html/2012/0410/79.html', 0, 99, 1, 'admin', 1334027179, 1334027179, 7, 0, ''),
	(80, 17, 0, 0, '目前国内规模最大的保持器生产厂家,现正在进行', '', '', '', '', 0, 'html/2012/0410/80.html', 0, 99, 1, 'admin', 1334027185, 1334027185, 8, 0, ''),
	(81, 17, 0, 0, '目前国内规模最大的保持器生产厂家,现正在进行', '', '', '', '', 0, 'html/2012/0410/81.html', 0, 99, 1, 'admin', 1334027200, 1334027200, 9, 0, ''),
	(82, 17, 0, 0, '目前国内规模最大的保持器生产厂家,现正在进行', '', '', '', '', 0, 'html/2012/0410/82.html', 0, 99, 1, 'admin', 1334027206, 1334027206, 10, 0, ''),
	(83, 17, 0, 0, '目前国内规模最大的保持器生产厂家,现正在进行', '', '', '', '', 0, 'html/2012/0410/83.html', 0, 99, 1, 'admin', 1334027212, 1334027212, 11, 0, ''),
	(84, 17, 0, 0, '目前国内规模最大的保持器生产厂家,现正在进行目前国内规模最大的保持器生产厂家,现正在进行', '', '', '', '', 0, 'html/2012/0410/84.html', 0, 99, 1, 'admin', 1334027224, 1334027224, 12, 0, ''),
	(85, 17, 0, 0, '目前国内规模最大的保持器生产厂家,现正在进行', '', '', '', '', 0, 'html/2012/0410/85.html', 0, 99, 1, 'admin', 1334027231, 1334027231, 13, 0, ''),
	(86, 17, 0, 0, '目前国内规模最大的保持器生产厂家,现正在进行', '', '', '', '', 0, 'html/2012/0410/86.html', 0, 99, 1, 'admin', 1334027237, 1334027237, 14, 0, ''),
	(87, 17, 0, 0, '目前国内规模最大的保持器生产厂家,现正在进行', '', '', '', '', 0, 'html/2012/0410/87.html', 0, 99, 1, 'admin', 1334027244, 1334027244, 15, 0, ''),
	(88, 18, 0, 0, '聊城市金帝集团是目前国内生产规模最大', '', 'uploadfile/2012/0410/20120410122017621.png', '', '', 0, 'html/2012/0410/88.html', 0, 99, 1, 'admin', 1334031595, 1334031595, 16, 0, ''),
	(89, 18, 0, 0, '树脂保持器', '', 'uploadfile/2012/0410/20120410122040561.jpg', '', '', 0, 'html/2012/0410/89.html', 0, 99, 1, 'admin', 1334031630, 1334031630, 17, 0, ''),
	(90, 24, 0, 0, '家电产业', '', '', '', '', 0, 'html/2012/0410/90.html', 0, 99, 1, 'admin', 1334034414, 1334034414, 18, 0, ''),
	(91, 5, 0, 0, '项目改进先进供应商', '', 'uploadfile/2012/0410/20120410013600740.jpg', '', '', 0, 'show.php?contentid=91', 0, 99, 1, 'admin', 1334035978, 1334035978, 19, 0, ''),
	(92, 5, 0, 0, '质量信誉保证单位', '', 'uploadfile/2012/0410/20120410013655876.jpg', '', '', 0, 'show.php?contentid=92', 0, 99, 1, 'admin', 1334036181, 1334036181, 20, 0, ''),
	(93, 7, 0, 0, '百度', '', 'uploadfile/2012/0410/20120410014116404.gif', '', '', 0, 'html/2012/0410/93.html', 0, 99, 1, 'admin', 1334036470, 1334036470, 21, 0, ''),
	(94, 7, 0, 0, '谷歌', '', 'uploadfile/2012/0410/20120410014245457.png', '', '', 0, 'html/2012/0410/94.html', 0, 99, 1, 'admin', 1334036558, 1334036558, 22, 0, ''),
	(95, 8, 0, 0, '营销经理', '', '', '', '', 0, 'show.php?contentid=95', 0, 99, 1, 'admin', 1334036736, 1334036736, 23, 0, ''),
	(96, 8, 0, 0, '技术顾问', '', '', '', '', 0, 'show.php?contentid=96', 0, 99, 1, 'admin', 1334036801, 1334036801, 24, 0, ''),
	(97, 8, 0, 0, '技术总监', '', '', '', '', 0, 'show.php?contentid=97', 0, 99, 1, 'admin', 1334036830, 1334036830, 25, 0, ''),
	(98, 8, 0, 0, '市场专员', '', '', '', '', 0, 'show.php?contentid=98', 0, 99, 1, 'admin', 1334036847, 1334036847, 26, 0, ''),
	(99, 6, 0, 0, '2012-04-10', '', '', '', '', 0, 'html/2012/0410/99.html', 0, 99, 1, 'admin', 1334037386, 1334037386, 27, 0, ''),
	(100, 6, 0, 0, '2011.4', '', '', '', '', 0, 'html/2012/0410/100.html', 0, 99, 1, 'admin', 1334037426, 1334037426, 28, 0, ''),
	(101, 6, 0, 0, '2010.4', '', '', '', '', 0, 'html/2012/0410/101.html', 0, 99, 1, 'admin', 1334037446, 1334037446, 29, 0, ''),
	(102, 6, 0, 0, '2012', '', '', '', '', 0, 'html/2012/0410/102.html', 0, 99, 1, 'admin', 1334037474, 1334037474, 30, 0, ''),
	(104, 31, 0, 0, '北京大区', '', '', '', '', 0, 'html/2012/0410/104.html', 0, 99, 1, 'admin', 1334041093, 1334041093, 32, 0, ''),
	(105, 31, 0, 0, '山东大区', '', '', '', '', 0, 'html/2012/0410/105.html', 0, 99, 1, 'admin', 1334041118, 1334041118, 33, 0, ''),
	(106, 28, 0, 0, '航空产业', '', '', '', '', 0, 'html/2012/0410/106.html', 0, 99, 1, 'admin', 1334043130, 1334043130, 34, 0, '');
/*!40000 ALTER TABLE `mg_content` ENABLE KEYS */;


# Dumping structure for table 004_jdweb.mg_content_count
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

# Dumping data for table 004_jdweb.mg_content_count: 33 rows
DELETE FROM `mg_content_count`;
/*!40000 ALTER TABLE `mg_content_count` DISABLE KEYS */;
INSERT INTO `mg_content_count` (`contentid`, `hits`, `hits_day`, `hits_week`, `hits_month`, `hits_time`, `comments`, `comments_checked`) VALUES
	(73, 9, 9, 9, 9, 1334023926, 0, 0),
	(74, 0, 0, 0, 0, 0, 0, 0),
	(75, 0, 0, 0, 0, 0, 0, 0),
	(76, 1, 1, 1, 1, 1334028203, 0, 0),
	(77, 0, 0, 0, 0, 0, 0, 0),
	(78, 0, 0, 0, 0, 0, 0, 0),
	(79, 0, 0, 0, 0, 0, 0, 0),
	(80, 0, 0, 0, 0, 0, 0, 0),
	(81, 0, 0, 0, 0, 0, 0, 0),
	(82, 0, 0, 0, 0, 0, 0, 0),
	(83, 0, 0, 0, 0, 0, 0, 0),
	(84, 0, 0, 0, 0, 0, 0, 0),
	(85, 1, 1, 1, 1, 1334028195, 0, 0),
	(86, 2, 2, 2, 2, 1334028199, 0, 0),
	(87, 0, 0, 0, 0, 0, 0, 0),
	(88, 0, 0, 0, 0, 0, 0, 0),
	(89, 2, 2, 2, 2, 1334055634, 0, 0),
	(90, 0, 0, 0, 0, 0, 0, 0),
	(91, 0, 0, 0, 0, 0, 0, 0),
	(92, 0, 0, 0, 0, 0, 0, 0),
	(93, 0, 0, 0, 0, 0, 0, 0),
	(94, 0, 0, 0, 0, 0, 0, 0),
	(95, 0, 0, 0, 0, 0, 0, 0),
	(96, 0, 0, 0, 0, 0, 0, 0),
	(97, 0, 0, 0, 0, 0, 0, 0),
	(98, 0, 0, 0, 0, 0, 0, 0),
	(99, 0, 0, 0, 0, 0, 0, 0),
	(100, 0, 0, 0, 0, 0, 0, 0),
	(101, 0, 0, 0, 0, 0, 0, 0),
	(102, 0, 0, 0, 0, 0, 0, 0),
	(104, 1, 1, 1, 1, 1334047744, 0, 0),
	(105, 0, 0, 0, 0, 0, 0, 0),
	(106, 0, 0, 0, 0, 0, 0, 0);
/*!40000 ALTER TABLE `mg_content_count` ENABLE KEYS */;


# Dumping structure for table 004_jdweb.mg_content_position
DROP TABLE IF EXISTS `mg_content_position`;
CREATE TABLE IF NOT EXISTS `mg_content_position` (
  `contentid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `posid` smallint(5) unsigned NOT NULL DEFAULT '0',
  KEY `posid` (`posid`),
  KEY `contentid` (`contentid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# Dumping data for table 004_jdweb.mg_content_position: 0 rows
DELETE FROM `mg_content_position`;
/*!40000 ALTER TABLE `mg_content_position` DISABLE KEYS */;
/*!40000 ALTER TABLE `mg_content_position` ENABLE KEYS */;


# Dumping structure for table 004_jdweb.mg_content_tag
DROP TABLE IF EXISTS `mg_content_tag`;
CREATE TABLE IF NOT EXISTS `mg_content_tag` (
  `tag` char(20) NOT NULL,
  `contentid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  KEY `contentid` (`contentid`),
  KEY `tag` (`tag`(10))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# Dumping data for table 004_jdweb.mg_content_tag: 0 rows
DELETE FROM `mg_content_tag`;
/*!40000 ALTER TABLE `mg_content_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `mg_content_tag` ENABLE KEYS */;


# Dumping structure for table 004_jdweb.mg_copyfrom
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

# Dumping data for table 004_jdweb.mg_copyfrom: 0 rows
DELETE FROM `mg_copyfrom`;
/*!40000 ALTER TABLE `mg_copyfrom` DISABLE KEYS */;
/*!40000 ALTER TABLE `mg_copyfrom` ENABLE KEYS */;


# Dumping structure for table 004_jdweb.mg_c_contact
DROP TABLE IF EXISTS `mg_c_contact`;
CREATE TABLE IF NOT EXISTS `mg_c_contact` (
  `contentid` mediumint(8) unsigned NOT NULL,
  `template` char(30) NOT NULL,
  `content` mediumtext NOT NULL,
  `contact` mediumtext NOT NULL,
  PRIMARY KEY (`contentid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# Dumping data for table 004_jdweb.mg_c_contact: 2 rows
DELETE FROM `mg_c_contact`;
/*!40000 ALTER TABLE `mg_c_contact` DISABLE KEYS */;
INSERT INTO `mg_c_contact` (`contentid`, `template`, `content`, `contact`) VALUES
	(104, '', '', 'Tel:010-86552522\r\nFax:010-85441125'),
	(105, '', '', '0531-88888888\r\nMail:jindi@126.com');
/*!40000 ALTER TABLE `mg_c_contact` ENABLE KEYS */;


# Dumping structure for table 004_jdweb.mg_c_folder
DROP TABLE IF EXISTS `mg_c_folder`;
CREATE TABLE IF NOT EXISTS `mg_c_folder` (
  `contentid` mediumint(8) unsigned NOT NULL,
  `template` char(30) NOT NULL,
  `content` mediumtext NOT NULL,
  PRIMARY KEY (`contentid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# Dumping data for table 004_jdweb.mg_c_folder: 0 rows
DELETE FROM `mg_c_folder`;
/*!40000 ALTER TABLE `mg_c_folder` DISABLE KEYS */;
/*!40000 ALTER TABLE `mg_c_folder` ENABLE KEYS */;


# Dumping structure for table 004_jdweb.mg_c_honor
DROP TABLE IF EXISTS `mg_c_honor`;
CREATE TABLE IF NOT EXISTS `mg_c_honor` (
  `contentid` mediumint(8) unsigned NOT NULL,
  `template` char(30) NOT NULL,
  `content` mediumtext NOT NULL,
  PRIMARY KEY (`contentid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# Dumping data for table 004_jdweb.mg_c_honor: 2 rows
DELETE FROM `mg_c_honor`;
/*!40000 ALTER TABLE `mg_c_honor` DISABLE KEYS */;
INSERT INTO `mg_c_honor` (`contentid`, `template`, `content`) VALUES
	(91, '', '&nbsp;项目改进先进供应商项目改进先进供应商项目改进先进供应商项目改进先进供应商项目改进先进供应商项目改进先进供应商项目改进先进供应商项目改进先进供应商项目改进先进供应商项目改进先进供应商项目改进先进供应商项目改进先进供应商项目改进先进供应商项目改进先进供应商项目改进先进供应商项目改进先进供应商项目改进先进供应商项目改进先进供应商项目改进先进供应商项目改进先进供应商项目改进先进供应商项目改进先进供应商项目改进先进供应商项目改进先进供应商项目改进先进供应商项目改进先进供应商项目改进先进供应商项目改进先进供应商项目改进先进供应商项目改进先进供应商项目改进先进供应商项目改进先进供应商'),
	(92, '', '&nbsp;质量信誉保证单位质量信誉保证单位质量信誉保证单位质量信誉保证单位质量信誉保证单位质量信誉保证单位质量信誉保证单位质量信誉保证单位质量信誉保证单位质量信誉保证单位质量信誉保证单位质量信誉保证单位质量信誉保证单位质量信誉保证单位质量信誉保证单位质量信誉保证单位质量信誉保证单位质量信誉保证单位质量信誉保证单位质量信誉保证单位质量信誉保证单位质量信誉保证单位质量信誉保证单位质量信誉保证单位质量信誉保证单位质量信誉保证单位质量信誉保证单位质量信誉保证单位质量信誉保证单位质量信誉保证单位质量信誉保证单位质量信誉保证单位质量信誉保证单位质量信誉保证单位质量信誉保证单位质量信誉保证单位质量信誉保证单位质量信誉保证单位质量信誉保证单位质量信誉保证单位质量信誉保证单位质量信誉保证单位质量信誉保证单位质量信誉保证单位质量信誉保证单位质量信誉保证单位质量信誉保证单位');
/*!40000 ALTER TABLE `mg_c_honor` ENABLE KEYS */;


# Dumping structure for table 004_jdweb.mg_c_job
DROP TABLE IF EXISTS `mg_c_job`;
CREATE TABLE IF NOT EXISTS `mg_c_job` (
  `contentid` mediumint(8) unsigned NOT NULL,
  `template` char(30) NOT NULL,
  `content` mediumtext NOT NULL,
  `endtime` date NOT NULL DEFAULT '0000-00-00',
  `starttime` date NOT NULL DEFAULT '0000-00-00',
  `jobnum` varchar(255) NOT NULL DEFAULT '',
  `place` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`contentid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# Dumping data for table 004_jdweb.mg_c_job: 4 rows
DELETE FROM `mg_c_job`;
/*!40000 ALTER TABLE `mg_c_job` DISABLE KEYS */;
INSERT INTO `mg_c_job` (`contentid`, `template`, `content`, `endtime`, `starttime`, `jobnum`, `place`) VALUES
	(95, '', '<div>&nbsp;职位：数据库营销经理 &ndash; 携程旅行网</div>\r\n<div>主要岗位职责：</div>\r\n<div>1、 内部数据库营销策划、统筹和项目实施</div>\r\n<div>2、 电子邮件营销计划执行、监测和效果分析</div>\r\n<div>3、 新媒体及网络渠道的研究应用</div>\r\n<div>4、 内部营销资源投放、协调和跨部门协作</div>\r\n<div>岗位任职要求：</div>\r\n<div>学历/经验：</div>\r\n<div>全日制本科以上学历，媒体广告/统计/数学/计算机科学专业优先；</div>\r\n<div>熟悉市场与媒介分析方法，有4A媒介公司、调研公司、咨询公司工作经验者优先</div>\r\n<div>两年以上网络营销或电子邮件客户关系维护经验，有成功案例者优先</div>\r\n<div>基本素质：</div>\r\n<div>有较强的分析总结能力和数据敏感性，熟悉媒介分析方法和模型，可以完成数据进行分析报告，提出推广建议</div>\r\n<div>对新媒体和互联网行业有浓厚兴趣和探索精神</div>\r\n<div>思路清晰、认真细致，主动性强</div>\r\n<div>其它要求：</div>\r\n<div>优秀的沟通能力和团队协作意识</div>\r\n有相关工作经验者优先&nbsp;', '2012-04-30', '2012-04-10', '20', '北京'),
	(96, '', '&nbsp; 职位：数据库营销经理 &ndash; 携程旅行网\r\n<div>主要岗位职责：</div>\r\n<div>1、 内部数据库营销策划、统筹和项目实施</div>\r\n<div>2、 电子邮件营销计划执行、监测和效果分析</div>\r\n<div>3、 新媒体及网络渠道的研究应用</div>\r\n<div>4、 内部营销资源投放、协调和跨部门协作</div>\r\n<div>岗位任职要求：</div>\r\n<div>学历/经验：</div>\r\n<div>全日制本科以上学历，媒体广告/统计/数学/计算机科学专业优先；</div>\r\n<div>熟悉市场与媒介分析方法，有4A媒介公司、调研公司、咨询公司工作经验者优先</div>\r\n<div>两年以上网络营销或电子邮件客户关系维护经验，有成功案例者优先</div>\r\n<div>基本素质：</div>\r\n<div>有较强的分析总结能力和数据敏感性，熟悉媒介分析方法和模型，可以完成数据进行分析报告，提出推广建议</div>\r\n<div>对新媒体和互联网行业有浓厚兴趣和探索精神</div>\r\n<div>思路清晰、认真细致，主动性强</div>\r\n<div>其它要求：</div>\r\n<div>优秀的沟通能力和团队协作意识</div>\r\n<div>有相关工作经验者优先</div>', '2012-04-10', '2012-04-10', '15', '聊城'),
	(97, '', '&nbsp; 职位：数据库营销经理 &ndash; 携程旅行网\r\n<div>主要岗位职责：</div>\r\n<div>1、 内部数据库营销策划、统筹和项目实施</div>\r\n<div>2、 电子邮件营销计划执行、监测和效果分析</div>\r\n<div>3、 新媒体及网络渠道的研究应用</div>\r\n<div>4、 内部营销资源投放、协调和跨部门协作</div>\r\n<div>岗位任职要求：</div>\r\n<div>学历/经验：</div>\r\n<div>全日制本科以上学历，媒体广告/统计/数学/计算机科学专业优先；</div>\r\n<div>熟悉市场与媒介分析方法，有4A媒介公司、调研公司、咨询公司工作经验者优先</div>\r\n<div>两年以上网络营销或电子邮件客户关系维护经验，有成功案例者优先</div>\r\n<div>基本素质：</div>\r\n<div>有较强的分析总结能力和数据敏感性，熟悉媒介分析方法和模型，可以完成数据进行分析报告，提出推广建议</div>\r\n<div>对新媒体和互联网行业有浓厚兴趣和探索精神</div>\r\n<div>思路清晰、认真细致，主动性强</div>\r\n<div>其它要求：</div>\r\n<div>优秀的沟通能力和团队协作意识</div>\r\n<div>有相关工作经验者优先</div>', '2012-04-10', '2012-04-10', '2', '北京'),
	(98, '', '&nbsp; 职位：数据库营销经理 &ndash; 携程旅行网\r\n<div>主要岗位职责：</div>\r\n<div>1、 内部数据库营销策划、统筹和项目实施</div>\r\n<div>2、 电子邮件营销计划执行、监测和效果分析</div>\r\n<div>3、 新媒体及网络渠道的研究应用</div>\r\n<div>4、 内部营销资源投放、协调和跨部门协作</div>\r\n<div>岗位任职要求：</div>\r\n<div>学历/经验：</div>\r\n<div>全日制本科以上学历，媒体广告/统计/数学/计算机科学专业优先；</div>\r\n<div>熟悉市场与媒介分析方法，有4A媒介公司、调研公司、咨询公司工作经验者优先</div>\r\n<div>两年以上网络营销或电子邮件客户关系维护经验，有成功案例者优先</div>\r\n<div>基本素质：</div>\r\n<div>有较强的分析总结能力和数据敏感性，熟悉媒介分析方法和模型，可以完成数据进行分析报告，提出推广建议</div>\r\n<div>对新媒体和互联网行业有浓厚兴趣和探索精神</div>\r\n<div>思路清晰、认真细致，主动性强</div>\r\n<div>其它要求：</div>\r\n<div>优秀的沟通能力和团队协作意识</div>\r\n<div>有相关工作经验者优先</div>', '2012-04-10', '2012-04-10', '2', '山东');
/*!40000 ALTER TABLE `mg_c_job` ENABLE KEYS */;


# Dumping structure for table 004_jdweb.mg_c_partner
DROP TABLE IF EXISTS `mg_c_partner`;
CREATE TABLE IF NOT EXISTS `mg_c_partner` (
  `contentid` mediumint(8) unsigned NOT NULL,
  `template` char(30) NOT NULL,
  `content` mediumtext NOT NULL,
  PRIMARY KEY (`contentid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# Dumping data for table 004_jdweb.mg_c_partner: 2 rows
DELETE FROM `mg_c_partner`;
/*!40000 ALTER TABLE `mg_c_partner` DISABLE KEYS */;
INSERT INTO `mg_c_partner` (`contentid`, `template`, `content`) VALUES
	(93, '', '<div>百度，全球最大的中文搜索引擎、最大的中文网站。2000年1月创立于北京中关村。</div>\r\n<div>1999年底，身在美国硅谷的李彦宏看到了中国互联网及中文搜索引擎服务的巨大发展潜力，抱着技术改变世界的梦想，他毅然辞掉硅谷的高薪工作，携搜索引擎专利技术，于2000年1月1日在中关村创建了百度公司。从最初的不足10人发展至今，员工人数超过12000人。如今的百度，已成为中国最受欢迎、影响力最大的中文网站。</div>\r\n<div>百度拥有数千名研发工程师，这是中国乃至全球最为优秀的技术团队，这支队伍掌握着世界上最为先进的搜索引擎技术，使百度成为中国掌握世界尖端科学核心技术的中国高科技企业，也使中国成为美国、俄罗斯、和韩国之外，全球仅有的4个拥有搜索引擎核心技术的国家之一。</div>\r\n<div>从创立之初，百度便将&ldquo;让人们最便捷地获取信息，找到所求&rdquo;作为自己的使命，成立以来，公司秉承&ldquo;以用户为导向&rdquo;的理念，不断坚持技术创新，致力于为用户提供&ldquo;简单，可依赖&rdquo;的互联网搜索产品及服务，其中包括：以网络搜索为主的功能性搜索，以贴吧为主的社区搜索，针对各区域、行业所需的垂直搜索，Mp3搜索，以及门户频道、IM等，全面覆盖了中文网络世界所有的搜索需求，根据第三方权威数据，百度在中国的搜索份额接近80%。</div>\r\n<div>在面对用户的搜索产品不断丰富的同时，百度还创新性地推出了基于搜索的营销推广服务，并成为最受企业青睐的互联网营销推广平台。目前，中国已有数十万家企业使用了百度的搜索推广服务，不断提升着企业自身的品牌及运营效率。通过持续的商业模式创新，百度正进一步带动整个互联网行业和中小企业的经济增长，推动社会经济的发展和转型。</div>\r\n<div>为推动中国数百万中小网站的发展，百度借助超大流量的平台优势，联合所有优质的各类网站，建立了世界上最大的网络联盟，使各类企业的搜索推广、品牌营销的价值、覆盖面均大面积提升。与此同时，各网站也在联盟大家庭的互助下，获得最大的生存与发展机会。</div>\r\n<div>作为国内的一家知名企业，百度也一直秉承&ldquo;弥合信息鸿沟，共享知识社会&rdquo;的责任理念，坚持履行企业公民的社会责任。成立来，百度利用自身优势积极投身公益事业，先后投入巨大资源，为盲人、少儿、老年人群体打造专门的搜索产品，解决了特殊群体上网难问题,极大地弥补了社会信息鸿沟问题。此外，在加速推动中国信息化进程、净化网络环境、搜索引擎教育及提升大学生就业率等方面，百度也一直走在行业领先的地位。2011年初，百度还特别成立了百度基金会，围绕知识教育、环境保护、灾难救助等领域，更加系统规范地管理和践行公益事业。</div>\r\n<div>2005年，百度在美国纳斯达克上市，一举打破首日涨幅最高等多项纪录，并成为首家进入纳斯达克成分股的中国公司。通过数年来的市场表现，百度优异的业绩与值得依赖的回报，使之成为中国企业价值的代表，傲然屹立于全球资本市场。</div>\r\n<div>2009年，百度更是推出全新的框计算技术概念，并基于此理念推出百度开放平台，帮助更多优秀的第三方开发者利用互联网平台自主创新、自主创业，在大幅提升网民互联网使用体验的同时，带动起围绕用户需求进行研发的产业创新热潮，对中国互联网产业的升级和发展产生巨大的拉动效应。</div>\r\n<div>今天，百度已经成为中国最具价值的品牌之一，英国《金融时报》将百度列为&ldquo;中国十大世界级品牌&rdquo;，成为这个榜单中最年轻的一家公司，也是唯一一家互联网公司。而&ldquo;亚洲最受尊敬企业&rdquo;、&ldquo;全球最具创新力企业&rdquo;、&ldquo;中国互联网力量之星&rdquo;等一系列荣誉称号的获得，也无一不向外界展示着百度成立数年来的成就。</div>\r\n多年来，百度董事长兼CEO李彦宏，率领百度人所形成的&ldquo;简单可依赖&rdquo;的核心文化，深深地植根于百度。这是一个充满朝气、求实坦诚的公司，以搜索改变生活，推动人类的文明与进步，促进中国经济的发展为己任，正朝着更为远大的目标而迈进。&nbsp;'),
	(94, '', '通过您的网站赢得收益：谷歌广告联盟  广告联盟（AdSense）的优势  增加收益：通过内容定位广告释放网站最大创收潜能。 改善体验：利用自定义广告完善网站外观和提升用户体验。 洞察效果：查看在线报告跟踪不同格式和位置的广告收益。 简单快捷地成为广告联盟（AdSense）发布商');
/*!40000 ALTER TABLE `mg_c_partner` ENABLE KEYS */;


# Dumping structure for table 004_jdweb.mg_c_product
DROP TABLE IF EXISTS `mg_c_product`;
CREATE TABLE IF NOT EXISTS `mg_c_product` (
  `contentid` mediumint(8) unsigned NOT NULL,
  `template` char(30) NOT NULL,
  `content` mediumtext NOT NULL,
  PRIMARY KEY (`contentid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# Dumping data for table 004_jdweb.mg_c_product: 2 rows
DELETE FROM `mg_c_product`;
/*!40000 ALTER TABLE `mg_c_product` DISABLE KEYS */;
INSERT INTO `mg_c_product` (`contentid`, `template`, `content`) VALUES
	(88, '', '&nbsp;聊城市金帝集团是目前国内生产规模最大聊城市金帝集团是目前国内生产规模最大聊城市金帝集团是目前国内生产规模最大聊城市金帝集团是目前国内生产规模最大聊城市金帝集团是目前国内生产规模最大聊城市金帝集团是目前国内生产规模最大聊城市金帝集团是目前国内生产规模最大聊城市金帝集团是目前国内生产规模最大聊城市金帝集团是目前国内生产规模最大聊城市金帝集团是目前国内生产规模最大聊城市金帝集团是目前国内生产规模最大聊城市金帝集团是目前国内生产规模最大聊城市金帝集团是目前国内生产规模最大聊城市金帝集团是目前国内生产规模最大聊城市金帝集团是目前国内生产规模最大聊城市金帝集团是目前国内生产规模最大聊城市金帝集团是目前国内生产规模最大聊城市金帝集团是目前国内生产规模最大聊城市金帝集团是目前国内生产规模最大聊城市金帝集团是目前国内生产规模最大聊城市金帝集团是目前国内生产规模最大聊城市金帝集团是目前国内生产规模最大聊城市金帝集团是目前国内生产规模最大聊城市金帝集团是目前国内生产规模最大聊城市金帝集团是目前国内生产规模最大聊城市金帝集团是目前国内生产规模最大聊城市金帝集团是目前国内生产规模最大聊城市金帝集团是目前国内生产规模最大聊城市金帝集团是目前国内生产规模最大聊城市金帝集团是目前国内生产规模最大聊城市金帝集团是目前国内生产规模最大聊城市金帝集团是目前国内生产规模最大聊城市金帝集团是目前国内生产规模最大聊城市金帝集团是目前国内生产规模最大聊城市金帝集团是目前国内生产规模最大聊城市金帝集团是目前国内生产规模最大聊城市金帝集团是目前国内生产规模最大聊城市金帝集团是目前国内生产规模最大聊城市金帝集团是目前国内生产规模最大聊城市金帝集团是目前国内生产规模最大聊城市金帝集团是目前国内生产规模最大'),
	(89, '', '&nbsp;树脂保持器树脂保持器树脂保持器树脂保持器树脂保持器树脂保持器树脂保持器树脂保持器树脂保持器树脂保持器树脂保持器树脂保持器树脂保持器树脂保持器树脂保持器树脂保持器树脂保持器树脂保持器树脂保持器树脂保持器树脂保持器树脂保持器树脂保持器树脂保持器树脂保持器树脂保持器树脂保持器树脂保持器树脂保持器树脂保持器树脂保持器树脂保持器树脂保持器树脂保持器树脂保持器树脂保持器树脂保持器树脂保持器树脂保持器树脂保持器树脂保持器树脂保持器树脂保持器树脂保持器树脂保持器树脂保持器树脂保持器树脂保持器树脂保持器树脂保持器树脂保持器树脂保持器树脂保持器树脂保持器树脂保持器树脂保持器树脂保持器树脂保持器树脂保持器树脂保持器树脂保持器树脂保持器树脂保持器树脂保持器');
/*!40000 ALTER TABLE `mg_c_product` ENABLE KEYS */;


# Dumping structure for table 004_jdweb.mg_c_progress
DROP TABLE IF EXISTS `mg_c_progress`;
CREATE TABLE IF NOT EXISTS `mg_c_progress` (
  `contentid` mediumint(8) unsigned NOT NULL,
  `template` char(30) NOT NULL,
  `content` mediumtext NOT NULL,
  `progress` mediumtext NOT NULL,
  `date` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`contentid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# Dumping data for table 004_jdweb.mg_c_progress: 4 rows
DELETE FROM `mg_c_progress`;
/*!40000 ALTER TABLE `mg_c_progress` DISABLE KEYS */;
INSERT INTO `mg_c_progress` (`contentid`, `template`, `content`, `progress`, `date`) VALUES
	(99, '', '', '踏入辉煌的历程', '2012-04-10'),
	(100, '', '', '开始新的篇章', '2011-04-10'),
	(101, '', '', '发展进入新的轨道', '2010-04-13'),
	(102, '', '', '企业进程企业进程企业进程企业进程企业进程企业进程企业进程企业进程企业进程企业进程企业进程企业进程企业进程企业进程企业进程企业进程企业进程企业进程企业进程企业进程企业进程企业进程企业进程企业进程企业进程企业进程企业进程企业进程企业进程企业进程企业进程企业进程企业进程企业进程企业进程企业进程企业进程企业进程企业进程企业进程企业进程', '2012-04-10');
/*!40000 ALTER TABLE `mg_c_progress` ENABLE KEYS */;


# Dumping structure for table 004_jdweb.mg_c_thumbnews
DROP TABLE IF EXISTS `mg_c_thumbnews`;
CREATE TABLE IF NOT EXISTS `mg_c_thumbnews` (
  `contentid` mediumint(8) unsigned NOT NULL,
  `template` char(30) NOT NULL,
  `content` mediumtext NOT NULL,
  PRIMARY KEY (`contentid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# Dumping data for table 004_jdweb.mg_c_thumbnews: 15 rows
DELETE FROM `mg_c_thumbnews`;
/*!40000 ALTER TABLE `mg_c_thumbnews` DISABLE KEYS */;
INSERT INTO `mg_c_thumbnews` (`contentid`, `template`, `content`) VALUES
	(73, '', '<div>&nbsp; 产品主要面向国内外中高端市场 产品主要面向国内外中高端市场 产品主要面向国内外中高端市场 产品主要面向国内外中高端市场 产品主要面向国内外中高端市场 产品主要面向国内外中高端市场 产品主要面向国内外中高端市场 产品主要面向国内外中高端市场 产品主要面向国内外中高端市场 产品主要面向国内外中高端市场 产品主要面向国内外中高端市场产品主要面向国内外中高端市场 产品主要面向国内外中高端市场 产品主要面向国内外中高端市场 产品主要面向国内外中高端市场 产品主要面向国内外中高端市场 产品主要面向国内外中高端市场 产品主要面向国内外中高端市场 产品主要面向国内外中高端市场 产品主要面向国内外中高端市场 产品主要面向国内外中高端市场 产品主要面向国内外中高端市场产品主要面向国内外中高端市场 产品主要面向国内外中高端市场 产品主要面向国内外中高端市场 产品主要面向国内外中高端市场 产品主要面向国内外中高端市场 产品主要面向国内外中高端市场 产品主要面向国内外中高端市场 产品主要面向国内外中高端市场 产品主要面向国内外中高端市场</div>\r\n<div>&nbsp;</div>\r\n<div>产品主要面向国内外中高端市场 &nbsp;产品主要面向国内外中高端市场 &nbsp;产品主要面向国内外中高端市场 &nbsp;产品主要面向国内外中高端市场 &nbsp;产品主要面向国内外中高端市场 &nbsp;产品主要面向国内外中高端市场 &nbsp;产品主要面向国内外中高端市场 &nbsp;产品主要面向国内外中高端市场 &nbsp;产品主要面向国内外中高端市场 &nbsp;产品主要面向国内外中高端市场 &nbsp;产品主要面向国内外中高端市场 &nbsp;产品主要面向国内外中高端市场 &nbsp;产品主要面向国内外中高端市场 &nbsp;产品主要面向国内外中高端市场 &nbsp;产品主要面向国内外中高端市场 &nbsp;产品主要面向国内外中高端市场 &nbsp;产品主要面向国内外中高端市场 &nbsp;产品主要面向国内外中高端市场 产品主要面向国内外中高端市场 &nbsp;产品主要面向国内外中高端市场 &nbsp;产品主要面向国内外中高端市场 &nbsp;产品主要面向国内外中高端市场 &nbsp;产品主要面向国内外中高端市场 &nbsp;产品主要面向国内外中高端市场 &nbsp;产品主要面向国内外中高端市场 &nbsp;产品主要面向国内外中高端市场 &nbsp;产品主要面向国内外中高端市场 &nbsp;产品主要面向国内外中高端市场 &nbsp;产品主要面向国内外中高端市场 &nbsp;产品主要面向国内外中高端市场 &nbsp;产品主要面向国内外中高端市场 &nbsp;产品主要面向国内外中高端市场 &nbsp;产品主要面向国内外中高端市场&nbsp;</div>'),
	(74, '', '&nbsp; <span style="color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: small; line-height: 16px; ">目前国内规模最大的保持器生产厂家,现正在进行</span> <span style="color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: small; line-height: 16px; ">目前国内规模最大的保持器生产厂家,现正在进行</span> <span style="color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: small; line-height: 16px; ">目前国内规模最大的保持器生产厂家,现正在进行</span> <span style="color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: small; line-height: 16px; ">目前国内规模最大的保持器生产厂家,现正在进行</span> <span style="color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: small; line-height: 16px; ">目前国内规模最大的保持器生产厂家,现正在进行</span> <span style="color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: small; line-height: 16px; ">目前国内规模最大的保持器生产厂家,现正在进行</span> <span style="color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: small; line-height: 16px; ">目前国内规模最大的保持器生产厂家,现正在进行</span> <span style="color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: small; line-height: 16px; ">目前国内规模最大的保持器生产厂家,现正在进行</span> <span style="color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: small; line-height: 16px; ">目前国内规模最大的保持器生产厂家,现正在进行</span> <span style="color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: small; line-height: 16px; ">目前国内规模最大的保持器生产厂家,现正在进行</span> <span style="color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: small; line-height: 16px; ">目前国内规模最大的保持器生产厂家,现正在进行</span> <span style="color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: small; line-height: 16px; ">目前国内规模最大的保持器生产厂家,现正在进行</span> <span style="color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: small; line-height: 16px; ">目前国内规模最大的保持器生产厂家,现正在进行</span> <span style="color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: small; line-height: 16px; ">目前国内规模最大的\r\n<div style="text-align: center; "><img src="/jdweb/uploadfile/2012/0410/20120410103602202.jpg" width="331" height="270" alt="" /></div>\r\n保持器生产厂家,现正在进行</span> <span style="color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: small; line-height: 16px; ">目前国内规模最大的保持器生产厂家,现正在进行</span> <span style="color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: small; line-height: 16px; ">目前国内规模最大的保持器生产厂家,现正在进行</span> <span style="color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: small; line-height: 16px; ">目前国内规模最大的保持器生产厂家,现正在进行</span><span style="color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: small; line-height: 16px; ">目前国内规模最大的保持器生产厂家,现正在进行</span> <span style="color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: small; line-height: 16px; ">目前国内规模最大的保持器生产厂家,现正在进行</span> <span style="color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: small; line-height: 16px; ">目前国内规模最大的保持器生产厂家,现正在进行</span> <span style="color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: small; line-height: 16px; ">目前国内规模最大的保持器生产厂家,现正在进行</span> <span style="color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: small; line-height: 16px; ">目前国内规模最大的保持器生产厂家,现正在进行</span> <span style="color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: small; line-height: 16px; ">目前国内规模最大的保持器生产厂家,现正在进行</span> <span style="color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: small; line-height: 16px; ">目前国内规模最大的保持器生产厂家,现正在进行</span> <span style="color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: small; line-height: 16px; ">目前国内规模最大的保持器生产厂家,现正在进行</span> <span style="color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: small; line-height: 16px; ">目前国内规模最大的保持器生产厂家,现正在进行</span> <span style="color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: small; line-height: 16px; ">目前国内规模最大的保持器生产厂家,现正在进行</span> <span style="color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: small; line-height: 16px; ">目前国内规模最大的保持器生产厂家,现正在进行</span> <span style="color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: small; line-height: 16px; ">目前国内规模最大的保持器生产厂家,现正在进行</span> <span style="color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: small; line-height: 16px; ">目前国内规模最大的保持器生产厂家,现正在进行</span> <span style="color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: small; line-height: 16px; ">目前国内规模最大的保持器生产厂家,现正在进行</span> <span style="color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: small; line-height: 16px; ">目前国内规模最大的保持器生产厂家<br />\r\n<br />\r\n,现正在进行</span> <span style="color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: small; line-height: 16px; ">目前国内规模最大的保持器生产厂家,现正在进行</span> <span style="color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: small; line-height: 16px; ">目前国内规模最大的保持器生产厂家,现正在进行</span> <span style="color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: small; line-height: 16px; ">目前国内规模最大的保持器生产厂家,现正在进行</span> <span style="color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: small; line-height: 16px; ">目前国内规模最大的保持器生产厂家,现正在进行</span> <span style="color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: small; line-height: 16px; ">目前国内规模最大的保持器生产厂家,现正在进行</span> <span style="color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: small; line-height: 16px; ">目前国内规模最大的保持器生产厂家,现正在进行</span> <span style="color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: small; line-height: 16px; ">目前国内规模最大的保持器生产厂家,现正在进行</span> <span style="color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: small; line-height: 16px; ">目前国内规模最大的保持器生产厂家,现正在进行</span> <span style="color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: small; line-height: 16px; ">目前国内规模最大的保持器生产厂家,现正在进行</span> <span style="color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: small; line-height: 16px; ">目前国内规模最大的保持器生产厂家,现正在进行v</span>'),
	(75, '', '目前国内规模最大的保持器生产厂家,现正在进行目前国内规模最大的保持器生产厂家,现正在进行目前国内规模最大的保持器生产厂家,现正在进行目前国内规模最大的保持器生产厂家,现正在进行目前国内规模最大的保持器生产厂家,现正在进行目前国内规模最大的保持器生产厂家,现正在进行目前国内规模最大的保持器生产厂家,现正在进行目前国内规模最大的保持器生产厂家,现正在进行目前国内规模最大的保持器生产厂家,现正在进行目前国内规模最大的保持器生产厂家,现正在进行目前国内规模最大的保持器生产厂家,现正在进行目前国内规模最大的保持器生产厂家,现正在进行目前国内规模最大的保持器生产厂家,现正在进行目前国内规模最大的保持器生产厂家,现正在进行目前国内规模最大的保持器生产厂家,现正在进行目前国内规模最大的保持器生产厂家,现正在进行目前国内规模最大的保持器生产厂家,现正在进行目前国内规模最大的保持器生产厂家,现正在进行目前国内规模最大的保持器生产厂家,现正在进行目前国内规模最大的保持器生产厂家,现正在进行目前国内规模最大的保持器生产厂家,现正在进行目前国内规模最大的保持器生产厂家,现正在进行目前国内规模最大的保持器生产厂家,现正在进行目前国内规模最大的保持器生产厂家,现正在进行目前国内规模最大的保持器生产厂家,现正在进行目前国内规模最大的保持器生产厂家,现正在进行目前国内规模最大的保持器生产厂家,现正在进行目前国内规模最大的保持器生产厂家,现正在进行目前国内规模最大的保持器生产厂家,现正在进行目前国内规模最大的保持器生产厂家,现正在进行目前国内规模最大的保持器生产厂家,现正在进行目前国内规模最大的保持器生产厂家,现正在进行'),
	(76, '', '&nbsp;目前国内规模最大的保持器生产厂家,现正在进行目前国内规模最大的保持器生产厂家,现正在进行目前国内规模最大的保持器生产厂家,现正在进行目前国内规模最大的保持器生产厂家,现正在进行'),
	(77, '', '&nbsp;目前国内规模最大的保持器生产厂家,现正在进行目前国内规模最大的保持器生产厂家,现正在进行目前国内规模最大的保持器生产厂家,现正在进行目前国内规模最大的保持器生产厂家,现正在进行目前国内规模最大的保持器生产厂家,现正在进行目前国内规模最大的保持器生产厂家,现正在进行目前国内规模最大的保持器生产厂家,现正在进行目前国内规模最大的保持器生产厂家,现正在进行'),
	(78, '', '&nbsp;目前国内规模最大的保持器生产厂家,现正在进行目前国内规模最大的保持器生产厂家,现正在进行目前国内规模最大的保持器生产厂家,现正在进行目前国内规模最目前国内规模最大的保持器生产厂家,现正在进行目前国内规模最大的保持器生产厂家,现正在进行目前国内规模最大的保持器生产厂家,现正在进行目前国内规模最大的保持器生产厂家,现正在进行目前国内规模最大的保持器生产厂家,现正在进行目前国内规模最大的保持器生产厂家,现正在进行目前国内规模最大的保持器生产厂家,现正在进行目前国内规模最大的保持器生产厂家,现正在进行目前国内规模最大的保持器生产厂家,现正在进行目前国内规模最大的保持器生产厂家,现正在进行目前国内规模最大的保持器生产厂家,现正在进行大的保持器生产厂家,现正在进行'),
	(79, '', '&nbsp;目前国内规模最大的保持器生产厂家,现正在进行目前国内规模最大的保持器生产厂家,现正在进行目前国内规模最大的保持器生产厂家,现正在进行'),
	(80, '', '&nbsp;目前国内规模最大的保持器生产厂家,现正在进行目前国内规模最大的保持器生产厂家,现正在进行目前国内规模最大的保持器生产厂家,现正在进行目前国内规模最大的保持器生产厂家,现正在进行目前国内规模最大的保持器生产厂家,现正在进行目前国内规模最大的保持器生产厂家,现正在进行目前国内规模最大的保持器生产厂家,现正在进行目前国内规模最大的保持器生产厂家,现正在进行'),
	(81, '', '&nbsp;目前国内规模最大的保持器生产厂家,现正在进行目前国内规模最大的保持器生产厂家,现正在进行目前国内规模最大的保持器生产厂家,现正在进行'),
	(82, '', '&nbsp;目前国内规模最大的保持器生产厂家,现正在进行目前国内规模最大的保持器生产厂家,现正在进行'),
	(83, '', '&nbsp;目前国内规模最大的保持器生产厂家,现正在进行目前国内规模最大的保持器生产厂家,现正在进行目前国内规模最大的保持器生产厂家,现正在进行目前国内规模最大的保持器生产厂家,现正在进行目前国内规模最大的保持器生产厂家,现正在进行'),
	(84, '', '&nbsp;目前国内规模最大的保持器生产厂家,现正在进行目前国内规模最大的保持器生产厂家,现正在进行目前国内规模最大的保持器生产厂家,现正在进行'),
	(85, '', '&nbsp;目前国内规模最大的保持器生产厂家,现正在进行目前国内规模最大的保持器生产厂家,现正在进行目前国内规模最大的保持器生产厂家,现正在进行目前国内规模最大的保持器生产厂家,现正在进行'),
	(86, '', '&nbsp;目前国内规模最大的保持器生产厂家,现正在进行目前国内规模最大的保持器生产厂家,现正在进行目前国内规模最大的保持器生产厂家,现正在进行'),
	(87, '', '&nbsp;目前国内规模最大的保持器生产厂家,现正在进行目前国内规模最大的保持器生产厂家,现正在进行目前国内规模最大的保持器生产厂家,现正在进行目前国内规模最大的保持器生产厂家,现正在进行目前国内规模最大的保持器生产厂家,现正在进行');
/*!40000 ALTER TABLE `mg_c_thumbnews` ENABLE KEYS */;


# Dumping structure for table 004_jdweb.mg_c_use
DROP TABLE IF EXISTS `mg_c_use`;
CREATE TABLE IF NOT EXISTS `mg_c_use` (
  `contentid` mediumint(8) unsigned NOT NULL,
  `template` char(30) NOT NULL,
  `content` mediumtext NOT NULL,
  `pics` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`contentid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# Dumping data for table 004_jdweb.mg_c_use: 2 rows
DELETE FROM `mg_c_use`;
/*!40000 ALTER TABLE `mg_c_use` DISABLE KEYS */;
INSERT INTO `mg_c_use` (`contentid`, `template`, `content`, `pics`) VALUES
	(90, '', '&nbsp;家电产业家电产业家电产业家电产业家电产业家电产业家电产业家电产业家电产业家电产业家电产业家电产业家电产业家电产业家电产业家电产业家电产业家电产业家电产业家电产业家电产业家电产业家电产业家电产业家电产业家电产业家电产业家电产业家电产业家电产业家电产业家电产业家电产业家电产业家电产业家电产业家电产业家电产业家电产业家电产业家电产业家电产业家电产业家电产业家电产业家电产业家电产业家电产业家电产业家电产业家电产业家电产业家电产业家电产业家电产业家电产业家电产业', 1),
	(106, '', '&nbsp;航空产业航空产业航空产业航空产业航空产业航空产业航空产业航空产业航空产业航空产业航空产业航空产业航空产业航空产业航空产业航空产业航空产业航空产业航空产业航空产业航空产业航空产业航空产业航空产业航空产业航空产业航空产业航空产业航空产业', 1);
/*!40000 ALTER TABLE `mg_c_use` ENABLE KEYS */;


# Dumping structure for table 004_jdweb.mg_datasource
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

# Dumping data for table 004_jdweb.mg_datasource: 0 rows
DELETE FROM `mg_datasource`;
/*!40000 ALTER TABLE `mg_datasource` DISABLE KEYS */;
/*!40000 ALTER TABLE `mg_datasource` ENABLE KEYS */;


# Dumping structure for table 004_jdweb.mg_editor_data
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
) ENGINE=MyISAM AUTO_INCREMENT=90 DEFAULT CHARSET=utf8;

# Dumping data for table 004_jdweb.mg_editor_data: 11 rows
DELETE FROM `mg_editor_data`;
/*!40000 ALTER TABLE `mg_editor_data` DISABLE KEYS */;
INSERT INTO `mg_editor_data` (`id`, `userid`, `editorid`, `ip`, `created_time`, `data`) VALUES
	(88, 1, 'copyright', '127.0.0.1', 1334046530, '聊城市金帝集团 &copy; 2012'),
	(89, 1, 'mail_sign', '127.0.0.1', 1334046530, '&nbsp;'),
	(79, 1, 'content', '127.0.0.1', 1334034130, '&nbsp;'),
	(80, 1, 'content', '127.0.0.1', 1334036008, '&nbsp;'),
	(81, 1, 'content', '127.0.0.1', 1334036212, '&nbsp;'),
	(82, 1, 'content', '127.0.0.1', 1334036267, '&nbsp;'),
	(83, 1, 'content', '127.0.0.1', 1334036500, '&nbsp;'),
	(84, 1, 'content', '127.0.0.1', 1334036588, '&nbsp;'),
	(85, 1, 'content', '127.0.0.1', 1334036767, '&nbsp;'),
	(86, 1, 'content', '127.0.0.1', 1334036797, '<div>&nbsp;职位：数据库营销经理 &ndash; 携程旅行网</div><div>主要岗位职责：</div><div>1、 内部数据库营销策划、统筹和项目实施</div><div>2、 电子邮件营销计划执行、监测和效果分析</div><div>3、 新媒体及网络渠道的研究应用</div><div>4、 内部营销资源投放、协调和跨部门协作</div><div>岗位任职要求：</div><div>学历/经验：</div><div>全日制本科以上学历，媒体广告/统计/数学/计算机科学专业优先；</div><div>熟悉市场与媒介分析方法，有4A媒介公司、调研公司、咨询公司工作经验者优先</div><div>两年以上网络营销或电子邮件客户关系维护经验，有成功案例者优先</div><div>基本素质：</div><div>有较强的分析总结能力和数据敏感性，熟悉媒介分析方法和模型，可以完成数据进行分析报告，提出推广建议</div><div>对新媒体和互联网行业有浓厚兴趣和探索精神</div><div>思路清晰、认真细致，主动性强</div><div>其它要求：</div><div>优秀的沟通能力和团队协作意识</div>有相关工作经验者优先&nbsp;'),
	(87, 1, 'content', '127.0.0.1', 1334036892, '&nbsp;');
/*!40000 ALTER TABLE `mg_editor_data` ENABLE KEYS */;


# Dumping structure for table 004_jdweb.mg_formguide
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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

# Dumping data for table 004_jdweb.mg_formguide: 1 rows
DELETE FROM `mg_formguide`;
/*!40000 ALTER TABLE `mg_formguide` DISABLE KEYS */;
INSERT INTO `mg_formguide` (`formid`, `name`, `tablename`, `introduce`, `setting`, `addtime`, `template`, `disabled`) VALUES
	(1, '联系我们', 'contact', '', 'array (\n  \'enabletime\' => \'0\',\n  \'starttime\' => \'\',\n  \'endtime\' => \'\',\n  \'allowsendemail\' => \'0\',\n  \'email\' => \'\',\n)', 1334041701, 'form_index', 1);
/*!40000 ALTER TABLE `mg_formguide` ENABLE KEYS */;


# Dumping structure for table 004_jdweb.mg_formguide_fields
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
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

# Dumping data for table 004_jdweb.mg_formguide_fields: 10 rows
DELETE FROM `mg_formguide_fields`;
/*!40000 ALTER TABLE `mg_formguide_fields` DISABLE KEYS */;
INSERT INTO `mg_formguide_fields` (`fieldid`, `formid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `issystem`, `isbackground`, `isunique`, `issearch`, `isselect`, `islist`, `isshow`, `listorder`, `disabled`) VALUES
	(1, 1, 'title', '标题', '', 'inputclass', 0, 0, '', '', 'text', 'array (\n  \'size\' => \'50\',\n  \'defaultvalue\' => \'\',\n  \'ispassword\' => \'0\',\n)', '', '-99', 0, 0, 0, 0, 0, 0, 0, 0, 1),
	(2, 1, 'content', '内容', '', '', 0, 0, '', '', 'textarea', 'array (\n  \'rows\' => \'10\',\n  \'cols\' => \'60\',\n  \'defaultvalue\' => \'\',\n  \'enablehtml\' => \'0\',\n  \'enablekeylink\' => \'0\',\n)', '', '-99', 0, 0, 0, 0, 0, 0, 0, 0, 1),
	(3, 1, 'companyname', '公司名称', '', '', 0, 0, '', '', 'text', 'array (\n  \'size\' => \'50\',\n  \'defaultvalue\' => \'\',\n  \'ispassword\' => \'0\',\n)', '', '-99', 0, 0, 0, 0, 0, 0, 0, 0, 1),
	(4, 1, 'address', '地址', '', '', 0, 0, '', '', 'text', 'array (\n  \'size\' => \'50\',\n  \'defaultvalue\' => \'\',\n  \'ispassword\' => \'0\',\n)', '', '-99', 0, 0, 0, 0, 0, 0, 0, 0, 1),
	(5, 1, 'code', '邮编', '', 'short', 0, 0, '', '', 'text', 'array (\n  \'size\' => \'50\',\n  \'defaultvalue\' => \'\',\n  \'ispassword\' => \'0\',\n)', '', '-99', 0, 0, 0, 0, 0, 0, 0, 0, 1),
	(6, 1, 'contact', '联系人', '', '', 0, 0, '', '', 'text', 'array (\n  \'size\' => \'50\',\n  \'defaultvalue\' => \'\',\n  \'ispassword\' => \'0\',\n)', '', '-99', 0, 0, 0, 0, 0, 0, 0, 0, 1),
	(7, 1, 'tel', '电话', '', '', 0, 0, '', '', 'text', 'array (\n  \'size\' => \'50\',\n  \'defaultvalue\' => \'\',\n  \'ispassword\' => \'0\',\n)', '', '-99', 0, 0, 0, 0, 0, 0, 0, 0, 1),
	(8, 1, 'mobile', '移动电话', '', '', 0, 0, '', '', 'text', 'array (\n  \'size\' => \'50\',\n  \'defaultvalue\' => \'\',\n  \'ispassword\' => \'0\',\n)', '', '-99', 0, 0, 0, 0, 0, 0, 0, 0, 1),
	(9, 1, 'fax', '传真', '', '', 0, 0, '', '', 'text', 'array (\n  \'size\' => \'50\',\n  \'defaultvalue\' => \'\',\n  \'ispassword\' => \'0\',\n)', '', '-99', 0, 0, 0, 0, 0, 0, 0, 0, 1),
	(10, 1, 'email', '电子邮箱', '', '', 0, 0, '', '', 'text', 'array (\n  \'size\' => \'50\',\n  \'defaultvalue\' => \'\',\n  \'ispassword\' => \'0\',\n)', '', '-99', 0, 0, 0, 0, 0, 0, 0, 0, 1);
/*!40000 ALTER TABLE `mg_formguide_fields` ENABLE KEYS */;


# Dumping structure for table 004_jdweb.mg_form_contact
DROP TABLE IF EXISTS `mg_form_contact`;
CREATE TABLE IF NOT EXISTS `mg_form_contact` (
  `dataid` mediumint(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` mediumint(8) unsigned NOT NULL,
  `datetime` int(10) unsigned NOT NULL,
  `ip` char(15) NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `content` mediumtext NOT NULL,
  `companyname` varchar(255) NOT NULL DEFAULT '',
  `address` varchar(255) NOT NULL DEFAULT '',
  `code` varchar(255) NOT NULL DEFAULT '',
  `contact` varchar(255) NOT NULL DEFAULT '',
  `tel` varchar(255) NOT NULL DEFAULT '',
  `mobile` varchar(255) NOT NULL DEFAULT '',
  `fax` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`dataid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

# Dumping data for table 004_jdweb.mg_form_contact: 1 rows
DELETE FROM `mg_form_contact`;
/*!40000 ALTER TABLE `mg_form_contact` DISABLE KEYS */;
INSERT INTO `mg_form_contact` (`dataid`, `userid`, `datetime`, `ip`, `title`, `content`, `companyname`, `address`, `code`, `contact`, `tel`, `mobile`, `fax`, `email`) VALUES
	(1, 1, 1334043348, '127.0.0.1', '测试留言', '测试留言内容', '测试名称', '地址', '023211', '赵殿有', '15254109156', '15555555555', '0531-55555555', '222222@126.com');
/*!40000 ALTER TABLE `mg_form_contact` ENABLE KEYS */;


# Dumping structure for table 004_jdweb.mg_guestbook
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

# Dumping data for table 004_jdweb.mg_guestbook: 0 rows
DELETE FROM `mg_guestbook`;
/*!40000 ALTER TABLE `mg_guestbook` DISABLE KEYS */;
/*!40000 ALTER TABLE `mg_guestbook` ENABLE KEYS */;


# Dumping structure for table 004_jdweb.mg_hits
DROP TABLE IF EXISTS `mg_hits`;
CREATE TABLE IF NOT EXISTS `mg_hits` (
  `field` char(10) NOT NULL,
  `value` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `date` date NOT NULL DEFAULT '0000-00-00',
  `hits` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`field`,`value`,`date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# Dumping data for table 004_jdweb.mg_hits: 3 rows
DELETE FROM `mg_hits`;
/*!40000 ALTER TABLE `mg_hits` DISABLE KEYS */;
INSERT INTO `mg_hits` (`field`, `value`, `date`, `hits`) VALUES
	('catid', 17, '2012-04-10', 13),
	('catid', 18, '2012-04-10', 2),
	('catid', 31, '2012-04-10', 1);
/*!40000 ALTER TABLE `mg_hits` ENABLE KEYS */;


# Dumping structure for table 004_jdweb.mg_ipbanned
DROP TABLE IF EXISTS `mg_ipbanned`;
CREATE TABLE IF NOT EXISTS `mg_ipbanned` (
  `ip` char(15) NOT NULL,
  `expires` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# Dumping data for table 004_jdweb.mg_ipbanned: 0 rows
DELETE FROM `mg_ipbanned`;
/*!40000 ALTER TABLE `mg_ipbanned` DISABLE KEYS */;
/*!40000 ALTER TABLE `mg_ipbanned` ENABLE KEYS */;


# Dumping structure for table 004_jdweb.mg_keylink
DROP TABLE IF EXISTS `mg_keylink`;
CREATE TABLE IF NOT EXISTS `mg_keylink` (
  `keylinkid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `word` char(40) NOT NULL,
  `url` char(100) NOT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`keylinkid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# Dumping data for table 004_jdweb.mg_keylink: 0 rows
DELETE FROM `mg_keylink`;
/*!40000 ALTER TABLE `mg_keylink` DISABLE KEYS */;
/*!40000 ALTER TABLE `mg_keylink` ENABLE KEYS */;


# Dumping structure for table 004_jdweb.mg_keyword
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

# Dumping data for table 004_jdweb.mg_keyword: 0 rows
DELETE FROM `mg_keyword`;
/*!40000 ALTER TABLE `mg_keyword` DISABLE KEYS */;
/*!40000 ALTER TABLE `mg_keyword` ENABLE KEYS */;


# Dumping structure for table 004_jdweb.mg_link
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
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

# Dumping data for table 004_jdweb.mg_link: 2 rows
DELETE FROM `mg_link`;
/*!40000 ALTER TABLE `mg_link` DISABLE KEYS */;
INSERT INTO `mg_link` (`linkid`, `typeid`, `linktype`, `style`, `name`, `url`, `logo`, `introduce`, `username`, `listorder`, `elite`, `passed`, `addtime`, `hits`) VALUES
	(8, 1, 0, '', '百度', 'http://baidu.com', '', '', '', 0, 1, 1, 1334029453, 0),
	(9, 1, 0, '', '谷歌', 'http://google.com', '', '', '', 0, 1, 1, 1334029471, 0);
/*!40000 ALTER TABLE `mg_link` ENABLE KEYS */;


# Dumping structure for table 004_jdweb.mg_linkage
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

# Dumping data for table 004_jdweb.mg_linkage: 0 rows
DELETE FROM `mg_linkage`;
/*!40000 ALTER TABLE `mg_linkage` DISABLE KEYS */;
/*!40000 ALTER TABLE `mg_linkage` ENABLE KEYS */;


# Dumping structure for table 004_jdweb.mg_log
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
) ENGINE=MyISAM AUTO_INCREMENT=286 DEFAULT CHARSET=utf8;

# Dumping data for table 004_jdweb.mg_log: 55 rows
DELETE FROM `mg_log`;
/*!40000 ALTER TABLE `mg_log` DISABLE KEYS */;
INSERT INTO `mg_log` (`logid`, `field`, `value`, `module`, `file`, `action`, `querystring`, `data`, `userid`, `username`, `ip`, `time`) VALUES
	(231, 'blockid', 64, 'wslm', 'block', 'add', 'mod=wslm&file=block&action=add&ajax=1', 'array (\n  \'pageid\' => \'index_intro\',\n  \'blockno\' => \'1\',\n  \'name\' => \'_首页 - 企业简介\',\n  \'listorder\' => \'1\',\n  \'isarray\' => \'0\',\n  \'rows\' => \'6\',\n)', 1, 'admin', '127.0.0.1', '2012-04-10 09:42:58'),
	(232, 'blockid', 64, 'wslm', 'block', 'update', 'mod=wslm&file=block&action=update&dosubmit=1&ajax=1&blockid=64', 'array (\n  \'data\' => \'聊城市金帝保持器厂成立于1985年,现有员工1500人,主要生产各种轴承保持器架,产品主要面向国内外中高端市场,是目前国内规模最大的保持器生产厂家,现正在进行国际质量体系TS16949的认证工作.  \',\n)', 1, 'admin', '127.0.0.1', '2012-04-10 09:44:11'),
	(233, 'blockid', 64, 'wslm', 'block', 'update', 'mod=wslm&file=block&action=update&dosubmit=1&ajax=1&blockid=64', 'array (\n  \'data\' => \'聊城市金帝保持器厂成立于1985年,现有员工1500人,主要生产各种轴承保持器架,是目前国内规模最大的保持器生产厂家.\',\n)', 1, 'admin', '127.0.0.1', '2012-04-10 09:44:31'),
	(234, 'contentid', 73, 'wslm', 'content', 'edit', 'mod=wslm&file=content&action=edit&contentid=73', '', 1, 'admin', '127.0.0.1', '2012-04-10 09:56:51'),
	(235, 'contentid', 73, 'wslm', 'content', 'edit', 'mod=wslm&file=content&action=edit&contentid=73', '', 1, 'admin', '127.0.0.1', '2012-04-10 10:01:06'),
	(236, 'contentid', 74, 'wslm', 'content', 'add', 'mod=wslm&file=content&action=add&catid=17&modelid=37', '', 1, 'admin', '127.0.0.1', '2012-04-10 10:36:48'),
	(237, 'contentid', 73, 'wslm', 'content', 'edit', 'mod=wslm&file=content&action=edit&contentid=73', '', 1, 'admin', '127.0.0.1', '2012-04-10 11:01:24'),
	(238, 'contentid', 75, 'wslm', 'content', 'add', 'mod=wslm&file=content&action=add&catid=17&modelid=37', '', 1, 'admin', '127.0.0.1', '2012-04-10 11:05:32'),
	(239, 'contentid', 76, 'wslm', 'content', 'add', 'mod=wslm&file=content&action=add&catid=17&modelid=37', '', 1, 'admin', '127.0.0.1', '2012-04-10 11:05:49'),
	(240, 'contentid', 77, 'wslm', 'content', 'add', 'mod=wslm&file=content&action=add&catid=16&modelid=37', '', 1, 'admin', '127.0.0.1', '2012-04-10 11:05:58'),
	(241, 'contentid', 78, 'wslm', 'content', 'add', 'mod=wslm&file=content&action=add&catid=16&modelid=37', '', 1, 'admin', '127.0.0.1', '2012-04-10 11:06:14'),
	(242, 'contentid', 79, 'wslm', 'content', 'add', 'mod=wslm&file=content&action=add&catid=17&modelid=37', '', 1, 'admin', '127.0.0.1', '2012-04-10 11:06:23'),
	(243, 'contentid', 80, 'wslm', 'content', 'add', 'mod=wslm&file=content&action=add&catid=17&modelid=37', '', 1, 'admin', '127.0.0.1', '2012-04-10 11:06:38'),
	(244, 'contentid', 81, 'wslm', 'content', 'add', 'mod=wslm&file=content&action=add&catid=17&modelid=37', '', 1, 'admin', '127.0.0.1', '2012-04-10 11:06:44'),
	(245, 'contentid', 82, 'wslm', 'content', 'add', 'mod=wslm&file=content&action=add&catid=17&modelid=37', '', 1, 'admin', '127.0.0.1', '2012-04-10 11:06:51'),
	(246, 'contentid', 83, 'wslm', 'content', 'add', 'mod=wslm&file=content&action=add&catid=17&modelid=37', '', 1, 'admin', '127.0.0.1', '2012-04-10 11:06:57'),
	(247, 'contentid', 84, 'wslm', 'content', 'add', 'mod=wslm&file=content&action=add&catid=17&modelid=37', '', 1, 'admin', '127.0.0.1', '2012-04-10 11:07:09'),
	(248, 'contentid', 85, 'wslm', 'content', 'add', 'mod=wslm&file=content&action=add&catid=17&modelid=37', '', 1, 'admin', '127.0.0.1', '2012-04-10 11:07:15'),
	(249, 'contentid', 86, 'wslm', 'content', 'add', 'mod=wslm&file=content&action=add&catid=17&modelid=37', '', 1, 'admin', '127.0.0.1', '2012-04-10 11:07:22'),
	(250, 'contentid', 87, 'wslm', 'content', 'add', 'mod=wslm&file=content&action=add&catid=17&modelid=37', '', 1, 'admin', '127.0.0.1', '2012-04-10 11:07:28'),
	(251, 'blockid', 65, 'wslm', 'block', 'add', 'mod=wslm&file=block&action=add&ajax=1', 'array (\n  \'pageid\' => \'sidebar_contact\',\n  \'blockno\' => \'1\',\n  \'name\' => \'_左侧 - 联系方式\',\n  \'listorder\' => \'1\',\n  \'isarray\' => \'0\',\n  \'rows\' => \'6\',\n)', 1, 'admin', '127.0.0.1', '2012-04-10 11:43:13'),
	(252, 'blockid', 65, 'wslm', 'block', 'update', 'mod=wslm&file=block&action=update&dosubmit=1&ajax=1&blockid=65', 'array (\n  \'data\' => \'                <div class="contact">\n                    <table>\n                        <tr>\n                            <th>TEL:</th>\n                            <td>0635-88888888</td>\n                        </tr>\n                        <tr>\n                            <th>EMAIL:</th>\n                            <td>JINDI@qq.com</td>\n                        </tr>\n                    </table>\n                </div>\',\n)', 1, 'admin', '127.0.0.1', '2012-04-10 11:43:18'),
	(253, 'blockid', 66, 'wslm', 'block', 'add', 'mod=wslm&file=block&action=add&ajax=1', 'array (\n  \'pageid\' => \'cat_12\',\n  \'blockno\' => \'1\',\n  \'name\' => \'_关于我们 - 企业概况\',\n  \'listorder\' => \'1\',\n  \'isarray\' => \'0\',\n  \'rows\' => \'6\',\n)', 1, 'admin', '127.0.0.1', '2012-04-10 12:00:25'),
	(254, 'blockid', 66, 'wslm', 'block', 'update', 'mod=wslm&file=block&action=update&dosubmit=1&ajax=1&blockid=66', 'array (\n  \'data\' => \'<div>聊城市金帝集团是目前国内生产规模最大、品质信誉最好的轴承保持器专业生产厂家。位于著名的轴承保持器生产基地&mdash;&mdash;&ldquo;江北水城&rdquo;山东聊城郑家开发区；309国道和京九铁路贯穿境内，济青、京福、京沪高速公路四通八达，物流交通十分便利。&nbsp;</div><div>金帝集团自1985年建厂以来实现了平稳和快速发展，现有职工2000余名，全厂占地面积67980㎡，总资产4000万元。并设有企管中心、经营中心、生产中心、技术中心、财务中心、行政中心，形成六大中心同时互补、协作迅速的360度可靠运作体系。2009年10月份，金帝集团在城区新成立4个集团分公司。&nbsp;</div><div>金帝集团以深沟球低噪音精密浪形保持器为主导产品，同时生产框形、碗形、蝶形及异型非标，其中深沟球波形静音保持器、不锈钢波形保持器、树脂保持器、渗氮保持器以及七类保持器，内径自7㎜&mdash;&mdash;400㎜不同规格的各类型轴承保持器多达2000多种。2009年金帝集团响应国家政策，成功开发环保风电保持器，现已与多家国内外客户签订批量订单。金帝集团生产的保持器以&ldquo;精度高&rdquo;&ldquo;低噪音&rdquo;&ldquo;使用寿命长&rdquo;等显著特点，享誉海内外。现为SKF、PEER、NSK、GMB、NPB等多家国际知名轴承公司生产配套。&nbsp;</div><div>&nbsp;金帝集团配备具有先进水平的高精度微电子检测设备，在引进关键生产设备基础上实现了全自动、半自动的制造方式，并采用国内最先进的轴承保持器制造工艺。金帝集团是国内率先通过ISO9001国际质量体系的轴承保持器厂家，2008年顺利通过ISO/TS16949标准和ISO14001环境管理体系，成为保持器行业中唯一的&ldquo;高新技术企业&rdquo;，2006年所生产的产品被评为&ldquo;山东省名牌&rdquo;荣誉称号。并先后获得&ldquo;轴承保持器工程研究中心&rdquo;&ldquo;技术中心&rdquo;和&ldquo;中国专利山东明星企业&rdquo;荣誉称号。拥有自主知识产权15项专利，我厂长期与洛阳轴承研究所、江南大学表面处理研究中心、中科院兰州材料应用研究所等大专院校和科研院所合作产品及工艺的开发，产品品质深得国内外广大客户的信赖。1998年在同行业中率先把保持器销到国外轴承的生产厂家，并具有中华人民共和国进出口资格证书。&nbsp;</div><div>在跨越发展战略上金帝集团进行了长远规划，注重以人为本、以市场为准绳；全面推行现代企业管理模式，推进&ldquo;金帝&rdquo;品牌的产业化发展，拟新建高标准、现代化的生产厂区，改善工序环境，扩大生产规模，筹建保持器产品技术研究中心和品质检测中心；以立足中国、面向世界，精工制造最好的保持器为己任；力争到2015年在同行业中实现产品质量和销量亚洲第一、2025年达到世界第一的宏伟目标。为世界十大轴承公司及知名品牌的轴承生产企业配套。在国际市场上拼搏并获得更大发展是金帝人共同的愿望和要求。&nbsp;</div><div>&nbsp;诚心欢迎国内外客户前来指导，共同合作、创造辉煌。我们会以高质量的产品和更全面的服务来满足各公司的需求，实现双赢并举、携手共进﹗</div>\',\n)', 1, 'admin', '127.0.0.1', '2012-04-10 12:01:12'),
	(255, 'blockid', 67, 'wslm', 'block', 'add', 'mod=wslm&file=block&action=add&ajax=1', 'array (\n  \'pageid\' => \'cat_11\',\n  \'blockno\' => \'1\',\n  \'name\' => \'_关于我们 - 公司概况\',\n  \'listorder\' => \'1\',\n  \'isarray\' => \'0\',\n  \'rows\' => \'6\',\n)', 1, 'admin', '127.0.0.1', '2012-04-10 12:02:09'),
	(256, 'blockid', 67, 'wslm', 'block', 'update', 'mod=wslm&file=block&action=update&dosubmit=1&ajax=1&blockid=67', 'array (\n  \'data\' => \'<div>聊城市金帝集团是目前国内生产规模最大、品质信誉最好的轴承保持器专业生产厂家。位于著名的轴承保持器生产基地&mdash;&mdash;&ldquo;江北水城&rdquo;山东聊城郑家开发区；309国道和京九铁路贯穿境内，济青、京福、京沪高速公路四通八达，物流交通十分便利。&nbsp;</div><div>&nbsp; &nbsp; &nbsp; &nbsp;金帝集团自1985年建厂以来实现了平稳和快速发展，现有职工2000余名，全厂占地面积67980㎡，总资产4000万元。并设有企管中心、经营中心、生产中心、技术中心、财务中心、行政中心，形成六大中心同时互补、协作迅速的360度可靠运作体系。2009年10月份，金帝集团在城区新成立4个集团分公司。&nbsp;</div><div>&nbsp; &nbsp; &nbsp; 金帝集团以深沟球低噪音精密浪形保持器为主导产品，同时生产框形、碗形、蝶形及异型非标，其中深沟球波形静音保持器、不锈钢波形保持器、树脂保持器、渗氮保持器以及七类保持器，内径自7㎜&mdash;&mdash;400㎜不同规格的各类型轴承保持器多达2000多种。2009年金帝集团响应国家政策，成功开发环保风电保持器，现已与多家国内外客户签订批量订单。金帝集团生产的保持器以&ldquo;精度高&rdquo;&ldquo;低噪音&rdquo;&ldquo;使用寿命长&rdquo;等显著特点，享誉海内外。现为SKF、PEER、NSK、GMB、NPB等多家国际知名轴承公司生产配套。&nbsp;</div><div>&nbsp; &nbsp; &nbsp; &nbsp;金帝集团配备具有先进水平的高精度微电子检测设备，在引进关键生产设备基础上实现了全自动、半自动的制造方式，并采用国内最先进的轴承保持器制造工艺。金帝集团是国内率先通过ISO9001国际质量体系的轴承保持器厂家，2008年顺利通过ISO/TS16949标准和ISO14001环境管理体系，成为保持器行业中唯一的&ldquo;高新技术企业&rdquo;，2006年所生产的产品被评为&ldquo;山东省名牌&rdquo;荣誉称号。并先后获得&ldquo;轴承保持器工程研究中心&rdquo;&ldquo;技术中心&rdquo;和&ldquo;中国专利山东明星企业&rdquo;荣誉称号。拥有自主知识产权15项专利，我厂长期与洛阳轴承研究所、江南大学表面处理研究中心、中科院兰州材料应用研究所等大专院校和科研院所合作产品及工艺的开发，产品品质深得国内外广大客户的信赖。1998年在同行业中率先把保持器销到国外轴承的生产厂家，并具有中华人民共和国进出口资格证书。&nbsp;</div><div>&nbsp; &nbsp; &nbsp; &nbsp;在跨越发展战略上金帝集团进行了长远规划，注重以人为本、以市场为准绳；全面推行现代企业管理模式，推进&ldquo;金帝&rdquo;品牌的产业化发展，拟新建高标准、现代化的生产厂区，改善工序环境，扩大生产规模，筹建保持器产品技术研究中心和品质检测中心；以立足中国、面向世界，精工制造最好的保持器为己任；力争到2015年在同行业中实现产品质量和销量亚洲第一、2025年达到世界第一的宏伟目标。为世界十大轴承公司及知名品牌的轴承生产企业配套。在国际市场上拼搏并获得更大发展是金帝人共同的愿望和要求。&nbsp;</div><div>&nbsp; &nbsp; &nbsp; 诚心欢迎国内外客户前来指导，共同合作、创造辉煌。我们会以高质量的产品和更全面的服务来满足各公司的需求，实现双赢并举、携手共进﹗</div>\',\n)', 1, 'admin', '127.0.0.1', '2012-04-10 12:02:13'),
	(257, 'blockid', 67, 'wslm', 'block', 'update', 'mod=wslm&file=block&action=update&dosubmit=1&ajax=1&blockid=67', 'array (\n  \'data\' => \'<div>聊城市金帝集团是目前国内生产规模最大、品质信誉最好的轴承保持器专业生产厂家。位于著名的轴承保持器生产基地&mdash;&mdash;&ldquo;江北水城&rdquo;山东聊城郑家开发区；309国道和京九铁路贯穿境内，济青、京福、京沪高速公路四通八达，物流交通十分便利。&nbsp;</div>\n<div>金帝集团自1985年建厂以来实现了平稳和快速发展，现有职工2000余名，全厂占地面积67980㎡，总资产4000万元。并设有企管中心、经营中心、生产中心、技术中心、财务中心、行政中心，形成六大中心同时互补、协作迅速的360度可靠运作体系。2009年10月份，金帝集团在城区新成立4个集团分公司。&nbsp;</div>\n<div>金帝集团以深沟球低噪音精密浪形保持器为主导产品，同时生产框形、碗形、蝶形及异型非标，其中深沟球波形静音保持器、不锈钢波形保持器、树脂保持器、渗氮保持器以及七类保持器，内径自7㎜&mdash;&mdash;400㎜不同规格的各类型轴承保持器多达2000多种。2009年金帝集团响应国家政策，成功开发环保风电保持器，现已与多家国内外客户签订批量订单。金帝集团生产的保持器以&ldquo;精度高&rdquo;&ldquo;低噪音&rdquo;&ldquo;使用寿命长&rdquo;等显著特点，享誉海内外。现为SKF、PEER、NSK、GMB、NPB等多家国际知名轴承公司生产配套。&nbsp;</div>\n<div>金帝集团配备具有先进水平的高精度微电子检测设备，在引进关键生产设备基础上实现了全自动、半自动的制造方式，并采用国内最先进的轴承保持器制造工艺。金帝集团是国内率先通过ISO9001国际质量体系的轴承保持器厂家，2008年顺利通过ISO/TS16949标准和ISO14001环境管理体系，成为保持器行业中唯一的&ldquo;高新技术企业&rdquo;，2006年所生产的产品被评为&ldquo;山东省名牌&rdquo;荣誉称号。并先后获得&ldquo;轴承保持器工程研究中心&rdquo;&ldquo;技术中心&rdquo;和&ldquo;中国专利山东明星企业&rdquo;荣誉称号。拥有自主知识产权15项专利，我厂长期与洛阳轴承研究所、江南大学表面处理研究中心、中科院兰州材料应用研究所等大专院校和科研院所合作产品及工艺的开发，产品品质深得国内外广大客户的信赖。1998年在同行业中率先把保持器销到国外轴承的生产厂家，并具有中华人民共和国进出口资格证书。&nbsp;</div>\n<div>&nbsp;在跨越发展战略上金帝集团进行了长远规划，注重以人为本、以市场为准绳；全面推行现代企业管理模式，推进&ldquo;金帝&rdquo;品牌的产业化发展，拟新建高标准、现代化的生产厂区，改善工序环境，扩大生产规模，筹建保持器产品技术研究中心和品质检测中心；以立足中国、面向世界，精工制造最好的保持器为己任；力争到2015年在同行业中实现产品质量和销量亚洲第一、2025年达到世界第一的宏伟目标。为世界十大轴承公司及知名品牌的轴承生产企业配套。在国际市场上拼搏并获得更大发展是金帝人共同的愿望和要求。&nbsp;</div>\n<div>诚心欢迎国内外客户前来指导，共同合作、创造辉煌。我们会以高质量的产品和更全面的服务来满足各公司的需求，实现双赢并举、携手共进﹗</div>\',\n)', 1, 'admin', '127.0.0.1', '2012-04-10 12:02:28'),
	(258, 'blockid', 68, 'wslm', 'block', 'add', 'mod=wslm&file=block&action=add&ajax=1', 'array (\n  \'pageid\' => \'cat_13\',\n  \'blockno\' => \'1\',\n  \'name\' => \'_关于我们 - 企业文化\',\n  \'listorder\' => \'1\',\n  \'isarray\' => \'0\',\n  \'rows\' => \'6\',\n)', 1, 'admin', '127.0.0.1', '2012-04-10 12:02:47'),
	(259, 'blockid', 68, 'wslm', 'block', 'update', 'mod=wslm&file=block&action=update&dosubmit=1&ajax=1&blockid=68', 'array (\n  \'data\' => \'<div>聊城市金帝集团是目前国内生产规模最大、品质信誉最好的轴承保持器专业生产厂家。位于著名的轴承保持器生产基地&mdash;&mdash;&ldquo;江北水城&rdquo;山东聊城郑家开发区；309国道和京九铁路贯穿境内，济青、京福、京沪高速公路四通八达，物流交通十分便利。&nbsp;</div>\n<div>金帝集团自1985年建厂以来实现了平稳和快速发展，现有职工2000余名，全厂占地面积67980㎡，总资产4000万元。并设有企管中心、经营中心、生产中心、技术中心、财务中心、行政中心，形成六大中心同时互补、协作迅速的360度可靠运作体系。2009年10月份，金帝集团在城区新成立4个集团分公司。&nbsp;</div>\n<div>金帝集团以深沟球低噪音精密浪形保持器为主导产品，同时生产框形、碗形、蝶形及异型非标，其中深沟球波形静音保持器、不锈钢波形保持器、树脂保持器、渗氮保持器以及七类保持器，内径自7㎜&mdash;&mdash;400㎜不同规格的各类型轴承保持器多达2000多种。2009年金帝集团响应国家政策，成功开发环保风电保持器，现已与多家国内外客户签订批量订单。金帝集团生产的保持器以&ldquo;精度高&rdquo;&ldquo;低噪音&rdquo;&ldquo;使用寿命长&rdquo;等显著特点，享誉海内外。现为SKF、PEER、NSK、GMB、NPB等多家国际知名轴承公司生产配套。&nbsp;</div>\n<div>金帝集团配备具有先进水平的高精度微电子检测设备，在引进关键生产设备基础上实现了全自动、半自动的制造方式，并采用国内最先进的轴承保持器制造工艺。金帝集团是国内率先通过ISO9001国际质量体系的轴承保持器厂家，2008年顺利通过ISO/TS16949标准和ISO14001环境管理体系，成为保持器行业中唯一的&ldquo;高新技术企业&rdquo;，2006年所生产的产品被评为&ldquo;山东省名牌&rdquo;荣誉称号。并先后获得&ldquo;轴承保持器工程研究中心&rdquo;&ldquo;技术中心&rdquo;和&ldquo;中国专利山东明星企业&rdquo;荣誉称号。拥有自主知识产权15项专利，我厂长期与洛阳轴承研究所、江南大学表面处理研究中心、中科院兰州材料应用研究所等大专院校和科研院所合作产品及工艺的开发，产品品质深得国内外广大客户的信赖。1998年在同行业中率先把保持器销到国外轴承的生产厂家，并具有中华人民共和国进出口资格证书。&nbsp;</div>\n<div>&nbsp;在跨越发展战略上金帝集团进行了长远规划，注重以人为本、以市场为准绳；全面推行现代企业管理模式，推进&ldquo;金帝&rdquo;品牌的产业化发展，拟新建高标准、现代化的生产厂区，改善工序环境，扩大生产规模，筹建保持器产品技术研究中心和品质检测中心；以立足中国、面向世界，精工制造最好的保持器为己任；力争到2015年在同行业中实现产品质量和销量亚洲第一、2025年达到世界第一的宏伟目标。为世界十大轴承公司及知名品牌的轴承生产企业配套。在国际市场上拼搏并获得更大发展是金帝人共同的愿望和要求。&nbsp;</div>\n<div>诚心欢迎国内外客户前来指导，共同合作、创造辉煌。我们会以高质量的产品和更全面的服务来满足各公司的需求，实现双赢并举、携手共进﹗</div>\',\n)', 1, 'admin', '127.0.0.1', '2012-04-10 12:02:51'),
	(260, 'blockid', 69, 'wslm', 'block', 'add', 'mod=wslm&file=block&action=add&ajax=1', 'array (\n  \'pageid\' => \'cat_14\',\n  \'blockno\' => \'1\',\n  \'name\' => \'_关于我们 - 组织架构\',\n  \'listorder\' => \'1\',\n  \'isarray\' => \'0\',\n  \'rows\' => \'6\',\n)', 1, 'admin', '127.0.0.1', '2012-04-10 12:03:07'),
	(261, 'blockid', 69, 'wslm', 'block', 'update', 'mod=wslm&file=block&action=update&dosubmit=1&ajax=1&blockid=69', 'array (\n  \'data\' => \'<div>聊城市金帝集团是目前国内生产规模最大、品质信誉最好的轴承保持器专业生产厂家。位于著名的轴承保持器生产基地&mdash;&mdash;&ldquo;江北水城&rdquo;山东聊城郑家开发区；309国道和京九铁路贯穿境内，济青、京福、京沪高速公路四通八达，物流交通十分便利。&nbsp;</div>\n<div>金帝集团自1985年建厂以来实现了平稳和快速发展，现有职工2000余名，全厂占地面积67980㎡，总资产4000万元。并设有企管中心、经营中心、生产中心、技术中心、财务中心、行政中心，形成六大中心同时互补、协作迅速的360度可靠运作体系。2009年10月份，金帝集团在城区新成立4个集团分公司。&nbsp;</div>\n<div>金帝集团以深沟球低噪音精密浪形保持器为主导产品，同时生产框形、碗形、蝶形及异型非标，其中深沟球波形静音保持器、不锈钢波形保持器、树脂保持器、渗氮保持器以及七类保持器，内径自7㎜&mdash;&mdash;400㎜不同规格的各类型轴承保持器多达2000多种。2009年金帝集团响应国家政策，成功开发环保风电保持器，现已与多家国内外客户签订批量订单。金帝集团生产的保持器以&ldquo;精度高&rdquo;&ldquo;低噪音&rdquo;&ldquo;使用寿命长&rdquo;等显著特点，享誉海内外。现为SKF、PEER、NSK、GMB、NPB等多家国际知名轴承公司生产配套。&nbsp;</div>\n<div>金帝集团配备具有先进水平的高精度微电子检测设备，在引进关键生产设备基础上实现了全自动、半自动的制造方式，并采用国内最先进的轴承保持器制造工艺。金帝集团是国内率先通过ISO9001国际质量体系的轴承保持器厂家，2008年顺利通过ISO/TS16949标准和ISO14001环境管理体系，成为保持器行业中唯一的&ldquo;高新技术企业&rdquo;，2006年所生产的产品被评为&ldquo;山东省名牌&rdquo;荣誉称号。并先后获得&ldquo;轴承保持器工程研究中心&rdquo;&ldquo;技术中心&rdquo;和&ldquo;中国专利山东明星企业&rdquo;荣誉称号。拥有自主知识产权15项专利，我厂长期与洛阳轴承研究所、江南大学表面处理研究中心、中科院兰州材料应用研究所等大专院校和科研院所合作产品及工艺的开发，产品品质深得国内外广大客户的信赖。1998年在同行业中率先把保持器销到国外轴承的生产厂家，并具有中华人民共和国进出口资格证书。&nbsp;</div>\n<div>&nbsp;在跨越发展战略上金帝集团进行了长远规划，注重以人为本、以市场为准绳；全面推行现代企业管理模式，推进&ldquo;金帝&rdquo;品牌的产业化发展，拟新建高标准、现代化的生产厂区，改善工序环境，扩大生产规模，筹建保持器产品技术研究中心和品质检测中心；以立足中国、面向世界，精工制造最好的保持器为己任；力争到2015年在同行业中实现产品质量和销量亚洲第一、2025年达到世界第一的宏伟目标。为世界十大轴承公司及知名品牌的轴承生产企业配套。在国际市场上拼搏并获得更大发展是金帝人共同的愿望和要求。&nbsp;</div>\n<div>诚心欢迎国内外客户前来指导，共同合作、创造辉煌。我们会以高质量的产品和更全面的服务来满足各公司的需求，实现双赢并举、携手共进﹗</div>\',\n)', 1, 'admin', '127.0.0.1', '2012-04-10 12:03:09'),
	(262, 'blockid', 70, 'wslm', 'block', 'add', 'mod=wslm&file=block&action=add&ajax=1', 'array (\n  \'pageid\' => \'cat_15\',\n  \'blockno\' => \'1\',\n  \'name\' => \'_关于我们 - 企业荣誉\',\n  \'listorder\' => \'1\',\n  \'isarray\' => \'0\',\n  \'rows\' => \'6\',\n)', 1, 'admin', '127.0.0.1', '2012-04-10 12:03:27'),
	(263, 'blockid', 70, 'wslm', 'block', 'update', 'mod=wslm&file=block&action=update&dosubmit=1&ajax=1&blockid=70', 'array (\n  \'data\' => \'<div>聊城市金帝集团是目前国内生产规模最大、品质信誉最好的轴承保持器专业生产厂家。位于著名的轴承保持器生产基地&mdash;&mdash;&ldquo;江北水城&rdquo;山东聊城郑家开发区；309国道和京九铁路贯穿境内，济青、京福、京沪高速公路四通八达，物流交通十分便利。&nbsp;</div>\n<div>金帝集团自1985年建厂以来实现了平稳和快速发展，现有职工2000余名，全厂占地面积67980㎡，总资产4000万元。并设有企管中心、经营中心、生产中心、技术中心、财务中心、行政中心，形成六大中心同时互补、协作迅速的360度可靠运作体系。2009年10月份，金帝集团在城区新成立4个集团分公司。&nbsp;</div>\n<div>金帝集团以深沟球低噪音精密浪形保持器为主导产品，同时生产框形、碗形、蝶形及异型非标，其中深沟球波形静音保持器、不锈钢波形保持器、树脂保持器、渗氮保持器以及七类保持器，内径自7㎜&mdash;&mdash;400㎜不同规格的各类型轴承保持器多达2000多种。2009年金帝集团响应国家政策，成功开发环保风电保持器，现已与多家国内外客户签订批量订单。金帝集团生产的保持器以&ldquo;精度高&rdquo;&ldquo;低噪音&rdquo;&ldquo;使用寿命长&rdquo;等显著特点，享誉海内外。现为SKF、PEER、NSK、GMB、NPB等多家国际知名轴承公司生产配套。&nbsp;</div>\n<div>金帝集团配备具有先进水平的高精度微电子检测设备，在引进关键生产设备基础上实现了全自动、半自动的制造方式，并采用国内最先进的轴承保持器制造工艺。金帝集团是国内率先通过ISO9001国际质量体系的轴承保持器厂家，2008年顺利通过ISO/TS16949标准和ISO14001环境管理体系，成为保持器行业中唯一的&ldquo;高新技术企业&rdquo;，2006年所生产的产品被评为&ldquo;山东省名牌&rdquo;荣誉称号。并先后获得&ldquo;轴承保持器工程研究中心&rdquo;&ldquo;技术中心&rdquo;和&ldquo;中国专利山东明星企业&rdquo;荣誉称号。拥有自主知识产权15项专利，我厂长期与洛阳轴承研究所、江南大学表面处理研究中心、中科院兰州材料应用研究所等大专院校和科研院所合作产品及工艺的开发，产品品质深得国内外广大客户的信赖。1998年在同行业中率先把保持器销到国外轴承的生产厂家，并具有中华人民共和国进出口资格证书。&nbsp;</div>\n<div>&nbsp;在跨越发展战略上金帝集团进行了长远规划，注重以人为本、以市场为准绳；全面推行现代企业管理模式，推进&ldquo;金帝&rdquo;品牌的产业化发展，拟新建高标准、现代化的生产厂区，改善工序环境，扩大生产规模，筹建保持器产品技术研究中心和品质检测中心；以立足中国、面向世界，精工制造最好的保持器为己任；力争到2015年在同行业中实现产品质量和销量亚洲第一、2025年达到世界第一的宏伟目标。为世界十大轴承公司及知名品牌的轴承生产企业配套。在国际市场上拼搏并获得更大发展是金帝人共同的愿望和要求。&nbsp;</div>\n<div>诚心欢迎国内外客户前来指导，共同合作、创造辉煌。我们会以高质量的产品和更全面的服务来满足各公司的需求，实现双赢并举、携手共进﹗</div>\',\n)', 1, 'admin', '127.0.0.1', '2012-04-10 12:03:29'),
	(264, 'contentid', 88, 'wslm', 'content', 'add', 'mod=wslm&file=content&action=add&catid=18&modelid=38', '', 1, 'admin', '127.0.0.1', '2012-04-10 12:20:28'),
	(265, 'contentid', 89, 'wslm', 'content', 'add', 'mod=wslm&file=content&action=add&catid=18&modelid=38', '', 1, 'admin', '127.0.0.1', '2012-04-10 12:20:48'),
	(266, 'contentid', 90, 'wslm', 'content', 'add', 'mod=wslm&file=content&action=add&catid=24&modelid=40', '', 1, 'admin', '127.0.0.1', '2012-04-10 13:07:23'),
	(267, 'contentid', 91, 'wslm', 'content', 'add', 'mod=wslm&file=content&action=add&catid=5&modelid=35', '', 1, 'admin', '127.0.0.1', '2012-04-10 13:36:19'),
	(268, 'contentid', 92, 'wslm', 'content', 'add', 'mod=wslm&file=content&action=add&catid=5&modelid=35', '', 1, 'admin', '127.0.0.1', '2012-04-10 13:37:15'),
	(269, 'contentid', 93, 'wslm', 'content', 'add', 'mod=wslm&file=content&action=add&catid=7&modelid=42', '', 1, 'admin', '127.0.0.1', '2012-04-10 13:42:17'),
	(270, 'contentid', 94, 'wslm', 'content', 'add', 'mod=wslm&file=content&action=add&catid=7&modelid=42', '', 1, 'admin', '127.0.0.1', '2012-04-10 13:43:25'),
	(271, 'contentid', 95, 'wslm', 'content', 'add', 'mod=wslm&file=content&action=add&catid=8&modelid=36', '', 1, 'admin', '127.0.0.1', '2012-04-10 13:46:39'),
	(272, 'contentid', 96, 'wslm', 'content', 'add', 'mod=wslm&file=content&action=add&catid=8&modelid=36', '', 1, 'admin', '127.0.0.1', '2012-04-10 13:47:09'),
	(273, 'contentid', 97, 'wslm', 'content', 'add', 'mod=wslm&file=content&action=add&catid=8&modelid=36', '', 1, 'admin', '127.0.0.1', '2012-04-10 13:47:26'),
	(274, 'contentid', 98, 'wslm', 'content', 'add', 'mod=wslm&file=content&action=add&catid=8&modelid=36', '', 1, 'admin', '127.0.0.1', '2012-04-10 13:47:40'),
	(275, 'contentid', 99, 'wslm', 'content', 'add', 'mod=wslm&file=content&action=add&catid=6&modelid=39', '', 1, 'admin', '127.0.0.1', '2012-04-10 13:57:04'),
	(276, 'contentid', 100, 'wslm', 'content', 'add', 'mod=wslm&file=content&action=add&catid=6&modelid=39', '', 1, 'admin', '127.0.0.1', '2012-04-10 13:57:25'),
	(277, 'contentid', 101, 'wslm', 'content', 'add', 'mod=wslm&file=content&action=add&catid=6&modelid=39', '', 1, 'admin', '127.0.0.1', '2012-04-10 13:57:52'),
	(278, 'contentid', 102, 'wslm', 'content', 'add', 'mod=wslm&file=content&action=add&catid=6&modelid=39', '', 1, 'admin', '127.0.0.1', '2012-04-10 14:12:29'),
	(279, 'contentid', 103, 'wslm', 'content', 'add', 'mod=wslm&file=content&action=add&catid=30&modelid=34', '', 1, 'admin', '127.0.0.1', '2012-04-10 14:48:08'),
	(280, 'contentid', 103, 'wslm', 'category', 'delete', 'mod=wslm&file=category&action=delete&catid=30', '', 1, 'admin', '127.0.0.1', '2012-04-10 14:56:35'),
	(281, 'contentid', 104, 'wslm', 'content', 'add', 'mod=wslm&file=content&action=add&catid=31&modelid=34', '', 1, 'admin', '127.0.0.1', '2012-04-10 14:58:36'),
	(282, 'contentid', 105, 'wslm', 'content', 'add', 'mod=wslm&file=content&action=add&catid=31&modelid=34', '', 1, 'admin', '127.0.0.1', '2012-04-10 15:00:45'),
	(283, 'blockid', 71, 'wslm', 'block', 'add', 'mod=wslm&file=block&action=add&ajax=1', 'array (\n  \'pageid\' => \'contact_tel\',\n  \'blockno\' => \'1\',\n  \'name\' => \'_联系我们\',\n  \'listorder\' => \'1\',\n  \'isarray\' => \'0\',\n  \'rows\' => \'6\',\n)', 1, 'admin', '127.0.0.1', '2012-04-10 15:07:30'),
	(284, 'blockid', 71, 'wslm', 'block', 'update', 'mod=wslm&file=block&action=update&dosubmit=1&ajax=1&blockid=71', 'array (\n  \'data\' => \'0635-88888888\',\n)', 1, 'admin', '127.0.0.1', '2012-04-10 15:07:40'),
	(285, 'contentid', 106, 'wslm', 'content', 'add', 'mod=wslm&file=content&action=add&catid=28&modelid=40', '', 1, 'admin', '127.0.0.1', '2012-04-10 15:32:24');
/*!40000 ALTER TABLE `mg_log` ENABLE KEYS */;


# Dumping structure for table 004_jdweb.mg_member
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

# Dumping data for table 004_jdweb.mg_member: 1 rows
DELETE FROM `mg_member`;
/*!40000 ALTER TABLE `mg_member` DISABLE KEYS */;
INSERT INTO `mg_member` (`userid`, `username`, `password`, `touserid`, `email`, `groupid`, `areaid`, `amount`, `point`, `modelid`, `message`, `disabled`) VALUES
	(1, 'admin', '5dfd8829b73474a9c851dee3787b5fb0', 0, 'zkz15@yahoo.com.cn', 1, 0, 0.00, 0, 10, 0, 0);
/*!40000 ALTER TABLE `mg_member` ENABLE KEYS */;


# Dumping structure for table 004_jdweb.mg_member_cache
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

# Dumping data for table 004_jdweb.mg_member_cache: 1 rows
DELETE FROM `mg_member_cache`;
/*!40000 ALTER TABLE `mg_member_cache` DISABLE KEYS */;
INSERT INTO `mg_member_cache` (`userid`, `username`, `password`, `touserid`, `email`, `groupid`, `areaid`, `amount`, `point`, `modelid`, `message`, `disabled`) VALUES
	(1, 'admin', '5dfd8829b73474a9c851dee3787b5fb0', 0, 'zkz15@yahoo.com.cn', 1, 0, 0.00, 0, 10, 0, 0);
/*!40000 ALTER TABLE `mg_member_cache` ENABLE KEYS */;


# Dumping structure for table 004_jdweb.mg_member_company
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

# Dumping data for table 004_jdweb.mg_member_company: 0 rows
DELETE FROM `mg_member_company`;
/*!40000 ALTER TABLE `mg_member_company` DISABLE KEYS */;
/*!40000 ALTER TABLE `mg_member_company` ENABLE KEYS */;


# Dumping structure for table 004_jdweb.mg_member_detail
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

# Dumping data for table 004_jdweb.mg_member_detail: 1 rows
DELETE FROM `mg_member_detail`;
/*!40000 ALTER TABLE `mg_member_detail` DISABLE KEYS */;
INSERT INTO `mg_member_detail` (`userid`, `truename`, `gender`, `msn`, `telephone`, `address`, `qq`, `birthday`, `postcode`, `mobile`) VALUES
	(1, '', 2, '', '', '', '', '0000-00-00 00:00:00', '', '');
/*!40000 ALTER TABLE `mg_member_detail` ENABLE KEYS */;


# Dumping structure for table 004_jdweb.mg_member_group
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

# Dumping data for table 004_jdweb.mg_member_group: 6 rows
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


# Dumping structure for table 004_jdweb.mg_member_group_extend
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

# Dumping data for table 004_jdweb.mg_member_group_extend: 0 rows
DELETE FROM `mg_member_group_extend`;
/*!40000 ALTER TABLE `mg_member_group_extend` DISABLE KEYS */;
/*!40000 ALTER TABLE `mg_member_group_extend` ENABLE KEYS */;


# Dumping structure for table 004_jdweb.mg_member_group_priv
DROP TABLE IF EXISTS `mg_member_group_priv`;
CREATE TABLE IF NOT EXISTS `mg_member_group_priv` (
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `field` char(15) NOT NULL,
  `value` char(15) NOT NULL,
  `priv` char(15) NOT NULL,
  PRIMARY KEY (`groupid`,`field`,`value`,`priv`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# Dumping data for table 004_jdweb.mg_member_group_priv: 817 rows
DELETE FROM `mg_member_group_priv`;
/*!40000 ALTER TABLE `mg_member_group_priv` DISABLE KEYS */;
INSERT INTO `mg_member_group_priv` (`groupid`, `field`, `value`, `priv`) VALUES
	(0, 'catid', '3', ''),
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
	(0, 'catid', '8', ''),
	(0, 'catid', '80', ''),
	(0, 'catid', '81', ''),
	(0, 'catid', '82', ''),
	(1, 'catid', '3', 'browse'),
	(1, 'catid', '3', 'input'),
	(1, 'catid', '3', 'view'),
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
	(1, 'catid', '8', 'browse'),
	(1, 'catid', '8', 'input'),
	(1, 'catid', '8', 'view'),
	(1, 'catid', '80', 'browse'),
	(1, 'catid', '80', 'input'),
	(1, 'catid', '80', 'view'),
	(1, 'catid', '81', 'browse'),
	(1, 'catid', '81', 'input'),
	(1, 'catid', '81', 'view'),
	(1, 'catid', '82', 'browse'),
	(1, 'catid', '82', 'input'),
	(1, 'catid', '82', 'view'),
	(2, 'catid', '3', 'browse'),
	(2, 'catid', '3', 'input'),
	(2, 'catid', '3', 'view'),
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
	(2, 'catid', '8', 'browse'),
	(2, 'catid', '8', 'input'),
	(2, 'catid', '8', 'view'),
	(2, 'catid', '80', 'browse'),
	(2, 'catid', '80', 'input'),
	(2, 'catid', '80', 'view'),
	(2, 'catid', '81', 'browse'),
	(2, 'catid', '81', 'input'),
	(2, 'catid', '81', 'view'),
	(2, 'catid', '82', 'browse'),
	(2, 'catid', '82', 'input'),
	(2, 'catid', '82', 'view'),
	(3, 'catid', '3', 'browse'),
	(3, 'catid', '3', 'input'),
	(3, 'catid', '3', 'view'),
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
	(3, 'catid', '8', 'browse'),
	(3, 'catid', '8', 'input'),
	(3, 'catid', '8', 'view'),
	(3, 'catid', '80', 'browse'),
	(3, 'catid', '80', 'input'),
	(3, 'catid', '80', 'view'),
	(3, 'catid', '81', 'browse'),
	(3, 'catid', '81', 'input'),
	(3, 'catid', '81', 'view'),
	(3, 'catid', '82', 'browse'),
	(3, 'catid', '82', 'input'),
	(3, 'catid', '82', 'view'),
	(4, 'catid', '3', 'browse'),
	(4, 'catid', '3', 'input'),
	(4, 'catid', '3', 'view'),
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
	(4, 'catid', '8', 'browse'),
	(4, 'catid', '8', 'input'),
	(4, 'catid', '8', 'view'),
	(4, 'catid', '80', 'browse'),
	(4, 'catid', '80', 'input'),
	(4, 'catid', '80', 'view'),
	(4, 'catid', '81', 'browse'),
	(4, 'catid', '81', 'input'),
	(4, 'catid', '81', 'view'),
	(4, 'catid', '82', 'browse'),
	(4, 'catid', '82', 'input'),
	(4, 'catid', '82', 'view'),
	(5, 'catid', '3', 'browse'),
	(5, 'catid', '3', 'input'),
	(5, 'catid', '3', 'view'),
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
	(5, 'catid', '8', 'browse'),
	(5, 'catid', '8', 'input'),
	(5, 'catid', '8', 'view'),
	(5, 'catid', '80', 'browse'),
	(5, 'catid', '80', 'input'),
	(5, 'catid', '80', 'view'),
	(5, 'catid', '81', 'browse'),
	(5, 'catid', '81', 'input'),
	(5, 'catid', '81', 'view'),
	(5, 'catid', '82', 'browse'),
	(5, 'catid', '82', 'input'),
	(5, 'catid', '82', 'view'),
	(6, 'catid', '3', 'browse'),
	(6, 'catid', '3', 'input'),
	(6, 'catid', '3', 'view'),
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
	(6, 'catid', '8', 'browse'),
	(6, 'catid', '8', 'input'),
	(6, 'catid', '8', 'view'),
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


# Dumping structure for table 004_jdweb.mg_member_info
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

# Dumping data for table 004_jdweb.mg_member_info: 1 rows
DELETE FROM `mg_member_info`;
/*!40000 ALTER TABLE `mg_member_info` DISABLE KEYS */;
INSERT INTO `mg_member_info` (`userid`, `question`, `answer`, `avatar`, `regip`, `regtime`, `lastloginip`, `lastlogintime`, `logintimes`, `note`) VALUES
	(1, '', '', 0, '127.0.0.1', 1332600903, '127.0.0.1', 1334047994, 25, '');
/*!40000 ALTER TABLE `mg_member_info` ENABLE KEYS */;


# Dumping structure for table 004_jdweb.mg_menu
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
) ENGINE=MyISAM AUTO_INCREMENT=1047 DEFAULT CHARSET=utf8;

# Dumping data for table 004_jdweb.mg_menu: 254 rows
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
	(102, 100, '修改密码', '', 'member/editpwd.php', '', 'right', '', '', '', '', 0, 0, 0, 0, ''),
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
	(1018, 300, '产品中心', '', '', '', 'right', '', '', '', '', 1, 0, 0, 0, 'catid_3'),
	(1017, 300, '新闻中心', '', '', '', 'right', '', '', '', '', 1, 0, 0, 0, 'catid_2'),
	(1010, 998, '添加订阅类别', '', '?mod=mail&file=type&action=add', '', 'right', '', '', '', '', 0, 0, 7, 0, ''),
	(1009, 998, '权限设置', '', '?mod=mail&file=priv', '', 'right', '', '', '', '', 0, 0, 12, 0, ''),
	(1008, 998, '模块配置', '', '?mod=mail&file=setting', '', 'right', '', '', '', '', 0, 0, 11, 0, ''),
	(1007, 998, '邮件配置', '', '?mod=wslm&file=setting&tab=5', '', 'right', '', '', '', '', 0, 0, 10, 0, ''),
	(1006, 998, '获取邮箱列表', '', '?mod=mail&file=importmail&action=choice', '', 'right', '', '', '', '', 0, 0, 9, 0, ''),
	(1005, 998, '管理邮件列表', '', '?mod=mail&file=maillist&action=list', '', 'right', '', '', '', '', 0, 0, 8, 0, ''),
	(1004, 998, '发送邮件', '', '?mod=mail&file=send', '', 'right', '', '', '', '', 0, 0, 1, 0, ''),
	(1003, 998, '管理订阅分类', '', '?mod=mail&file=type', '', 'right', '', '', '', '', 0, 0, 6, 0, ''),
	(1002, 998, '管理订阅邮箱', '', '?mod=mail&file=email&action=list', '', 'right', '', '', '', '', 0, 0, 2, 0, ''),
	(1001, 998, '管理期刊', '', '?mod=mail&file=subscription&action=list', '', 'right', '', '', '', '', 0, 0, 5, 0, ''),
	(1000, 998, '添加期刊', '', '?mod=mail&file=subscription&action=add', '', 'right', '', '', '', '', 0, 0, 4, 0, ''),
	(999, 998, '群发期刊', '', '?mod=mail&file=subscription&action=send', '', 'right', '', '', '', '', 0, 0, 3, 0, ''),
	(1016, 300, '关于我们', '', '', '', 'right', '', '', '', '', 1, 0, 0, 0, 'catid_1'),
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
	(808, 5, '表单向导', '', '', '', '_self', '', '', '', '', 1, 0, 0, 0, 'formguide'),
	(809, 808, '添加表单', '', '?mod=formguide&file=manage&action=add', '', 'right', '', '', '', '', 0, 0, 0, 0, 'formguide'),
	(810, 808, '管理表单', '', '?mod=formguide&file=manage&action=manage', '', 'right', '', '', '', '', 0, 0, 0, 0, 'formguide'),
	(811, 808, '模块设置', '', '?mod=formguide&file=setting', '', 'right', '', '', '', '', 0, 0, 0, 0, 'formguide'),
	(812, 808, '权限设置', '', '?mod=formguide&file=priv', '', 'right', '', '', '', '', 0, 0, 0, 0, 'formguide'),
	(813, 7, '表单向导', '', '', '', '_self', '', '', '', '', 1, 0, 0, 0, 'formguide'),
	(814, 813, '新建模板', '', '?mod=wslm&file=template&action=add&module=formguide', '', 'right', '', '', '', '', 0, 0, 0, 0, 'formguide'),
	(815, 813, '管理模板', '', '?mod=wslm&file=template&action=manage&module=formguide', '', 'right', '', '', '', '', 0, 0, 0, 0, 'formguide'),
	(816, 40, '我的简历', '', 'yp/apply.php', '', '_self', '', '', '', '', 0, 0, 0, 0, ''),
	(1037, 300, '在线留言', '', '?mod=wslm&file=content&action=manage&catid=22', '', 'right', '', '', '', '', 0, 0, 0, 0, 'catid_22'),
	(1026, 1016, '公司概况', '', '?mod=wslm&file=content&action=manage&catid=11', '', 'right', '', '', '', '', 0, 0, 0, 0, 'catid_11'),
	(1027, 1016, '企业概况', '', '?mod=wslm&file=content&action=manage&catid=12', '', 'right', '', '', '', '', 0, 0, 0, 0, 'catid_12'),
	(1028, 1016, '企业文化', '', '?mod=wslm&file=content&action=manage&catid=13', '', 'right', '', '', '', '', 0, 0, 0, 0, 'catid_13'),
	(1029, 1016, '组织架构', '', '?mod=wslm&file=content&action=manage&catid=14', '', 'right', '', '', '', '', 0, 0, 0, 0, 'catid_14'),
	(1030, 1016, '企业荣誉', '', '?mod=wslm&file=content&action=manage&catid=15', '', 'right', '', '', '', '', 0, 0, 0, 0, 'catid_15'),
	(1031, 1017, '公司动态', '', '?mod=wslm&file=content&action=manage&catid=16', '', 'right', '', '', '', '', 0, 0, 0, 0, 'catid_16'),
	(1032, 1017, '行业资讯', '', '?mod=wslm&file=content&action=manage&catid=17', '', 'right', '', '', '', '', 0, 0, 0, 0, 'catid_17'),
	(1033, 1018, '分类1', '', '?mod=wslm&file=content&action=manage&catid=18', '', 'right', '', '', '', '', 0, 0, 0, 0, 'catid_18'),
	(1034, 1018, '分类2', '', '?mod=wslm&file=content&action=manage&catid=19', '', 'right', '', '', '', '', 0, 0, 0, 0, 'catid_19'),
	(1035, 1018, '分类3', '', '?mod=wslm&file=content&action=manage&catid=20', '', 'right', '', '', '', '', 0, 0, 0, 0, 'catid_20'),
	(1036, 1018, '分类4', '', '?mod=wslm&file=content&action=manage&catid=21', '', 'right', '', '', '', '', 0, 0, 0, 0, 'catid_21'),
	(1023, 300, '招聘信息', '', '?mod=wslm&file=content&action=manage&catid=8', '', 'right', '', '', '', '', 0, 0, 0, 0, 'catid_8'),
	(1022, 300, '合作伙伴', '', '?mod=wslm&file=content&action=manage&catid=7', '', 'right', '', '', '', '', 0, 0, 0, 0, 'catid_7'),
	(1021, 300, '发展历程', '', '?mod=wslm&file=content&action=manage&catid=6', '', 'right', '', '', '', '', 0, 0, 0, 0, 'catid_6'),
	(1020, 300, '资质荣誉', '', '?mod=wslm&file=content&action=manage&catid=5', '', 'right', '', '', '', '', 0, 0, 0, 0, 'catid_5'),
	(1019, 300, '应用领域', '', '', '', 'right', '', '', '', '', 1, 0, 0, 0, 'catid_4'),
	(1015, 1013, '管理模板', '', '?mod=wslm&file=template&action=manage&module=mail', '', 'right', '', '', '', '', 0, 0, 0, 0, 'member'),
	(1014, 1013, '新建模板', '', '?mod=wslm&file=template&action=add&module=mail', '', 'right', '', '', '', '', 0, 0, 0, 0, 'member'),
	(1013, 7, '邮件订阅', '', '', '', '_self', '', '', '', '', 1, 0, 0, 0, 'member'),
	(1039, 1019, '家电产业', '', '?mod=wslm&file=content&action=manage&catid=24', '', 'right', '', '', '', '', 0, 0, 0, 0, 'catid_24'),
	(1040, 1019, '机动车产业', '', '?mod=wslm&file=content&action=manage&catid=25', '', 'right', '', '', '', '', 0, 0, 0, 0, 'catid_25'),
	(1041, 1019, '工矿机械', '', '?mod=wslm&file=content&action=manage&catid=26', '', 'right', '', '', '', '', 0, 0, 0, 0, 'catid_26'),
	(1042, 1019, '风电产业', '', '?mod=wslm&file=content&action=manage&catid=27', '', 'right', '', '', '', '', 0, 0, 0, 0, 'catid_27'),
	(1043, 1019, '航空产业', '', '?mod=wslm&file=content&action=manage&catid=28', '', 'right', '', '', '', '', 0, 0, 0, 0, 'catid_28'),
	(1046, 300, '联系我们', '', '?mod=wslm&file=content&action=manage&catid=31', '', 'right', '', '', '', '', 0, 0, 0, 0, 'catid_31');
/*!40000 ALTER TABLE `mg_menu` ENABLE KEYS */;


# Dumping structure for table 004_jdweb.mg_model
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
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

# Dumping data for table 004_jdweb.mg_model: 10 rows
DELETE FROM `mg_model`;
/*!40000 ALTER TABLE `mg_model` DISABLE KEYS */;
INSERT INTO `mg_model` (`modelid`, `name`, `description`, `tablename`, `itemname`, `itemunit`, `workflowid`, `template_category`, `template_list`, `template_show`, `template_print`, `ishtml`, `category_urlruleid`, `show_urlruleid`, `enablesearch`, `ischeck`, `isrelated`, `disabled`, `modeltype`) VALUES
	(41, '文件夹', '', 'folder', '文件夹', '文件夹', 1, 'category', 'list', 'show', 'print', 1, 3, 7, 0, 1, 1, 0, 0),
	(10, '普通会员', '', 'detail', '', '', 0, '', '', '', '', 0, 0, 0, 1, 0, 1, 0, 2),
	(34, '联系人', '', 'contact', '联系人', '联系人', 1, 'category', 'list_contact', 'show', 'print', 1, 3, 7, 0, 1, 1, 0, 0),
	(35, '企业荣誉', '', 'honor', '企业荣誉', '企业荣誉', 1, 'category', 'list_honor', 'show', 'print', 1, 3, 7, 1, 1, 1, 0, 0),
	(36, '职位', '职位', 'job', '职位', '职位', 1, 'category', 'list_jobs', 'show', 'print', 1, 3, 7, 1, 1, 1, 0, 0),
	(37, '图文新闻', '', 'thumbnews', '图文新闻', '图文新闻', 1, 'category', 'list_news', 'show', 'print', 1, 3, 7, 1, 1, 1, 0, 0),
	(38, '产品', '', 'product', '产品', '产品', 1, 'category', 'list_products', 'show', 'print', 1, 3, 7, 1, 0, 1, 0, 0),
	(39, '企业进程', '', 'progress', '企业进程', '企业进程', 1, 'category', 'list_progress', 'show', 'print', 1, 3, 7, 0, 1, 1, 0, 0),
	(40, '应用领域', '', 'use', '应用领域', '应用领域', 1, 'category', 'list_use', 'show', 'print', 1, 3, 7, 1, 1, 1, 0, 0),
	(42, '合作伙伴', '', 'partner', '合作伙伴', '合作伙伴', 1, 'category', 'list_partner', 'show', 'print', 1, 3, 7, 1, 1, 1, 0, 0);
/*!40000 ALTER TABLE `mg_model` ENABLE KEYS */;


# Dumping structure for table 004_jdweb.mg_model_field
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
) ENGINE=MyISAM AUTO_INCREMENT=1162 DEFAULT CHARSET=utf8;

# Dumping data for table 004_jdweb.mg_model_field: 289 rows
DELETE FROM `mg_model_field`;
/*!40000 ALTER TABLE `mg_model_field` DISABLE KEYS */;
INSERT INTO `mg_model_field` (`fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isselect`, `iswhere`, `isorder`, `islist`, `isshow`, `isadd`, `isfulltext`, `listorder`, `disabled`) VALUES
	(1096, 39, 'status', '状态', '', '', 0, 2, '', '', 'box', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 98, 1),
	(1097, 39, 'template', '内容页模板', '', '', 0, 255, '', '', 'template', '', '', '', '', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 99, 1),
	(1098, 39, 'content', '内容', '', '', 1, 99999, '', '', 'editor', 'array (\n  \'toolbar\' => \'standard\',\n  \'width\' => \'700\',\n  \'height\' => \'550\',\n  \'defaultvalue\' => \'\',\n  \'storage\' => \'database\',\n  \'enablekeylink\' => \'0\',\n  \'enablefilterword\' => \'0\',\n  \'enablesaveimage\' => \'0\',\n)', '', '', '', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 11, 1),
	(1095, 39, 'prefix', 'html文件名', '', '', 0, 20, '', '', 'text', 'array (\n  \'size\' => \'12\',\n  \'defaultvalue\' => \'\',\n  \'ispassword\' => \'0\',\n)', '', '-99', '-99', 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 19, 1),
	(1094, 39, 'islink', '转向链接', '', '', 0, 0, '', '', 'islink', '', '', '', '', 0, 1, 0, 1, 0, 1, 0, 0, 1, 1, 1, 0, 32, 1),
	(1090, 39, 'url', 'URL', '', '', 0, 100, '', '', 'text', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 96, 0),
	(1091, 39, 'userid', '发布人', '', '', 0, 0, '', '', 'userid', '', '', '', '', 1, 1, 0, 1, 0, 1, 1, 0, 0, 0, 1, 0, 9, 0),
	(1092, 39, 'updatetime', '更新时间', '', '', 0, 0, '', '', 'datetime', 'array (\r\n  \'dateformat\' => \'int\',\r\n  \'format\' => \'Y-m-d H:i:s\',\r\n  \'defaulttype\' => \'1\',\r\n  \'defaultvalue\' => \'\',\r\n)', '', '', '', 1, 1, 0, 1, 0, 1, 1, 1, 0, 0, 1, 0, 10, 0),
	(1093, 39, 'inputtime', '发布时间', '', '', 0, 0, '', '', 'datetime', 'array (\r\n  \'dateformat\' => \'int\',\r\n  \'format\' => \'Y-m-d H:i:s\',\r\n  \'defaulttype\' => \'1\',\r\n  \'defaultvalue\' => \'\',\r\n)', '', '', '', 0, 1, 0, 1, 0, 1, 1, 1, 0, 0, 0, 0, 12, 0),
	(1088, 39, 'posids', '推荐位', '全选<input boxid=\'posids\' type=\'checkbox\' onclick="checkall(\'posids\')" >', '', 0, 0, '', '', 'posid', 'array (\r\n  \'cols\' => \'4\',\r\n  \'width\' => \'125\',\r\n)', '', '', '', 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 13, 1),
	(1089, 39, 'listorder', '排序', '', '', 1, 1, '', '', 'number', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 1, 0, 0, 1, 0, 97, 0),
	(1087, 39, 'description', '摘要', '', '', 0, 500, '', '', 'textarea', 'array (\n  \'rows\' => \'5\',\n  \'cols\' => \'60\',\n  \'defaultvalue\' => \'\',\n  \'enablehtml\' => \'0\',\n  \'enablekeylink\' => \'0\',\n  \'enablefilterword\' => \'0\',\n \'checkcharacter\' => \'1\',\n)', '', '', '', 0, 1, 0, 1, 0, 1, 0, 0, 1, 1, 1, 1, 8, 1),
	(1086, 39, 'keywords', '关键词', '多个关键词之间用空格隔开', '', 0, 40, '', '', 'keyword', 'array (\n  \'size\' => \'60\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 1, 0, 0, 1, 1, 1, 7, 1),
	(1068, 38, 'posids', '推荐位', '全选<input boxid=\'posids\' type=\'checkbox\' onclick="checkall(\'posids\')" >', '', 0, 0, '', '', 'posid', 'array (\r\n  \'cols\' => \'4\',\r\n  \'width\' => \'125\',\r\n)', '', '', '', 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 13, 1),
	(1069, 38, 'listorder', '排序', '', '', 1, 1, '', '', 'number', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 1, 0, 0, 1, 0, 97, 0),
	(1070, 38, 'url', 'URL', '', '', 0, 100, '', '', 'text', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 96, 0),
	(1071, 38, 'userid', '发布人', '', '', 0, 0, '', '', 'userid', '', '', '', '', 1, 1, 0, 1, 0, 1, 1, 0, 0, 0, 1, 0, 9, 0),
	(1072, 38, 'updatetime', '更新时间', '', '', 0, 0, '', '', 'datetime', 'array (\r\n  \'dateformat\' => \'int\',\r\n  \'format\' => \'Y-m-d H:i:s\',\r\n  \'defaulttype\' => \'1\',\r\n  \'defaultvalue\' => \'\',\r\n)', '', '', '', 1, 1, 0, 1, 0, 1, 1, 1, 0, 0, 1, 0, 10, 0),
	(1073, 38, 'inputtime', '发布时间', '', '', 0, 0, '', '', 'datetime', 'array (\r\n  \'dateformat\' => \'int\',\r\n  \'format\' => \'Y-m-d H:i:s\',\r\n  \'defaulttype\' => \'1\',\r\n  \'defaultvalue\' => \'\',\r\n)', '', '', '', 0, 1, 0, 1, 0, 1, 1, 1, 0, 0, 0, 0, 12, 0),
	(1074, 38, 'islink', '转向链接', '', '', 0, 0, '', '', 'islink', '', '', '', '', 0, 1, 0, 1, 0, 1, 0, 0, 1, 1, 1, 0, 32, 1),
	(1075, 38, 'prefix', 'html文件名', '', '', 0, 20, '', '', 'text', 'array (\n  \'size\' => \'12\',\n  \'defaultvalue\' => \'\',\n  \'ispassword\' => \'0\',\n)', '', '-99', '-99', 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 19, 1),
	(1076, 38, 'status', '状态', '', '', 0, 2, '', '', 'box', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 98, 1),
	(1077, 38, 'template', '内容页模板', '', '', 0, 255, '', '', 'template', '', '', '', '', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 99, 1),
	(1078, 38, 'content', '内容', '', '', 1, 99999, '', '', 'editor', 'array (\n  \'toolbar\' => \'standard\',\n  \'width\' => \'700\',\n  \'height\' => \'550\',\n  \'defaultvalue\' => \'\',\n  \'storage\' => \'database\',\n  \'enablekeylink\' => \'0\',\n  \'enablefilterword\' => \'0\',\n  \'enablesaveimage\' => \'0\',\n)', '', '', '', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 11, 0),
	(1081, 39, 'typeid', '类别', '', '', 0, 0, '', '', 'typeid', 'array (\n  \'minnumber\' => \'\',\n  \'maxnumber\' => \'\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 2, 1),
	(1082, 39, 'areaid', '地区', '', '', 0, 0, '', '', 'areaid', 'array (\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 3, 1),
	(1083, 39, 'title', '标题', '', 'inputtitle', 1, 200, '', '', 'title', 'array (\n  \'size\' => \'60\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 4, 0),
	(1084, 39, 'style', '颜色和字型', '', '', 0, 0, '', '', 'style', '', '', '', '', 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0, 5, 1),
	(1085, 39, 'thumb', '缩略图', '', '', 0, 100, '', '', 'image', 'array (\n  \'size\' => \'60\',\n  \'defaultvalue\' => \'\',\n  \'upload_maxsize\' => \'1024\',\n  \'upload_allowext\' => \'jpg|jpeg|gif|png|bmp\',\n  \'isselectimage\' => \'1\',\n  \'isthumb\' => \'0\',\n  \'thumb_width\' => \'300\',\n  \'thumb_height\' => \'300\',\n  \'iswatermark\' => \'0\',\n  \'watermark_img\' => \'images/watermark.gif\',\n)', '', '', '', 0, 1, 0, 1, 0, 1, 1, 0, 1, 1, 1, 0, 6, 1),
	(1079, 39, 'contentid', 'ID', '', '', 0, 0, '', '', 'number', '', '', '', '', 1, 1, 0, 1, 0, 1, 0, 1, 1, 1, 1, 0, 0, 0),
	(1066, 38, 'keywords', '关键词', '多个关键词之间用空格隔开', '', 0, 40, '', '', 'keyword', 'array (\n  \'size\' => \'60\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 1, 0, 0, 1, 1, 1, 7, 1),
	(1067, 38, 'description', '摘要', '', '', 0, 500, '', '', 'textarea', 'array (\n  \'rows\' => \'5\',\n  \'cols\' => \'60\',\n  \'defaultvalue\' => \'\',\n  \'enablehtml\' => \'0\',\n  \'enablekeylink\' => \'0\',\n  \'enablefilterword\' => \'0\',\n \'checkcharacter\' => \'1\',\n)', '', '', '', 0, 1, 0, 1, 0, 1, 0, 0, 1, 1, 1, 1, 8, 1),
	(1080, 39, 'catid', '栏目', '', '', 1, 9999, '/^[0-9]+$/', '请选择所属栏目', 'catid', 'array (\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 0),
	(1065, 38, 'thumb', '缩略图', '', '', 0, 100, '', '', 'image', 'array (\n  \'size\' => \'60\',\n  \'defaultvalue\' => \'\',\n  \'upload_maxsize\' => \'1024\',\n  \'upload_allowext\' => \'jpg|jpeg|gif|png|bmp\',\n  \'isselectimage\' => \'1\',\n  \'isthumb\' => \'0\',\n  \'thumb_width\' => \'300\',\n  \'thumb_height\' => \'300\',\n  \'iswatermark\' => \'0\',\n  \'watermark_img\' => \'images/watermark.gif\',\n)', '', '', '', 0, 1, 0, 1, 0, 1, 1, 0, 1, 1, 1, 0, 6, 0),
	(1064, 38, 'style', '颜色和字型', '', '', 0, 0, '', '', 'style', '', '', '', '', 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0, 5, 1),
	(1063, 38, 'title', '标题', '', 'inputtitle', 1, 200, '', '', 'title', 'array (\n  \'size\' => \'60\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 4, 0),
	(1061, 38, 'typeid', '类别', '', '', 0, 0, '', '', 'typeid', 'array (\n  \'minnumber\' => \'\',\n  \'maxnumber\' => \'\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 2, 1),
	(1062, 38, 'areaid', '地区', '', '', 0, 0, '', '', 'areaid', 'array (\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 3, 1),
	(1060, 38, 'catid', '栏目', '', '', 1, 9999, '/^[0-9]+$/', '请选择所属栏目', 'catid', 'array (\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 0),
	(1059, 38, 'contentid', 'ID', '', '', 0, 0, '', '', 'number', '', '', '', '', 1, 1, 0, 1, 0, 1, 0, 1, 1, 1, 1, 0, 0, 0),
	(1056, 37, 'status', '状态', '', '', 0, 2, '', '', 'box', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 98, 1),
	(1057, 37, 'template', '内容页模板', '', '', 0, 255, '', '', 'template', '', '', '', '', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 99, 1),
	(1058, 37, 'content', '内容', '', '', 1, 99999, '', '', 'editor', 'array (\n  \'toolbar\' => \'standard\',\n  \'width\' => \'700\',\n  \'height\' => \'550\',\n  \'defaultvalue\' => \'\',\n  \'storage\' => \'database\',\n  \'enablekeylink\' => \'0\',\n  \'enablefilterword\' => \'0\',\n  \'enablesaveimage\' => \'0\',\n)', '', '', '', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 11, 0),
	(1054, 37, 'islink', '转向链接', '', '', 0, 0, '', '', 'islink', '', '', '', '', 0, 1, 0, 1, 0, 1, 0, 0, 1, 1, 1, 0, 32, 1),
	(1055, 37, 'prefix', 'html文件名', '', '', 0, 20, '', '', 'text', 'array (\n  \'size\' => \'12\',\n  \'defaultvalue\' => \'\',\n  \'ispassword\' => \'0\',\n)', '', '-99', '-99', 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 19, 1),
	(1050, 37, 'url', 'URL', '', '', 0, 100, '', '', 'text', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 96, 0),
	(1051, 37, 'userid', '发布人', '', '', 0, 0, '', '', 'userid', '', '', '', '', 1, 1, 0, 1, 0, 1, 1, 0, 0, 0, 1, 0, 9, 0),
	(1049, 37, 'listorder', '排序', '', '', 1, 1, '', '', 'number', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 1, 0, 0, 1, 0, 97, 0),
	(1047, 37, 'description', '摘要', '', '', 0, 500, '', '', 'textarea', 'array (\n  \'rows\' => \'5\',\n  \'cols\' => \'60\',\n  \'defaultvalue\' => \'\',\n  \'enablehtml\' => \'0\',\n  \'enablekeylink\' => \'0\',\n  \'enablefilterword\' => \'0\',\n \'checkcharacter\' => \'1\',\n)', '', '', '', 0, 1, 0, 1, 0, 1, 0, 0, 1, 1, 1, 1, 8, 1),
	(1048, 37, 'posids', '推荐位', '全选<input boxid=\'posids\' type=\'checkbox\' onclick="checkall(\'posids\')" >', '', 0, 0, '', '', 'posid', 'array (\r\n  \'cols\' => \'4\',\r\n  \'width\' => \'125\',\r\n)', '', '', '', 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 13, 1),
	(1043, 37, 'title', '标题', '', 'inputtitle', 1, 200, '', '', 'title', 'array (\n  \'size\' => \'60\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 4, 0),
	(1044, 37, 'style', '颜色和字型', '', '', 0, 0, '', '', 'style', '', '', '', '', 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0, 5, 1),
	(1045, 37, 'thumb', '缩略图', '', '', 0, 100, '', '', 'image', 'array (\n  \'size\' => \'60\',\n  \'defaultvalue\' => \'\',\n  \'upload_maxsize\' => \'1024\',\n  \'upload_allowext\' => \'jpg|jpeg|gif|png|bmp\',\n  \'isselectimage\' => \'1\',\n  \'isthumb\' => \'0\',\n  \'thumb_width\' => \'300\',\n  \'thumb_height\' => \'300\',\n  \'iswatermark\' => \'0\',\n  \'watermark_img\' => \'images/watermark.gif\',\n)', '', '', '', 0, 1, 0, 1, 0, 1, 1, 0, 1, 1, 1, 0, 6, 0),
	(1046, 37, 'keywords', '关键词', '多个关键词之间用空格隔开', '', 0, 40, '', '', 'keyword', 'array (\n  \'size\' => \'60\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 1, 0, 0, 1, 1, 1, 7, 1),
	(1053, 37, 'inputtime', '发布时间', '', '', 0, 0, '', '', 'datetime', 'array (\r\n  \'dateformat\' => \'int\',\r\n  \'format\' => \'Y-m-d H:i:s\',\r\n  \'defaulttype\' => \'1\',\r\n  \'defaultvalue\' => \'\',\r\n)', '', '', '', 0, 1, 0, 1, 0, 1, 1, 1, 0, 0, 0, 0, 12, 0),
	(1052, 37, 'updatetime', '更新时间', '', '', 0, 0, '', '', 'datetime', 'array (\r\n  \'dateformat\' => \'int\',\r\n  \'format\' => \'Y-m-d H:i:s\',\r\n  \'defaulttype\' => \'1\',\r\n  \'defaultvalue\' => \'\',\r\n)', '', '', '', 1, 1, 0, 1, 0, 1, 1, 1, 0, 0, 1, 0, 10, 0),
	(1042, 37, 'areaid', '地区', '', '', 0, 0, '', '', 'areaid', 'array (\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 3, 1),
	(974, 34, 'contentid', 'ID', '', '', 0, 0, '', '', 'number', '', '', '', '', 1, 1, 0, 1, 0, 1, 0, 1, 1, 1, 1, 0, 0, 0),
	(975, 34, 'catid', '栏目', '', '', 1, 9999, '/^[0-9]+$/', '请选择所属栏目', 'catid', 'array (\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 0),
	(976, 34, 'typeid', '类别', '', '', 0, 0, '', '', 'typeid', 'array (\n  \'minnumber\' => \'\',\n  \'maxnumber\' => \'\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 2, 1),
	(977, 34, 'areaid', '地区', '', '', 0, 0, '', '', 'areaid', 'array (\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 3, 1),
	(978, 34, 'title', '联系区域名称', '', 'inputtitle', 1, 200, '', '', 'title', 'array (\n  \'size\' => \'60\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', 0, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 4, 0),
	(979, 34, 'style', '颜色和字型', '', '', 0, 0, '', '', 'style', '', '', '', '', 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0, 5, 1),
	(980, 34, 'thumb', '缩略图', '', '', 0, 100, '', '', 'image', 'array (\n  \'size\' => \'60\',\n  \'defaultvalue\' => \'\',\n  \'upload_maxsize\' => \'1024\',\n  \'upload_allowext\' => \'jpg|jpeg|gif|png|bmp\',\n  \'isselectimage\' => \'1\',\n  \'isthumb\' => \'1\',\n  \'thumb_width\' => \'300\',\n  \'thumb_height\' => \'300\',\n  \'iswatermark\' => \'1\',\n  \'watermark_img\' => \'images/watermark.gif\',\n)', '', '', '', 0, 1, 0, 1, 0, 1, 1, 0, 1, 1, 1, 0, 6, 1),
	(981, 34, 'keywords', '关键词', '多个关键词之间用空格隔开', '', 0, 40, '', '', 'keyword', 'array (\n  \'size\' => \'60\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 1, 0, 0, 1, 1, 1, 7, 1),
	(982, 34, 'description', '摘要', '', '', 0, 500, '', '', 'textarea', 'array (\n  \'rows\' => \'5\',\n  \'cols\' => \'60\',\n  \'defaultvalue\' => \'\',\n  \'enablehtml\' => \'0\',\n  \'enablekeylink\' => \'0\',\n  \'enablefilterword\' => \'0\',\n \'checkcharacter\' => \'1\',\n)', '', '', '', 0, 1, 0, 1, 0, 1, 0, 0, 1, 1, 1, 1, 8, 1),
	(983, 34, 'posids', '推荐位', '全选<input boxid=\'posids\' type=\'checkbox\' onclick="checkall(\'posids\')" >', '', 0, 0, '', '', 'posid', 'array (\r\n  \'cols\' => \'4\',\r\n  \'width\' => \'125\',\r\n)', '', '', '', 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 13, 1),
	(984, 34, 'listorder', '排序', '', '', 1, 1, '', '', 'number', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 1, 0, 0, 1, 0, 97, 0),
	(985, 34, 'url', 'URL', '', '', 0, 100, '', '', 'text', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 96, 0),
	(986, 34, 'userid', '发布人', '', '', 0, 0, '', '', 'userid', '', '', '', '', 1, 1, 0, 1, 0, 1, 1, 0, 0, 0, 1, 0, 9, 0),
	(987, 34, 'updatetime', '更新时间', '', '', 0, 0, '', '', 'datetime', 'array (\r\n  \'dateformat\' => \'int\',\r\n  \'format\' => \'Y-m-d H:i:s\',\r\n  \'defaulttype\' => \'1\',\r\n  \'defaultvalue\' => \'\',\r\n)', '', '', '', 1, 1, 0, 1, 0, 1, 1, 1, 0, 0, 1, 0, 10, 0),
	(988, 34, 'inputtime', '发布时间', '', '', 0, 0, '', '', 'datetime', 'array (\r\n  \'dateformat\' => \'int\',\r\n  \'format\' => \'Y-m-d H:i:s\',\r\n  \'defaulttype\' => \'1\',\r\n  \'defaultvalue\' => \'\',\r\n)', '', '', '', 0, 1, 0, 1, 0, 1, 1, 1, 0, 0, 0, 0, 12, 0),
	(989, 34, 'islink', '转向链接', '', '', 0, 0, '', '', 'islink', '', '', '', '', 0, 1, 0, 1, 0, 1, 0, 0, 1, 1, 1, 0, 32, 1),
	(990, 34, 'prefix', 'html文件名', '', '', 0, 20, '', '', 'text', 'array (\n  \'size\' => \'12\',\n  \'defaultvalue\' => \'\',\n  \'ispassword\' => \'0\',\n)', '', '-99', '-99', 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 19, 1),
	(991, 34, 'status', '状态', '', '', 0, 2, '', '', 'box', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 98, 1),
	(992, 34, 'template', '内容页模板', '', '', 0, 255, '', '', 'template', '', '', '', '', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 99, 1),
	(993, 34, 'content', '内容', '', '', 1, 99999, '', '', 'editor', 'array (\n  \'toolbar\' => \'standard\',\n  \'width\' => \'700\',\n  \'height\' => \'550\',\n  \'defaultvalue\' => \'\',\n  \'storage\' => \'database\',\n  \'enablekeylink\' => \'0\',\n  \'enablefilterword\' => \'0\',\n  \'enablesaveimage\' => \'1\',\n)', '', '', '', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 11, 1),
	(994, 34, 'contact', '联系方式', '每行一个联系方式', '', 0, 500, '', '', 'textarea', 'array (\n  \'rows\' => \'10\',\n  \'cols\' => \'60\',\n  \'defaultvalue\' => \'\',\n  \'enablehtml\' => \'0\',\n  \'enablekeylink\' => \'0\',\n  \'replacenum\' => \'1\',\n  \'checkcharacter\' => \'1\',\n)', '', '-99', '-99', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 8, 0),
	(995, 35, 'contentid', 'ID', '', '', 0, 0, '', '', 'number', '', '', '', '', 1, 1, 0, 1, 0, 1, 0, 1, 1, 1, 1, 0, 0, 0),
	(996, 35, 'catid', '栏目', '', '', 1, 9999, '/^[0-9]+$/', '请选择所属栏目', 'catid', 'array (\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 0),
	(997, 35, 'typeid', '类别', '', '', 0, 0, '', '', 'typeid', 'array (\n  \'minnumber\' => \'\',\n  \'maxnumber\' => \'\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 2, 1),
	(998, 35, 'areaid', '地区', '', '', 0, 0, '', '', 'areaid', 'array (\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 3, 1),
	(999, 35, 'title', '标题', '', 'inputtitle', 1, 200, '', '', 'title', 'array (\n  \'size\' => \'60\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 4, 0),
	(1000, 35, 'style', '颜色和字型', '', '', 0, 0, '', '', 'style', '', '', '', '', 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0, 5, 1),
	(1001, 35, 'thumb', '缩略图', '', '', 0, 100, '', '', 'image', 'array (\n  \'size\' => \'60\',\n  \'defaultvalue\' => \'\',\n  \'upload_maxsize\' => \'1024\',\n  \'upload_allowext\' => \'jpg|jpeg|gif|png|bmp\',\n  \'isselectimage\' => \'1\',\n  \'isthumb\' => \'0\',\n  \'thumb_width\' => \'300\',\n  \'thumb_height\' => \'300\',\n  \'iswatermark\' => \'0\',\n  \'watermark_img\' => \'images/watermark.gif\',\n)', '', '', '', 0, 1, 0, 1, 0, 1, 1, 0, 1, 1, 1, 0, 6, 0),
	(1002, 35, 'keywords', '关键词', '多个关键词之间用空格隔开', '', 0, 40, '', '', 'keyword', 'array (\n  \'size\' => \'60\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 1, 0, 0, 1, 1, 1, 7, 1),
	(1003, 35, 'description', '摘要', '', '', 0, 500, '', '', 'textarea', 'array (\n  \'rows\' => \'5\',\n  \'cols\' => \'60\',\n  \'defaultvalue\' => \'\',\n  \'enablehtml\' => \'0\',\n  \'enablekeylink\' => \'0\',\n  \'enablefilterword\' => \'0\',\n \'checkcharacter\' => \'1\',\n)', '', '', '', 0, 1, 0, 1, 0, 1, 0, 0, 1, 1, 1, 1, 8, 1),
	(1004, 35, 'posids', '推荐位', '全选<input boxid=\'posids\' type=\'checkbox\' onclick="checkall(\'posids\')" >', '', 0, 0, '', '', 'posid', 'array (\r\n  \'cols\' => \'4\',\r\n  \'width\' => \'125\',\r\n)', '', '', '', 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 13, 1),
	(1005, 35, 'listorder', '排序', '', '', 1, 1, '', '', 'number', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 1, 0, 0, 1, 0, 97, 0),
	(1006, 35, 'url', 'URL', '', '', 0, 100, '', '', 'text', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 96, 0),
	(1007, 35, 'userid', '发布人', '', '', 0, 0, '', '', 'userid', '', '', '', '', 1, 1, 0, 1, 0, 1, 1, 0, 0, 0, 1, 0, 9, 0),
	(1008, 35, 'updatetime', '更新时间', '', '', 0, 0, '', '', 'datetime', 'array (\r\n  \'dateformat\' => \'int\',\r\n  \'format\' => \'Y-m-d H:i:s\',\r\n  \'defaulttype\' => \'1\',\r\n  \'defaultvalue\' => \'\',\r\n)', '', '', '', 1, 1, 0, 1, 0, 1, 1, 1, 0, 0, 1, 0, 10, 0),
	(1009, 35, 'inputtime', '发布时间', '', '', 0, 0, '', '', 'datetime', 'array (\r\n  \'dateformat\' => \'int\',\r\n  \'format\' => \'Y-m-d H:i:s\',\r\n  \'defaulttype\' => \'1\',\r\n  \'defaultvalue\' => \'\',\r\n)', '', '', '', 0, 1, 0, 1, 0, 1, 1, 1, 0, 0, 0, 0, 12, 0),
	(1010, 35, 'islink', '转向链接', '', '', 0, 0, '', '', 'islink', '', '', '', '', 0, 1, 0, 1, 0, 1, 0, 0, 1, 1, 1, 0, 32, 1),
	(1011, 35, 'prefix', 'html文件名', '', '', 0, 20, '', '', 'text', 'array (\n  \'size\' => \'12\',\n  \'defaultvalue\' => \'\',\n  \'ispassword\' => \'0\',\n)', '', '-99', '-99', 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 19, 1),
	(1012, 35, 'status', '状态', '', '', 0, 2, '', '', 'box', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 98, 1),
	(1013, 35, 'template', '内容页模板', '', '', 0, 255, '', '', 'template', '', '', '', '', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 99, 1),
	(1014, 35, 'content', '内容', '', '', 1, 99999, '', '', 'editor', 'array (\n  \'toolbar\' => \'standard\',\n  \'width\' => \'700\',\n  \'height\' => \'550\',\n  \'defaultvalue\' => \'\',\n  \'storage\' => \'database\',\n  \'enablekeylink\' => \'0\',\n  \'enablefilterword\' => \'0\',\n  \'enablesaveimage\' => \'1\',\n)', '', '', '', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 11, 0),
	(1015, 36, 'contentid', 'ID', '', '', 0, 0, '', '', 'number', '', '', '', '', 1, 1, 0, 1, 0, 1, 0, 1, 1, 1, 1, 0, 0, 0),
	(1016, 36, 'catid', '栏目', '', '', 1, 9999, '/^[0-9]+$/', '请选择所属栏目', 'catid', 'array (\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 0),
	(1017, 36, 'typeid', '类别', '', '', 0, 0, '', '', 'typeid', 'array (\n  \'minnumber\' => \'\',\n  \'maxnumber\' => \'\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 2, 1),
	(1018, 36, 'areaid', '地区', '', '', 0, 0, '', '', 'areaid', 'array (\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 3, 1),
	(1019, 36, 'title', '招聘职位', '', 'inputtitle', 1, 200, '', '', 'title', 'array (\n  \'size\' => \'60\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', 0, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 4, 0),
	(1020, 36, 'style', '颜色和字型', '', '', 0, 0, '', '', 'style', '', '', '', '', 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0, 5, 1),
	(1021, 36, 'thumb', '缩略图', '', '', 0, 100, '', '', 'image', 'array (\n  \'size\' => \'60\',\n  \'defaultvalue\' => \'\',\n  \'upload_maxsize\' => \'1024\',\n  \'upload_allowext\' => \'jpg|jpeg|gif|png|bmp\',\n  \'isselectimage\' => \'1\',\n  \'isthumb\' => \'0\',\n  \'thumb_width\' => \'300\',\n  \'thumb_height\' => \'300\',\n  \'iswatermark\' => \'0\',\n  \'watermark_img\' => \'images/watermark.gif\',\n)', '', '', '', 0, 1, 0, 1, 0, 1, 1, 0, 1, 1, 1, 0, 6, 1),
	(1022, 36, 'keywords', '关键词', '多个关键词之间用空格隔开', '', 0, 40, '', '', 'keyword', 'array (\n  \'size\' => \'60\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 1, 0, 0, 1, 1, 1, 7, 1),
	(1023, 36, 'description', '摘要', '', '', 0, 500, '', '', 'textarea', 'array (\n  \'rows\' => \'5\',\n  \'cols\' => \'60\',\n  \'defaultvalue\' => \'\',\n  \'enablehtml\' => \'0\',\n  \'enablekeylink\' => \'0\',\n  \'enablefilterword\' => \'0\',\n \'checkcharacter\' => \'1\',\n)', '', '', '', 0, 1, 0, 1, 0, 1, 0, 0, 1, 1, 1, 1, 8, 1),
	(1024, 36, 'posids', '推荐位', '全选<input boxid=\'posids\' type=\'checkbox\' onclick="checkall(\'posids\')" >', '', 0, 0, '', '', 'posid', 'array (\r\n  \'cols\' => \'4\',\r\n  \'width\' => \'125\',\r\n)', '', '', '', 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 13, 1),
	(1025, 36, 'listorder', '排序', '', '', 1, 1, '', '', 'number', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 1, 0, 0, 1, 0, 97, 0),
	(1026, 36, 'url', 'URL', '', '', 0, 100, '', '', 'text', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 96, 0),
	(1027, 36, 'userid', '发布人', '', '', 0, 0, '', '', 'userid', '', '', '', '', 1, 1, 0, 1, 0, 1, 1, 0, 0, 0, 1, 0, 9, 0),
	(1028, 36, 'updatetime', '更新时间', '', '', 0, 0, '', '', 'datetime', 'array (\r\n  \'dateformat\' => \'int\',\r\n  \'format\' => \'Y-m-d H:i:s\',\r\n  \'defaulttype\' => \'1\',\r\n  \'defaultvalue\' => \'\',\r\n)', '', '', '', 1, 1, 0, 1, 0, 1, 1, 1, 0, 0, 1, 0, 10, 0),
	(1029, 36, 'inputtime', '文章发布时间', '', '', 0, 0, '', '', 'datetime', 'array (\n  \'dateformat\' => \'int\',\n  \'format\' => \'Y-m-d H:i:s\',\n  \'defaulttype\' => \'1\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', 0, 1, 0, 1, 0, 1, 1, 1, 0, 0, 0, 0, 12, 0),
	(1030, 36, 'islink', '转向链接', '', '', 0, 0, '', '', 'islink', '', '', '', '', 0, 1, 0, 1, 0, 1, 0, 0, 1, 1, 1, 0, 32, 1),
	(1031, 36, 'prefix', 'html文件名', '', '', 0, 20, '', '', 'text', 'array (\n  \'size\' => \'12\',\n  \'defaultvalue\' => \'\',\n  \'ispassword\' => \'0\',\n)', '', '-99', '-99', 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 19, 1),
	(1032, 36, 'status', '状态', '', '', 0, 2, '', '', 'box', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 98, 1),
	(1033, 36, 'template', '内容页模板', '', '', 0, 255, '', '', 'template', '', '', '', '', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 99, 1),
	(1034, 36, 'content', '招聘详情', '', '', 1, 99999, '', '', 'editor', 'array (\n  \'toolbar\' => \'standard\',\n  \'width\' => \'700\',\n  \'height\' => \'550\',\n  \'defaultvalue\' => \'\',\n  \'storage\' => \'database\',\n  \'enablekeylink\' => \'0\',\n  \'replacenum\' => \'\',\n  \'enablesaveimage\' => \'0\',\n)', '', '-99', '-99', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 11, 0),
	(1035, 36, 'endtime', '截止日期', '', '', 0, 0, '', '', 'datetime', 'array (\n  \'dateformat\' => \'date\',\n  \'format\' => \'Y-m-d H:i:s\',\n  \'defaulttype\' => \'1\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 9, 0),
	(1036, 36, 'starttime', '发布日期', '', '', 0, 0, '', '', 'datetime', 'array (\n  \'dateformat\' => \'date\',\n  \'format\' => \'Y-m-d H:i:s\',\n  \'defaulttype\' => \'1\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 8, 0),
	(1037, 36, 'jobnum', '招聘人数', '', '', 0, 255, '', '', 'text', 'array (\n  \'size\' => \'30\',\n  \'defaultvalue\' => \'\',\n  \'ispassword\' => \'0\',\n)', '', '-99', '-99', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 7, 0),
	(1038, 36, 'place', '工作地点', '', '', 0, 0, '', '', 'text', 'array (\n  \'size\' => \'50\',\n  \'defaultvalue\' => \'\',\n  \'ispassword\' => \'0\',\n)', '', '-99', '-99', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 6, 0),
	(1039, 37, 'contentid', 'ID', '', '', 0, 0, '', '', 'number', '', '', '', '', 1, 1, 0, 1, 0, 1, 0, 1, 1, 1, 1, 0, 0, 0),
	(1040, 37, 'catid', '栏目', '', '', 1, 9999, '/^[0-9]+$/', '请选择所属栏目', 'catid', 'array (\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 0),
	(1041, 37, 'typeid', '类别', '', '', 0, 0, '', '', 'typeid', 'array (\n  \'minnumber\' => \'\',\n  \'maxnumber\' => \'\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 2, 1),
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
	(1099, 39, 'progress', '企业进程', '', '', 0, 1000, '', '', 'textarea', 'array (\n  \'rows\' => \'20\',\n  \'cols\' => \'80\',\n  \'defaultvalue\' => \'\',\n  \'enablehtml\' => \'0\',\n  \'enablekeylink\' => \'0\',\n  \'replacenum\' => \'1\',\n  \'checkcharacter\' => \'1\',\n)', '', '-99', '-99', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 9, 0),
	(1100, 40, 'contentid', 'ID', '', '', 0, 0, '', '', 'number', '', '', '', '', 1, 1, 0, 1, 0, 1, 0, 1, 1, 1, 1, 0, 0, 0),
	(1101, 40, 'catid', '栏目', '', '', 1, 9999, '/^[0-9]+$/', '请选择所属栏目', 'catid', 'array (\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 0),
	(1102, 40, 'typeid', '类别', '', '', 0, 0, '', '', 'typeid', 'array (\n  \'minnumber\' => \'\',\n  \'maxnumber\' => \'\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 2, 1),
	(1103, 40, 'areaid', '地区', '', '', 0, 0, '', '', 'areaid', 'array (\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 3, 1),
	(1104, 40, 'title', '标题', '', 'inputtitle', 1, 200, '', '', 'title', 'array (\n  \'size\' => \'60\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 4, 0),
	(1105, 40, 'style', '颜色和字型', '', '', 0, 0, '', '', 'style', '', '', '', '', 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0, 5, 1),
	(1106, 40, 'thumb', '缩略图', '', '', 0, 100, '', '', 'image', 'array (\n  \'size\' => \'60\',\n  \'defaultvalue\' => \'\',\n  \'upload_maxsize\' => \'1024\',\n  \'upload_allowext\' => \'jpg|jpeg|gif|png|bmp\',\n  \'isselectimage\' => \'1\',\n  \'isthumb\' => \'0\',\n  \'thumb_width\' => \'300\',\n  \'thumb_height\' => \'300\',\n  \'iswatermark\' => \'0\',\n  \'watermark_img\' => \'images/watermark.gif\',\n)', '', '', '', 0, 1, 0, 1, 0, 1, 1, 0, 1, 1, 1, 0, 6, 1),
	(1107, 40, 'keywords', '关键词', '多个关键词之间用空格隔开', '', 0, 40, '', '', 'keyword', 'array (\n  \'size\' => \'60\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 1, 0, 0, 1, 1, 1, 7, 1),
	(1108, 40, 'description', '摘要', '', '', 0, 500, '', '', 'textarea', 'array (\n  \'rows\' => \'5\',\n  \'cols\' => \'60\',\n  \'defaultvalue\' => \'\',\n  \'enablehtml\' => \'0\',\n  \'enablekeylink\' => \'0\',\n  \'enablefilterword\' => \'0\',\n \'checkcharacter\' => \'1\',\n)', '', '', '', 0, 1, 0, 1, 0, 1, 0, 0, 1, 1, 1, 1, 8, 1),
	(1109, 40, 'posids', '推荐位', '全选<input boxid=\'posids\' type=\'checkbox\' onclick="checkall(\'posids\')" >', '', 0, 0, '', '', 'posid', 'array (\r\n  \'cols\' => \'4\',\r\n  \'width\' => \'125\',\r\n)', '', '', '', 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 13, 1),
	(1110, 40, 'listorder', '排序', '', '', 1, 1, '', '', 'number', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 1, 0, 0, 1, 0, 97, 0),
	(1111, 40, 'url', 'URL', '', '', 0, 100, '', '', 'text', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 96, 0),
	(1112, 40, 'userid', '发布人', '', '', 0, 0, '', '', 'userid', '', '', '', '', 1, 1, 0, 1, 0, 1, 1, 0, 0, 0, 1, 0, 9, 0),
	(1113, 40, 'updatetime', '更新时间', '', '', 0, 0, '', '', 'datetime', 'array (\r\n  \'dateformat\' => \'int\',\r\n  \'format\' => \'Y-m-d H:i:s\',\r\n  \'defaulttype\' => \'1\',\r\n  \'defaultvalue\' => \'\',\r\n)', '', '', '', 1, 1, 0, 1, 0, 1, 1, 1, 0, 0, 1, 0, 10, 0),
	(1114, 40, 'inputtime', '发布时间', '', '', 0, 0, '', '', 'datetime', 'array (\r\n  \'dateformat\' => \'int\',\r\n  \'format\' => \'Y-m-d H:i:s\',\r\n  \'defaulttype\' => \'1\',\r\n  \'defaultvalue\' => \'\',\r\n)', '', '', '', 0, 1, 0, 1, 0, 1, 1, 1, 0, 0, 0, 0, 12, 0),
	(1115, 40, 'islink', '转向链接', '', '', 0, 0, '', '', 'islink', '', '', '', '', 0, 1, 0, 1, 0, 1, 0, 0, 1, 1, 1, 0, 32, 1),
	(1116, 40, 'prefix', 'html文件名', '', '', 0, 20, '', '', 'text', 'array (\n  \'size\' => \'12\',\n  \'defaultvalue\' => \'\',\n  \'ispassword\' => \'0\',\n)', '', '-99', '-99', 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 19, 1),
	(1117, 40, 'status', '状态', '', '', 0, 2, '', '', 'box', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 98, 1),
	(1118, 40, 'template', '内容页模板', '', '', 0, 255, '', '', 'template', '', '', '', '', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 99, 1),
	(1119, 40, 'content', '内容', '', '', 1, 99999, '', '', 'editor', 'array (\n  \'toolbar\' => \'standard\',\n  \'width\' => \'700\',\n  \'height\' => \'550\',\n  \'defaultvalue\' => \'\',\n  \'storage\' => \'database\',\n  \'enablekeylink\' => \'0\',\n  \'enablefilterword\' => \'0\',\n  \'enablesaveimage\' => \'0\',\n)', '', '', '', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 11, 0),
	(1120, 40, 'pics', '应用组图', '', '', 0, 255, '', '', 'images', 'array (\n  \'upload_maxsize\' => \'1024\',\n  \'upload_allowext\' => \'gif|jpg|jpeg|png|bmp\',\n  \'isthumb\' => \'0\',\n  \'thumb_width\' => \'667\',\n  \'thumb_height\' => \'0\',\n  \'iswatermark\' => \'0\',\n  \'ishtml\' => \'1\',\n  \'watermark_img\' => \'images/watermark.gif\',\n)', '', '-99', '-99', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 9, 0),
	(1121, 41, 'contentid', 'ID', '', '', 0, 0, '', '', 'number', '', '', '', '', 1, 1, 0, 1, 0, 1, 0, 1, 1, 1, 1, 0, 0, 0),
	(1122, 41, 'catid', '栏目', '', '', 1, 9999, '/^[0-9]+$/', '请选择所属栏目', 'catid', 'array (\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 0),
	(1123, 41, 'typeid', '类别', '', '', 0, 0, '', '', 'typeid', 'array (\n  \'minnumber\' => \'\',\n  \'maxnumber\' => \'\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 2, 1),
	(1124, 41, 'areaid', '地区', '', '', 0, 0, '', '', 'areaid', 'array (\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 3, 1),
	(1125, 41, 'title', '标题', '', 'inputtitle', 1, 200, '', '', 'title', 'array (\n  \'size\' => \'60\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 4, 0),
	(1126, 41, 'style', '颜色和字型', '', '', 0, 0, '', '', 'style', '', '', '', '', 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0, 5, 1),
	(1127, 41, 'thumb', '缩略图', '', '', 0, 100, '', '', 'image', 'array (\n  \'size\' => \'60\',\n  \'defaultvalue\' => \'\',\n  \'upload_maxsize\' => \'1024\',\n  \'upload_allowext\' => \'jpg|jpeg|gif|png|bmp\',\n  \'isselectimage\' => \'1\',\n  \'isthumb\' => \'0\',\n  \'thumb_width\' => \'300\',\n  \'thumb_height\' => \'300\',\n  \'iswatermark\' => \'0\',\n  \'watermark_img\' => \'images/watermark.gif\',\n)', '', '', '', 0, 1, 0, 1, 0, 1, 1, 0, 1, 1, 1, 0, 6, 1),
	(1128, 41, 'keywords', '关键词', '多个关键词之间用空格隔开', '', 0, 40, '', '', 'keyword', 'array (\n  \'size\' => \'60\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 1, 0, 0, 1, 1, 1, 7, 1),
	(1129, 41, 'description', '摘要', '', '', 0, 500, '', '', 'textarea', 'array (\n  \'rows\' => \'5\',\n  \'cols\' => \'60\',\n  \'defaultvalue\' => \'\',\n  \'enablehtml\' => \'0\',\n  \'enablekeylink\' => \'0\',\n  \'enablefilterword\' => \'0\',\n \'checkcharacter\' => \'1\',\n)', '', '', '', 0, 1, 0, 1, 0, 1, 0, 0, 1, 1, 1, 1, 8, 1),
	(1130, 41, 'posids', '推荐位', '全选<input boxid=\'posids\' type=\'checkbox\' onclick="checkall(\'posids\')" >', '', 0, 0, '', '', 'posid', 'array (\r\n  \'cols\' => \'4\',\r\n  \'width\' => \'125\',\r\n)', '', '', '', 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 13, 1),
	(1131, 41, 'listorder', '排序', '', '', 1, 1, '', '', 'number', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 1, 0, 0, 1, 0, 97, 0),
	(1132, 41, 'url', 'URL', '', '', 0, 100, '', '', 'text', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 96, 0),
	(1133, 41, 'userid', '发布人', '', '', 0, 0, '', '', 'userid', '', '', '', '', 1, 1, 0, 1, 0, 1, 1, 0, 0, 0, 1, 0, 9, 0),
	(1134, 41, 'updatetime', '更新时间', '', '', 0, 0, '', '', 'datetime', 'array (\r\n  \'dateformat\' => \'int\',\r\n  \'format\' => \'Y-m-d H:i:s\',\r\n  \'defaulttype\' => \'1\',\r\n  \'defaultvalue\' => \'\',\r\n)', '', '', '', 1, 1, 0, 1, 0, 1, 1, 1, 0, 0, 1, 0, 10, 0),
	(1135, 41, 'inputtime', '发布时间', '', '', 0, 0, '', '', 'datetime', 'array (\r\n  \'dateformat\' => \'int\',\r\n  \'format\' => \'Y-m-d H:i:s\',\r\n  \'defaulttype\' => \'1\',\r\n  \'defaultvalue\' => \'\',\r\n)', '', '', '', 0, 1, 0, 1, 0, 1, 1, 1, 0, 0, 0, 0, 12, 0),
	(1136, 41, 'islink', '转向链接', '', '', 0, 0, '', '', 'islink', '', '', '', '', 0, 1, 0, 1, 0, 1, 0, 0, 1, 1, 1, 0, 32, 1),
	(1137, 41, 'prefix', 'html文件名', '', '', 0, 20, '', '', 'text', 'array (\n  \'size\' => \'12\',\n  \'defaultvalue\' => \'\',\n  \'ispassword\' => \'0\',\n)', '', '-99', '-99', 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 19, 1),
	(1138, 41, 'status', '状态', '', '', 0, 2, '', '', 'box', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 98, 1),
	(1139, 41, 'template', '内容页模板', '', '', 0, 255, '', '', 'template', '', '', '', '', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 99, 1),
	(1140, 41, 'content', '内容', '', '', 1, 99999, '', '', 'editor', 'array (\n  \'toolbar\' => \'standard\',\n  \'width\' => \'700\',\n  \'height\' => \'550\',\n  \'defaultvalue\' => \'\',\n  \'storage\' => \'database\',\n  \'enablekeylink\' => \'0\',\n  \'enablefilterword\' => \'0\',\n  \'enablesaveimage\' => \'0\',\n)', '', '', '', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 11, 0),
	(1141, 42, 'contentid', 'ID', '', '', 0, 0, '', '', 'number', '', '', '', '', 1, 1, 0, 1, 0, 1, 0, 1, 1, 1, 1, 1, 0, 0),
	(1142, 42, 'catid', '栏目', '', '', 1, 9999, '/^[0-9]+$/', '请选择所属栏目', 'catid', 'array (\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0),
	(1143, 42, 'listorder', '排序', '', '', 1, 1, '', '', 'number', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 1, 0, 0, 1, 0, 97, 0),
	(1144, 42, 'url', 'URL', '', '', 0, 100, '', '', 'text', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 96, 0),
	(1145, 42, 'userid', '发布人', '', '', 0, 0, '', '', 'userid', '', '', '', '', 1, 1, 0, 1, 0, 1, 1, 0, 0, 0, 1, 0, 9, 0),
	(1146, 42, 'updatetime', '更新时间', '', '', 0, 0, '', '', 'datetime', 'array (\r\n  \'dateformat\' => \'int\',\r\n  \'format\' => \'Y-m-d H:i:s\',\r\n  \'defaulttype\' => \'1\',\r\n  \'defaultvalue\' => \'\',\r\n)', '', '', '', 1, 1, 0, 1, 0, 1, 1, 1, 0, 0, 1, 0, 10, 0),
	(1147, 42, 'inputtime', '发布时间', '', '', 0, 0, '', '', 'datetime', 'array (\r\n  \'dateformat\' => \'int\',\r\n  \'format\' => \'Y-m-d H:i:s\',\r\n  \'defaulttype\' => \'1\',\r\n  \'defaultvalue\' => \'\',\r\n)', '', '', '', 0, 1, 0, 1, 0, 1, 1, 1, 0, 0, 0, 0, 12, 0),
	(1148, 42, 'content', '内容', '', '', 1, 99999, '', '', 'editor', 'array (\n  \'toolbar\' => \'standard\',\n  \'width\' => \'700\',\n  \'height\' => \'550\',\n  \'defaultvalue\' => \'\',\n  \'storage\' => \'database\',\n  \'enablekeylink\' => \'0\',\n  \'enablefilterword\' => \'0\',\n  \'enablesaveimage\' => \'0\',\n)', '', '', '', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 11, 0),
	(1149, 42, 'thumb', '缩略图', '', '', 0, 100, '', '', 'image', 'array (\n  \'size\' => \'60\',\n  \'defaultvalue\' => \'\',\n  \'upload_maxsize\' => \'1024\',\n  \'upload_allowext\' => \'jpg|jpeg|gif|png|bmp\',\n  \'isselectimage\' => \'1\',\n  \'isthumb\' => \'0\',\n  \'thumb_width\' => \'300\',\n  \'thumb_height\' => \'300\',\n  \'iswatermark\' => \'0\',\n  \'watermark_img\' => \'images/watermark.gif\',\n)', '', '', '', 0, 1, 0, 1, 0, 1, 1, 0, 1, 1, 1, 0, 6, 0),
	(1150, 42, 'title', '标题', '', 'inputtitle', 1, 200, '', '', 'title', 'array (\n  \'size\' => \'60\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 4, 0),
	(1151, 42, 'posids', '推荐位', '全选<input boxid=\'posids\' type=\'checkbox\' onclick="checkall(\'posids\')" >', '', 0, 0, '', '', 'posid', 'array (\r\n  \'cols\' => \'4\',\r\n  \'width\' => \'125\',\r\n)', '', '', '', 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 13, 1),
	(1152, 42, 'islink', '转向链接', '', '', 0, 0, '', '', 'islink', '', '', '', '', 0, 1, 0, 1, 0, 1, 0, 0, 1, 1, 1, 0, 32, 1),
	(1153, 42, 'prefix', 'html文件名', '', '', 0, 20, '', '', 'text', 'array (\n  \'size\' => \'12\',\n  \'defaultvalue\' => \'\',\n  \'ispassword\' => \'0\',\n)', '', '-99', '-99', 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 19, 1),
	(1154, 42, 'status', '状态', '', '', 0, 2, '', '', 'box', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 98, 1),
	(1155, 42, 'template', '内容页模板', '', '', 0, 255, '', '', 'template', '', '', '', '', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 99, 1),
	(1156, 42, 'keywords', '关键词', '多个关键词之间用空格隔开', '', 0, 40, '', '', 'keyword', 'array (\n  \'size\' => \'60\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 1, 0, 0, 1, 1, 1, 7, 1),
	(1157, 42, 'description', '摘要', '', '', 0, 500, '', '', 'textarea', 'array (\n  \'rows\' => \'5\',\n  \'cols\' => \'60\',\n  \'defaultvalue\' => \'\',\n  \'enablehtml\' => \'0\',\n  \'enablekeylink\' => \'0\',\n  \'enablefilterword\' => \'0\',\n \'checkcharacter\' => \'1\',\n)', '', '', '', 0, 1, 0, 1, 0, 1, 0, 0, 1, 1, 1, 1, 8, 1),
	(1158, 42, 'style', '颜色和字型', '', '', 0, 0, '', '', 'style', '', '', '', '', 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0, 5, 1),
	(1159, 42, 'typeid', '类别', '', '', 0, 0, '', '', 'typeid', 'array (\n  \'minnumber\' => \'\',\n  \'maxnumber\' => \'\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 2, 1),
	(1160, 42, 'areaid', '地区', '', '', 0, 0, '', '', 'areaid', 'array (\n  \'defaultvalue\' => \'\',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 3, 1),
	(1161, 39, 'date', '发展时间', '', '', 0, 0, '', '', 'datetime', 'array (\n  \'dateformat\' => \'date\',\n  \'format\' => \'Y-m-d\',\n  \'defaulttype\' => \'1\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 6, 0);
/*!40000 ALTER TABLE `mg_model_field` ENABLE KEYS */;


# Dumping structure for table 004_jdweb.mg_module
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

# Dumping data for table 004_jdweb.mg_module: 6 rows
DELETE FROM `mg_module`;
/*!40000 ALTER TABLE `mg_module` DISABLE KEYS */;
INSERT INTO `mg_module` (`module`, `name`, `path`, `url`, `iscore`, `version`, `author`, `site`, `email`, `description`, `license`, `faq`, `tagtypes`, `setting`, `listorder`, `disabled`, `publishdate`, `installdate`, `updatedate`) VALUES
	('wslm', 'Wslm', '', '', 1, '1.0.0.0', 'Wslm Team', 'http://www.wslm.cn/', 'wslm@163.com', 'Wslm Content Manage System', '', '', 'array (\r\n \'wslm-content\'=>\'wslm\',\r\n \'wslm-category\'=>\'栏目标签\',\r\n)', 'array (\n  \'sitename\' => \'聊城金帝保持器有限公司\',\n  \'siteurl\' => \'http://127.0.0.1/jdweb/\',\n  \'ishtml\' => \'1\',\n  \'fileext\' => \'html\',\n  \'enable_urlencode\' => \'0\',\n  \'meta_title\' => \'聊城金帝保持器有限公司\',\n  \'meta_keywords\' => \'金帝,保持器,济南保持器\',\n  \'meta_description\' => \'   聊城市金帝集团是目前国内生产规模最大、品质信誉最好的轴承保持器专业生产厂家。位于著名的轴承保持器生产基地——“江北水城”山东聊城郑家开发区；309国道和京九铁路贯穿境内，济青、京福、京沪高速公路四通八达，物流交通十分便利。\',\n  \'copyright\' => \'聊城市金帝集团 &copy; 2012\',\n  \'icpno\' => \'鲁ICP备XXXXX\',\n  \'pagemode\' => \'1\',\n  \'pageshtml\' => \'总数：<b>{$total}</b>\r\n<a href="{$firstpage}">首页</a><a href="{$prepage}">上一页</a><a href="{$nextpage}">下一页</a><a href="{$lastpage}">尾页</a>\r\n页次：<b><font color="red">{$page}</font>/{$pages}</b>\r\n<input type="text" name="page" id="page" size="2" onKeyDown="if(event.keyCode==13) {redirect(\\\'{$urlpre}\\\'+this.value); return false;}"> \r\n<input type="button" value="GO" class="gotopage" onclick="redirect(\\\'{$urlpre}\\\'+$(\\\'#page\\\').val())">\',\n  \'segmentclass\' => \'segment\',\n  \'enablegetscrollbar\' => \'1\',\n  \'enablegetkeywords\' => \'1\',\n  \'areaid\' => \'1\',\n  \'editor_max_data_hour\' => \'4\',\n  \'editor_interval_data\' => \'30\',\n  \'category_count\' => \'1\',\n  \'show_hits\' => \'1\',\n  \'maxpage\' => \'100\',\n  \'pagesize\' => \'20\',\n  \'autoupdatelist\' => \'5\',\n  \'search_time\' => \'10\',\n  \'search_maxresults\' => \'500\',\n  \'search_pagesize\' => \'10\',\n  \'adminaccessip\' => \'\',\n  \'maxloginfailedtimes\' => \'5\',\n  \'maxiplockedtime\' => \'1\',\n  \'enable_ipbanned\' => \'0\',\n  \'minrefreshtime\' => \'0\',\n  \'filter_word\' => \'\',\n  \'allowtourist\' => \'0\',\n  \'thumb_enable\' => \'0\',\n  \'thumb_width\' => \'667\',\n  \'thumb_height\' => \'0\',\n  \'watermark_enable\' => \'0\',\n  \'watermark_minwidth\' => \'300\',\n  \'watermark_minheight\' => \'300\',\n  \'watermark_img\' => \'images/watermark.gif\',\n  \'watermark_pct\' => \'100\',\n  \'watermark_quality\' => \'80\',\n  \'watermark_pos\' => \'9\',\n  \'mail_type\' => \'1\',\n  \'mail_server\' => \'smtp.163.com\',\n  \'mail_port\' => \'25\',\n  \'mail_user\' => \'wslm@163.com\',\n  \'mail_password\' => \'\',\n  \'mail_sign\' => \'&nbsp;\',\n  \'enablepassport\' => \'0\',\n  \'passport_file\' => \'discuz\',\n  \'passport_charset\' => \'gbk\',\n  \'passport_url\' => \'http://www.***.com/bbs/api/passport.php\',\n  \'passport_key\' => \'\',\n  \'enableserverpassport\' => \'0\',\n  \'passport_serverurl\' => \'http://www.***.com/bbs/\',\n  \'passport_registerurl\' => \'register.php\',\n  \'passport_loginurl\' => \'login.php\',\n  \'passport_logouturl\' => \'login.php?action=quit\',\n  \'passport_getpasswordurl\' => \'sendpwd.php\',\n  \'passport_serverkey\' => \'\',\n  \'passport_expire\' => \'\',\n  \'uc\' => \'0\',\n  \'uc_api\' => \'http://uc.wslm.cn/uc\',\n  \'uc_ip\' => \'\',\n  \'uc_dbhost\' => \'localhost\',\n  \'uc_dbuser\' => \'dbuser\',\n  \'uc_dbpwd\' => \'dbpw\',\n  \'uc_dbname\' => \'dbname\',\n  \'uc_dbpre\' => \'uc_\',\n  \'uc_charset\' => \'gbk\',\n  \'uc_appid\' => \'3\',\n  \'uc_key\' => \'\',\n  \'enabletm\' => \'1\',\n  \'qq\' => \'408128151\',\n  \'msn\' => \'\',\n  \'skype\' => \'\',\n  \'taobao\' => \'\',\n  \'alibaba\' => \'\',\n  \'version\' => \'2008 sp4\',\n  \'wss_enable\' => \'\',\n  \'wss_site_id\' => \'\',\n  \'wss_password\' => \'\',\n)', 0, 0, '2008-10-28', '2008-10-28', '2008-10-28'),
	('member', '会员', 'member/', 'member/', 1, '1.0.0.0', 'Wslm Team', 'http://www.wslm.cn/', 'wslm@163.com', '', '', '', 'array (\r\n  \'member\'=>\'会员类型\',\r\n)\r\n\r\n\r\n', 'array (\n  \'allowregister\' => \'1\',\n  \'choosemodel\' => \'1\',\n  \'enablemailcheck\' => \'0\',\n  \'enableshowlist\' => \'1\',\n  \'enableadmincheck\' => \'0\',\n  \'enablecheckcodeofreg\' => \'1\',\n  \'enableQchk\' => \'0\',\n  \'paytype\' => \'point\',\n  \'defualtpoint\' => \'0\',\n  \'defualtamount\' => \'0.00\',\n  \'reglicense\' => \' 欢迎您注册成为wslm用户\r\n             请仔细阅读下面的协议，只有接受协议才能继续进行注册。 \r\n             1．服务条款的确认和接纳\r\n            　　wslm用户服务的所有权和运作权归wslm拥有。wslm所提供的服务将按照有关章程、服务条款和操作规则严格执行。用户通过注册程序点击“我同意” 按钮，即表示用户与wslm达成协议并接受所有的服务条款。\r\n             2． wslm服务简介\r\n            　　wslm通过国际互联网为用户提供新闻及文章浏览、图片浏览、软件下载、网上留言和BBS论坛等服务。\r\n            　　用户必须： \r\n            　　1)购置设备，包括个人电脑一台、调制解调器一个及配备上网装置。 \r\n            　　2)个人上网和支付与此服务有关的电话费用、网络费用。\r\n            　　用户同意： \r\n            　　1)提供及时、详尽及准确的个人资料。 \r\n            　　2)不断更新注册资料，符合及时、详尽、准确的要求。所有原始键入的资料将引用为注册资料。 \r\n            　　3)用户同意遵守《中华人民共和国保守国家秘密法》、《中华人民共和国计算机信息系统安全保护条例》、《计算机软件保护条例》等有关计算机及互联网规定的法律和法规、实施办法。在任何情况下，wslm合理地认为用户的行为可能违反上述法律、法规，wslm可以在任何时候，不经事先通知终止向该用户提供服务。用户应了解国际互联网的无国界性，应特别注意遵守当地所有有关的法律和法规。\r\n             3． 服务条款的修改\r\n            　　wslm会不定时地修改服务条款，服务条款一旦发生变动，将会在相关页面上提示修改内容。如果您同意改动，则再一次点击“我同意”按钮。 如果您不接受，则及时取消您的用户使用服务资格。\r\n             4． 服务修订\r\n            　　wslm保留随时修改或中断服务而不需知照用户的权利。wslm行使修改或中断服务的权利，不需对用户或第三方负责。\r\n             5． 用户隐私制度\r\n            　　尊重用户个人隐私是wslm的 基本政策。wslm不会公开、编辑或透露用户的注册信息，除非有法律许可要求，或wslm在诚信的基础上认为透露这些信息在以下三种情况是必要的： \r\n            　　1)遵守有关法律规定，遵从合法服务程序。 \r\n            　　2)保持维护wslm的商标所有权。 \r\n            　　3)在紧急情况下竭力维护用户个人和社会大众的隐私安全。 \r\n            　　4)符合其他相关的要求。 \r\n             6．用户的帐号，密码和安全性\r\n            　　一旦注册成功成为wslm用户，您将得到一个密码和帐号。如果您不保管好自己的帐号和密码安全，将对因此产生的后果负全部责任。另外，每个用户都要对其帐户中的所有活动和事件负全责。您可随时根据指示改变您的密码，也可以结束旧的帐户重开一个新帐户。用户同意若发现任何非法使用用户帐号或安全漏洞的情况，立即通知wslm。\r\n             7． 免责条款\r\n            　　用户明确同意网站服务的使用由用户个人承担风险。 　　 \r\n            　　wslm不作任何类型的担保，不担保服务一定能满足用户的要求，也不担保服务不会受中断，对服务的及时性，安全性，出错发生都不作担保。用户理解并接受：任何通过wslm服务取得的信息资料的可靠性取决于用户自己，用户自己承担所有风险和责任。 \r\n             8．有限责任\r\n            　　wslm对任何直接、间接、偶然、特殊及继起的损害不负责任。\r\n             9． 不提供零售和商业性服务 \r\n            　　用户使用网站服务的权利是个人的。用户只能是一个单独的个体而不能是一个公司或实体商业性组织。用户承诺不经wslm同意，不能利用网站服务进行销售或其他商业用途。\r\n             10．用户责任 \r\n            　　用户单独承担传输内容的责任。用户必须遵循： \r\n            　　1)从中国境内向外传输技术性资料时必须符合中国有关法规。 \r\n            　　2)使用网站服务不作非法用途。 \r\n            　　3)不干扰或混乱网络服务。 \r\n            　　4)不在论坛BBS或留言簿发表任何与政治相关的信息。 \r\n            　　5)遵守所有使用网站服务的网络协议、规定、程序和惯例。\r\n            　　6)不得利用本站危害国家安全、泄露国家秘密，不得侵犯国家社会集体的和公民的合法权益。\r\n            　　7)不得利用本站制作、复制和传播下列信息： \r\n            　　　1、煽动抗拒、破坏宪法和法律、行政法规实施的；\r\n            　　　2、煽动颠覆国家政权，推翻社会主义制度的；\r\n            　　　3、煽动分裂国家、破坏国家统一的；\r\n            　　　4、煽动民族仇恨、民族歧视，破坏民族团结的；\r\n            　　　5、捏造或者歪曲事实，散布谣言，扰乱社会秩序的；\r\n            　　　6、宣扬封建迷信、淫秽、色情、赌博、暴力、凶杀、恐怖、教唆犯罪的；\r\n            　　　7、公然侮辱他人或者捏造事实诽谤他人的，或者进行其他恶意攻击的；\r\n            　　　8、损害国家机关信誉的；\r\n            　　　9、其他违反宪法和法律行政法规的；\r\n            　　　10、进行商业广告行为的。\r\n            　　用户不能传输任何教唆他人构成犯罪行为的资料；不能传输长国内不利条件和涉及国家安全的资料；不能传输任何不符合当地法规、国家法律和国际法 律的资料。未经许可而非法进入其它电脑系统是禁止的。若用户的行为不符合以上的条款，wslm将取消用户服务帐号。\r\n             11．网站内容的所有权\r\n            　　wslm定义的内容包括：文字、软件、声音、相片、录象、图表；在广告中全部内容；电子邮件的全部内容；wslm为用户提供的商业信息。所有这些内容受版权、商标、标签和其它财产所有权法律的保护。所以，用户只能在wslm和广告商授权下才能使用这些内容，而不能擅自复制、篡改这些内容、或创造与内容有关的派生产品。\r\n             12．附加信息服务\r\n            　　用户在享用wslm提供的免费服务的同时，同意接受wslm提供的各类附加信息服务。\r\n             13．解释权\r\n            　　本注册协议的解释权归wslm所有。如果其中有任何条款与国家的有关法律相抵触，则以国家法律的明文规定为准。\r\n            \',\n)', 0, 0, '2008-10-28', '2008-10-28', '2008-10-28'),
	('link', '友情链接', 'link/', 'link/', 0, '1.0.0.0', 'Wslm Team', 'http://www.wslm.cn/', 'wslm@163.com', '', '', '', '', 'array (\n  \'seo_keywords\' => \'友情链接\',\n  \'seo_description\' => \'友情链接\',\n  \'enablecheckcode\' => \'0\',\n  \'ischeck\' => \'1\',\n)', 0, 0, '2008-10-28', '2008-10-28', '2008-10-28'),
	('guestbook', '留言板', 'guestbook/', 'guestbook/', 0, '1.0.0.0', 'Wslm Team', 'http://www.wslm.cn/', 'wslm@163.com', '', '', '', '', 'array (\n  \'seo_keywords\' => \'wslm留言板\',\n  \'seo_description\' => \'wslm留言板\',\n  \'pagesize\' => \'20\',\n  \'maxcontent\' => \'1000\',\n  \'enablecheckcode\' => \'1\',\n  \'show\' => \'1\',\n  \'enableTourist\' => \'1\',\n  \'checkpass\' => \'1\',\n)', 0, 0, '2008-10-28', '2008-10-28', '2008-10-28'),
	('search', '全站搜索', 'search/', 'search/', 0, '1.0.0.0', 'Wslm Team', 'http://www.wslm.cn/', 'wslm@163.com', '全站搜索', '', '', '', 'array (\n  \'titlelen\' => \'80\',\n  \'descriptionlen\' => \'480\',\n  \'type_urlruleid\' => \'\',\n  \'show_urlruleid\' => \'\',\n)', 0, 0, '2008-10-28', '2008-10-28', '2008-10-28'),
	('formguide', '表单向导', 'formguide/', 'formguide/', 0, '1.0.0.0', 'Wslm Team', 'http://www.wslm.cn/', 'wslm@163.com', '', '', '', '', 'array (\n  \'allowmultisubmit\' => \'1\',\n  \'allowunregsubmit\' => \'1\',\n  \'allowsendemail\' => \'0\',\n)', 0, 0, '2008-10-28', '2008-10-28', '2008-10-28');
/*!40000 ALTER TABLE `mg_module` ENABLE KEYS */;


# Dumping structure for table 004_jdweb.mg_player
DROP TABLE IF EXISTS `mg_player`;
CREATE TABLE IF NOT EXISTS `mg_player` (
  `playerid` smallint(3) unsigned NOT NULL AUTO_INCREMENT,
  `subject` char(20) NOT NULL,
  `code` mediumtext NOT NULL,
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`playerid`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

# Dumping data for table 004_jdweb.mg_player: 5 rows
DELETE FROM `mg_player`;
/*!40000 ALTER TABLE `mg_player` DISABLE KEYS */;
INSERT INTO `mg_player` (`playerid`, `subject`, `code`, `disabled`) VALUES
	(1, 'RealPlayer', '<script language="javascript">\r\nvar ERR_FileNotFind="播放器提示：未找到点播文件！请报告影片错误给管理员";\r\nvar ERR_NotLocateServer="播放器提示：无法连接服务器或连接服务器超时！";\r\nvar ERR_UnkownError="播放器提示：发生了未知错误！";\r\n</script>\r\n<script LANGUAGE="VBScript">                                    \r\non error resume next \r\nSub player_OnBuffering(lFlags,lPercentage)\r\nif (lPercentage=100) then\r\nStartPlay=false\r\nif (FirstPlay) then\r\nFirstPlay=false\r\nend if\r\nexit sub\r\nend if\r\nEnd Sub\r\nSub player_OnErrorMessage(uSeverity, uRMACode, uUserCode, pUserString, pMoreInfoURL, pErrorString)\r\nselect case player.GetLastErrorRMACode()\r\n   case -2147221496\r\nwindow.alert(ERR_FileNotFind)\r\n   case -2147221433,-2147221428,-2147221417,-2147217468\r\nwindow.alert(ERR_NotLocateServer)\r\ncase -2147221436\r\nwindow.alert("系统提示！播放器无法连接到点播文件服务器")\r\n   case else\r\nwindow.alert(ERR_UnkownError)\r\nend select\r\nEnd Sub\r\n</script>\r\n<center>\r\n<TABLE cellPadding=0 cellSpacing=0 border=1 height="100%" width="100%" id="table2">\r\n<TR>\r\n<TD>\r\n<OBJECT classid="clsid:CFCDAA03-8BE4-11cf-B84B-0020AFBBCCFA" height="100%" id=RP1 name=RP1 width="100%">\r\n<PARAM NAME="AUTOSTART" VALUE="-1">\r\n<PARAM NAME="SHUFFLE" VALUE="0">\r\n<PARAM NAME="PREFETCH" VALUE="0">\r\n<PARAM NAME="NOLABELS" VALUE="0">\r\n<PARAM NAME="CONTROLS" VALUE="Imagewindow">\r\n<PARAM NAME="CONSOLE" VALUE="clip1">\r\n<PARAM NAME="LOOP" VALUE="0">\r\n<PARAM NAME="NUMLOOP" VALUE="0">\r\n<PARAM NAME="CENTER" VALUE="0">\r\n<PARAM NAME="MAINTAINASPECT" VALUE="1">\r\n<PARAM NAME="BACKGROUNDCOLOR" VALUE="#000000">\r\n</OBJECT>\r\n</TD></TR><TR><TD height=60>\r\n<TABLE align=center border=0 cellPadding=0 cellSpacing=0 width="100%" id="table3">\r\n<TR><TD align=middle bgColor=#000000>\r\n<TABLE border=1 cellPadding=0 cellSpacing=0 width="100%" id="table4">\r\n<TR><TD width=50>\r\n<IMG border=0 height=30 onclick=document.RP1.SetFullScreen() src="{$WSLM[siteurl]}images/player/full.gif" width=50></TD>\r\n<TD>\r\n<OBJECT classid=clsid:CFCDAA03-8BE4-11cf-B84B-0020AFBBCCFA  height=30 id=player name=player width="100%">\r\n<PARAM NAME="_ExtentX" VALUE="4657">\r\n<PARAM NAME="_ExtentY" VALUE="794">\r\n<PARAM NAME="AUTOSTART" VALUE="-1">\r\n<PARAM NAME="SRC" VALUE="{$filepath}">\r\n<PARAM NAME="SHUFFLE" VALUE="0">\r\n<PARAM NAME="PREFETCH" VALUE="0">\r\n<PARAM NAME="NOLABELS" VALUE="-1">\r\n<PARAM NAME="CONTROLS" VALUE="ControlPanel">\r\n<PARAM NAME="CONSOLE" VALUE="clip1">\r\n<PARAM NAME="LOOP" VALUE="0">\r\n<PARAM NAME="NUMLOOP" VALUE="0">\r\n<PARAM NAME="CENTER" VALUE="0">\r\n<PARAM NAME="MAINTAINASPECT" VALUE="1">\r\n<PARAM NAME="BACKGROUNDCOLOR" VALUE="#000000">\r\n</OBJECT>\r\n</TD></TR></TABLE></TD></TR>\r\n<TR>\r\n<TD align=middle bgColor=#000000>\r\n<OBJECT classid=clsid:CFCDAA03-8BE4-11cf-B84B-0020AFBBCCFA height=30 id=RP3 name=RP3 width="100%">\r\n<PARAM NAME="_ExtentX" VALUE="4657">\r\n<PARAM NAME="_ExtentY" VALUE="794">\r\n<PARAM NAME="AUTOSTART" VALUE="-1">\r\n<PARAM NAME="SHUFFLE" VALUE="0">\r\n<PARAM NAME="PREFETCH" VALUE="0">\r\n<PARAM NAME="NOLABELS" VALUE="-1">\r\n<PARAM NAME="CONTROLS" VALUE="StatusBar">\r\n<PARAM NAME="CONSOLE" VALUE="clip1">\r\n<PARAM NAME="LOOP" VALUE="0">\r\n<PARAM NAME="NUMLOOP" VALUE="0">\r\n<PARAM NAME="CENTER" VALUE="0">\r\n<PARAM NAME="MAINTAINASPECT" VALUE="1">\r\n<PARAM NAME="BACKGROUNDCOLOR" VALUE="#000000">\r\n</OBJECT>\r\n</TD></TR></TABLE></TD></TR></TABLE>', 0),
	(2, 'window media player', '<object classid="clsid:22D6F312-B0F6-11D0-94AB-0080C74C7E95" id="MediaPlayer1" width="100%" height="100%">\r\n<param name="AudioStream" value="-1">\r\n<param name="AutoSize" value="-1">\r\n<!--是否自动调整播放大小-->\r\n<param name="AutoStart" value="-1">\r\n<!--是否自动播放-->\r\n<param name="AnimationAtStart" value="-1">\r\n<param name="AllowScan" value="-1">\r\n<param name="AllowChangeDisplaySize" value="-1">\r\n<param name="AutoRewind" value="0">\r\n<param name="Balance" value="0">\r\n<!--左右声道平衡,最左-9640,最右9640-->\r\n<param name="BaseURL" value>\r\n<param name="BufferingTime" value="15">\r\n<!--缓冲时间-->\r\n<param name="CaptioningID" value>\r\n<param name="ClickToPlay" value="-1">\r\n<param name="CursorType" value="0">\r\n<param name="CurrentPosition" value="0">\r\n<!--当前播放进度 -1 表示不变,0表示开头 单位是秒,比如10表示从第10秒处开始播放,值必须是-1.0或大于等于0-->\r\n<param name="CurrentMarker" value="0">\r\n<param name="DefaultFrame" value>\r\n<param name="DisplayBackColor" value="0">\r\n<param name="DisplayForeColor" value="16777215">\r\n<param name="DisplayMode" value="0">\r\n<param name="DisplaySize" value="0">\r\n<!--视频1-50%, 0-100%, 2-200%,3-全屏 其它的值作0处理,小数则采用四舍五入然后按前的处理-->\r\n<param name="Enabled" value="-1">\r\n<param name="EnableContextMenu" value="-1">\r\n<!-是否用右键弹出菜单控制-->\r\n<param name="EnablePositionControls" value="-1">\r\n<param name="EnableFullScreenControls" value="-1">\r\n<param name="EnableTracker" value="-1">\r\n<!--是否允许拉动播放进度条到任意地方播放-->\r\n<param name="Filename" value="{$filepath}" valuetype="ref">\r\n<!--播放的文件地址-->\r\n<param name="InvokeURLs" value="-1">\r\n<param name="Language" value="-1">\r\n<param name="Mute" value="0">\r\n<!--是否静音-->\r\n<param name="PlayCount" value="1">\r\n<!--重复播放次数,0为始终重复-->\r\n<param name="PreviewMode" value="-1">\r\n<param name="Rate" value="1">\r\n<!--播放速率控制,1为正常,允许小数-->\r\n<param name="SAMIStyle" value="1">\r\n<!--SAMI样式-->\r\n<param name="SAMILang" value>\r\n<!--SAMI语言-->\r\n<param name="SAMIFilename" value>\r\n<!--字幕ID-->\r\n<param name="SelectionStart" value="-1">\r\n<param name="SelectionEnd" value="-1">\r\n<param name="SendOpenStateChangeEvents" value="-1">\r\n<param name="SendWarningEvents" value="-1">\r\n<param name="SendErrorEvents" value="-1">\r\n<param name="SendKeyboardEvents" value="0">\r\n<param name="SendMouseClickEvents" value="0">\r\n<param name="SendMousemovieeEvents" value="0">\r\n<param name="SendPlayStateChangeEvents" value="-1">\r\n<param name="ShowCaptioning" value="0">\r\n<!--是否显示字幕,为一块黑色,下面会有一大块黑色,一般不显示-->\r\n<param name="ShowControls" value="-1">\r\n<!--是否显示控制,比如播放,停止,暂停-->\r\n<param name="ShowAudioControls" value="-1">\r\n<!--是否显示音量控制-->\r\n<param name="ShowDisplay" value="0">\r\n<!--显示节目信息,比如版权等-->\r\n<param name="ShowGotoBar" value="0">\r\n<!--是否启用上下文菜单-->\r\n<param name="ShowPositionControls" value="-1">\r\n<!--是否显示往前往后及列表,如果显示一般也都是灰色不可控制-->\r\n<param name="ShowStatusBar" value="-1">\r\n<!--当前播放信息,显示是否正在播放,及总播放时间和当前播放到的时间-->\r\n<param name="ShowTracker" value="-1">\r\n<!--是否显示当前播放跟踪条,即当前的播放进度条-->\r\n<param name="TransparentAtStart" value="-1">\r\n<param name="VideoBorderWidth" value="0">\r\n<!--显示部的宽部,如果小于视频宽,则最小为视频宽,或者加大到指定值,并自动加大高度.此改变只改变四周的黑框大小,不改变视频大小-->\r\n<param name="VideoBorderColor" value="0">\r\n<!--显示黑色框的颜色, 为RGB值,比如ffff00为黄色-->\r\n<param name="VideoBorder3D" value="0">\r\n<param name="Volume" value="0">\r\n<!--音量大小,负值表示是当前音量的减值,值自动会取绝对值,最大为0,最小为-9640-->\r\n<param name="WindowlessVideo" value="0">\r\n<!--如果是0可以允许全屏,否则只能在窗口中查看-->\r\n</object>', 0),
	(3, '精美real播放器', '<Script Language="JavaScript">\r\nIEvar=navigator.appVersion.substring(navigator.appVersion.indexOf(\'MSIE\')+5,navigator.appVersion.indexOf(\';\',17));\r\nif(IEvar=="6.0")\r\n{\r\n  ie6 = true;\r\n  width_add = 10;\r\n  height_add = 29;\r\n  jjjj = 5;\r\n  hand_add = -14;\r\n}\r\nelse\r\n{\r\n  ie6 = false;\r\n  width_add = 0;\r\n  height_add = 0;\r\n  jjjj = 0;\r\n  hand_add = 0;\r\n}\r\nb_width = 0;\r\nb_height = 0;\r\n\r\n//屏蔽右键\r\n   function no_newwin(){\r\n   if((event.ctrlKey)&&(event.keyCode==78)){\r\n   event.keyCode=0;\r\n   event.returnValue=false;\r\n   }\r\n}\r\n\r\nfunction click()\r\n{\r\n   return false;\r\n}\r\ndocument.oncontextmenu=click;\r\ndocument.onmousemoviee=click;\r\n\r\ndocument.ondragstart=doDragStart\r\nfunction doDragStart() {event.returnValue=false}\r\n\r\n\r\n//-------------------------\r\n\r\nvar Real;\r\nReal=\'rPlayer.\';\r\nvar Mute=false;\r\nvar CanSetPos=true;\r\nvar SetPosStart=false;\r\nvar SetVolStart=false;\r\nvar loop, timer, initialised;\r\nvar speed=50;\r\nvar oldwidth=566,oldheight=502;\r\nmovieeon=false;movieelen=300;rm_tollen=0;timelen=0;volumlen=56;iScrollLength=140;\r\n\r\ndocument.onmouseup=Total_Up;\r\n\r\nfunction Total_Up(){\r\nif(event.button!=2){\r\nif(SetPosStart){\r\nsetpos();\r\nballmoviee();\r\n}\r\nif(SetVolStart) setvol();\r\n }\r\n}\r\n\r\nfunction moviees()\r\n{\r\nif(CanSetPos&&event.button!=2)\r\n{\r\norix=event.x;\r\norileft=mblock.style.pixelLeft;\r\nif(movieeon)\r\n{\r\nclearTimeout(balltime);\r\n}\r\nSetPosStart=true;\r\n}\r\nelse\r\n  return false;\r\n}\r\n\r\nfunction ChangePos() {\r\nnewleft=event.x;\r\n{\r\nSetPosStart=false;\r\nif (event.x < movieelen+10)\r\n  newleft=event.x-10;\r\nelse\r\n  newleft=movieelen-1;\r\nif (event.x < 10)\r\n  newleft=0;\r\nrm_tollen = GetLength();\r\nrcp=Math.round((newleft/movieelen)*rm_tollen);\r\nSetPosition(rcp);\r\nmblock.style.left = newleft;\r\nplay()\r\n}\r\n}\r\n\r\nfunction movieego()\r\n{\r\nif(SetPosStart)\r\n{\r\nnewx=event.x;\r\ndisx=newx-orix;\r\nnewleft=orileft+disx;\r\nif(newleft>-1&&newleft<movieelen) mblock.style.left=newleft;\r\n}\r\n}\r\n\r\nfunction setpos()\r\n{\r\nSetPosStart=false;\r\nnewleft=mblock.style.pixelLeft;\r\nrm_tollen = GetLength();\r\nrcp=Math.round((newleft/movieelen)*rm_tollen);\r\nSetPosition(rcp);\r\n}\r\n\r\nfunction vols()\r\n{\r\nif(event.button!=2)\r\n{\r\norix=event.x;\r\norileft=vblock.style.pixelLeft;\r\nSetVolStart=true;\r\n}\r\n}\r\n\r\nfunction volgo()\r\n{\r\nif(SetVolStart)\r\n{\r\nnewx=event.x;\r\ndisx=newx-orix;\r\nnewleft=orileft+disx;\r\nif(newleft>5&&newleft<=volumlen) vblock.style.left=newleft;\r\n}\r\n}\r\n\r\nfunction setvol()\r\n{//设置音量\r\nSetVolStart=false;\r\nnewleft=vblock.style.pixelLeft;\r\nnewvol=-(Math.round((volumlen-newleft)*2000/(volumlen-6)));\r\nSetVolume(newvol);\r\n}\r\nfunction RealincreaseVolume(){\r\nif(window.rPlayer!=null)\r\n{\r\nif(volumlen >= 100 )\r\nvolumlen = 100;\r\nelse\r\nvolumlen += 10;\r\nrPlayer.SetVolume(volumlen);\r\n}}\r\nfunction RealdecreseVolume()\r\n{\r\n   if(window.rPlayer!=null)\r\n{\r\nif(volumlen <= 0 )\r\nvolumlen = 0;\r\nelse\r\nvolumlen -= 10;\r\nrPlayer.SetVolume(volumlen);\r\n}}\r\n  \r\n//-------------------------\r\n\r\nfunction ballmoviee()\r\n{//移动进度条\r\nmovieelen = movie.style.pixelWidth-20;\r\naa = rPlayer.GetPosition();\r\ndd = rPlayer.Getlength();\r\nif (rPlayer.FILENAME!="" && isFinite(Math.round(aa/dd*movieelen)))\r\n{\r\n  mblock.style.left = Math.round(aa/dd*movieelen);\r\n}\r\nballtime = setTimeout(\'ballmoviee();\',1000);\r\n}\r\n\r\nfunction SetPosition(Pos)\r\n{\r\neval(Real+\'SetPosition(Pos)\');\r\n}\r\nfunction SetVolume(Pos)\r\n{\r\neval(Real+\'Volume=Pos\');\r\n}\r\nfunction SetFastForward()\r\n{\r\nif (rPlayer.CanScan)\r\neval(Real+\'FastForward()\');\r\n}\r\nfunction SetFastReverse()\r\n{\r\nif (rPlayer.CanScan)\r\neval(Real+\'FastReverse()\');\r\n}\r\nfunction GetLength()\r\n{\r\nreturn eval(Real+\'GetLength()\');\r\n}\r\nfunction GetPosition()\r\n{\r\ntt=eval(Real+\'GetPosition()\');\r\nreturn tt*1000;\r\n}\r\nfunction SetMute(Status)\r\n{\r\nif (Status)\r\n{\r\neval(Real+\'Mute=true\');\r\n}\r\nelse\r\neval(Real+\'Mute=false\');\r\neval(Real+\'Play()\');\r\n}\r\nfunction FastpositionSet() {\r\n  if(window.rPlayer!=null)\r\n  {\r\n var iLength=rPlayer.GetLength();\r\n var iPosition=rPlayer.GetPosition();\r\n var FastPosition=iLength/20;\r\n if ((iPosition+FastPosition)<=iLength) \r\n {\r\n   iPosition=iPosition+FastPosition;\r\n   rPlayer.SetPosition(iPosition);\r\n }\r\n  }  \r\n  }  \r\nfunction BackpositionSet() {\r\nif(window.rPlayer!=null)\r\n  {\r\n var iLength=rPlayer.GetLength();\r\n var iPosition=rPlayer.GetPosition();\r\n var BackPosition=iLength/20;\r\n if (iPosition>=BackPosition) \r\n {\r\n   iPosition=iPosition-BackPosition;\r\n   rPlayer.SetPosition(iPosition);\r\n }\r\n  }\r\n}\r\nfunction ClickSound(aa)\r\n{\r\nif (Mute)\r\n{\r\nMute=false;\r\nSetMute(Mute);\r\naa.src=\'{$WSLM[siteurl]}images/mediaplayer/toole_08_over.gif\';\r\n}\r\nelse\r\n{\r\nMute=true;\r\nSetMute(Mute);\r\naa.src=\'{$WSLM[siteurl]}images/mediaplayer/toole_08_down.gif\';\r\n}\r\n}\r\n\r\n\r\n//------------------------\r\n\r\nvar PauseStatus = 0;\r\nvar Fill = false;\r\nvar Playing=true;\r\nfunction Playorpasue()\r\n{\r\nif (Playing)\r\n{\r\npause();\r\n}\r\nelse\r\n{\r\nplay();\r\n}\r\n}\r\n\r\nfunction Stop() {\r\n\r\n{\r\nrPlayer.DoStop();\r\nif (Playing)\r\n{\r\nPlaying = false;\r\npp001.src = "{$WSLM[siteurl]}images/mediaplayer/toole_03.gif";\r\npp001.onmouseover=new Function("this.src = \'{$WSLM[siteurl]}images/mediaplayer/toole_03_over.gif\'");\r\npp001.onmouseout=new Function("this.src = \'{$WSLM[siteurl]}images/mediaplayer/toole_03.gif\'");\r\n}\r\nif (PauseStatus==0)\r\n{\r\nPauseStatus = 1;\r\n}\r\nmblock.style.left=0;\r\n\r\n}\r\n}\r\n\r\nfunction pause(){\r\npp001.src = "{$WSLM[siteurl]}images/mediaplayer/toole_03.gif";\r\npp001.onmouseover=new Function("this.src = \'{$WSLM[siteurl]}images/mediaplayer/toole_03_over.gif\'");\r\npp001.onmouseout=new Function("this.src = \'{$WSLM[siteurl]}images/mediaplayer/toole_03.gif\'");\r\nPlaying = false;\r\n\r\n{\r\n   \r\n{\r\nif (PauseStatus==0)\r\n{\r\nPauseStatus = 1;\r\n}\r\n rPlayer.DoPause();\r\n}\r\n}\r\n}\r\nfunction play(){\r\npp001.src = "{$WSLM[siteurl]}images/mediaplayer/toole_04.gif";\r\npp001.onmouseover=new Function("this.src = \'{$WSLM[siteurl]}images/mediaplayer/toole_04_over.gif\'");\r\npp001.onmouseout=new Function("this.src = \'{$WSLM[siteurl]}images/mediaplayer/toole_04.gif\'");\r\nPlaying = true;\r\n\r\n{\r\nif (PauseStatus==1)\r\n{\r\nPauseStatus = 0;\r\n}\r\n rPlayer.DoPlay();\r\n}\r\n}\r\n\r\n//-----------------\r\n\r\nfunction DoFill()\r\n{//最大化/还原窗口\r\nif (Fill) \r\n{//还原窗口\r\nwindow.movieeTo((screen.width-b_width)/2,(screen.height-b_height)/2);\r\nwindow.resizeTo(b_width+width_add,b_height+height_add);\r\nfill001.src = "{$WSLM[siteurl]}images/mediaplayer/Header_06.gif";\r\nFill = false;\r\nfill001.alt = "最大化";\r\n}\r\nelse \r\n{//最大化窗口\r\nwindow.movieeTo(0,0);\r\nb_width = document.body.clientWidth;\r\nb_height = document.body.clientHeight;\r\nwindow.resizeTo(screen.width,screen.height);\r\nfill001.src = "{$WSLM[siteurl]}images/mediaplayer/Header_08.gif";\r\nFill = true;\r\nfill001.alt = "还原";\r\n}\r\n}\r\n\r\nfunction closewin()\r\n{//关闭窗口\r\n  \r\nrPlayer.DoStop();\r\n  window.close();\r\n}\r\n\r\nfunction DoFull()\r\n{//全屏播放\r\neval(Real+\'SetFullScreen()\');\r\n}\r\n\r\nfunction DoMin() \r\n{//最小化窗口\r\noldwidth=window.screenLeft;\r\noldheight=window.screenTop;\r\nwindow.movieeTo(-2000,-2000);\r\nwindow.attachEvent("onfocus",res);\r\n}\r\nfunction res() {\r\nwindow.movieeTo(oldwidth,oldheight);\r\nwindow.detachEvent("onfocus",res)\r\n}\r\n</Script>\r\n\r\n<script language="VBScript">\r\n\r\nsub Mute\r\n   imagesrc=document.all("silent").src\r\n   singlechar=mid(imagesrc,instr(imagesrc,".gif")-1,1)\r\n   if singlechar="8" then\r\n   document.all("silent").src="{$WSLM[siteurl]}images/mediaplayer/toole_08_down.gif"\r\n   document.all("silent").alt="恢复"\r\n   else\r\n   document.all("silent").src="{$WSLM[siteurl]}images/mediaplayer/toole_08.gif"\r\n   document.all("silent").alt="静音"\r\n   end if\r\n   rPlayer.setMute(not rPlayer.GetMute())\r\nend sub\r\n</script>\r\n\r\n<script for="window" event="onresize" LANGUAGE="JavaScript">\r\n//改变窗口大小了限制\r\nif (toole.style.display==\'block\' && ((document.body.clientWidth<440) || (document.body.clientHeight<300+hand_add)))\r\n{\r\n   window.resizeTo(440+width_add,428+height_add+hand_add);\r\n}\r\nif (toole.style.display==\'none\' && ((document.body.clientWidth<262) || (document.body.clientHeight<252+hand_add)))\r\n{\r\n   window.resizeTo(262+width_add,252+height_add+hand_add);\r\n}\r\n//Image1.style.height = MP1.style.pixelHeight-24;\r\n</script>\r\n<SCRIPT FOR="rPlayer" EVENT="PlayStateChange(lOldState, lNewState)" LANGUAGE="JavaScript">\r\nif (lNewState==0 || lNewState==8){\r\nPlayorpasue();\r\n}\r\n</SCRIPT>\r\n\r\n<SCRIPT FOR="rPlayer" EVENT="OpenStateChange(lOldState, lNewState)" LANGUAGE="JavaScript">\r\nif (lNewState==0){\r\nPlayorpasue();\r\n}\r\n</SCRIPT>\r\n\r\n<SCRIPT FOR="rPlayer" EVENT="Error()" LANGUAGE="JavaScript">\r\nif (rPlayer.ErrorCode==-1072889837)\r\nPlay_Mess.innerHTML="<font color=red size=3>无法连接到服务器，可能是网络问题，请重试。</font>";\r\nif (rPlayer.ErrorCode==-2147220992)\r\nPlay_Mess.innerHTML="<font color=red size=3>没有适当的解码器，请重试或安装新的微软播放器。</font>";\r\nif (rPlayer.ErrorCode==-2147220945)\r\nPlay_Mess.innerHTML="<font color=red size=3>文件格式错，请通知我们，我们将尽快进行维修。</font>";\r\nif (rPlayer.ErrorCode==-1072889830)\r\nPlay_Mess.innerHTML="<font color=red size=3>文件打不开，请通知我们，我们将尽快进行维修。</font>";\r\nif (rPlayer.ErrorCode==-2146697211)\r\nPlay_Mess.innerHTML="<font color=red size=3>无法访问这个服务器，可能是代理服务器不可用。</font>";\r\nif (rPlayer.ErrorCode==-1072887822)\r\nPlay_Mess.innerHTML="<font color=red size=3>无法连接到一个广播频道。</font>";\r\n</SCRIPT>\r\n\r\n<SCRIPT FOR="rPlayer" EVENT="Warning(lType, lParam, sDescription)" LANGUAGE="JScript">\r\nPlay_Mess.innerHTML="<font color=red size=3>"+sDescription+"</font>";\r\n</SCRIPT>\r\n\r\n<SCRIPT LANGUAGE="VBScript">\r\nSub rplayer_OnBuffering(lFlags,lPercentage)\r\n  if (lPercentage=100) then\r\n  StartPlay=false\r\n  if (FirstPlay) then\r\n///Image1.style.visibility = "visible"\r\n  else\r\nMP1.style.visibility = "visible"\r\n//Image1.style.visibility = "hidden"\r\n  end if\r\n  exit sub\r\n  end if\r\nEnd Sub\r\nSub rplayer_OnErrorMessage(uSeverity, uRMACode, uUserCode, pUserString, pMoreInfoURL, pErrorString)\r\nselect case rPlayer.GetLastErrorRMACode()\r\ncase -2147221496\r\n  window.alert("您的网络繁忙暂时中断！")\r\ncase -2147221433,-2147221428,-2147221417,-2147217468\r\n  window.alert("您的网络繁忙暂时中断！")\r\ncase else\r\n  window.alert("在线用户过多，服务器限制，请抢线或稍后观看！")\r\nend select\r\nend sub\r\n</SCRIPT>\r\n\r\n<script language="JavaScript">\r\nvar dragapproved=false;\r\nvar eventsource,x,y;\r\nfunction moviee()\r\n{//移动窗口\r\n  if (event.button==1&&dragapproved) //改变被拖动元素在页面上的位置\r\n  {\r\ntop.window.movieeBy(event.clientX-x, event.clientY-y);\r\nreturn false;\r\n  }\r\n}\r\nfunction size()\r\n{//改变窗口大小\r\n  if (event.button==1&&dragapproved) \r\n  {\r\ntop.window.resizeTo(event.clientX+5+width_add-jjjj, event.clientY+5+height_add-jjjj);\r\nreturn false;\r\n  }\r\n}\r\nfunction drags()\r\n{\r\n  if (event.srcElement.className=="drag") //捕捉鼠标和被拖动元素的当前位置\r\n  {\r\ndragapproved=true;\r\nx=event.clientX;\r\ny=event.clientY;\r\ndocument.onmousemoviee=moviee;\r\n  }\r\n  if (event.srcElement.className=="rs001") //捕捉鼠标和被拖动元素的当前位置\r\n  {\r\ndragapproved=true;\r\ndocument.onmousemoviee=size;\r\n  }\r\n}\r\n\r\ndocument.onmousedown=drags;   //鼠标左键按下时,准备拖动\r\ndocument.onmouseup=new Function("dragapproved=false");//鼠标左键放开时,拖动停止\r\n\r\nfunction mini(type)\r\n{//精简与正常窗口切换\r\n  if (type==1)\r\n  {\r\ntoole.style.display=\'none\';\r\nscroll01.style.display=\'none\';\r\nminitoole.style.display=\'block\';\r\nwindow.resizeTo(333+width_add,305+height_add+hand_add);\r\n  }\r\n  if (type==0)\r\n  {\r\ntoole.style.display=\'block\';\r\nscroll01.style.display=\'block\';\r\nminitoole.style.display=\'none\';\r\nwindow.resizeTo((440+width_add),428+height_add+hand_add);\r\n  }\r\n}\r\n\r\n//-----------------\r\n\r\n//显示影片进度条时间\r\nfunction scrollPositionMousemoviee(obj, event)\r\n{\r\n  iCurrentX=event.x;\r\n  if(parseInt(iCurrentX)>=movieelen+20)\r\nreturn;\r\n  if(window.MP1!=null)\r\n  {\r\niTotalTime=GetLength();\r\niPlayTime=parseInt(iCurrentX*iTotalTime/(movieelen+20));\r\nHour=parseInt(iPlayTime/(60*60*1000));\r\nMin=parseInt((iPlayTime-Hour*60*60*1000)/(60*1000));\r\nSec=parseInt((iPlayTime-Hour*60*60*1000-Min*60*1000)/1000);\r\nif(String(Hour).length<2)\r\n  strHour="0"+String(Hour);\r\nelse\r\n  strHour=String(Hour);\r\nif(String(Min).length<2)\r\n  strMin="0"+String(Min);\r\nelse\r\n  strMin=String(Min);\r\nif(String(Sec).length<2)\r\n  strSec="0"+String(Sec);\r\nelse\r\n  strSec=+String(Sec);\r\n \r\nif(Hour!=0)\r\nscrollInfo.replaceAdjacentText("afterBegin",strHour+":"+strMin+":"+strSec);\r\nelse\r\nscrollInfo.replaceAdjacentText("afterBegin",strMin+":"+strSec);\r\n\r\nscrollInfo.style.top=event.y+12;\r\nscrollInfo.style.left=event.x+15;\r\nscrollInfo.style.visibility = "visible";\r\n  }\r\n}\r\nfunction scrollPositionMouseOut()\r\n{\r\n  scrollInfo.style.visibility = "hidden";\r\n}\r\n\r\n//---------------------\r\n\r\nfunction onLond001()\r\n{\r\n  setvol();\r\n  ballmoviee();\r\n}\r\n\r\n</script>\r\n  \r\n</head>\r\n<body bgcolor="#000000" scroll="no" leftmargin="0" topmargin="0" onLoad="onLond001();" onkeydown="no_newwin()">\r\n<center>\r\n<TABLE width="100%" height="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">\r\n<TR>\r\n<TD colspan="3">\r\n<table id="mini_head" border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse; display: block;" bordercolor="#111111" width="100%">\r\n<tr>\r\n<td background="{$WSLM[siteurl]}images/mediaplayer/mini_Header_02.gif">\r\n<img border="0" src="{$WSLM[siteurl]}images/mediaplayer/mini_Header_01.gif" width="4" height="6"></td>\r\n<td background="{$WSLM[siteurl]}images/mediaplayer/mini_Header_02.gif" align="right">\r\n<img border="0" src="{$WSLM[siteurl]}images/mediaplayer/mini_Header_03.gif" width="3" height="6"></td>\r\n</tr>\r\n</table>\r\n<table id="head" border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse; display: none;" bordercolor="#111111" width="100%">\r\n<tr>\r\n<td background="{$WSLM[siteurl]}images/mediaplayer/Header_02.gif">\r\n<img border="0" src="{$WSLM[siteurl]}images/mediaplayer/Header_01.gif" width="135" height="20" onmouseover="this.style.cursor=\'moviee\'" id="mydiv1" class="drag" alt="移动窗口"><img border="0" src="{$WSLM[siteurl]}images/mediaplayer/Header_03.gif" width="2" height="20"></td>\r\n<td background="{$WSLM[siteurl]}images/mediaplayer/Header_02.gif"></td>\r\n<td align="right" background="{$WSLM[siteurl]}images/mediaplayer/Header_02.gif">\r\n<img border="0" src="{$WSLM[siteurl]}images/mediaplayer/Header_07.gif" align="absmiddle" width="9" height="9" alt="最小化" onmousedown="DoMin()" onmouseover="this.style.cursor=\'hand\'"><img border="0" src="{$WSLM[siteurl]}images/mediaplayer/1pix.gif" width="8" height="1"><img border="0" src="{$WSLM[siteurl]}images/mediaplayer/Header_06.gif" align="absmiddle" width="9" height="9" id="fill001" ALT="最大化" onmousedown="DoFill()" onmouseover="this.style.cursor=\'hand\'"><img border="0" src="{$WSLM[siteurl]}images/mediaplayer/1pix.gif" width="10" height="1"><img border="0" src="{$WSLM[siteurl]}images/mediaplayer/Header_05.gif" align="absmiddle" width="9" height="9" ALT="关闭窗口" onmousedown="closewin()" onmouseover="this.style.cursor=\'hand\'"><img border="0" src="{$WSLM[siteurl]}images/mediaplayer/1pix.gif" width="3" height="1"><img border="0" src="{$WSLM[siteurl]}images/mediaplayer/Header_04.gif" align="absmiddle" width="5" height="20" onmouseover="this.style.cursor=\'hand\'"></td>\r\n</tr>\r\n</table>\r\n<Script language="JavaScript">\r\nif (!ie6)\r\n{\r\nmini_head.style.display = "none";\r\nhead.style.display = "block";\r\n}\r\n</Script>\r\n</TD>\r\n</TR>\r\n<TR>\r\n<TD background="{$WSLM[siteurl]}images/mediaplayer/player_01.gif"><IMG SRC="images/Spacer.gif" WIDTH="7" HEIGHT="1" id="left002"></TD>\r\n<TD><IMG SRC="{$WSLM[siteurl]}images/mediaplayer/1pix.gif" WIDTH="200" HEIGHT="1" id="temp002"></TD>\r\n<TD background="{$WSLM[siteurl]}images/mediaplayer/player_02.gif" style="background-position:right;"><IMG SRC="images/Spacer.gif" WIDTH="6" HEIGHT="1" id="right002"></TD>\r\n</TR>\r\n<TR>\r\n<TD background="{$WSLM[siteurl]}images/mediaplayer/player_01.gif" width="7" HEIGHT="99%" id="left001"></TD>\r\n<TD width="99%">\r\n<DIV id="MP1" style="HEIGHT: 100%; POSITION: relative; TOP: 0px; WIDTH: 100%; Z-INDEX: 1;">\r\n<object ID="rPlayer" CLASSID="clsid:CFCDAA03-8BE4-11cf-B84B-0020AFBBCCFA" HEIGHT="100%" WIDTH="100%">\r\n  <param name="_ExtentX" value="20055">\r\n  <param name="_ExtentY" value="7064">\r\n  <param name="AUTOSTART" value="-1">\r\n  <param name="SHUFFLE" value="0">\r\n  <param name="PREFETCH" value="0">\r\n  <param name="NOLABELS" value="0">\r\n  <param name="SRC" value="{$filepath}">\r\n  <param name="CONTROLS" value="ImageWindow">\r\n  <param name="CONSOLE" value="Clip1">\r\n  <param name="LOOP" value="0">\r\n  <param name="NUMLOOP" value="0">\r\n  <param name="CENTER" value="0">\r\n  <param name="MAINTAINASPECT" value="0">\r\n  <param name="BACKGROUNDCOLOR" value="#000000">\r\n  </object>\r\n</DIV>\r\n<script language="javascript"> \r\nrPlayer.SetEnableContextMenu(false);\r\nrPlayer.SetWantErrors(true);\r\n</script>\r\n</TD>\r\n<TD background="{$WSLM[siteurl]}images/mediaplayer/player_02.gif" style="background-position:right;" width="6" HEIGHT="99%" id="right001"></TD>\r\n</TR>\r\n<tr>\r\n<td colspan="3">\r\n<table id="scroll01" border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%">\r\n<tr>\r\n<td background="{$WSLM[siteurl]}images/mediaplayer/scroll_02.gif" width="3%">\r\n<img border="0" src="{$WSLM[siteurl]}images/mediaplayer/scroll_01.gif" width="3" height="15"></td>\r\n<td background="{$WSLM[siteurl]}images/mediaplayer/scroll_02.gif" width="2%" align="right">\r\n<img border="0" src="{$WSLM[siteurl]}images/mediaplayer/scroll_03.gif" width="2" height="15"></td>\r\n<td background="{$WSLM[siteurl]}images/mediaplayer/scroll_04.gif" width="70%">\r\n<DIV onmouseup="Total_Up()" onmousemoviee="scrollPositionMousemoviee(this, event)" onmouseout="scrollPositionMouseOut()" onmousedown="ChangePos()" id="movie" style="CURSOR: hand; POSITION: relative; TOP: 1px; LEFT: 0px; WIDTH: 100%; HEIGHT: 8px"><DIV id="mblock" style="LEFT: 0px; POSITION: absolute; TOP: 0px; HEIGHT: 8px"><IMG alt="播放进度" src="{$WSLM[siteurl]}images/mediaplayer/scroll_07.gif" width="20" height="8" border="0"></DIV>\r\n<DIV id="scrollInfo" style="BORDER: orange 1px ridge; FONT-SIZE: 9px; VISIBILITY: hidden; BACKGROUND: #c0c0c0; POSITION: absolute; zIndex: 9">00:00</DIV>\r\n</DIV>\r\n</td>\r\n<td background="{$WSLM[siteurl]}images/mediaplayer/scroll_02.gif" width="10%">\r\n<img border="0" src="{$WSLM[siteurl]}images/mediaplayer/scroll_05.gif" width="2" height="15"></td>\r\n<td align="center" background="{$WSLM[siteurl]}images/mediaplayer/scroll_02.gif" width="9%">\r\n<img border="0" src="{$WSLM[siteurl]}images/mediaplayer/scroll_08.gif" width="2" height="14"><img border="0" src="{$WSLM[siteurl]}images/mediaplayer/1pix.gif" width="1" height="1"><img border="0" src="{$WSLM[siteurl]}images/mediaplayer/scroll_09.gif" width="7" height="15" alt="左声道" onmousedown="rPlayer.Balance=-10000" onmouseover="this.style.cursor=\'hand\'"><img border="0" src="{$WSLM[siteurl]}images/mediaplayer/1pix.gif" width="1" height="1"><img border="0" src="{$WSLM[siteurl]}images/mediaplayer/scroll_08.gif" width="2" height="14"><img border="0" src="{$WSLM[siteurl]}images/mediaplayer/1pix.gif" width="1" height="1"><img border="0" src="{$WSLM[siteurl]}images/mediaplayer/scroll_10.gif" width="7" height="15" alt="立体声" onmousedown="rPlayer.Balance=0" onmouseover="this.style.cursor=\'hand\'"><img border="0" src="{$WSLM[siteurl]}images/mediaplayer/1pix.gif" width="1" height="1"><img border="0" src="{$WSLM[siteurl]}images/mediaplayer/scroll_08.gif" width="2" height="14"><img border="0" src="{$WSLM[siteurl]}images/mediaplayer/1pix.gif" width="1" height="1"><img border="0" src="{$WSLM[siteurl]}images/mediaplayer/scroll_11.gif" width="7" height="15" alt="右声道" onmousedown="rPlayer.Balance=10000" onmouseover="this.style.cursor=\'hand\'"><img border="0" src="{$WSLM[siteurl]}images/mediaplayer/1pix.gif" width="1" height="1"><img border="0" src="{$WSLM[siteurl]}images/mediaplayer/scroll_08.gif" width="2" height="14"></td>\r\n<td align="right" background="{$WSLM[siteurl]}images/mediaplayer/scroll_02.gif" width="6%">\r\n<img border="0" src="{$WSLM[siteurl]}images/mediaplayer/scroll_06.gif" width="4" height="15"></td>\r\n</tr>\r\n</table>\r\n<table id="toole" border="0" cellpadding="0" cellspacing="0" style="display:block; border-collapse: collapse" bordercolor="#111111" width="100%" background="{$WSLM[siteurl]}images/mediaplayer/toole_02.gif">\r\n<tr>\r\n<td background="{$WSLM[siteurl]}images/mediaplayer/toole_02.gif">\r\n<img border="0" src="{$WSLM[siteurl]}images/mediaplayer/toole_01.gif" width="4" height="49"><img border="0" src="{$WSLM[siteurl]}images/mediaplayer/1pix.gif" width="10" height="1"><img id="pp001" border="0" src="{$WSLM[siteurl]}images/mediaplayer/toole_04.gif" width="36" height="49" ALT="播放" onmousedown="Playorpasue()" onmouseout="this.src=\'{$WSLM[siteurl]}images/mediaplayer/toole_04.gif\'" onmouseover="this.src=\'{$WSLM[siteurl]}images/mediaplayer/toole_04_over.gif\';this.style.cursor=\'hand\'"><img border="0" src="{$WSLM[siteurl]}images/mediaplayer/toole_05.gif" width="25" height="49" ALT="停止" onmousedown="Stop()" onmouseout="this.src=\'{$WSLM[siteurl]}images/mediaplayer/toole_05.gif\'" onmouseover="this.src=\'{$WSLM[siteurl]}images/mediaplayer/toole_05_over.gif\';this.style.cursor=\'hand\'"><img border="0" src="{$WSLM[siteurl]}images/mediaplayer/1pix.gif" width="10" height="1"><img border="0" src="{$WSLM[siteurl]}images/mediaplayer/toole_06.gif" width="25" height="49" ALT="快退" onmousedown="BackpositionSet()" onmouseout="this.src=\'{$WSLM[siteurl]}images/mediaplayer/toole_06.gif\'" onmouseover="this.src=\'{$WSLM[siteurl]}images/mediaplayer/toole_06_over.gif\';this.style.cursor=\'hand\'"><img border="0" src="{$WSLM[siteurl]}images/mediaplayer/toole_07.gif" width="25" height="49" ALT="快进" onmousedown="FastpositionSet()" onmouseout="this.src=\'{$WSLM[siteurl]}images/mediaplayer/toole_07.gif\'" onmouseover="this.src=\'{$WSLM[siteurl]}images/mediaplayer/toole_07_over.gif\';this.style.cursor=\'hand\'"><img border="0" src="{$WSLM[siteurl]}images/mediaplayer/1pix.gif" width="6" height="1"></td>\r\n<td background="{$WSLM[siteurl]}images/mediaplayer/toole_02.gif" align="right">\r\n<img src="{$WSLM[siteurl]}images/mediaplayer/toole_08.gif" style="cursor:hand;" alt="静音" name="silent" width="26" height="49" onclick="vbscript:Mute" border="0"></td>\r\n<td background="{$WSLM[siteurl]}images/mediaplayer/toole_02.gif" style="background-repeat: no-repeat;">\r\n<DIV onmouseup="Total_Up()" onmousemoviee="volgo()" id="volume" style="LEFT: 0px; WIDTH: 70px; POSITION: relative;HEIGHT: 23px" valgin="top" align="center"><DIV id="vblock"><IMG src="{$WSLM[siteurl]}images/mediaplayer/toole_16.gif" width="25" height="49" border="0" ALT="减小音量" onmousedown="RealdecreseVolume()" onmouseout="this.src=\'{$WSLM[siteurl]}images/mediaplayer/toole_16.gif\'" onmouseover="this.src=\'{$WSLM[siteurl]}images/mediaplayer/toole_16_over.gif\';this.style.cursor=\'hand\'"><IMG src="{$WSLM[siteurl]}images/mediaplayer/toole_17.gif" width="25" height="49" border="0" ALT="增强音量" onmousedown="RealincreaseVolume()" onmouseout="this.src=\'{$WSLM[siteurl]}images/mediaplayer/toole_17.gif\'" onmouseover="this.src=\'{$WSLM[siteurl]}images/mediaplayer/toole_17_over.gif\';this.style.cursor=\'hand\'"></DIV>\r\n</DIV>\r\n</td>\r\n<td background="{$WSLM[siteurl]}images/mediaplayer/toole_12.gif" style="background-repeat: no-repeat;">\r\n<MARQUEE id="Play_Mess" WIDTH="100" SCROLLAMOUNT="8" SCROLLDELAY="200" style="margin-left: 8; margin-right: 10;"><FONT color=#284717 size=2>{$WSLM[sitename]}欢迎您观看：</FONT></MARQUEE>\r\n</td>\r\n<td background="{$WSLM[siteurl]}images/mediaplayer/toole_02.gif">\r\n<img border="0" src="{$WSLM[siteurl]}images/mediaplayer/1pix.gif" width="6" height="1"><img border="0" src="{$WSLM[siteurl]}images/mediaplayer/toole_09.gif" width="25" height="49" alt="全屏播放" onmousedown="DoFull()" onmouseout="this.src=\'{$WSLM[siteurl]}images/mediaplayer/toole_09.gif\'" onmouseover="this.src=\'{$WSLM[siteurl]}images/mediaplayer/toole_09_over.gif\';this.style.cursor=\'hand\'"><img border="0" src="{$WSLM[siteurl]}images/mediaplayer/toole_10.gif" width="25" height="49" alt="精简模式" onclick="mini(1);" onmouseout="this.src=\'{$WSLM[siteurl]}images/mediaplayer/toole_10.gif\'" onmouseover="this.src=\'{$WSLM[siteurl]}images/mediaplayer/toole_10_over.gif\';this.style.cursor=\'hand\'"></td>\r\n<td background="{$WSLM[siteurl]}images/mediaplayer/toole_02.gif" align="right">\r\n<img border="0" src="{$WSLM[siteurl]}images/mediaplayer/toole_13.gif" width="13" height="17" onmouseover="this.style.cursor=\'se-resize\'" id="mydiv100" class="rs001" alt="改变窗口大小"><img border="0" src="{$WSLM[siteurl]}images/mediaplayer/toole_14.gif" width="4" height="49"></td>\r\n</tr>\r\n</table>\r\n<table id="minitoole" border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse; display:none;" bordercolor="#111111" width="100%">\r\n<tr>\r\n<td width="33%" background="{$WSLM[siteurl]}images/mediaplayer/miniToole_02.gif">\r\n<img border="0" src="{$WSLM[siteurl]}images/mediaplayer/miniToole_01.gif" width="3" height="20"><img border="0" src="{$WSLM[siteurl]}images/mediaplayer/1pix.gif" width="10" height="1"><img border="0" src="{$WSLM[siteurl]}images/mediaplayer/miniToole_03.gif" width="6" height="20"><img border="0" src="{$WSLM[siteurl]}images/mediaplayer/miniToole_03.gif" width="6" height="20"><img border="0" src="{$WSLM[siteurl]}images/mediaplayer/miniToole_04.gif" width="18" height="20" ALT="播放" onmousedown="play()" onmouseover="this.style.cursor=\'hand\'"><img border="0" src="{$WSLM[siteurl]}images/mediaplayer/miniToole_03.gif" width="6" height="20"><img border="0" src="{$WSLM[siteurl]}images/mediaplayer/miniToole_05.gif" width="18" height="20" ALT="暂停" onmousedown="pause()" onmouseover="this.style.cursor=\'hand\'"><img border="0" src="{$WSLM[siteurl]}images/mediaplayer/miniToole_03.gif" width="6" height="20"><img border="0" src="{$WSLM[siteurl]}images/mediaplayer/miniToole_06.gif" width="18" height="20" ALT="停止" onmousedown="Stop()" onmouseover="this.style.cursor=\'hand\'"><img border="0" src="{$WSLM[siteurl]}images/mediaplayer/miniToole_03.gif" width="6" height="20"><img border="0" src="{$WSLM[siteurl]}images/mediaplayer/miniToole_03.gif" width="6" height="20"><img border="0" src="{$WSLM[siteurl]}images/mediaplayer/miniToole_07.gif" width="18" height="20" ALT="快退" onmousedown="BackpositionSet()" onmouseover="this.style.cursor=\'hand\'"><img border="0" src="{$WSLM[siteurl]}images/mediaplayer/miniToole_03.gif" width="6" height="20"><img border="0" src="{$WSLM[siteurl]}images/mediaplayer/miniToole_08.gif" width="18" height="20" ALT="快进" onmousedown="FastpositionSet()" onmouseover="this.style.cursor=\'hand\'"><img border="0" src="{$WSLM[siteurl]}images/mediaplayer/miniToole_03.gif" width="6" height="20"><img border="0" src="{$WSLM[siteurl]}images/mediaplayer/miniToole_03.gif" width="6" height="20"><img border="0" src="{$WSLM[siteurl]}images/mediaplayer/miniToole_09.gif" width="33" height="20" alt="全屏播放" onmousedown="DoFull()" onmouseover="this.style.cursor=\'hand\'"><img border="0" src="{$WSLM[siteurl]}images/mediaplayer/miniToole_03.gif" width="6" height="20"><img border="0" src="{$WSLM[siteurl]}images/mediaplayer/miniToole_10.gif" width="33" height="20" alt="正常模式" onclick="mini(0);" onmouseover="this.style.cursor=\'hand\'"><img border="0" src="{$WSLM[siteurl]}images/mediaplayer/miniToole_03.gif" width="6" height="20"><img border="0" src="{$WSLM[siteurl]}images/mediaplayer/miniToole_03.gif" width="6" height="20"></td>\r\n<td width="33%" background="{$WSLM[siteurl]}images/mediaplayer/miniToole_02.gif">\r\n</td>\r\n<td width="34%" background="{$WSLM[siteurl]}images/mediaplayer/miniToole_02.gif" align="right">\r\n<img class="rs001" border="0" src="{$WSLM[siteurl]}images/mediaplayer/miniToole_12.gif" width="8" height="11" onmouseover="this.style.cursor=\'se-resize\'" alt="改变窗口大小"><img border="0" src="{$WSLM[siteurl]}images/mediaplayer/miniToole_11.gif" width="3" height="20"></td>\r\n</tr>\r\n</table>\r\n</td>\r\n</tr>\r\n</TABLE>\r\n', 0),
	(4, 'Flv播放器', '<object type="application/x-shockwave-flash" data="{$WSLM[siteurl]}images/flvplayer.swf" width="100%" height="100%">\r\n  <param name="movie" value="{$WSLM[siteurl]}images/flvplayer.swf?autostart=true&file={$filepath}">\r\n</object>', 0),
	(5, 'flash 播放器', '<object width="100%" height="100%"><param name="movie" value="{$filepath}"></param><param name="allowscriptaccess" value="always"><embed src="{$filepath}" type="application/x-shockwave-flash" width="100%" height="100%"></embed></object>\r\n', 0);
/*!40000 ALTER TABLE `mg_player` ENABLE KEYS */;


# Dumping structure for table 004_jdweb.mg_position
DROP TABLE IF EXISTS `mg_position`;
CREATE TABLE IF NOT EXISTS `mg_position` (
  `posid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '',
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`posid`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

# Dumping data for table 004_jdweb.mg_position: 0 rows
DELETE FROM `mg_position`;
/*!40000 ALTER TABLE `mg_position` DISABLE KEYS */;
/*!40000 ALTER TABLE `mg_position` ENABLE KEYS */;


# Dumping structure for table 004_jdweb.mg_process
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

# Dumping data for table 004_jdweb.mg_process: 1 rows
DELETE FROM `mg_process`;
/*!40000 ALTER TABLE `mg_process` DISABLE KEYS */;
INSERT INTO `mg_process` (`processid`, `workflowid`, `name`, `description`, `passname`, `passstatus`, `rejectname`, `rejectstatus`) VALUES
	(8, 1, '审核', '', '通过', 99, '删除', 0);
/*!40000 ALTER TABLE `mg_process` ENABLE KEYS */;


# Dumping structure for table 004_jdweb.mg_process_status
DROP TABLE IF EXISTS `mg_process_status`;
CREATE TABLE IF NOT EXISTS `mg_process_status` (
  `processid` smallint(5) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL,
  KEY `processid` (`processid`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# Dumping data for table 004_jdweb.mg_process_status: 20 rows
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


# Dumping structure for table 004_jdweb.mg_role
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

# Dumping data for table 004_jdweb.mg_role: 5 rows
DELETE FROM `mg_role`;
/*!40000 ALTER TABLE `mg_role` DISABLE KEYS */;
INSERT INTO `mg_role` (`roleid`, `name`, `description`, `ipaccess`, `listorder`, `disabled`) VALUES
	(1, '超级管理员', '超级管理员', '', 0, 0),
	(2, '总编', '拥有所有栏目和所有专题的所有权限，并且可以添加栏目和专题', '', 0, 0),
	(3, '栏目编辑', '拥有某些栏目的信息录入、审核及管理权限，需要进一步详细设置。', '', 0, 0),
	(4, '设计师', '拥有模板与标签管理权限', '', 0, 0),
	(5, '财务人员', '拥有订单查看、录入银行汇款、开发票等权限。', '', 0, 0);
/*!40000 ALTER TABLE `mg_role` ENABLE KEYS */;


# Dumping structure for table 004_jdweb.mg_search
DROP TABLE IF EXISTS `mg_search`;
CREATE TABLE IF NOT EXISTS `mg_search` (
  `searchid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(15) NOT NULL,
  `data` mediumtext NOT NULL,
  PRIMARY KEY (`searchid`),
  KEY `type` (`type`),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM AUTO_INCREMENT=120 DEFAULT CHARSET=utf8;

# Dumping data for table 004_jdweb.mg_search: 42 rows
DELETE FROM `mg_search`;
/*!40000 ALTER TABLE `mg_search` DISABLE KEYS */;
INSERT INTO `mg_search` (`searchid`, `type`, `data`) VALUES
	(118, 'use', '家电产业 家电 产业 家电 产业 1'),
	(119, 'use', '航空产业 航空 产业 航空 产业 1'),
	(116, 'product', '树脂保持器 树脂 保持 器 树脂 保持 器'),
	(117, 'product', '聊城市金帝集团是目前国内生产规模最大 聊 城市 金 帝 集团 是目前 国内 生产 规模 最大 聊 城市 金 帝 集团 是目前 国内 生产 规模 最大'),
	(114, 'thumbnews', '目前国内规模最大的保持器生产厂家,现正在进行 目前 国内 规模 最大 的 保持 器生产 厂家 , 现正 在 进行 目前 国内 规模 最大 的 保持 器生产 厂家 , 现正 在 进行'),
	(115, 'thumbnews', '产品主要面向国内外中高端市场产品主要面向国内外中高端市场产品主要面向国内外中高端市场 产品 主要 面向 国内 外中 高端 市场 产品 主要 面向 国内 外中 高端 市场 产品 主要 面向 国内 外中 高端 市场 产品 主要 面向 国内 外中 高端 市场 产品 主要 面向 国内 外中 高端 市场 产品 主要 面向 国内 外中 高端 市场'),
	(113, 'thumbnews', '规模最大的保持器生产厂家,现正在进行目前国内规模最大的保持器生产厂家,现正在进 规模 最大 的 保持 器生产 厂家 , 现正 在 进行 目前 国内 规模 最大 的 保持 器生产 厂家 , 现正 在 进 规模 最大 的 保持 器生产 厂家 , 现正 在 进行 目前 国内 规模 最大 的 保持 器生产 厂家 , 现正 在 进'),
	(112, 'thumbnews', '目前国内规模最大的保持器生产厂家,现正在进行目前国内规模最大的保持器生产厂家,现正在进行 目前 国内 规模 最大 的 保持 器生产 厂家 , 现正 在 进行 目前 国内 规模 最大 的 保持 器生产 厂家 , 现正 在 进行 目前 国内 规模 最大 的 保持 器生产 厂家 , 现正 在 进行 目前 国内 规模 最大 的 保持 器生产 厂家 , 现正 在 进行'),
	(110, 'thumbnews', '目前国内规模最大的保持器生产厂家,现正在进行 目前 国内 规模 最大 的 保持 器生产 厂家 , 现正 在 进行 目前 国内 规模 最大 的 保持 器生产 厂家 , 现正 在 进行'),
	(111, 'thumbnews', '目前国内规模最大的保持器生产厂家,现正在进行 目前 国内 规模 最大 的 保持 器生产 厂家 , 现正 在 进行 目前 国内 规模 最大 的 保持 器生产 厂家 , 现正 在 进行'),
	(109, 'thumbnews', '目前国内规模最大的保持器生产厂家,现正在进行 目前 国内 规模 最大 的 保持 器生产 厂家 , 现正 在 进行 目前 国内 规模 最大 的 保持 器生产 厂家 , 现正 在 进行'),
	(108, 'thumbnews', '目前国内规模最大的保持器生产厂家,现正在进行 目前 国内 规模 最大 的 保持 器生产 厂家 , 现正 在 进行 目前 国内 规模 最大 的 保持 器生产 厂家 , 现正 在 进行'),
	(107, 'thumbnews', '目前国内规模最大的保持器生产厂家,现正在进行 目前 国内 规模 最大 的 保持 器生产 厂家 , 现正 在 进行 目前 国内 规模 最大 的 保持 器生产 厂家 , 现正 在 进行'),
	(106, 'thumbnews', '目前国内规模最大的保持器生产厂家,现正在进行目前国内规模最大的保持器生产厂家,现正在进行 目前 国内 规模 最大 的 保持 器生产 厂家 , 现正 在 进行 目前 国内 规模 最大 的 保持 器生产 厂家 , 现正 在 进行 目前 国内 规模 最大 的 保持 器生产 厂家 , 现正 在 进行 目前 国内 规模 最大 的 保持 器生产 厂家 , 现正 在 进行'),
	(105, 'thumbnews', '目前国内规模最大的保持器生产厂家,现正在进行 目前 国内 规模 最大 的 保持 器生产 厂家 , 现正 在 进行 目前 国内 规模 最大 的 保持 器生产 厂家 , 现正 在 进行'),
	(104, 'thumbnews', '目前国内规模最大的保持器生产厂家,现正在进行 目前 国内 规模 最大 的 保持 器生产 厂家 , 现正 在 进行 目前 国内 规模 最大 的 保持 器生产 厂家 , 现正 在 进行'),
	(103, 'thumbnews', '目前国内规模最大的保持器生产厂家,现正在进行 目前 国内 规模 最大 的 保持 器生产 厂家 , 现正 在 进行 目前 国内 规模 最大 的 保持 器生产 厂家 , 现正 在 进行'),
	(102, 'thumbnews', '目前国内规模最大的保持器生产厂家,现正在进行 目前 国内 规模 最大 的 保持 器生产 厂家 , 现正 在 进行 目前 国内 规模 最大 的 保持 器生产 厂家 , 现正 在 进行'),
	(101, 'thumbnews', '目前国内规模最大的保持器生产厂家,现正在进行目前国内规 目前 国内 规模 最大 的 保持 器生产 厂家 , 现正 在 进行 目前 国内 规 目前 国内 规模 最大 的 保持 器生产 厂家 , 现正 在 进行 目前 国内 规'),
	(100, 'job', '营销经理 营销 经理 营销 经理 北京 20 2012-04-10 2012-04-30'),
	(99, 'job', '技术顾问 技术 顾问 技术 顾问 聊城 15 2012-04-10 2012-04-10'),
	(95, 'partner', '谷歌 谷歌 94 7 谷歌'),
	(96, 'partner', '百度 百度 93 7百度'),
	(97, 'job', '市场专员 市场 专员 市场 专员 山东 2 2012-04-10 2012-04-10'),
	(98, 'job', '技术总监 技术 总监 技术 总监 北京 2 2012-04-10 2012-04-10'),
	(93, 'honor', '质量信誉保证单位 质量 信誉 保证 单位 质量 信誉 保证 单位'),
	(94, 'honor', '项目改进先进供应商 项目 改进 先进 供应 商 项目 改进 先进 供应 商'),
	(78, 'thumbnews', '目前国内规模最大的保持器生产厂家,现正在进行 目前 国内 规模 最大 的 保持 器生产 厂家 , 现正 在 进行 目前 国内 规模 最大 的 保持 器生产 厂家 , 现正 在 进行'),
	(79, 'thumbnews', '目前国内规模最大的保持器生产厂家,现正在进行 目前 国内 规模 最大 的 保持 器生产 厂家 , 现正 在 进行 目前 国内 规模 最大 的 保持 器生产 厂家 , 现正 在 进行'),
	(80, 'thumbnews', '目前国内规模最大的保持器生产厂家,现正在进行 目前 国内 规模 最大 的 保持 器生产 厂家 , 现正 在 进行 目前 国内 规模 最大 的 保持 器生产 厂家 , 现正 在 进行'),
	(81, 'thumbnews', '目前国内规模最大的保持器生产厂家,现正在进行目前国内规模最大的保持器生产厂家,现正在进行 目前 国内 规模 最大 的 保持 器生产 厂家 , 现正 在 进行 目前 国内 规模 最大 的 保持 器生产 厂家 , 现正 在 进行 目前 国内 规模 最大 的 保持 器生产 厂家 , 现正 在 进行 目前 国内 规模 最大 的 保持 器生产 厂家 , 现正 在 进行'),
	(82, 'thumbnews', '目前国内规模最大的保持器生产厂家,现正在进行 目前 国内 规模 最大 的 保持 器生产 厂家 , 现正 在 进行 目前 国内 规模 最大 的 保持 器生产 厂家 , 现正 在 进行'),
	(83, 'thumbnews', '目前国内规模最大的保持器生产厂家,现正在进行 目前 国内 规模 最大 的 保持 器生产 厂家 , 现正 在 进行 目前 国内 规模 最大 的 保持 器生产 厂家 , 现正 在 进行'),
	(84, 'thumbnews', '目前国内规模最大的保持器生产厂家,现正在进行 目前 国内 规模 最大 的 保持 器生产 厂家 , 现正 在 进行 目前 国内 规模 最大 的 保持 器生产 厂家 , 现正 在 进行'),
	(85, 'thumbnews', '目前国内规模最大的保持器生产厂家,现正在进行 目前 国内 规模 最大 的 保持 器生产 厂家 , 现正 在 进行 目前 国内 规模 最大 的 保持 器生产 厂家 , 现正 在 进行'),
	(86, 'thumbnews', '目前国内规模最大的保持器生产厂家,现正在进行 目前 国内 规模 最大 的 保持 器生产 厂家 , 现正 在 进行 目前 国内 规模 最大 的 保持 器生产 厂家 , 现正 在 进行'),
	(87, 'thumbnews', '目前国内规模最大的保持器生产厂家,现正在进行目前国内规模最大的保持器生产厂家,现正在进行 目前 国内 规模 最大 的 保持 器生产 厂家 , 现正 在 进行 目前 国内 规模 最大 的 保持 器生产 厂家 , 现正 在 进行 目前 国内 规模 最大 的 保持 器生产 厂家 , 现正 在 进行 目前 国内 规模 最大 的 保持 器生产 厂家 , 现正 在 进行'),
	(88, 'thumbnews', '规模最大的保持器生产厂家,现正在进行目前国内规模最大的保持器生产厂家,现正在进 规模 最大 的 保持 器生产 厂家 , 现正 在 进行 目前 国内 规模 最大 的 保持 器生产 厂家 , 现正 在 进 规模 最大 的 保持 器生产 厂家 , 现正 在 进行 目前 国内 规模 最大 的 保持 器生产 厂家 , 现正 在 进'),
	(89, 'thumbnews', '目前国内规模最大的保持器生产厂家,现正在进行 目前 国内 规模 最大 的 保持 器生产 厂家 , 现正 在 进行 目前 国内 规模 最大 的 保持 器生产 厂家 , 现正 在 进行'),
	(90, 'thumbnews', '产品主要面向国内外中高端市场产品主要面向国内外中高端市场产品主要面向国内外中高端市场 产品 主要 面向 国内 外中 高端 市场 产品 主要 面向 国内 外中 高端 市场 产品 主要 面向 国内 外中 高端 市场 产品 主要 面向 国内 外中 高端 市场 产品 主要 面向 国内 外中 高端 市场 产品 主要 面向 国内 外中 高端 市场'),
	(91, 'product', '树脂保持器 树脂 保持 器 树脂 保持 器'),
	(92, 'product', '聊城市金帝集团是目前国内生产规模最大 聊 城市 金 帝 集团 是目前 国内 生产 规模 最大 聊 城市 金 帝 集团 是目前 国内 生产 规模 最大');
/*!40000 ALTER TABLE `mg_search` ENABLE KEYS */;


# Dumping structure for table 004_jdweb.mg_search_type
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

# Dumping data for table 004_jdweb.mg_search_type: 6 rows
DELETE FROM `mg_search_type`;
/*!40000 ALTER TABLE `mg_search_type` DISABLE KEYS */;
INSERT INTO `mg_search_type` (`type`, `name`, `md5key`, `description`, `listorder`, `disabled`) VALUES
	('use', '应用领域', '', '', 0, 0),
	('thumbnews', '图文新闻', '', '', 0, 0),
	('job', '职位', '', '', 0, 0),
	('honor', '企业荣誉', '', '', 0, 0),
	('product', '产品', '', '', 5, 0),
	('partner', '合作伙伴', '', '', 0, 0);
/*!40000 ALTER TABLE `mg_search_type` ENABLE KEYS */;


# Dumping structure for table 004_jdweb.mg_session
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

# Dumping data for table 004_jdweb.mg_session: 1 rows
DELETE FROM `mg_session`;
/*!40000 ALTER TABLE `mg_session` DISABLE KEYS */;
INSERT INTO `mg_session` (`sessionid`, `userid`, `ip`, `lastvisit`, `groupid`, `module`, `catid`, `contentid`, `data`) VALUES
	('7bc64t7esd4dc2aollhu91qn04', 1, '127.0.0.1', 1334057476, 1, 'wslm', 0, 0, 'admin_groupid|s:1:"1";is_admin|i:1;field_image|i:1;field_images|i:1;');
/*!40000 ALTER TABLE `mg_session` ENABLE KEYS */;


# Dumping structure for table 004_jdweb.mg_status
DROP TABLE IF EXISTS `mg_status`;
CREATE TABLE IF NOT EXISTS `mg_status` (
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `issystem` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# Dumping data for table 004_jdweb.mg_status: 10 rows
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


# Dumping structure for table 004_jdweb.mg_times
DROP TABLE IF EXISTS `mg_times`;
CREATE TABLE IF NOT EXISTS `mg_times` (
  `action` char(10) NOT NULL,
  `ip` char(15) NOT NULL,
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  `times` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`action`,`ip`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

# Dumping data for table 004_jdweb.mg_times: 0 rows
DELETE FROM `mg_times`;
/*!40000 ALTER TABLE `mg_times` DISABLE KEYS */;
/*!40000 ALTER TABLE `mg_times` ENABLE KEYS */;


# Dumping structure for table 004_jdweb.mg_type
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

# Dumping data for table 004_jdweb.mg_type: 32 rows
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


# Dumping structure for table 004_jdweb.mg_urlrule
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

# Dumping data for table 004_jdweb.mg_urlrule: 4 rows
DELETE FROM `mg_urlrule`;
/*!40000 ALTER TABLE `mg_urlrule` DISABLE KEYS */;
INSERT INTO `mg_urlrule` (`urlruleid`, `module`, `file`, `ishtml`, `urlrule`, `example`) VALUES
	(3, 'wslm', 'category', 1, 'html/{$categorydir}/index.{$fileext}|html/{$categorydir}/{$page}.{$fileext}', 'html/it/news/2_1.html'),
	(4, 'wslm', 'category', 0, 'list.php?catid={$catid}|list.php?catid={$catid}&page={$page}', 'list.php?catid=1&page=2'),
	(7, 'wslm', 'show', 1, 'html/{$year}/{$month}{$day}/{$contentid}.{$fileext}|html/{$year}/{$month}{$day}/{$contentid}_{$page}.{$fileext}', 'html/2012/0102/1_2.html'),
	(10, 'wslm', 'show', 0, 'show.php?contentid={$contentid}|show.php?contentid={$contentid}&page={$page}', 'show.php?contentid=1&page=2');
/*!40000 ALTER TABLE `mg_urlrule` ENABLE KEYS */;


# Dumping structure for table 004_jdweb.mg_vote_useroption
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

# Dumping data for table 004_jdweb.mg_vote_useroption: 0 rows
DELETE FROM `mg_vote_useroption`;
/*!40000 ALTER TABLE `mg_vote_useroption` DISABLE KEYS */;
/*!40000 ALTER TABLE `mg_vote_useroption` ENABLE KEYS */;


# Dumping structure for table 004_jdweb.mg_workflow
DROP TABLE IF EXISTS `mg_workflow`;
CREATE TABLE IF NOT EXISTS `mg_workflow` (
  `workflowid` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`workflowid`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

# Dumping data for table 004_jdweb.mg_workflow: 3 rows
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
