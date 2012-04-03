<?php function _tag_member_tag_list($data, $number, $rows, $count, $page, $pages, $setting){ global $WSLM,$MODULE,$M,$CATEGORY,$TYPE,$AREA,$GROUP,$MODEL,$templateid,$_userid,$_username;@extract($setting);?><?php if(is_array($data)) foreach($data AS $k => $v) { ?> 
<dl class="search_member">
<dt>
<a href="<?php echo $MODULE['member']['url'];?>view.php?userid=<?php echo $v['userid'];?>" title="<?php echo $v['username'];?>" target="_blank"><img src="<?php echo avatar($v[userid]);?>" alt="<?php echo $v['username'];?>"  target="_blank"/></a>
</dt> 
<dd>
<a href="<?php echo $MODULE['member']['url'];?>view.php?userid=<?php echo $v['userid'];?>" class="name"><span style="color:red"><?php echo $v['username'];?></span></a>
<em>所在地区： <?php echo $AREA[$v['areaid']]['name'];?></em>
<em>用户组：<?php echo $GROUP[$v['groupid']];?></em>
<em>最后登录时间：<?php if($v[lastlogintime]) { ?><?php echo date('Y-m-d', $v[lastlogintime]);?><?php } ?></em>
</dd> 
<dd>
联系方式：<em><?php echo $v['email'];?></em>
</dd>
<dd>个人空间：<a href="<?php echo url($MODULE[space][url], 1);?>?userid=<?php echo $v['userid'];?>" class="green"><?php echo url($MODULE[space][url], 1);?>?userid=<?php echo $v['userid'];?></a>
</dd> 
</dl> 
<?php } ?> <div id="pages"><?php echo $pages;?></div><?php } ?>