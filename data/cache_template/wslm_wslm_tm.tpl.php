<?php defined('IN_WSLM') or exit('Access Denied'); ?>在线咨询：
<?php if(is_array($qqs)) foreach($qqs AS $qq) { ?>
<a href="http://wpa.qq.com/msgrd?V=1&Uin=<?php echo $qq;?>&Site=<?php echo DOMAIN;?>&Menu=yes" title="点击咨询&#10;QQ：<?php echo $qq;?>" target="_blank"><img src="http://wpa.qq.com/pa?p=1:<?php echo $qq;?>:4" border="0" align="absmiddle" /></a>&nbsp;&nbsp;
<?php } ?>
<?php if(is_array($msns)) foreach($msns AS $msn) { ?>
<a href="msnim:chat?contact=<?php echo $msn;?>" title="点击咨询&#10;MSN：<?php echo $msn;?>" target="_blank"><img src="http://osi.hshh.org:8888/msn/<?php echo $msn;?>" border="0" align="absmiddle" onerror="this.onerror=null;this.src='http://osi.hshh.org/msnunknown.gif';" /></a>&nbsp;&nbsp;
<?php } ?>
<?php if(is_array($skypes)) foreach($skypes AS $skype) { ?>
<a href="callto://<?php echo $skype;?>" title="点击咨询&#10;SKYPE：<?php echo $skype;?>"><img src="http://goodies.skype.com/graphics/skypeme_btn_small_green.gif" border="0" align="absmiddle" /></a>&nbsp;&nbsp;
<?php } ?>
<?php if(is_array($taobaos)) foreach($taobaos AS $taobao) { ?>
<a href="http://amos1.taobao.com/msg.ww?v=2&uid=<?php echo urlencode($taobao);?>&site=cntaobao&s=1" target="_blank" title="点击咨询&#10;帐号：<?php echo $taobao;?>"><img src="http://amos1.taobao.com/online.ww?v=2&uid=<?php echo urlencode($taobao);?>&site=cntaobao&s=1" border="0" align="absmiddle" /></a>&nbsp;&nbsp;
<?php } ?>
<?php if(is_array($alibabas)) foreach($alibabas AS $alibaba) { ?>
<a href="http://web.im.alisoft.com/msg.aw?v=2&uid=<?php echo $alibaba;?>&site=cnalichn&s=4" target="_blank" title="点击咨询&#10;帐号：<?php echo $alibaba;?>"><img src="http://web.im.alisoft.com/online.aw?v=2&uid=<?php echo $alibaba;?>&site=cnalichn&s=4" border="0" align="absmiddle" /></a>&nbsp;&nbsp;
<?php } ?>