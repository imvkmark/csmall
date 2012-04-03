<?php function _tag_guestbook_tag_guestbook($data, $number, $rows, $count, $page, $pages, $setting){ global $WSLM,$MODULE,$M,$CATEGORY,$TYPE,$AREA,$GROUP,$MODEL,$templateid,$_userid,$_username;@extract($setting);?><table width="100%" border="0" align="center" cellpadding="1" cellspacing="1">
<?php if(is_array($data)) foreach($data AS $i => $g) { ?>
<?php if($i%$cols==0) { ?><tr><?php } ?>
<td height="20" >
<a href="guestbook/index.php?gid=<?php echo $g['gid'];?>" target="_blank"><?php echo $g['title'];?></a>
<?php if($showusername) { ?>[作者:<?php echo $g['username'];?>]<?php } ?>
<?php if($datetype) { ?>[<span class="datetime"><?php echo $g['addtime'];?></span>]<?php } ?>
</td>
<?php if($i%$cols==($cols-1)) { ?></tr><?php } ?>
<?php } ?>

</table>
<?php } ?>