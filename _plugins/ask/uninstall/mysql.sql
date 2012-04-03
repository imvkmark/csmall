DROP TABLE IF EXISTS `wslm_ask`;
DROP TABLE IF EXISTS `wslm_ask_actor`;
DROP TABLE IF EXISTS `wslm_ask_credit`;
DROP TABLE IF EXISTS `wslm_ask_posts`;
DROP TABLE IF EXISTS `wslm_ask_vote`;
ALTER TABLE `wslm_member_info` DROP `actortype`;
ALTER TABLE `wslm_member_info` DROP `answercount`;
ALTER TABLE `wslm_member_info` DROP `acceptcount`;
DELETE FROM `wslm_urlrule` WHERE `urlruleid` IN (25,26,27,28,29);