/*
Navicat MySQL Data Transfer

Source Server         : localhost-5.5.8
Source Server Version : 50508
Source Host           : localhost:3306
Source Database       : 004_full

Target Server Type    : MYSQL
Target Server Version : 50508
File Encoding         : 65001

Date: 2012-04-15 17:38:24
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `mg_menu`
-- ----------------------------
DROP TABLE IF EXISTS `mg_menu`;
CREATE TABLE `mg_menu` (
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
) ENGINE=MyISAM AUTO_INCREMENT=1048 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mg_menu
-- ----------------------------
INSERT INTO mg_menu VALUES ('1', '0', '后台顶部菜单', '', '', '', '_self', '', '', '', '', '1', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('20', '0', '会员中心', '', '', '', '_self', '', '', '', '', '1', '0', '0', '0', 'member_0');
INSERT INTO mg_menu VALUES ('40', '0', '会员中心快捷菜单', '', '', '', '_self', '', '', '', '', '1', '0', '0', '0', 'member_1');
INSERT INTO mg_menu VALUES ('2', '1', '我的面板', '', '', '', 'left', '', '', '', '', '1', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('3', '1', '系统设置', '', '', '', 'left', '', '', '', '1,2', '1', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('4', '1', '内容管理', '', '', '', 'left', '', '', '', '1,2,3', '1', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('5', '1', '模块管理', '', '', '', 'left', '', '', '', '1,2,3,5', '1', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('6', '1', '会员管理', '', '', '', 'left', '', '', '', '1,2,3', '1', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('7', '1', '模板风格', '', '', '', 'left', '', '', '', '1,4', '1', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('61', '4', '全部内容', '', '?mod=wslm&file=content_all', '', 'right', '', '', '', '', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('62', '4', '内容审核', '', '?mod=wslm&file=content_all&action=inspect', '', 'right', '', '', '', '', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('64', '4', '碎片管理', '', '?mod=wslm&file=block&action=list', '', 'right', '', '', '', '', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('65', '4', '推荐位管理', '', '?mod=wslm&file=position&action=list', '', 'right', '', '', '', '', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('99', '2', '常用操作', '', '', '', '_self', '', '', '', '', '1', '1', '0', '0', '');
INSERT INTO mg_menu VALUES ('100', '2', '个人信息', '', '', '', '_self', '', '', '', '', '1', '1', '0', '0', '');
INSERT INTO mg_menu VALUES ('102', '100', '修改密码', '', 'member/editpwd.php', '', 'right', '', '', '', '', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('110', '99', '添加常用菜单', '', '?mod=wslm&file=menu&action=add&parentid=99&parentname=常用操作', '', 'right', '', '', '', '', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('111', '99', '管理常用菜单', '', '?mod=wslm&file=menu&action=manage&parentid=99&parentname=常用操作', '', 'right', '', '', '', '', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('112', '99', '后台首页', '', '?mod=wslm&file=index&action=main', '', 'right', '', '', '', '', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('113', '99', '更新首页', '', '?mod=wslm&file=html&action=index', '', 'right', '', '', '', '', '0', '0', '0', '1', '');
INSERT INTO mg_menu VALUES ('114', '99', '更新缓存', '', '?mod=wslm&file=cache', '', 'right', '', '', '', '', '0', '0', '0', '1', '');
INSERT INTO mg_menu VALUES ('115', '99', '添加栏目', '', '?mod=wslm&file=category&action=add', '', 'right', '', '', '', '', '0', '0', '0', '1', '');
INSERT INTO mg_menu VALUES ('116', '99', '管理栏目', '', '?mod=wslm&file=category&action=manage', '', 'right', '', '', '', '', '0', '0', '0', '1', '');
INSERT INTO mg_menu VALUES ('117', '99', '管理会员', '', '?mod=member&file=member&action=manage', '', 'right', '', '', '', '', '0', '0', '0', '1', '');
INSERT INTO mg_menu VALUES ('118', '99', '添加管理员', '', '?mod=wslm&file=admin&action=add', '', 'right', '', '', '', '', '0', '0', '0', '1', '');
INSERT INTO mg_menu VALUES ('600', '99', '添加地区', '', '?mod=wslm&file=area&action=add', '', 'right', '', '', '', '', '0', '0', '0', '1', '');
INSERT INTO mg_menu VALUES ('601', '99', '管理内容模型', '', '?mod=wslm&file=model&action=manage', '', 'right', '', '', '', '', '0', '0', '0', '1', '');
INSERT INTO mg_menu VALUES ('602', '99', '数据库备份', '', '?mod=wslm&file=database&action=export', '', 'right', '', '', '', '', '0', '0', '0', '1', '');
INSERT INTO mg_menu VALUES ('603', '99', '网站配置', '', '?mod=wslm&file=setting&tab=0', '', 'right', '', '', '', '', '0', '0', '0', '1', '');
INSERT INTO mg_menu VALUES ('120', '3', '栏目管理', '', '', '', '_self', '', '', '', '1,2', '1', '1', '0', '0', '');
INSERT INTO mg_menu VALUES ('121', '120', '添加栏目', '', '?mod=wslm&file=category&action=add', '', 'right', '', '', '', '1,2', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('122', '120', '管理栏目', '', '?mod=wslm&file=category&action=manage', '', 'right', '', '', '', '1,2', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('123', '120', '合并栏目', '', '?mod=wslm&file=category&action=join', '', 'right', '', '', '', '1,2', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('124', '120', '更新栏目缓存', '', '?mod=wslm&file=category&action=updatecache', '', 'right', '', '', '', '1,2', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('125', '120', '修复栏目数据', '', '?mod=wslm&file=category&action=repair', '', 'right', '', '', '', '1,2', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('126', '120', '批量添加栏目', '', '?mod=wslm&file=category&action=more', '', 'right', '', '', '', '1,2', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('130', '3', '模型管理', '', '', '', '_self', '', '', '', '1', '1', '1', '0', '0', '');
INSERT INTO mg_menu VALUES ('131', '130', '添加模型', '', '?mod=wslm&file=model&action=add', '', 'right', '', '', '', '1', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('132', '130', '管理模型', '', '?mod=wslm&file=model&action=manage', '', 'right', '', '', '', '1', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('133', '130', '导入模型', '', '?mod=wslm&file=model&action=import', '', 'right', '', '', '', '1', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('140', '3', '模块管理', '', '', '', '_self', '', '', '', '1', '1', '1', '0', '0', '');
INSERT INTO mg_menu VALUES ('141', '140', '安装模块', '', '?mod=wslm&file=module&action=install', '', 'right', '', '', '', '1', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('142', '140', '管理模块', '', '?mod=wslm&file=module&action=manage', '', 'right', '', '', '', '1', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('143', '140', '新建模块', '', '?mod=wslm&file=module&action=add', '', 'right', '', '', '', '1', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('150', '3', '管理员设置', '', '', '', '_self', '', '', '', '1', '1', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('151', '150', '添加管理员', '', '?mod=wslm&file=admin&action=add', '', 'right', '', '', '', '1', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('152', '150', '管理员列表', '', '?mod=wslm&file=admin&action=manage', '', 'right', '', '', '', '1', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('153', '150', '添加角色', '', '?mod=wslm&file=role&action=add', '', 'right', '', '', '', '1', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('154', '150', '管理角色', '', '?mod=wslm&file=role&action=manage', '', 'right', '', '', '', '1', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('160', '3', '数据库管理', '', '', '', '_self', '', '', '', '1', '1', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('161', '160', '数据库备份', '', '?mod=wslm&file=database&action=export', '', 'right', '', '', '', '1', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('162', '160', '数据库恢复', '', '?mod=wslm&file=database&action=import', '', 'right', '', '', '', '1', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('163', '160', '数据库修复', '', '?mod=wslm&file=database&action=repair', '', 'right', '', '', '', '1', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('164', '160', '字符串替换', '', '?mod=wslm&file=database&action=replace', '', 'right', '', '', '', '1', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('165', '160', '执行SQL', '', '?mod=wslm&file=database&action=executesql', '', 'right', '', '', '', '1', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('166', '160', '数据库策略', '', '?mod=wslm&file=database&action=dbsolution', '', 'right', '', '', '', '1', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('170', '3', '相关设置', '', '', '', '_self', '', '', '', '', '1', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('171', '170', '类别管理', '', '', '', 'right', '', '', '', '', '1', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('500', '171', '添加类别', '', '?mod=wslm&file=type&action=add', '', 'right', '', '', '', '', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('501', '171', '管理类别', '', '?mod=wslm&file=type&action=manage', '', 'right', '', '', '', '', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('172', '170', '地区管理', '', '', '', 'right', '', '', '', '', '1', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('505', '172', '添加地区', '', '?mod=wslm&file=area&action=add', '', 'right', '', '', '', '', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('506', '172', '管理地区', '', '?mod=wslm&file=area&action=manage', '', 'right', '', '', '', '', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('507', '172', '更新地区缓存', '', '?mod=wslm&file=area&action=updatecache', '', 'right', '', '', '', '', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('508', '172', '修复地区数据', '', '?mod=wslm&file=area&action=repair', '', 'right', '', '', '', '', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('173', '170', '菜单管理', '', '', '', 'right', '', '', '', '', '1', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('510', '173', '添加菜单', '', '?mod=wslm&file=menu&action=add', '', 'right', '', '', '', '', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('511', '173', '管理菜单', '', '?mod=wslm&file=menu', '', 'right', '', '', '', '', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('174', '170', '推荐位管理', '', '', '', 'right', '', '', '', '', '1', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('515', '174', '添加推荐位', '', '?mod=wslm&file=position&action=add', '', 'right', '', '', '', '', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('516', '174', '管理推荐位', '', '?mod=wslm&file=position&action=manage', '', 'right', '', '', '', '', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('175', '170', '关键词管理', '', '', '', 'right', '', '', '', '', '1', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('520', '175', '添加关键词', '', '?mod=wslm&file=keyword&action=add', '', 'right', '', '', '', '', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('521', '175', '管理关键词', '', '?mod=wslm&file=keyword&action=manage', '', 'right', '', '', '', '', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('176', '170', '作者管理', '', '', '', 'right', '', '', '', '', '1', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('525', '176', '添加作者', '', '?mod=wslm&file=author&action=add', '', 'right', '', '', '', '', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('526', '176', '管理作者', '', '?mod=wslm&file=author&action=manage', '', 'right', '', '', '', '', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('177', '170', '来源管理', '', '', '', 'right', '', '', '', '', '1', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('530', '177', '添加来源', '', '?mod=wslm&file=copyfrom&action=add', '', 'right', '', '', '', '', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('531', '177', '管理来源', '', '?mod=wslm&file=copyfrom&action=manage', '', 'right', '', '', '', '', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('178', '170', '关联链接管理', '', '', '', 'right', '', '', '', '', '1', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('535', '178', '添加关联链接', '', '?mod=wslm&file=keylink&action=add', '', 'right', '', '', '', '', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('536', '178', '管理关联链接', '', '?mod=wslm&file=keylink&action=manage', '', 'right', '', '', '', '', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('180', '170', '工作流管理', '', '', '', 'right', '', '', '', '', '1', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('540', '180', '添加工作流方案', '', '?mod=wslm&file=workflow&action=add', '', 'right', '', '', '', '', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('541', '180', '管理工作流方案', '', '?mod=wslm&file=workflow', '', 'right', '', '', '', '', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('181', '170', '稿件状态管理', '', '', '', 'right', '', '', '', '', '1', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('545', '181', '添加状态', '', '?mod=wslm&file=status&action=add', '', 'right', '', '', '', '', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('546', '181', '管理状态', '', '?mod=wslm&file=status', '', 'right', '', '', '', '', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('200', '170', '数据源管理', '', '', '', 'right', '', '', '', '', '1', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('201', '200', '添加数据源', '', '?mod=wslm&file=datasource&action=add', '', 'right', '', '', '', '', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('202', '200', '管理数据源', '', '?mod=wslm&file=datasource&action=manage', '', 'right', '', '', '', '', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('205', '170', 'URL规则管理', '', '', '', 'right', '', '', '', '', '1', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('206', '205', '添加URL规则', '', '?mod=wslm&file=urlrule&action=add', '', 'right', '', '', '', '', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('207', '205', '管理URL规则', '', '?mod=wslm&file=urlrule&action=manage', '', 'right', '', '', '', '', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('208', '170', '联动菜单管理', '', '?mod=wslm&file=linkage', '', 'right', '', '', '', '', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('210', '3', '系统工具', '', '', '', '_self', '', '', '', '', '1', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('211', '210', '木马扫描', '', '', '', '_self', '', '', '', '', '1', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('212', '211', '扫描木马', '', '?mod=wslm&file=safe', '', 'right', '', '', '', '', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('213', '211', '文件安全校验', '', '?mod=wslm&file=filecheck', '', 'right', '', '', '', '', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('214', '211', '创建文件校验镜像', '', '?mod=wslm&file=filecheck&action=make', '', 'right', '', '', '', '', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('215', '210', '外部数据导入', '', '', '', '_self', '', '', '', '', '1', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('216', '215', '添加数据导入规则', '', '?mod=wslm&file=import&action=add', '', 'right', '', '', '', '', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('217', '215', '资讯数据导入', '', '?mod=wslm&file=import&action=manage&type=content', '', 'right', '', '', '', '', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('218', '215', '会员数据导入', '', '?mod=wslm&file=import&action=manage&type=member', '', 'right', '', '', '', '', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('219', '210', '更新缓存', '', '?mod=wslm&file=cache', '', 'right', '', '', '', '', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('220', '210', 'Baibu/Google地图', '', '?mod=wslm&file=googlemap', '', 'right', '', '', '', '', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('221', '210', '系统运行环境诊断', '', '?mod=wslm&file=system', '', 'right', '', '', '', '', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('222', '210', 'IP 禁止', '', '?mod=wslm&file=ipbanned', '', 'right', '', '', '', '', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('223', '210', '非法信息屏蔽日志', '', '?mod=wslm&file=filterword', '', 'right', '', '', '', '', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('224', '210', '后台操作日志', '', '?mod=wslm&file=log', '', 'right', '', '', '', '', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('225', '210', 'php 错误日志', '', '?mod=wslm&file=errorlog', '', 'right', '', '', '', '', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('226', '210', '文件管理器', '', '?mod=wslm&file=filemanager', '', 'right', '', '', '', '', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('227', '210', '网站地图', '', '?mod=wslm&file=sitemap', '', 'right', '', '', '', '', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('230', '210', '数据字典', '', '?mod=wslm&file=datadict', '', 'right', '', '', '', '', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('231', '210', '附件管理', '', '?mod=wslm&file=attachment&action=manage', '', 'right', '', '', '', '', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('232', '210', '播放器管理', '', '?mod=wslm&file=player&action=manage', '', 'right', '', '', '', '', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('233', '210', 'CNZZ站长统计', '', '?mod=wslm&file=wss', '', 'right', '', '', '', '', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('234', '210', 'CNZZ统计配置', '', '?mod=wslm&file=wss&action=setting', '', 'right', '', '', '', '', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('235', '210', '稿件统计', '', '?mod=wslm&file=statistics', '', 'right', '', '', '', '', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('236', '210', '栏目访问统计', '', '?mod=wslm&file=count', '', 'right', '', '', '', '', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('250', '3', '网站配置', '', '', '', '_self', '', '', '', '1', '1', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('251', '250', '基本信息', '', '?mod=wslm&file=setting&tab=0', '', 'right', '', '', '', '1', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('252', '250', '网站设置', '', '?mod=wslm&file=setting&tab=1', '', 'right', '', '', '', '1', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('253', '250', '性能优化', '', '?mod=wslm&file=setting&tab=2', '', 'right', '', '', '', '1', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('254', '250', '安全设置', '', '?mod=wslm&file=setting&tab=3', '', 'right', '', '', '', '1', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('255', '250', '附件设置', '', '?mod=wslm&file=setting&tab=4', '', 'right', '', '', '', '1', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('256', '250', '邮件设置', '', '?mod=wslm&file=setting&tab=5', '', 'right', '', '', '', '1', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('257', '250', 'FTP设置', '', '?mod=wslm&file=setting&tab=6', '', 'right', '', '', '', '1', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('258', '250', '通行证', '', '?mod=wslm&file=setting&tab=7', '', 'right', '', '', '', '1', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('259', '250', '扩展设置', '', '?mod=wslm&file=setting&tab=8', '', 'right', '', '', '', '1', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('300', '4', '内容发布管理', '', '?mod=wslm&file=content&action=manage&catid=0', '', '_self', '', '', '', '', '0', '0', '0', '0', 'catid_0');
INSERT INTO mg_menu VALUES ('319', '4', '生成HTML', '', '', '', '_self', '', '', '', '', '1', '1', '0', '0', '');
INSERT INTO mg_menu VALUES ('320', '319', '更新首页', '', '?mod=wslm&file=html&action=index', '', 'right', '', '', '', '', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('321', '319', '更新栏目页', '', '?mod=wslm&file=html&action=category', '', 'right', '', '', '', '', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('324', '319', '更新内容页', '', '?mod=wslm&file=html&action=show', '', 'right', '', '', '', '', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('325', '319', '更新URL', '', '?mod=wslm&file=url', '', 'right', '', '', '', '', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('326', '319', '更新全站索引', '', '?mod=wslm&file=category&action=update_search', '', 'right', '', '', '', '', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('350', '7', '模板方案', '', '?mod=wslm&file=templateproject&action=manage', '', 'right', '', '', '', '', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('351', '7', '风格方案', '', '?mod=wslm&file=skin&action=manage', '', 'right', '', '', '', '', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('352', '7', '碎片管理', '', '?mod=wslm&file=block', '', 'right', '', '', '', '', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('353', '7', '更新模板缓存', '', '?mod=wslm&file=template&action=cache', '', 'right', '', '', '', '', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('360', '7', '内容管理', '', '', '', '_self', '', '', '', '', '1', '1', '0', '0', '');
INSERT INTO mg_menu VALUES ('361', '360', '新建模板', '', '?mod=wslm&file=template&action=add', '', 'right', '', '', '', '', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('362', '360', '管理模板', '', '?mod=wslm&file=template&action=manage&module=wslm', '', 'right', '', '', '', '', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('363', '360', '添加内容标签', '', '?mod=wslm&file=tag&action=add&module=wslm&type=content', '', 'right', '', '', '', '', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('364', '360', '管理内容标签', '', '?mod=wslm&file=tag&action=manage&module=wslm&type=content', '', 'right', '', '', '', '', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('365', '360', '添加栏目标签', '', '?mod=wslm&file=tag&action=add&type=category', '', 'right', '', '', '', '', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('366', '360', '管理栏目标签', '', '?mod=wslm&file=tag&action=manage&type=category', '', 'right', '', '', '', '', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('604', '6', '会员管理', '', '', '', '_self', '', '', '', '', '1', '1', '0', '0', 'member');
INSERT INTO mg_menu VALUES ('605', '604', '添加会员', '', '?mod=member&file=member&action=add', '', 'right', '', '', '', '', '0', '0', '0', '0', 'member');
INSERT INTO mg_menu VALUES ('606', '604', '审核会员', '', '?mod=member&file=member&action=check', '', 'right', '', '', '', '', '0', '0', '0', '0', 'member');
INSERT INTO mg_menu VALUES ('607', '604', '管理会员', '', '?mod=member&file=member&action=manage', '', 'right', '', '', '', '', '0', '0', '0', '0', 'member');
INSERT INTO mg_menu VALUES ('608', '604', '管理扩展组会员', '', '?mod=member&file=extend&action=manage', '', 'right', '', '', '', '', '0', '0', '0', '0', 'member');
INSERT INTO mg_menu VALUES ('609', '604', '搜索会员', '', '?mod=member&file=member&action=search', '', 'right', '', '', '', '', '0', '0', '0', '0', 'member');
INSERT INTO mg_menu VALUES ('610', '604', '模块配置', '', '?mod=member&file=setting', '', 'right', '', '', '', '', '0', '0', '0', '0', 'member');
INSERT INTO mg_menu VALUES ('611', '604', '权限设置', '', '?mod=member&file=priv', '', 'right', '', '', '', '', '0', '0', '0', '0', 'member');
INSERT INTO mg_menu VALUES ('612', '6', '会员组管理', '', '', '', '_self', '', '', '', '', '1', '1', '0', '0', 'member');
INSERT INTO mg_menu VALUES ('613', '612', '添加会员组', '', '?mod=member&file=group&action=add', '', 'right', '', '', '', '', '0', '0', '0', '0', 'member');
INSERT INTO mg_menu VALUES ('614', '612', '管理会员组', '', '?mod=member&file=group&action=manage', '', 'right', '', '', '', '', '0', '0', '0', '0', 'member');
INSERT INTO mg_menu VALUES ('615', '6', '会员模型管理', '', '', '', '_self', '', '', '', '', '1', '1', '0', '0', 'member');
INSERT INTO mg_menu VALUES ('616', '615', '添加会员模型', '', '?mod=member&file=member_model&action=add', '', 'right', '', '', '', '', '0', '0', '0', '0', 'member');
INSERT INTO mg_menu VALUES ('617', '615', '管理会员模型', '', '?mod=member&file=member_model&action=manage', '', 'right', '', '', '', '', '0', '0', '0', '0', 'member');
INSERT INTO mg_menu VALUES ('618', '615', '导入会员模型', '', '?mod=member&file=member_model&action=import', '', 'right', '', '', '', '', '0', '0', '0', '0', 'member');
INSERT INTO mg_menu VALUES ('619', '7', '会员', '', '', '', '_self', '', '', '', '', '1', '0', '0', '0', 'member');
INSERT INTO mg_menu VALUES ('620', '619', '新建模板', '', '?mod=wslm&file=template&action=add&module=member', '', 'right', '', '', '', '', '0', '0', '0', '0', 'member');
INSERT INTO mg_menu VALUES ('621', '619', '管理模板', '', '?mod=wslm&file=template&action=manage&module=member', '', 'right', '', '', '', '', '0', '0', '0', '0', 'member');
INSERT INTO mg_menu VALUES ('622', '619', '添加会员标签', '', '?mod=member&file=tag&action=add&module=member', '', 'right', '', '', '', '', '0', '0', '0', '0', 'member');
INSERT INTO mg_menu VALUES ('623', '619', '管理会员标签', 'member', '?mod=member&file=tag&action=manage&module=member', '', 'right', '', '', '', '', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('624', '20', '首页', '', '', '', 'right', '', '', '', '', '0', '0', '0', '0', 'member');
INSERT INTO mg_menu VALUES ('625', '20', '会员中心', '', 'member/index.php', '', 'right', '', '', '', '', '0', '0', '0', '0', 'member');
INSERT INTO mg_menu VALUES ('626', '20', '信息管理', '', 'manage.php', '', 'right', '', '', '', '', '0', '0', '0', '0', 'member');
INSERT INTO mg_menu VALUES ('683', '5', '友情链接', '', '', '', '_self', '', '', '', '', '1', '0', '0', '0', 'link');
INSERT INTO mg_menu VALUES ('684', '683', '添加友情链接', '', '?mod=link&file=link&action=add', '', 'right', '', '', '', '', '0', '0', '0', '0', 'link');
INSERT INTO mg_menu VALUES ('685', '683', '管理友情链接', '', '?mod=link&file=link&action=manage&passed=1', '', 'right', '', '', '', '', '0', '0', '0', '0', 'link');
INSERT INTO mg_menu VALUES ('686', '683', '添加分类', '', '?mod=link&file=type&action=add', '', 'right', '', '', '', '', '0', '0', '0', '0', 'link');
INSERT INTO mg_menu VALUES ('687', '683', '管理分类', '', '?mod=link&file=type&action=manage', '', 'right', '', '', '', '', '0', '0', '0', '0', 'link');
INSERT INTO mg_menu VALUES ('688', '683', '模块配置', '', '?mod=link&file=setting', '', 'right', '', '', '', '', '0', '0', '0', '0', 'link');
INSERT INTO mg_menu VALUES ('689', '683', '权限设置', '', '?mod=link&file=priv', '', 'right', '', '', '', '', '0', '0', '0', '0', 'link');
INSERT INTO mg_menu VALUES ('690', '7', '友情链接', '', '', '', '_self', '', '', '', '', '1', '0', '0', '0', 'link');
INSERT INTO mg_menu VALUES ('691', '690', '新建模板', '', '?mod=wslm&file=template&action=add&module=link', '', 'right', '', '', '', '', '0', '0', '0', '0', 'link');
INSERT INTO mg_menu VALUES ('692', '690', '管理模板', '', '?mod=wslm&file=template&action=manage&module=link', '', 'right', '', '', '', '', '0', '0', '0', '0', 'link');
INSERT INTO mg_menu VALUES ('693', '690', '添加标签', '', '?mod=link&file=tag&action=add', '', 'right', '', '', '', '', '0', '0', '0', '0', 'link');
INSERT INTO mg_menu VALUES ('694', '690', '管理标签', '', '?mod=link&file=tag', '', 'right', '', '', '', '', '0', '0', '0', '0', 'link');
INSERT INTO mg_menu VALUES ('1010', '998', '添加订阅类别', '', '?mod=mail&file=type&action=add', '', 'right', '', '', '', '', '0', '0', '7', '0', '');
INSERT INTO mg_menu VALUES ('1009', '998', '权限设置', '', '?mod=mail&file=priv', '', 'right', '', '', '', '', '0', '0', '12', '0', '');
INSERT INTO mg_menu VALUES ('1008', '998', '模块配置', '', '?mod=mail&file=setting', '', 'right', '', '', '', '', '0', '0', '11', '0', '');
INSERT INTO mg_menu VALUES ('1007', '998', '邮件配置', '', '?mod=wslm&file=setting&tab=5', '', 'right', '', '', '', '', '0', '0', '10', '0', '');
INSERT INTO mg_menu VALUES ('1006', '998', '获取邮箱列表', '', '?mod=mail&file=importmail&action=choice', '', 'right', '', '', '', '', '0', '0', '9', '0', '');
INSERT INTO mg_menu VALUES ('1005', '998', '管理邮件列表', '', '?mod=mail&file=maillist&action=list', '', 'right', '', '', '', '', '0', '0', '8', '0', '');
INSERT INTO mg_menu VALUES ('1004', '998', '发送邮件', '', '?mod=mail&file=send', '', 'right', '', '', '', '', '0', '0', '1', '0', '');
INSERT INTO mg_menu VALUES ('1003', '998', '管理订阅分类', '', '?mod=mail&file=type', '', 'right', '', '', '', '', '0', '0', '6', '0', '');
INSERT INTO mg_menu VALUES ('1002', '998', '管理订阅邮箱', '', '?mod=mail&file=email&action=list', '', 'right', '', '', '', '', '0', '0', '2', '0', '');
INSERT INTO mg_menu VALUES ('1001', '998', '管理期刊', '', '?mod=mail&file=subscription&action=list', '', 'right', '', '', '', '', '0', '0', '5', '0', '');
INSERT INTO mg_menu VALUES ('1000', '998', '添加期刊', '', '?mod=mail&file=subscription&action=add', '', 'right', '', '', '', '', '0', '0', '4', '0', '');
INSERT INTO mg_menu VALUES ('999', '998', '群发期刊', '', '?mod=mail&file=subscription&action=send', '', 'right', '', '', '', '', '0', '0', '3', '0', '');
INSERT INTO mg_menu VALUES ('725', '7', '邮件订阅', '', '', '', '_self', '', '', '', '', '1', '0', '0', '0', 'member');
INSERT INTO mg_menu VALUES ('726', '725', '新建模板', '', '?mod=wslm&file=template&action=add&module=mail', '', 'right', '', '', '', '', '0', '0', '0', '0', 'member');
INSERT INTO mg_menu VALUES ('727', '725', '管理模板', '', '?mod=wslm&file=template&action=manage&module=mail', '', 'right', '', '', '', '', '0', '0', '0', '0', 'member');
INSERT INTO mg_menu VALUES ('728', '5', '留言板', '', '', '', '_self', '', '', '', '', '1', '0', '0', '0', 'guestbook');
INSERT INTO mg_menu VALUES ('729', '728', '管理留言板', '', '?mod=guestbook&file=guestbook&action=manage', '', 'right', '', '', '', '', '0', '0', '0', '0', 'guestbook');
INSERT INTO mg_menu VALUES ('730', '728', '模块配置', '', '?mod=guestbook&file=setting', '', 'right', '', '', '', '', '0', '0', '0', '0', 'guestbook');
INSERT INTO mg_menu VALUES ('731', '728', '权限设置', '', '?mod=guestbook&file=priv', '', 'right', '', '', '', '', '0', '0', '0', '0', 'guestbook');
INSERT INTO mg_menu VALUES ('732', '7', '留言板', '', '', '', '_self', '', '', '', '', '1', '0', '0', '0', 'guestbook');
INSERT INTO mg_menu VALUES ('733', '732', '新建模板', '', '?mod=wslm&file=template&action=add&module=guestbook', '', 'right', '', '', '', '', '0', '0', '0', '0', 'guestbook');
INSERT INTO mg_menu VALUES ('734', '732', '管理模板', '', '?mod=wslm&file=template&action=manage&module=guestbook', '', 'right', '', '', '', '', '0', '0', '0', '0', 'guestbook');
INSERT INTO mg_menu VALUES ('735', '732', '添加标签', '', '?mod=guestbook&file=tag&action=add', '', 'right', '', '', '', '', '0', '0', '0', '0', 'guestbook');
INSERT INTO mg_menu VALUES ('736', '732', '管理标签', '', '?mod=guestbook&file=tag&action=manage', '', 'right', '', '', '', '', '0', '0', '0', '0', 'guestbook');
INSERT INTO mg_menu VALUES ('779', '5', '全站搜索', '', '', '', '_self', '', '', '', '', '1', '0', '0', '0', 'search');
INSERT INTO mg_menu VALUES ('780', '779', '重建索引', '', '?mod=search&file=search&action=createindex', '', 'right', '', '', '', '', '0', '0', '0', '0', 'search');
INSERT INTO mg_menu VALUES ('781', '779', '添加分类', '', '?mod=search&file=type&action=add', '', 'right', '', '', '', '', '0', '0', '0', '0', 'search');
INSERT INTO mg_menu VALUES ('782', '779', '管理分类', '', '?mod=search&file=type&action=manage', '', 'right', '', '', '', '', '0', '0', '0', '0', 'search');
INSERT INTO mg_menu VALUES ('783', '779', '模块配置', '', '?mod=search&file=setting', '', 'right', '', '', '', '', '0', '0', '0', '0', 'search');
INSERT INTO mg_menu VALUES ('784', '7', '全站搜索', '', '', '', '_self', '', '', '', '', '1', '0', '0', '0', 'search');
INSERT INTO mg_menu VALUES ('785', '784', '新建模板', '', '?mod=wslm&file=template&action=add&module=search', '', 'right', '', '', '', '', '0', '0', '0', '0', 'search');
INSERT INTO mg_menu VALUES ('786', '784', '管理模板', '', '?mod=wslm&file=template&action=manage&module=search', '', 'right', '', '', '', '', '0', '0', '0', '0', 'search');
INSERT INTO mg_menu VALUES ('808', '5', '表单向导', '', '', '', '_self', '', '', '', '', '1', '0', '0', '0', 'formguide');
INSERT INTO mg_menu VALUES ('809', '808', '添加表单', '', '?mod=formguide&file=manage&action=add', '', 'right', '', '', '', '', '0', '0', '0', '0', 'formguide');
INSERT INTO mg_menu VALUES ('810', '808', '管理表单', '', '?mod=formguide&file=manage&action=manage', '', 'right', '', '', '', '', '0', '0', '0', '0', 'formguide');
INSERT INTO mg_menu VALUES ('811', '808', '模块设置', '', '?mod=formguide&file=setting', '', 'right', '', '', '', '', '0', '0', '0', '0', 'formguide');
INSERT INTO mg_menu VALUES ('812', '808', '权限设置', '', '?mod=formguide&file=priv', '', 'right', '', '', '', '', '0', '0', '0', '0', 'formguide');
INSERT INTO mg_menu VALUES ('813', '7', '表单向导', '', '', '', '_self', '', '', '', '', '1', '0', '0', '0', 'formguide');
INSERT INTO mg_menu VALUES ('814', '813', '新建模板', '', '?mod=wslm&file=template&action=add&module=formguide', '', 'right', '', '', '', '', '0', '0', '0', '0', 'formguide');
INSERT INTO mg_menu VALUES ('815', '813', '管理模板', '', '?mod=wslm&file=template&action=manage&module=formguide', '', 'right', '', '', '', '', '0', '0', '0', '0', 'formguide');
INSERT INTO mg_menu VALUES ('816', '40', '我的简历', '', 'yp/apply.php', '', '_self', '', '', '', '', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('1015', '1013', '管理模板', '', '?mod=wslm&file=template&action=manage&module=mail', '', 'right', '', '', '', '', '0', '0', '0', '0', 'member');
INSERT INTO mg_menu VALUES ('1014', '1013', '新建模板', '', '?mod=wslm&file=template&action=add&module=mail', '', 'right', '', '', '', '', '0', '0', '0', '0', 'member');
INSERT INTO mg_menu VALUES ('1013', '7', '邮件订阅', '', '', '', '_self', '', '', '', '', '1', '0', '0', '0', 'member');
