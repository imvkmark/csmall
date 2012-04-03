<?php defined('IN_WSLM') or exit('Access Denied'); ?><?php if(is_array($data)) foreach($data AS $n => $r) { ?>
<item>
<title><![CDATA[<?php echo $r['title'];?>]]></title>
<url><?php echo $r['url'];?></url>
<description><![CDATA[<?php echo $r['title'];?>]]></description>
<time><?php echo date('Y-m-d H:i:s', $r['time']);?></time>
</item>
<?php } ?>