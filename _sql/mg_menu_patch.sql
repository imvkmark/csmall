DELETE FROM mg_menu WHERE menuid in (5,6,7,117,601,602,160,161,162,163,164,165,166,171,500,501,174,515,516,175,520,521,176,525,526,177,530,531,178,535,536,180,540,541,181,545,546,200,201,202,208,211,212,213,214,215,216,217,218,220,221,223,224,225,226,227,230,232,233,234,235,236,257,258);

/* 5 - 7*/
INSERT INTO mg_menu VALUES ('5', '1', '模块管理', '', '', '', 'left', '', '', '', '1,2,3,5', '1', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('6', '1', '会员管理', '', '', '', 'left', '', '', '', '1,2,3', '1', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('7', '1', '模板风格', '', '', '', 'left', '', '', '', '1,4', '1', '0', '0', '0', '');

/*117*/
INSERT INTO mg_menu VALUES ('117', '99', '管理会员', '', '?mod=member&file=member&action=manage', '', 'right', '', '', '', '', '0', '0', '0', '1', '');

/*601-602*/
INSERT INTO mg_menu VALUES ('601', '99', '管理内容模型', '', '?mod=wslm&file=model&action=manage', '', 'right', '', '', '', '', '0', '0', '0', '1', '');
INSERT INTO mg_menu VALUES ('602', '99', '数据库备份', '', '?mod=wslm&file=database&action=export', '', 'right', '', '', '', '', '0', '0', '0', '1', '');

/*160-166*/
INSERT INTO mg_menu VALUES ('160', '3', '数据库管理', '', '', '', '_self', '', '', '', '1', '1', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('161', '160', '数据库备份', '', '?mod=wslm&file=database&action=export', '', 'right', '', '', '', '1', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('162', '160', '数据库恢复', '', '?mod=wslm&file=database&action=import', '', 'right', '', '', '', '1', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('163', '160', '数据库修复', '', '?mod=wslm&file=database&action=repair', '', 'right', '', '', '', '1', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('164', '160', '字符串替换', '', '?mod=wslm&file=database&action=replace', '', 'right', '', '', '', '1', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('165', '160', '执行SQL', '', '?mod=wslm&file=database&action=executesql', '', 'right', '', '', '', '1', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('166', '160', '数据库策略', '', '?mod=wslm&file=database&action=dbsolution', '', 'right', '', '', '', '1', '0', '0', '0', '0', '');

/*相关设置*/
INSERT INTO mg_menu VALUES ('171', '170', '类别管理', '', '', '', 'right', '', '', '', '', '1', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('500', '171', '添加类别', '', '?mod=wslm&file=type&action=add', '', 'right', '', '', '', '', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('501', '171', '管理类别', '', '?mod=wslm&file=type&action=manage', '', 'right', '', '', '', '', '0', '0', '0', '0', '');
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
INSERT INTO mg_menu VALUES ('208', '170', '联动菜单管理', '', '?mod=wslm&file=linkage', '', 'right', '', '', '', '', '0', '0', '0', '0', '');

/*系统工具*/
INSERT INTO mg_menu VALUES ('211', '210', '木马扫描', '', '', '', '_self', '', '', '', '', '1', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('212', '211', '扫描木马', '', '?mod=wslm&file=safe', '', 'right', '', '', '', '', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('213', '211', '文件安全校验', '', '?mod=wslm&file=filecheck', '', 'right', '', '', '', '', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('214', '211', '创建文件校验镜像', '', '?mod=wslm&file=filecheck&action=make', '', 'right', '', '', '', '', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('215', '210', '外部数据导入', '', '', '', '_self', '', '', '', '', '1', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('216', '215', '添加数据导入规则', '', '?mod=wslm&file=import&action=add', '', 'right', '', '', '', '', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('217', '215', '资讯数据导入', '', '?mod=wslm&file=import&action=manage&type=content', '', 'right', '', '', '', '', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('218', '215', '会员数据导入', '', '?mod=wslm&file=import&action=manage&type=member', '', 'right', '', '', '', '', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('220', '210', 'Baibu/Google地图', '', '?mod=wslm&file=googlemap', '', 'right', '', '', '', '', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('221', '210', '系统运行环境诊断', '', '?mod=wslm&file=system', '', 'right', '', '', '', '', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('223', '210', '非法信息屏蔽日志', '', '?mod=wslm&file=filterword', '', 'right', '', '', '', '', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('224', '210', '后台操作日志', '', '?mod=wslm&file=log', '', 'right', '', '', '', '', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('225', '210', 'php 错误日志', '', '?mod=wslm&file=errorlog', '', 'right', '', '', '', '', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('226', '210', '文件管理器', '', '?mod=wslm&file=filemanager', '', 'right', '', '', '', '', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('227', '210', '网站地图', '', '?mod=wslm&file=sitemap', '', 'right', '', '', '', '', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('230', '210', '数据字典', '', '?mod=wslm&file=datadict', '', 'right', '', '', '', '', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('232', '210', '播放器管理', '', '?mod=wslm&file=player&action=manage', '', 'right', '', '', '', '', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('233', '210', 'CNZZ站长统计', '', '?mod=wslm&file=wss', '', 'right', '', '', '', '', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('234', '210', 'CNZZ统计配置', '', '?mod=wslm&file=wss&action=setting', '', 'right', '', '', '', '', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('235', '210', '稿件统计', '', '?mod=wslm&file=statistics', '', 'right', '', '', '', '', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('236', '210', '栏目访问统计', '', '?mod=wslm&file=count', '', 'right', '', '', '', '', '0', '0', '0', '0', '');

/*网站配置*/
INSERT INTO mg_menu VALUES ('257', '250', 'FTP设置', '', '?mod=wslm&file=setting&tab=6', '', 'right', '', '', '', '1', '0', '0', '0', '0', '');
INSERT INTO mg_menu VALUES ('258', '250', '通行证', '', '?mod=wslm&file=setting&tab=7', '', 'right', '', '', '', '1', '0', '0', '0', '0', '');
