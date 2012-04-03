DROP TABLE IF EXISTS `wslm_spider_job`,`wslm_spider_out`,`wslm_spider_sites`,`wslm_spider_urls`;
DELETE FROM `wslm_module` WHERE module='spider';
DELETE FROM `wslm_menu` WHERE keyid ='spider';