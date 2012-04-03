DELETE FROM `wslm_module` WHERE module='guestbook';
DROP TABLE IF EXISTS `wslm_guestbook`;
DELETE FROM `wslm_menu` WHERE keyid='guestbook';