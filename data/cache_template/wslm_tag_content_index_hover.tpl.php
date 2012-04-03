<?php function _tag_wslm_tag_content_index_hover($data, $number, $rows, $count, $page, $pages, $setting){ global $WSLM,$MODULE,$M,$CATEGORY,$TYPE,$AREA,$GROUP,$MODEL,$templateid,$_userid,$_username;@extract($setting);?><?php if(is_array($data)) foreach($data AS $n => $r) { ?>
<img src="<?php echo $r['thumb'];?>" alt="<?php echo $r['title'];?>">
<div class="details">
<?php if($r[link]) { ?>
<a href="$r[link]" title="<?php echo $r['title'];?>">
<?php } ?>
    <h4><?php echo $r['title'];?></h4>
    <p><?php echo $r['description'];?></p>
<?php if($r[link]) { ?>
</a>
<?php } ?>
</div>
<?php } ?><?php } ?>