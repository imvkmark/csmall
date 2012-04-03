<?php function _tag_wslm_tag_category($data, $number, $rows, $count, $page, $pages, $setting){ global $WSLM,$MODULE,$M,$CATEGORY,$TYPE,$AREA,$GROUP,$MODEL,$templateid,$_userid,$_username;@extract($setting);?><?php $data = subcat($module, $catid);?>
<?php if(is_array($data)) foreach($data AS $n => $r) { ?>
<?php if($r[ismenu]) { ?><li><a href="<?php echo $r['url'];?>" id="menu_<?php echo $r['catid'];?>"><span><?php echo $r['catname'];?></span></a></li><?php } ?>
<?php } ?><?php } ?>