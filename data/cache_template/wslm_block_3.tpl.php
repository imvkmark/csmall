<?php defined('IN_WSLM') or exit('Access Denied'); ?><?php if(is_array($data)) foreach($data AS $n => $r) { ?>
<a href="<?php echo $r['url'];?>" title="<?php echo $r['title'];?>"><img src="<?php echo $r['thumb'];?>" alt="<?php echo $r['title'];?>" width="726" /></a>
<?php } ?>