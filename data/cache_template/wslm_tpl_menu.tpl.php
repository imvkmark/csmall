<?php defined('IN_WSLM') or exit('Access Denied'); ?><?php $data = subcat('main', 0);?>
<?php if(is_array($data)) foreach($data AS $n => $r) { ?>
<?php if($r[ismenu]) { ?>
<li class="l_float">
<?php $subcat = subcat('main', $r['catid']);?>
<?php if($subcat) { ?><!-- *有子元素 -->
<?php $loop = 0;?>
<?php if(is_array($subcat)) foreach($subcat AS $k => $v) { ?>
<a href="{getsubLink($v[catid]}" id="menu_<?php echo $v['catid'];?>"><?php echo $v['catname'];?></a>
<?php } ?>
<?php } else { ?>
<a href="{getsubLink($r[catid]}" id="menu_<?php echo $r['catid'];?>"><?php echo $r['catname'];?></a>
<?php } ?>
</li>
<?php } ?>
<?php } ?>