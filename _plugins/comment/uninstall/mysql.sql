DELETE FROM `wslm_module` WHERE module='comment';
DROP TABLE IF EXISTS `wslm_comment`;
DELETE FROM `wslm_menu` WHERE `url` like '%mod=comment%';
DELETE FROM `wslm_menu` WHERE `url` like '%module=comment%';