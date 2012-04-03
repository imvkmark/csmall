<?php
class formguide_tag
{
	var $db;
	var $formid;
	var $fields;
	var $table;

    function __construct($formid)
    {
		global $db;
		$this->db = &$db;
		$this->formid = $formid;
		$this->fields = cache_read($this->formid.'_formfields.inc.php', CACHE_MODEL_PATH);
		$this->table = DB_PRE.'formguide_fields';
    }

    function formguide_tag($formid)
    {
    	$this->__construct($formid);	
    }
    
	function get()
	{
		$where = "WHERE formid='$this->formid'";
		$sql = "SELECT * FROM $this->table $where";
		return $sql;
	}

    function areaid($field, $value)
    {
	     return $value === '' ? '' : " `areaid`='$value' "; 
    }	
	function box($field, $value)
	{
		if($value && is_array($value))
		{
			$values = '';
			foreach($value AS $_k)
			{
				$values .= "'".$_k."',";
			}
			$value = substr($values,0,-1);
			return "`$field` IN ($value)' ";
		}
		else
		{
			return $value === '' ? '' : " `$field`='$value' ";
		}
	}
	function datetime($field, $value)
	{
		return $value === '' ? '' : " $field='$value' ";
	}	function number($field, $value)
	{
		return $value === '' ? '' : " `$field`='$value' ";
	}	function text($field, $value)
	{
		return $value === '' ? '' : " `$field`='$value' ";
	}	function textarea($field, $value)
	{
		return $value === '' ? '' : " `$field`='$value' ";
	}}
?>