<?php
return array (
  'link_logo' => 
  array (
    'func' => 'link',
    'introduce' => '',
    'linktype' => '1',
    'typeid' => '1',
    'elite' => '1',
    'linknum' => '20',
    'template' => 'tag_link_logo',
    'var_description' => 
    array (
      1 => '每行显示链接列数',
    ),
    'var_name' => 
    array (
      1 => 'rownum',
    ),
    'var_value' => 
    array (
      1 => '10',
    ),
    'number' => '20',
    'page' => '0',
    'type' => 'link',
    'sql' => 'SELECT * FROM wslm_link where linktype=\'1\' and passed=1 AND typeid=\'1\' AND elite=1',
    'tagcode' => 'tag(\'link\', \'tag_link_logo\', "SELECT * FROM wslm_link where linktype=\'1\' and passed=1 AND typeid=\'1\' AND elite=1", 0, 20, array (  \'typeid\' => \'1\',  \'rownum\' => \'10\',))',
  ),
  'link_text' => 
  array (
    'func' => 'link',
    'introduce' => '',
    'linktype' => '0',
    'typeid' => '1',
    'elite' => '1',
    'linknum' => '20',
    'template' => 'tag_link',
    'var_description' => 
    array (
      1 => '每行显示链接列数',
      2 => '是否显示点击次数',
    ),
    'var_name' => 
    array (
      1 => 'rownum',
      2 => 'showhits',
    ),
    'var_value' => 
    array (
      1 => '10',
      2 => '是',
    ),
    'number' => '20',
    'page' => '0',
    'type' => 'link',
    'sql' => 'SELECT * FROM wslm_link WHERE linktype=\'0\' and passed=1 AND typeid=\'1\' AND elite=1',
    'tagcode' => 'tag(\'link\', \'tag_link\', "SELECT * FROM wslm_link WHERE linktype=\'0\' and passed=1 AND typeid=\'1\' AND elite=1", 0, 20, array (  \'typeid\' => \'1\',  \'rownum\' => \'10\',  \'showhits\' => \'是\',))',
  ),
);
?>