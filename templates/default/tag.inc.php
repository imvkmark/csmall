<?php
return array (
  'link_logo' => 'tag(\'link\', \'tag_link_logo\', "SELECT * FROM wslm_link where linktype=\'1\' and passed=1 AND typeid=\'1\' AND elite=1", 0, 20, array (  \'typeid\' => \'1\',  \'rownum\' => \'10\',))',
  'link_text' => 'tag(\'link\', \'tag_link\', "SELECT * FROM wslm_link WHERE linktype=\'0\' and passed=1 AND typeid=\'1\' AND elite=1", 0, 20, array (  \'typeid\' => \'1\',  \'rownum\' => \'10\',  \'showhits\' => \'是\',))',
  '留言板' => 'tag(\'guestbook\', \'tag_guestbook\', "SELECT * FROM wslm_guestbook where passed = 1", 0, 1, array (  \'class\' => \'url\',  \'target\' => \'_blank\',))',
  'guestbook_reply' => 'tag(\'guestbook\', \'tag_guestbook_main\', "SELECT * FROM wslm_guestbook", 0, 10, array (  \'class\' => \'url\',  \'target\' => \'_blank\',))',
);
?>