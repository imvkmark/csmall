<?php defined('IN_WSLM') or exit('Access Denied'); ?><?php include template('wslm','header'); ?>
<?php include template('wslm','footer'); ?>
<?php if ( $catid == 8 ) :?>
<?php echo block('about_us'_$catid, 2);?>
<?php elseif ( $catid == 9 ) :?>
<?php echo block("market_$catid",2);?>
<?php elseif ( $catid == 12 ) :?>
<?php cache_read('2.html', CACHE_FORM) ?>
<?php endif;?>