<?php function _tag_wslm_tag_content_one($data, $number, $rows, $count, $page, $pages, $setting){ global $WSLM,$MODULE,$M,$CATEGORY,$TYPE,$AREA,$GROUP,$MODEL,$templateid,$_userid,$_username;@extract($setting);?><?php if(is_array($data)) foreach($data AS $n => $r) { ?>
 <h1><a href="<?php echo $r['url'];?>" target="<?php echo $target;?>" class="<?php echo $class;?>"><span class="c_orange"><?php echo str_cut($r[title], $titlelen);?></span></a></h1>
<?php } ?>
<?php } ?>