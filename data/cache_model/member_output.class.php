<?php
class member_output
{
	var $db;
	var $modelid;
	var $userid;
	var $fields;

    function __construct($modelid, $userid)
    {
		global $db;
		$this->db = &$db;
		$this->modelid = $modelid;
		$this->userid = $userid;
		$this->fields = cache_read($this->modelid.'_fields.inc.php', CACHE_MODEL_PATH);
    }

    function member_output($modelid, $userid)
    {
    	$this->__construct($modelid, $userid);
    }
    
	function get($data)
	{
		$info = array();
		if(!is_array($data) || empty($data)) return false;
		foreach($data as $field=>$value)
		{
			if(!isset($this->fields[$field])) continue;
			$func = $this->fields[$field]['formtype'];
			if(!$this->fields[$field]['islist'])
			{
				continue;
			}
			$info[$this->fields[$field]['name']] = method_exists($this, $func) ? $this->$func($field, $value) : $value;
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
	function catids($field, $value)
	{
		return substr($value,1,-1);
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
	function groupid($field, $value)
	{
	    global $priv_group, $GROUP;
		if(!isset($GROUP)) $GROUP = cache_read('member_group.php');
        $value = '';
		$priv = $this->fields[$field]['priv'];
		$groupids = $priv_group->get_groupid('contentid', $this->contentid, $priv);
		foreach($groupids as $groupid)
		{
			$value .= $GROUP[$groupid].' ';
		}
		return $value;
	}
	function image($field, $value)
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