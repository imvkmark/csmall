<?php defined('IN_WSLM') or exit('Access Denied'); ?><?php $menu = subcat('main', 0);?>
<?php $menu_count = 1?>
<?php if(is_array($menu)) foreach($menu AS $n => $r) { ?>
<?php if($r[ismenu]) { ?>
<?php if (count($menu)-1 == $menu_count):?> 
<li id="menu_<?php echo $r['catid'];?>" class="bli">
<?php else:?>
<li id="menu_<?php echo $r['catid'];?>">
<?php endif;?>
<?php $menu_count++?>
<a href="<?php echo get_sublink($r[catid]);?>" title="<?php echo $r['catname'];?>"><?php echo $r['catname'];?></a>
<p><?php echo $r['image'];?></p>
<dl>
<?php $submenu = subcat('main', $r[catid])?>
<?php if(is_array($submenu)) foreach($submenu AS $sn => $sr) { ?>
<dd
<?php if($r[catid] == 4) { ?> style="clear:both;width:180px;" <?php } ?>
><a href="<?php echo get_sublink($sr[catid]);?>" title="<?php echo $sr['catname'];?>"><?php echo $sr['catname'];?></a></dd>
<?php } ?>
</dl>
</li>
<?php } ?>
<?php } ?>