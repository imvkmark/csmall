<?php function _tag_wslm_tag_category_footer($data, $number, $rows, $count, $page, $pages, $setting){ global $WSLM,$MODULE,$M,$CATEGORY,$TYPE,$AREA,$GROUP,$MODEL,$templateid,$_userid,$_username;@extract($setting);?><?php $data = subcat($module, $catid);?>
<?php if(is_array($data)) foreach($data AS $n => $r) { ?>
  | <a href="<?php echo $r['url'];?>"><?php echo $r['catname'];?></a>
<?php } ?><?php } ?>