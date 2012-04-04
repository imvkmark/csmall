<?php
return array (
  '留言板' => 
  array (
    'func' => 'guestbook',
    'introduce' => '',
    'guestbooknum' => '1',
    'page' => '0',
    'template' => 'tag_guestbook',
    'var_description' => 
    array (
      1 => '链接样式',
      2 => '打开窗口',
    ),
    'var_name' => 
    array (
      1 => 'class',
      2 => 'target',
    ),
    'var_value' => 
    array (
      1 => 'url',
      2 => '_blank',
    ),
    'number' => '1',
    'type' => 'guestbook',
    'sql' => 'SELECT * FROM wslm_guestbook',
    'tagcode' => 'tag(\'guestbook\', \'tag_guestbook\', "SELECT * FROM wslm_guestbook where passed = 1", 0, 1, array (  \'class\' => \'url\',  \'target\' => \'_blank\',))',
  ),
  'guestbook_reply' => 
  array (
    'func' => 'guestbook',
    'introduce' => '',
    'guestbooknum' => '10',
    'page' => '0',
    'template' => 'tag_guestbook_main',
    'var_description' => 
    array (
      1 => '链接样式',
      2 => '打开窗口',
    ),
    'var_name' => 
    array (
      1 => 'class',
      2 => 'target',
    ),
    'var_value' => 
    array (
      1 => 'url',
      2 => '_blank',
    ),
    'number' => '10',
    'type' => 'guestbook',
    'sql' => 'SELECT * FROM wslm_guestbook',
    'tagcode' => 'tag(\'guestbook\', \'tag_guestbook_main\', "SELECT * FROM wslm_guestbook", 0, 10, array (  \'class\' => \'url\',  \'target\' => \'_blank\',))',
  ),
);
?>