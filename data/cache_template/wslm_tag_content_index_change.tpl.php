<?php function _tag_wslm_tag_content_index_change($data, $number, $rows, $count, $page, $pages, $setting){ global $WSLM,$MODULE,$M,$CATEGORY,$TYPE,$AREA,$GROUP,$MODEL,$templateid,$_userid,$_username;@extract($setting);?><?php if(is_array($data)) foreach($data AS $n => $r) { ?>
<img src="<?php echo $r['thumb'];?>" alt="<?php echo $r['title'];?>">
<?php } ?><?php } ?>