<?php
defined('IN_WSLM') or exit('Access Denied');
$db->query("INSERT INTO `".DB_PRE."menu` (`parentid`, `name`, `image`, `url`, `description`, `target`, `style`, `js`, `groupids`, `roleids`, `isfolder`, `isopen`, `listorder`, `userid`, `keyid`) VALUES(5, '评论管理', '', '', '', '_self', '', '', '', '', 1, 0, 0, 0, 'comment');");
$parentid = $db->insert_id();
$db->query("INSERT INTO `".DB_PRE."menu` (`parentid`, `name`, `image`, `url`, `description`, `target`, `style`, `js`, `groupids`, `roleids`, `isfolder`, `isopen`, `listorder`, `userid`, `keyid`) VALUES (".$parentid.", '管理评论', '', '?mod=comment&file=comment&action=manage', '', 'right', '', '', '', '', 0, 0, 1, 0, 'comment'),(".$parentid.", '模块配置', '', '?mod=comment&file=setting', '', 'right', '', '', '', '', 0, 0, 2, 0, 'comment'),(".$parentid.", '权限设置', '', '?mod=comment&file=priv', '', 'right', '', '', '', '', 0, 0, 3, 0, '');");

$db->query("INSERT INTO `".DB_PRE."menu` (`parentid`, `name`, `image`, `url`, `description`, `target`, `style`, `js`, `groupids`, `roleids`, `isfolder`, `isopen`, `listorder`, `userid`, `keyid`) VALUES(7, '评论', '', '', '', '_self', '', '', '', '', 1, 0, 0, 0, 'comment');");
$parentid = $db->insert_id();
$db->query("INSERT INTO `".DB_PRE."menu` (`parentid`, `name`, `image`, `url`, `description`, `target`, `style`, `js`, `groupids`, `roleids`, `isfolder`, `isopen`, `listorder`, `userid`, `keyid`) VALUES(".$parentid.", '新建模板', '', '?mod=wslm&file=template&action=add&module=comment', '', 'right', '', '', '', '', 0, 0, 0, 0, 'comment');");
$db->query("INSERT INTO `".DB_PRE."menu` (`parentid`, `name`, `image`, `url`, `description`, `target`, `style`, `js`, `groupids`, `roleids`, `isfolder`, `isopen`, `listorder`, `userid`, `keyid`) VALUES(".$parentid.", '管理模板', '', '?mod=wslm&file=template&action=manage&module=comment', '', 'right', '', '', '', '', 0, 0, 0, 0, 'comment');");
?>