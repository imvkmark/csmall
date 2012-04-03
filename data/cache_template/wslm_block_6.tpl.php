<?php defined('IN_WSLM') or exit('Access Denied'); ?><?php if(is_array($data)) foreach($data AS $n => $r) { ?>
　<a href="<?php echo $r['url'];?>" title="<?php echo $r['title'];?>"><?php echo $r['title'];?></a>
<?php } ?>