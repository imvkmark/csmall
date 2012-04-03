<?php defined('IN_WSLM') or exit('Access Denied'); ?><table width="98%"  cellspacing="1" cellpadding="0" class="table_list">
<caption><?php echo $FORMGUIDE[$formid]['name'];?>表单</caption>
<?php if(is_array($info)) foreach($info AS $k => $v) { ?>
    <tr>
    	<th><strong><?php if($forminfos[$k][name]) { ?><?php echo $forminfos[$k]['name'];?><?php } else { ?><?php echo $k;?><?php } ?></strong></th><td><?php echo $v;?></td>
    </tr>
<?php } ?>	
</table>