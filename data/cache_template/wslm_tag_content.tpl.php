<?php function _tag_wslm_tag_content($data, $number, $rows, $count, $page, $pages, $setting){ global $WSLM,$MODULE,$M,$CATEGORY,$TYPE,$AREA,$GROUP,$MODEL,$templateid,$_userid,$_username;@extract($setting);?><a href="<?php echo $r['url'];?>" title="<?php echo $r['title'];?>"><img src="<?php echo $r['thumb'];?>" width="<?php echo $width;?>" height="<?php echo $height;?>" /></a>
<?php echo $r['url'];?>
<?php echo $r['title'];?>
<?php echo $r['thumb'];?>
<?php echo $width;?>
<?php echo $height;?>
<?php echo str_cut($r[title], $titlen, '');?>
<?php echo date($dateformat, $r['inputtime']);?><?php } ?>