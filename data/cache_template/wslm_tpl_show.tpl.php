<?php defined('IN_WSLM') or exit('Access Denied'); ?>	<div class="right_mbg l_line">
<div class="font_h col_40 show" >
<h4 class="contitle"><?php echo $title;?><?php if($protype) { ?>[<?php echo $protype;?>]<?php } ?></h4>
<p class="cut"> 最近更新时间：<?php echo $updatetime;?>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;浏览次数：<span id="hits">0</span></p>
<div class="content"><?php echo $content;?></div>
</div>
</div>
<script language="JavaScript" src="count.php?contentid=<?php echo $contentid;?>"></script>