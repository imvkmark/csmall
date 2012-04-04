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
  'index_back_hover' => 
  array (
    'introduce' => '',
    'mode' => '0',
    'sql' => 'SELECT a.contentid,a.catid,a.title,a.thumb,b.background,a.userid,a.updatetime,a.inputtime FROM `wslm_content` a, `wslm_c_backfront` b WHERE a.contentid=b.contentid AND a.status=99   AND a.`thumb`!=\'\' ".get_sql_catid(76)." ORDER BY a.listorder DESC',
    'selectfields' => 
    array (
      0 => 'contentid',
      1 => 'catid',
      2 => 'title',
      3 => 'thumb',
      4 => 'background',
      5 => 'userid',
      6 => 'updatetime',
      7 => 'inputtime',
    ),
    'orderby' => 'listorder DESC',
    'page' => '0',
    'number' => '8',
    'template' => 'tag_content_index_back_hover',
    'type' => 'content',
    'where' => 
    array (
      'catid' => '76',
      'thumb' => '1',
      'userid' => '',
      'updatetime' => '',
      'inputtime' => '',
    ),
    'modelid' => '28',
    'tagcode' => 'tag(\'wslm\', \'tag_content_index_back_hover\', "SELECT a.contentid,a.catid,a.title,a.thumb,b.background,a.userid,a.updatetime,a.inputtime FROM `wslm_content` a, `wslm_c_backfront` b WHERE a.contentid=b.contentid AND a.status=99   AND a.`thumb`!=\'\' ".get_sql_catid(76)." ORDER BY a.listorder DESC", 0, 8, array ())',
  ),
  'cat_about_team' => 
  array (
    'introduce' => '',
    'mode' => '0',
    'sql' => 'SELECT a.contentid,a.catid,a.title,a.thumb,a.description,a.userid,a.posids,a.url,a.listorder FROM `wslm_content` a, `wslm_content_position` p WHERE a.contentid=p.contentid AND p.posid=6 AND a.status=99   AND  `thumb`!=\'\' ".get_sql_catid(13)." ORDER BY a.listorder DESC',
    'selectfields' => 
    array (
      0 => 'contentid',
      1 => 'catid',
      2 => 'title',
      3 => 'thumb',
      4 => 'description',
      5 => 'userid',
      6 => 'posids',
      7 => 'url',
      8 => 'listorder',
    ),
    'orderby' => 'listorder DESC',
    'page' => '0',
    'number' => '20',
    'template' => 'tag_content_cat_about_team',
    'type' => 'content',
    'where' => 
    array (
      'catid' => '13',
      'thumb' => '1',
      'userid' => '',
      'updatetime' => '',
      'inputtime' => '',
      'posids' => '6',
    ),
    'modelid' => '29',
    'tagcode' => 'tag(\'wslm\', \'tag_content_cat_about_team\', "SELECT a.contentid,a.catid,a.title,a.thumb,a.description,a.userid,a.posids,a.url,a.listorder FROM `wslm_content` a, `wslm_content_position` p WHERE a.contentid=p.contentid AND p.posid=6 AND a.status=99   AND  `thumb`!=\'\' ".get_sql_catid(13)." ORDER BY a.listorder DESC", 0, 20, array ())',
  ),
  'cat_news_recommend' => 
  array (
    'introduce' => '',
    'mode' => '0',
    'sql' => 'SELECT a.contentid,a.catid,a.title,a.userid,a.inputtime,a.posids,a.url FROM `wslm_content` a, `wslm_content_position` p WHERE a.contentid=p.contentid AND p.posid=7 AND a.status=99  ".get_sql_catid($catnewsid)." ORDER BY a.listorder DESC',
    'selectfields' => 
    array (
      0 => 'contentid',
      1 => 'catid',
      2 => 'title',
      3 => 'userid',
      4 => 'inputtime',
      5 => 'posids',
      6 => 'url',
    ),
    'orderby' => 'listorder DESC',
    'page' => '0',
    'number' => '1',
    'template' => 'tag_content_cat_news_recommend',
    'type' => 'content',
    'where' => 
    array (
      'catid' => '$catnewsid',
      'userid' => '',
      'updatetime' => '',
      'inputtime' => '',
      'posids' => '7',
    ),
    'modelid' => '26',
    'tagcode' => 'tag(\'wslm\', \'tag_content_cat_news_recommend\', "SELECT a.contentid,a.catid,a.title,a.userid,a.inputtime,a.posids,a.url FROM `wslm_content` a, `wslm_content_position` p WHERE a.contentid=p.contentid AND p.posid=7 AND a.status=99  ".get_sql_catid($catnewsid)." ORDER BY a.listorder DESC", 0, 1, array ())',
  ),
  'cat_news_list' => 
  array (
    'introduce' => '',
    'mode' => '0',
    'sql' => 'SELECT contentid,catid,title,thumb,description,userid,updatetime,inputtime,url,listorder FROM `wslm_content` WHERE  status=99  ".get_sql_catid($catnewsid)." ORDER BY listorder DESC',
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
    'number' => '12',
    'template' => 'tag_content_cat_news_list',
    'type' => 'content',
    'where' => 
    array (
      'catid' => '$catnewsid',
      'userid' => '',
      'updatetime' => '',
      'inputtime' => '',
      'posids' => '0',
    ),
    'modelid' => '21',
    'tagcode' => 'tag(\'wslm\', \'tag_content_cat_news_list\', "SELECT contentid,catid,title,thumb,description,userid,updatetime,inputtime,url,listorder FROM `wslm_content` WHERE  status=99  ".get_sql_catid($catnewsid)." ORDER BY listorder DESC", 0, 12, array ())',
  ),
  'list_culture' => 
  array (
    'introduce' => '',
    'mode' => '0',
    'sql' => 'SELECT contentid,catid,title,thumb,description,userid,updatetime,inputtime,url FROM `wslm_content` WHERE  status=99  ".get_sql_catid($catid)." ORDER BY listorder DESC',
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
    ),
    'orderby' => 'listorder DESC',
    'page' => '$page',
    'number' => '6',
    'template' => 'tag_content_list_culture',
    'type' => 'content',
    'where' => 
    array (
      'catid' => '$catid',
      'userid' => '',
      'updatetime' => '',
      'inputtime' => '',
      'posids' => '0',
    ),
    'modelid' => '21',
    'tagcode' => 'tag(\'wslm\', \'tag_content_list_culture\', "SELECT contentid,catid,title,thumb,description,userid,updatetime,inputtime,url FROM `wslm_content` WHERE  status=99  ".get_sql_catid($catid)." ORDER BY listorder DESC", $page, 6, array (), $catid)',
  ),
  'cat_pro_slider' => 
  array (
    'introduce' => '',
    'mode' => '0',
    'sql' => 'SELECT a.contentid,a.catid,a.title,a.thumb,b.bigpic,b.link,a.userid,a.updatetime,a.inputtime,a.listorder FROM `wslm_content` a, `wslm_c_catproslider` b WHERE a.contentid=b.contentid AND a.status=99  ".get_sql_catid(77)." ORDER BY a.listorder DESC',
    'selectfields' => 
    array (
      0 => 'contentid',
      1 => 'catid',
      2 => 'title',
      3 => 'thumb',
      4 => 'bigpic',
      5 => 'link',
      6 => 'userid',
      7 => 'updatetime',
      8 => 'inputtime',
      9 => 'listorder',
    ),
    'orderby' => 'listorder DESC',
    'page' => '0',
    'number' => '4',
    'template' => 'tag_content_cat_pro_slider',
    'type' => 'content',
    'where' => 
    array (
      'catid' => '77',
      'userid' => '',
      'updatetime' => '',
      'inputtime' => '',
    ),
    'modelid' => '30',
    'tagcode' => 'tag(\'wslm\', \'tag_content_cat_pro_slider\', "SELECT a.contentid,a.catid,a.title,a.thumb,b.bigpic,b.link,a.userid,a.updatetime,a.inputtime,a.listorder FROM `wslm_content` a, `wslm_c_catproslider` b WHERE a.contentid=b.contentid AND a.status=99  ".get_sql_catid(77)." ORDER BY a.listorder DESC", 0, 4, array ())',
  ),
  'cat_pro_recommend' => 
  array (
    'introduce' => '',
    'mode' => '0',
    'sql' => 'SELECT a.contentid,a.catid,a.title,a.thumb,a.description,a.userid,a.updatetime,a.inputtime,a.posids,a.url,a.listorder FROM `wslm_content` a, `wslm_content_position` p WHERE a.contentid=p.contentid AND p.posid=8 AND a.status=99   AND  `thumb`!=\'\' ".get_sql_catid(5)." ORDER BY a.listorder DESC',
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
      8 => 'posids',
      9 => 'url',
      10 => 'listorder',
    ),
    'orderby' => 'listorder DESC',
    'page' => '0',
    'number' => '15',
    'template' => 'tag_content_cat_pro_recommend',
    'type' => 'content',
    'where' => 
    array (
      'catid' => '5',
      'thumb' => '1',
      'userid' => '',
      'updatetime' => '',
      'inputtime' => '',
      'posids' => '8',
    ),
    'modelid' => '26',
    'tagcode' => 'tag(\'wslm\', \'tag_content_cat_pro_recommend\', "SELECT a.contentid,a.catid,a.title,a.thumb,a.description,a.userid,a.updatetime,a.inputtime,a.posids,a.url,a.listorder FROM `wslm_content` a, `wslm_content_position` p WHERE a.contentid=p.contentid AND p.posid=8 AND a.status=99   AND  `thumb`!=\'\' ".get_sql_catid(5)." ORDER BY a.listorder DESC", 0, 15, array ())',
  ),
  'cat_case_list' => 
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
    'number' => '6',
    'template' => 'tag_content_cat_case_list',
    'var_description' => 
    array (
      1 => '日期格式',
      2 => '打开窗口',
      3 => '标题长度',
      4 => '缩略图宽度',
      5 => '缩略图高度',
    ),
    'var_name' => 
    array (
      1 => 'dateformat',
      2 => 'target',
      3 => 'titlelen',
      4 => 'width',
      5 => 'height',
    ),
    'var_value' => 
    array (
      1 => 'Y-m-d',
      2 => '_blank',
      3 => '46',
      4 => '100',
      5 => '75',
    ),
    'type' => 'content',
    'where' => 
    array (
      'catid' => '$cid',
      'userid' => '',
      'updatetime' => '',
      'inputtime' => '',
      'posids' => '0',
    ),
    'modelid' => '21',
    'tagcode' => 'tag(\'wslm\', \'tag_content_cat_case_list\', "SELECT contentid,catid,title,thumb,description,userid,updatetime,inputtime,url,listorder FROM `wslm_content` WHERE  status=99  ".get_sql_catid($cid)." ORDER BY listorder DESC", 0, 6, array (  \'dateformat\' => \'Y-m-d\',  \'target\' => \'_blank\',  \'titlelen\' => \'46\',  \'width\' => \'100\',  \'height\' => \'75\',))',
  ),
  'cat_case_recommend' => 
  array (
    'introduce' => '',
    'mode' => '0',
    'sql' => 'SELECT a.contentid,a.catid,a.title,a.thumb,a.description,a.userid,a.updatetime,a.inputtime,a.posids,a.url,a.listorder FROM `wslm_content` a, `wslm_content_position` p WHERE a.contentid=p.contentid AND p.posid=9 AND a.status=99   AND  `thumb`!=\'\' ".get_sql_catid(6)." ORDER BY a.listorder DESC',
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
      8 => 'posids',
      9 => 'url',
      10 => 'listorder',
    ),
    'orderby' => 'listorder DESC',
    'page' => '0',
    'number' => '8',
    'template' => 'tag_content_cat_case_recommend',
    'var_description' => 
    array (
      1 => '日期格式',
      2 => '打开窗口',
      3 => '标题长度',
      4 => '缩略图宽度',
      5 => '缩略图高度',
    ),
    'var_name' => 
    array (
      1 => 'dateformat',
      2 => 'target',
      3 => 'titlelen',
      4 => 'width',
      5 => 'height',
    ),
    'var_value' => 
    array (
      1 => 'Y-m-d',
      2 => '_blank',
      3 => '46',
      4 => '100',
      5 => '75',
    ),
    'type' => 'content',
    'where' => 
    array (
      'catid' => '6',
      'thumb' => '1',
      'userid' => '',
      'updatetime' => '',
      'inputtime' => '',
      'posids' => '9',
    ),
    'modelid' => '26',
    'tagcode' => 'tag(\'wslm\', \'tag_content_cat_case_recommend\', "SELECT a.contentid,a.catid,a.title,a.thumb,a.description,a.userid,a.updatetime,a.inputtime,a.posids,a.url,a.listorder FROM `wslm_content` a, `wslm_content_position` p WHERE a.contentid=p.contentid AND p.posid=9 AND a.status=99   AND  `thumb`!=\'\' ".get_sql_catid(6)." ORDER BY a.listorder DESC", 0, 8, array (  \'dateformat\' => \'Y-m-d\',  \'target\' => \'_blank\',  \'titlelen\' => \'46\',  \'width\' => \'100\',  \'height\' => \'75\',))',
  ),
  'list_team' => 
  array (
    'introduce' => '',
    'mode' => '0',
    'sql' => 'SELECT contentid,catid,title,thumb,description,userid,updatetime,inputtime,url,listorder FROM `wslm_content` WHERE  status=99  ".get_sql_catid($catid)." ORDER BY listorder DESC',
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
    'page' => '$page',
    'number' => '6',
    'template' => 'tag_content_list_news_team',
    'type' => 'content',
    'where' => 
    array (
      'catid' => '$catid',
      'userid' => '',
      'updatetime' => '',
      'inputtime' => '',
      'posids' => '0',
    ),
    'modelid' => '29',
    'tagcode' => 'tag(\'wslm\', \'tag_content_list_news_team\', "SELECT contentid,catid,title,thumb,description,userid,updatetime,inputtime,url,listorder FROM `wslm_content` WHERE  status=99  ".get_sql_catid($catid)." ORDER BY listorder DESC", $page, 6, array (), $catid)',
  ),
  'list_partner' => 
  array (
    'introduce' => '',
    'mode' => '0',
    'sql' => 'SELECT contentid,catid,title,thumb,description,userid,updatetime,inputtime FROM `wslm_content` WHERE  status=99  ".get_sql_catid($catid)." ORDER BY listorder DESC',
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
    ),
    'orderby' => 'listorder DESC',
    'page' => '0',
    'number' => '200',
    'template' => 'tag_content_list_partner',
    'var_description' => 
    array (
      1 => '日期格式',
      2 => '打开窗口',
      3 => '标题长度',
      4 => '缩略图宽度',
      5 => '缩略图高度',
    ),
    'var_name' => 
    array (
      1 => 'dateformat',
      2 => 'target',
      3 => 'titlelen',
      4 => 'width',
      5 => 'height',
    ),
    'var_value' => 
    array (
      1 => 'Y-m-d',
      2 => '_blank',
      3 => '46',
      4 => '100',
      5 => '75',
    ),
    'type' => 'content',
    'where' => 
    array (
      'catid' => '$catid',
      'userid' => '',
      'updatetime' => '',
      'inputtime' => '',
    ),
    'modelid' => '32',
    'tagcode' => 'tag(\'wslm\', \'tag_content_list_partner\', "SELECT contentid,catid,title,thumb,description,userid,updatetime,inputtime FROM `wslm_content` WHERE  status=99  ".get_sql_catid($catid)." ORDER BY listorder DESC", 0, 200, array (  \'dateformat\' => \'Y-m-d\',  \'target\' => \'_blank\',  \'titlelen\' => \'46\',  \'width\' => \'100\',  \'height\' => \'75\',))',
  ),
  'list_news' => 
  array (
    'introduce' => '',
    'mode' => '0',
    'sql' => 'SELECT contentid,catid,title,thumb,description,userid,updatetime,inputtime,url FROM `wslm_content` WHERE  status=99  ".get_sql_catid($catid)." ORDER BY contentid DESC',
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
    ),
    'orderby' => 'contentid DESC',
    'page' => '$page',
    'number' => '6',
    'template' => 'tag_content_list_news_team',
    'var_description' => 
    array (
      1 => '日期格式',
      2 => '打开窗口',
      3 => '标题长度',
      4 => '缩略图宽度',
      5 => '缩略图高度',
    ),
    'var_name' => 
    array (
      1 => 'dateformat',
      2 => 'target',
      3 => 'titlelen',
      4 => 'width',
      5 => 'height',
    ),
    'var_value' => 
    array (
      1 => 'Y-m-d',
      2 => '_blank',
      3 => '46',
      4 => '100',
      5 => '75',
    ),
    'type' => 'content',
    'where' => 
    array (
      'catid' => '$catid',
      'userid' => '',
      'updatetime' => '',
      'inputtime' => '',
      'posids' => '0',
    ),
    'modelid' => '21',
    'tagcode' => 'tag(\'wslm\', \'tag_content_list_news_team\', "SELECT contentid,catid,title,thumb,description,userid,updatetime,inputtime,url FROM `wslm_content` WHERE  status=99  ".get_sql_catid($catid)." ORDER BY contentid DESC", $page, 6, array (  \'dateformat\' => \'Y-m-d\',  \'target\' => \'_blank\',  \'titlelen\' => \'46\',  \'width\' => \'100\',  \'height\' => \'75\',), $catid)',
  ),
  'list_products' => 
  array (
    'introduce' => '',
    'mode' => '0',
    'sql' => 'SELECT contentid,catid,title,thumb,userid,updatetime,inputtime,url FROM `wslm_content` WHERE  status=99   AND  `thumb`!=\'\' ".get_sql_catid($catid)." ORDER BY listorder DESC',
    'selectfields' => 
    array (
      0 => 'contentid',
      1 => 'catid',
      2 => 'title',
      3 => 'thumb',
      4 => 'userid',
      5 => 'updatetime',
      6 => 'inputtime',
      7 => 'url',
    ),
    'orderby' => 'listorder DESC',
    'page' => '$page',
    'number' => '16',
    'template' => 'tag_content_list_products',
    'var_description' => 
    array (
      1 => '日期格式',
      2 => '打开窗口',
      3 => '标题长度',
      4 => '缩略图宽度',
      5 => '缩略图高度',
    ),
    'var_name' => 
    array (
      1 => 'dateformat',
      2 => 'target',
      3 => 'titlelen',
      4 => 'width',
      5 => 'height',
    ),
    'var_value' => 
    array (
      1 => 'Y-m-d',
      2 => '_blank',
      3 => '46',
      4 => '100',
      5 => '75',
    ),
    'type' => 'content',
    'where' => 
    array (
      'catid' => '$catid',
      'thumb' => '1',
      'userid' => '',
      'updatetime' => '',
      'inputtime' => '',
    ),
    'modelid' => '22',
    'tagcode' => 'tag(\'wslm\', \'tag_content_list_products\', "SELECT contentid,catid,title,thumb,userid,updatetime,inputtime,url FROM `wslm_content` WHERE  status=99   AND  `thumb`!=\'\' ".get_sql_catid($catid)." ORDER BY listorder DESC", $page, 16, array (  \'dateformat\' => \'Y-m-d\',  \'target\' => \'_blank\',  \'titlelen\' => \'46\',  \'width\' => \'100\',  \'height\' => \'75\',), $catid)',
  ),
  'cat_invest_question' => 
  array (
    'introduce' => '',
    'mode' => '0',
    'sql' => 'SELECT contentid,catid,title,userid,updatetime,inputtime FROM `wslm_content` WHERE  status=99  ".get_sql_catid(83)." ORDER BY contentid DESC',
    'selectfields' => 
    array (
      0 => 'contentid',
      1 => 'catid',
      2 => 'title',
      3 => 'userid',
      4 => 'updatetime',
      5 => 'inputtime',
    ),
    'orderby' => 'contentid DESC',
    'page' => '0',
    'number' => '5',
    'template' => 'tag_content_cat_invest_question',
    'var_description' => 
    array (
      1 => '日期格式',
      2 => '打开窗口',
      3 => '标题长度',
      4 => '缩略图宽度',
      5 => '缩略图高度',
    ),
    'var_name' => 
    array (
      1 => 'dateformat',
      2 => 'target',
      3 => 'titlelen',
      4 => 'width',
      5 => 'height',
    ),
    'var_value' => 
    array (
      1 => 'Y-m-d',
      2 => '_blank',
      3 => '46',
      4 => '100',
      5 => '75',
    ),
    'type' => 'content',
    'where' => 
    array (
      'catid' => '83',
      'userid' => '',
      'updatetime' => '',
      'inputtime' => '',
    ),
    'modelid' => '33',
    'tagcode' => 'tag(\'wslm\', \'tag_content_cat_invest_question\', "SELECT contentid,catid,title,userid,updatetime,inputtime FROM `wslm_content` WHERE  status=99  ".get_sql_catid(83)." ORDER BY contentid DESC", 0, 5, array (  \'dateformat\' => \'Y-m-d\',  \'target\' => \'_blank\',  \'titlelen\' => \'46\',  \'width\' => \'100\',  \'height\' => \'75\',))',
  ),
  'cat_invest_case' => 
  array (
    'introduce' => '',
    'mode' => '0',
    'sql' => 'SELECT a.contentid,a.catid,a.title,a.thumb,a.description,a.userid,a.updatetime,a.inputtime,a.posids,a.url,a.listorder FROM `wslm_content` a, `wslm_content_position` p WHERE a.contentid=p.contentid AND p.posid=10 AND a.status=99   ORDER BY a.listorder DESC',
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
      8 => 'posids',
      9 => 'url',
      10 => 'listorder',
    ),
    'orderby' => 'listorder DESC',
    'page' => '0',
    'number' => '5',
    'template' => 'tag_content_cat_invest_case',
    'var_description' => 
    array (
      1 => '日期格式',
      2 => '打开窗口',
      3 => '标题长度',
      4 => '缩略图宽度',
      5 => '缩略图高度',
    ),
    'var_name' => 
    array (
      1 => 'dateformat',
      2 => 'target',
      3 => 'titlelen',
      4 => 'width',
      5 => 'height',
    ),
    'var_value' => 
    array (
      1 => 'Y-m-d',
      2 => '_blank',
      3 => '46',
      4 => '100',
      5 => '75',
    ),
    'type' => 'content',
    'where' => 
    array (
      'catid' => '',
      'userid' => '',
      'updatetime' => '',
      'inputtime' => '',
      'posids' => '10',
    ),
    'modelid' => '26',
    'tagcode' => 'tag(\'wslm\', \'tag_content_cat_invest_case\', "SELECT a.contentid,a.catid,a.title,a.thumb,a.description,a.userid,a.updatetime,a.inputtime,a.posids,a.url,a.listorder FROM `wslm_content` a, `wslm_content_position` p WHERE a.contentid=p.contentid AND p.posid=10 AND a.status=99   ORDER BY a.listorder DESC", 0, 5, array (  \'dateformat\' => \'Y-m-d\',  \'target\' => \'_blank\',  \'titlelen\' => \'46\',  \'width\' => \'100\',  \'height\' => \'75\',))',
  ),
  'list_news_simple' => 
  array (
    'introduce' => '',
    'mode' => '0',
    'sql' => 'SELECT contentid,catid,title,inputtime,url,listorder FROM `wslm_content` WHERE  status=99  ".get_sql_catid(83)." ORDER BY listorder DESC',
    'selectfields' => 
    array (
      0 => 'contentid',
      1 => 'catid',
      2 => 'title',
      3 => 'inputtime',
      4 => 'url',
      5 => 'listorder',
    ),
    'orderby' => 'listorder DESC',
    'page' => '$page',
    'number' => '10',
    'template' => 'tag_content_list_news_simple',
    'type' => 'content',
    'where' => 
    array (
      'catid' => '83',
      'userid' => '',
      'updatetime' => '',
      'inputtime' => '',
    ),
    'modelid' => '33',
    'tagcode' => 'tag(\'wslm\', \'tag_content_list_news_simple\', "SELECT contentid,catid,title,inputtime,url,listorder FROM `wslm_content` WHERE  status=99  ".get_sql_catid(83)." ORDER BY listorder DESC", $page, 10, array (), 83)',
  ),
);
?>