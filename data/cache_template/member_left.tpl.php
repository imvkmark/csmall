<?php defined('IN_WSLM') or exit('Access Denied'); ?><div id="left">
  <div id="treemenu">
    <h5>基本设置</h5>
    <div style="text-align:center;">
    <img src="<?php echo $avatar;?>" alt="<?php echo $username;?>" height="150" width="150"/></div>
    <table cellpadding="0" cellspacing="0" class="member_info">
    <tr>
      <th>用户名：</th><td><?php echo $_username;?></td>
    </tr>
    <tr>
      <th>类　型：</th><td><?php echo $MODEL[$_modelid]['name'];?></td>
    </tr>
    <tr>
      <th valign="top">等　级：</th>
      <td><?php if(is_array($_extend_group)) foreach($_extend_group AS $ext_group) { ?>
<a href="<?php echo $MODULE['member']['url'];?>upgrade.php?action=view&groupid=<?php echo $ext_group['groupid'];?>" id="ext_group_<?php echo $ext_group['groupid'];?>" onmouseover="javascript:get_remaintime(<?php echo $ext_group['groupid'];?>);"><?php echo $GROUP[$ext_group['groupid']];?></a><br /><?php } ?></td></tr>
    </table>
    <ul>
      <li><a href="<?php echo $MODULE['member']['url'];?>upgrade.php">会员升级</a></li>
      <li><a href="<?php echo $MODULE['member']['url'];?>edit.php">修改资料</a></li>
      <?php if($WSLM['uc']) { ?>
      <li><a href="<?php echo $MODULE['member']['url'];?>avatar.php">修改头像</a></li>
      <li><a href="<?php echo $MODULE['member']['url'];?>changecredit.php">积分兑换</a></li>
      <?php } ?>
      <?php if($M[enableQchk]) { ?>
      <li><a href="<?php echo $MODULE['member']['url'];?>editanwser.php">修改密码提示问题</a></li>
      <?php } ?>
      <li><a href="<?php echo $MODULE['member']['url'];?>editpwd.php">修改密码</a></li>
    </ul>
  </div>
  <ol>
    <li class="local"><a href="<?php echo SITE_URL;?>">返回网站首页</a></li>
    <li class="exit"><a href="<?php echo $MODULE['member']['url'];?>logout.php">退出登录</a></li>
  </ol>
</div>
<script language="javascript">
function get_remaintime(groupid)
{
var id = "#ext_group_" + groupid;
if($(id).attr('title') == '')
{
$.get("<?php echo $MODULE['member']['url'];?>index.php", {action:'get_remaintime', groupid:groupid}, function(data){
data = '服务期限为：' + data;
$(id).attr('title', data);
});
}
}
</script>
