<?php defined('IN_WSLM') or exit('Access Denied'); ?><div class="left">
<ul>
<?php if($topid == $catid) { ?>
<li id="catleft_<?php echo $catid;?>">
<a href="<?php echo $CATEGORY[$topid]['url'];?>" title="<?php echo $CATEGORY[$topid]['catname'];?>"><?php echo $CATEGORY[$topid]['catname'];?></a>
</li>
<?php } else { ?>
<?php $data = subcat('main', $topid);?>
<?php if(is_array($data)) foreach($data AS $cat) { ?>
<li id="catleft_<?php echo $cat['catid'];?>"><a href="<?php echo $cat['url'];?>" title="<?php echo $cat['catname'];?>"><?php echo $cat['catname'];?></a></li>
<?php } ?>
<?php } ?>
</ul>
<script type="text/javascript">
$('#catleft_<?php echo $catid;?> a').addClass('hover');
</script>
</div>