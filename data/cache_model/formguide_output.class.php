<?php
class formguide_output
{
	var $db;
	var $formid;
	var $fields;

    function __construct($formid)
    {
		global $db;
		$this->db = &$db;
		$this->formid = $formid;
		if($this->formid < 1) return false;
		$this->fields = cache_read($this->formid.'_formfields.inc.php', CACHE_MODEL_PATH);
    }

    function formguide_output($formid)
    {
    	$this->__construct($formid);
    }
    
	function get($data)
	{
		$info = array();
		foreach($data as $field=>$value)
		{
			if(!isset($this->fields[$field])) continue;
			$func = $this->fields[$field]['formtype'];
			$info[$field] = method_exists($this, $func) ? $this->$func($field, $value) : $value;
		}
		return $info;
	}
	function areaid($field, $value)
	{
		global $AREA;
		return $AREA[$value]['name'];
	}

	function box($field, $value)
	{
		$s1 = "\n";
		$s2 = '|';
		$options = explode($s1, $this->fields[$field]['options']);
		foreach($options as $option)
		{
			if(strpos($option, $s2))
			{
				list($name, $id) = explode($s2, trim($option));
			}
			else
			{
				$name = $id = trim($option);
			}
			$os[$id] = $name;
		}
		if(strpos($value, ','))
		{
			$ids = explode(',', $value);
			$value = '';
			foreach($ids as $id)
			{
				$value .= $os[$id].' ';
			}
		}
		else
		{
			$value = $os[$value];
		}
		return $value;
	}
	
	function datetime($field, $value)
	{
		return $this->fields[$field]['dateformat'] == 'int' ? date($this->fields[$field]['format'], $value) : (substr($value, 0, 4) =='0000' ? '' : $value);
	}	function editor($field, $value)
	{
		if($this->fields[$field]['enablekeylink'])
		{
			$replacenum = $this->fields[$field]['replacenum'];
			$data = keylinks($data, $replacenum);
		}
		return $data ? $data : $value;
	}
	function file($field, $value)
	{
		$a_k = urlencode(wslm_auth("i=-1&m=0&f=$value&mod=formguide", 'ENCODE', AUTH_KEY));
		$result = "<a href='down.php?a_k=$a_k' target='_blank'>点击下载</a>";
		return $value ? $result : '';
	}	function image($field, $value)
	{
		return '<img src="'.$value.'" border="0">';
	}
	function textarea($field, $value)
	{
		if($this->fields[$field]['enablekeylink'])
		{
			$replacenum = $this->fields[$field]['replacenum'];
			$data = keylinks($data, $replacenum);
		}
		return format_textarea($value);
	}}
?>