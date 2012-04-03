<?php defined('IN_WSLM') or exit('Access Denied'); ?><?php include template('wslm','header'); ?> 
<!--begin main-->
<div id="main_full">
  <!--位置导航-->
  <div id="position"><a href="">首页</a><?php echo catpos($catid);?>搜索</div>
  <!--搜索条件-->
<form name="myform" method="get" action="">
  <table cellpadding="0" cellspacing="1" class="search_term">
<?php if(is_array($where)) foreach($where AS $field => $r) { ?>
    <tr>
      <th width="30%"><?php echo $r['name'];?></th>
      <td><?php echo $r['form'];?></td>
    </tr>
<?php } ?>
    <tr>
      <th>排序方式</th>
      <td><?=form::select($order, 'orderby', 'orderby', 'a.contentid DESC', 1)?></td>
    </tr>
    <tr>
      <th></th>
      <td><input type="submit" value="立即搜索" />
        <input type="reset" value="重新搜索" /></td>
    </tr>
  </table>
  <input type="hidden" name="mod" value="<?php echo $mod;?>"> 
  <input type="hidden" name="file" value="<?php echo $file;?>"> 
  <input type="hidden" name="action" value="<?php echo $action;?>"> 
  <input type="hidden" name="dosubmit" value="1"> 
</form>
  <!--搜索结果-->
<?php if($dosubmit) { ?>
  <div class="search_res">共找到到符合条件的结果 <span style="color:red"><?php echo $total;?></span> 条</div>
<?php if(is_array($data)) foreach($data AS $i => $r) { ?>
  <dl class="search_list">
    <dt><a href="<?php echo $r['url'];?>" target="_blank"><?php echo $r['title'];?></a></dt>
    <dd class="search_txt"><?php echo $r['description'];?></dd>
    <dd class="search_attribute"><?php echo url($r[url], 1);?>　<?php if($r[updatetime]) { ?><?php echo date('Y-m-d', $r[updatetime]);?><?php } ?></dd>
  </dl>
<?php } ?>
<?php } ?>
  <!--分页-->
  <div id="pages"><?php echo $pages;?></div>
</div>
<!--end main-->
<!--begin foot-->
<?php include template('wslm','footer'); ?>
