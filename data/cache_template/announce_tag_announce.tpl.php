<?php function _tag_announce_tag_announce($data, $number, $rows, $count, $page, $pages, $setting){ global $WSLM,$MODULE,$M,$CATEGORY,$TYPE,$AREA,$GROUP,$MODEL,$templateid,$_userid,$_username;@extract($setting);?><?php if(is_array($data)) foreach($data AS $announce) { ?>
<?php if($announce[passed]) { ?><li><a href="announce/?announceid=<?php echo $announce['announceid'];?>" target="<?php echo $target;?>"><?php echo str_cut($announce['title'],$titlelen);?></a><?php if($showauthor) { ?>&nbsp;[发布人：<a href="{MODULE[member][url]}member.php?username=<?php echo $announce['username'];?>" target="{target}"><?php echo $announce['username'];?></a>]<?php } ?>&nbsp;<?php if($datetype) { ?><?php echo $announce['addtime'];?><?php } ?></li><?php } ?>
<?php } ?>
<?php if($pages) { ?><p id="pages"><?php echo $pages;?></p><?php } ?><?php } ?>