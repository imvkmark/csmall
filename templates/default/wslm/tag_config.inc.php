<?php
return array (
  'index_hover' => 
  array (
    'introduce' => '',
    'mode' => '0',
    'sql' => 'SELECT a.contentid,a.catid,a.title,a.thumb,a.description,a.userid,b.link,a.listorder FROM `wslm_content` a, `wslm_c_picdeslink` b WHERE a.contentid=b.contentid AND a.status=99  ".get_sql_catid($cid)." ORDER BY a.listorder DESC',
    'selectfields' => 
    array (
      0 => 'contentid',
      1 => 'catid',
      2 => 'title',
      3 => 'thumb',
      4 => 'description',
      5 => 'userid',
      6 => 'link',
      7 => 'listorder',
    ),
    'orderby' => 'listorder DESC',
    'page' => '0',
    'number' => '1',
    'template' => 'tag_content_index_hover',
    'type' => 'content',
    'where' => 
    array (
      'catid' => '$cid',
      'userid' => '',
      'updatetime' => '',
      'inputtime' => '',
    ),
    'modelid' => '23',
    'tagcode' => 'tag(\'wslm\', \'tag_content_index_hover\', "SELECT a.contentid,a.catid,a.title,a.thumb,a.description,a.userid,b.link,a.listorder FROM `wslm_content` a, `wslm_c_picdeslink` b WHERE a.contentid=b.contentid AND a.status=99  ".get_sql_catid($cid)." ORDER BY a.listorder DESC", 0, 1, array ())',
  ),
  'index_nhover' => 
  array (
    'introduce' => '',
    'mode' => '0',
    'sql' => 'SELECT contentid,catid,title,thumb,userid,updatetime,inputtime,listorder FROM `wslm_content` WHERE  status=99  ".get_sql_catid($cid)." ORDER BY contentid DESC',
    'selectfields' => 
    array (
      0 => 'contentid',
      1 => 'catid',
      2 => 'title',
      3 => 'thumb',
      4 => 'userid',
      5 => 'updatetime',
      6 => 'inputtime',
      7 => 'listorder',
    ),
    'orderby' => 'contentid DESC',
    'page' => '0',
    'number' => '1',
    'template' => 'tag_content_index_nhover',
    'type' => 'content',
    'where' => 
    array (
      'catid' => '$cid',
      'userid' => '',
      'updatetime' => '',
      'inputtime' => '',
    ),
    'modelid' => '25',
    'tagcode' => 'tag(\'wslm\', \'tag_content_index_nhover\', "SELECT contentid,catid,title,thumb,userid,updatetime,inputtime,listorder FROM `wslm_content` WHERE  status=99  ".get_sql_catid($cid)." ORDER BY contentid DESC", 0, 1, array ())',
  ),
  'index_change' => 
  array (
    'introduce' => '',
    'mode' => '0',
    'sql' => 'SELECT contentid,catid,title,thumb,userid,updatetime,inputtime,listorder FROM `wslm_content` WHERE  status=99  ".get_sql_catid($cid)." ORDER BY listorder DESC',
    'selectfields' => 
    array (
      0 => 'contentid',
      1 => 'catid',
      2 => 'title',
      3 => 'thumb',
      4 => 'userid',
      5 => 'updatetime',
      6 => 'inputtime',
      7 => 'listorder',
    ),
    'orderby' => 'listorder DESC',
    'page' => '0',
    'number' => '10',
    'template' => 'tag_content_index_change',
    'type' => 'content',
    'where' => 
    array (
      'catid' => '$cid',
      'userid' => '',
      'updatetime' => '',
      'inputtime' => '',
    ),
    'modelid' => '25',
    'tagcode' => 'tag(\'wslm\', \'tag_content_index_change\', "SELECT contentid,catid,title,thumb,userid,updatetime,inputtime,listorder FROM `wslm_content` WHERE  status=99  ".get_sql_catid($cid)." ORDER BY listorder DESC", 0, 10, array ())',
  ),
  'index_news_list' => 
  array (
    'introduce' => '',
    'mode' => '0',
    'sql' => 'SELECT contentid,catid,title,thumb,description,userid,updatetime,inputtime,url,listorder FROM `wslm_content` WHERE  status=99  ".get_sql_catid($cid)." ORDER BY listorder DESC',
    'selectfields' => 
    array (
      0 => 'contentid',
      1 => 'catid',
      2 => 'title',
      3 => 'thumb',
      4 => 'description',
      5 => 'userid',
      6 => 'updatetime',
      7 => 'inputtime',
      8 => 'url',
      9 => 'listorder',
    ),
    'orderby' => 'listorder DESC',
    'page' => '0',
    'number' => '3',
    'template' => 'tag_content_index_news_list',
    'type' => 'content',
    'where' => 
    array (
      'catid' => '$cid',
      'userid' => '',
      'updatetime' => '',
      'inputtime' => '',
    ),
    'modelid' => '21',
    'tagcode' => 'tag(\'wslm\', \'tag_content_index_news_list\', "SELECT contentid,catid,title,thumb,description,userid,updatetime,inputtime,url,listorder FROM `wslm_content` WHERE  status=99  ".get_sql_catid($cid)." ORDER BY listorder DESC", 0, 3, array ())',
  ),
);
?>