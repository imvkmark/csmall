<?php
return array (
  'index_hover' => 'tag(\'wslm\', \'tag_content_index_hover\', "SELECT a.contentid,a.catid,a.title,a.thumb,a.description,a.userid,b.link,a.listorder FROM `wslm_content` a, `wslm_c_picdeslink` b WHERE a.contentid=b.contentid AND a.status=99  ".get_sql_catid($cid)." ORDER BY a.listorder DESC", 0, 1, array ())',
  'index_nhover' => 'tag(\'wslm\', \'tag_content_index_nhover\', "SELECT contentid,catid,title,thumb,userid,updatetime,inputtime,listorder FROM `wslm_content` WHERE  status=99  ".get_sql_catid($cid)." ORDER BY contentid DESC", 0, 1, array ())',
  'index_change' => 'tag(\'wslm\', \'tag_content_index_change\', "SELECT contentid,catid,title,thumb,userid,updatetime,inputtime,listorder FROM `wslm_content` WHERE  status=99  ".get_sql_catid($cid)." ORDER BY listorder DESC", 0, 10, array ())',
  'index_news_list' => 'tag(\'wslm\', \'tag_content_index_news_list\', "SELECT contentid,catid,title,thumb,description,userid,updatetime,inputtime,url,listorder FROM `wslm_content` WHERE  status=99  ".get_sql_catid($cid)." ORDER BY listorder DESC", 0, 3, array ())',
  '文字链接' => 'tag(\'link\', \'tag_link\', "SELECT * FROM wslm_link where linktype=\'0\' and passed=1 AND elite=1 ORDER BY listorder ASC", 0, 18, array (  \'typeid\' => \'0\',  \'rownum\' => \'10\',  \'showhits\' => \'是\',))',
  'logo链接' => 'tag(\'link\', \'tag_link_logo\', "SELECT * FROM wslm_link where linktype=\'1\' and passed=1 AND elite=1", 0, 20, array (  \'typeid\' => \'0\',  \'rownum\' => \'15\',  \'showhits\' => \'是\',))',
  '首页图片链接' => 'tag(\'link\', \'tag_link_logo\', "SELECT * FROM wslm_link where linktype=\'1\' and passed=1", 0, 20, array (  \'typeid\' => \'0\',  \'rownum\' => \'10\',  \'showhits\' => \'1\',))',
  '留言板' => 'tag(\'guestbook\', \'tag_guestbook\', "SELECT * FROM wslm_guestbook", 0, 1, array (  \'class\' => \'url\',  \'target\' => \'_blank\',))',
);
?>