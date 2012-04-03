<?php defined('IN_WSLM') or exit('Access Denied'); ?><form action="<?php echo $M['url'];?>vote.php?voteid=<?php echo $voteid;?>" method="post" id="voteform<?php echo $voteid;?>"  style="border:none;">
 <dl>
<?php if(!$embed) { ?>
      <dt><?php echo $subject;?></dt>
      <?php if($detail) { ?><dd><?php echo $detail;?></dd><?php } ?>
<?php } else { ?>
    <dt><?php echo $subject;?></dt>
<?php } ?>
</dl>
<?php if($description) { ?><p style="text-indent:2em;padding:6px;border-bottom:#CCC 1px dashed"><?php echo $description;?></p><?php } ?>
<?php $i=0;?>
<?php if(is_array($subject_lists)) foreach($subject_lists AS $sid => $data) { ?>
<?php $type=$data['ischeckbox']?'checkbox':'radio';$msg=$data[ischeckbox]?"请选择 $data[minval] - $data[maxval] 个选项":"请选择一个选项"?>
<dl>
<?php if(count($subject_lists)>1) { ?>    
<dt><?=++$i?>. <?php echo $data['subject'];?>&nbsp;&nbsp; <span id="err<?=$sid?>" class="errtip">(<?php echo $msg;?>)</span></dt>
<?php } ?>    
   <?php $r=0;?>
    <?php if(is_array($data['options'])) foreach($data['options'] AS $optionid => $option) { ?>
      <?php if(!$option['image']) { ?>
         <dd sn="<?php echo $optionid;?>">
         &nbsp;&nbsp;<input type="<?php echo $type;?>" id="<?php echo $optionid;?>" name="votedata[<?php echo $sid;?>][]" value="<?php echo $optionid;?>" <?php if($r==0) { ?>  require="true" datatype="group" msgid="err<?php echo $sid;?>" msg="<?php echo $msg;?>" min="<?php echo $data['minval'];?>" max="<?php echo $data['maxval'];?>"  <?php } ?>/>
         <?php echo $option['option'];?> 
         <?php echo $embed ? '<br />':'';?>
          </dd>
      <?php } else { ?>
     	<dd class="optionpic" sn="<?php echo $optionid;?>">
       <img src="<?php echo SITE_URL;?><?php echo thumb($option['image'],88, 60);?>" onerror="this.src='<?php echo SITE_URL;?>images/nopic.gif'" title="<?php echo $option['option'];?>" />
        <input type="<?php echo $type;?>" id="<?php echo $optionid;?>" name="votedata[<?php echo $sid;?>][]" value="<?php echo $optionid;?>" <?php if($r==0) { ?> require="true" datatype="group" msgid="err<?php echo $sid;?>" msg="<?php echo $msg;?>" min="<?php echo $data['minval'];?>" max="<?php echo $data['maxval'];?>"  <?php } ?>/>
        <?php echo $option['option'];?>
        </dd>
      <?php } ?>
      <?php $r=1;?>
    <?php } ?>    
<?php } ?>
</dl> 

    <?php if(($userinfo  || $enablecheckcode)) { ?>     
    <table cellpadding="0" cellspacing="1" class="table_form">
        <caption>投票人信息</caption>
        <?php if(isset($userinfo['sex'])) { ?>
        <tr><td width="50%">
       &nbsp;性别&nbsp;</td>
       <td><input type="radio" value="1" name="userinfo[sex]" checked="checked" />先生&nbsp;
        <input type="radio" value="2" name="userinfo[sex]" />女士&nbsp;
</td></tr>
        <?php } ?>
        
         <?php if(is_array($userinfo)) foreach($userinfo AS $key => $val) { ?>
         <?php if ($key=='comment' || $key=='extra' || $key=='sex') continue ;?>
         	<tr><td>&nbsp;<?php echo $LANG[$key];?>&nbsp;</td>
            <td align="left"><input type="text" name="userinfo[<?php echo $key;?>]" value=""  class="auto_input" <?php if($val) { ?> require="true" datatype="require" msg="不能为空" msgid="<?php echo $key;?>" <?php } ?> />
            <?php if($val) { ?><span id="<?php echo $key;?>" style="color:#ff0000">*</span><?php } ?><span><?php echo $LANG['tip_'.$key] ;?></span>
            </td>
            </tr>
         <?php } ?>  <!--end userinfo -->
         
         <?php if(isset($userinfo['comment'])) { ?>
         <tr><td>
         &nbsp;意见
         </td>
         <td> <textarea name="userinfo[comment]" rows="4" style="width:60%" <?php if($userinfo['comment']) { ?> require="true" datatype="require" msg="不能为空" msgid="comment" <?php } ?>></textarea>   <?php if($userinfo['comment']) { ?> <span id="comment" style="color:#ff0000">*</span><?php } ?> 限500个字符以内</td>
         </tr>
         <?php } ?>

         <?php if(isset($userinfo['extra'])) { ?>
         <tr><td>
         &nbsp;补充信息
         </td>
         <td> <textarea name="userinfo[extra]" rows="4" style="width:60%"  <?php if($userinfo['extra']) { ?> require="true" datatype="require" msg="不能为空" msgid="<?php echo $key;?>" <?php } ?>></textarea>  <?php if($userinfo['extra']) { ?>  <span id="<?php echo $key;?>" style="color:#ff0000">*</span><?php } ?> 限500个字符以内</td>
         </tr>
         <?php } ?>

    <?php if($enablecheckcode) { ?>
    <tr><td>
    &nbsp;验证码&nbsp;</td><td> <?php echo form::checkcode('checkcode',4,'require="true" datatype="require" msgid="checkcodetip" msg="请输入验证码"');?>
    <span class="errtip" id="checkcodetip"></span>
    </td>
    </tr>
    <?php } ?>    
    </table> 
    <?php } ?>
    <p class="mar_10">
    &nbsp;&nbsp;<input type="submit" value="提交" name="dosubmit" />&nbsp;&nbsp;
    <a href="<?php echo SITE_URL;?><?php echo $M['url'];?>show.php?voteid=<?php echo $voteid;?>">查看结果</a>
    </p>
</form>
<script>

var sn;
var name;
var color="#B9DFF9" ; 

$(".optionpic").click(function(){
sn=$(this).attr("sn");
$("#"+sn).click();
var s=$(this).find("input[type=radio]").attr("name");
$("input[name="+s+"]").parent().css({"background-color":""});
$(this).css({"background-color":color});
});

mode =0 ;

$("#voteform<?php echo $voteid;?>").checkForm(0);
$('tr td:even').css({'text-align':'right', 'padding-right':'10px'});
//用来控制一行显示多个选项, 如果一行显示一个选项, 则可以删除掉  ,float:'left'
$('span[sn]').css({width:'160px',display:'block',float:'left'});


</script>