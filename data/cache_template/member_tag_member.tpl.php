<?php function _tag_member_tag_member($data, $number, $rows, $count, $page, $pages, $setting){ global $WSLM,$MODULE,$M,$CATEGORY,$TYPE,$AREA,$GROUP,$MODEL,$templateid,$_userid,$_username;@extract($setting);?><?php if(is_array($data)) foreach($data AS $user) { ?>
<ul>
<li>用户ID:<?php echo $user['userid'];?></li>
<li>用户名:<?php echo $user['username'];?></li>
</ul>
<?php } ?><?php } ?>