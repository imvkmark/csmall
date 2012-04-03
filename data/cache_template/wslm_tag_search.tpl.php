<?php function _tag_wslm_tag_search($data, $number, $rows, $count, $page, $pages, $setting){ global $WSLM,$MODULE,$M,$CATEGORY,$TYPE,$AREA,$GROUP,$MODEL,$templateid,$_userid,$_username;@extract($setting);?><?php if(is_array($data)) foreach($data AS $n => $r) { ?>
<li class="<?php echo $css;?>"><a href="<?php echo $r['url'];?>" target="<?php echo $target;?>"><?php echo $r['title'];?></a> <?php if($dateformat) { ?>[<?php echo date($dateformat, $r[inputtime]);?>]<?php } ?></li>
<?php } ?>
<?php if($pages) { ?><div class="pages"><?php echo $pages;?></div><?php } ?><?php } ?>