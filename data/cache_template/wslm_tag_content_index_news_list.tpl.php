<?php function _tag_wslm_tag_content_index_news_list($data, $number, $rows, $count, $page, $pages, $setting){ global $WSLM,$MODULE,$M,$CATEGORY,$TYPE,$AREA,$GROUP,$MODEL,$templateid,$_userid,$_username;@extract($setting);?><?php if(is_array($data)) foreach($data AS $n => $r) { ?>
<li class="hastime">
    <span class="time"><?php echo date('m/d',$r[inputtime]);?></span>
    <a href="<?php echo $r['url'];?>" title="<?php echo $r['title'];?>"><?php echo str_cut($r[title],50);?></a>
</li>
<?php } ?><?php } ?>