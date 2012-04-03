<?php defined('IN_WSLM') or exit('Access Denied'); ?><?php if(is_array($data)) foreach($data AS $n => $r) { ?>
<embed src="<?php echo $r['thumb'];?>" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="980" height="75"></embed>
<?php } ?>