<?php defined('IN_WSLM') or exit('Access Denied'); ?><?php if(is_array($contents)) foreach($contents AS $i => $content) { ?>
<?php if(is_array($content)) { ?>
<?php echo $content['0'];?>
<?php } else { ?>
<?php echo $content;?>
<?php } ?>
<?php } ?>