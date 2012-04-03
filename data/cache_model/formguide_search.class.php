<?php
class formguide_search
{
	var $db;
	var $formid;
	var $fields;
	var $table;
	var $pages;
	var $sql;
	var $common_fields;
	
	function __construct($formid)
	{
		global $db;
		$this->db = &$db;
		$this->formid = intval($formid);
		if($this->formid < 1) return false;
		$this->common_fields = cache_read('formguide_fields.inc.php', WSLM_ROOT.'formguide/admin/include/fields/');
		$this->set_formid();
		$this->set();
	}
	
	function formguide_search($formid)
	{
		$this->__construct($formid);
	}
	
	function set()
	{
		$where = array();
		foreach($this->fields as $field=>$v)
		{
			$func = $v['formtype'];
			if($v['issearch'] && isset($_GET[$field]) && method_exists($this, $func))
			{
				 $where[$field] = $this->$func($field, $_GET[$field]);
			}
		}
		$where = implode(' AND ', array_filter($where));
		if($where) $where = ' WHERE '.$where;
		$orderby = 'dataid DESC';
		$sql = "SELECT * FROM $this->table $where ORDER BY $orderby";
		$this->sql = $sql;
		return true;
	}

	function set_formid()
	{
		global $FORMGUIDE;
		if(!isset($FORMGUIDE[$this->formid])) return false;
		$this->table = DB_PRE.'form_'.$FORMGUIDE[$this->formid]['tablename'];
		$this->fields = $this->modelid ? array_merge($this->model_fields, $this->common_fields) : $this->common_fields;
		return true;
	}

	function data($page = 1, $pagesize = 20)
	{
		if(!$this->sql) return false;
		$page = max(intval($page), 1);
		$offset = $pagesize*($page-1);
		$sql_count = preg_replace("/^SELECT([^(]+)FROM(.+)(ORDER BY.+)$/i", "SELECT COUNT(*) AS `count` FROM\\2", $this->sql);
		$this->total = cache_count($sql_count);
		if($this->total == 0) return array();
		$this->pages = pages($this->total, $page, $pagesize);
		$data = array();
		$result = $this->db->query("$this->sql LIMIT $offset, $pagesize");
		while($r = $this->db->fetch_array($result))
		{
			$data[] = $r;
		}
		$this->db->free_result($result);
		return $data;
	}
    function areaid($field, $value)
    {
	     return $value == 0 ? '' : " `$field`='$value' "; 
    }
	function box($field, $value)
	{
		return $value === '' ? '' : " `$field`='$value' ";
	}
	function datetime($field, $value)
	{
		$sql = '';
		if($this->fields[$field]['dateformat'] == 'int')
		{
			if($value['start'])
			{
				$value['start'] = strtotime($value['start']);
				$sql .= "AND `$field`>='$value[start]' ";
			}
			if($value['end'])
			{
				$value['end'] = strtotime($value['end']);
				$sql .= "AND `$field`<='$value[end]' ";
			}
		}
		else
		{
			if($value['start']) $sql .= "AND `$field`>='$value[start]' ";
			if($value['end']) $sql .= "AND `$field`<='$value[end]' ";
		}
		if($sql) $sql = substr($sql, 3);
		return $sql;
	}
	function editor($field, $value)
	{
		return $value === '' ? '' : " `$field` LIKE '%$value%' ";
	}	function number($field, $value)
	{
	    $sql = '';
	    if($value['start']) $sql .= " `$field`>='$value[start]'";
	    if($value['end']) $sql .= " `$field`<='$value[end]'";
		return $sql;
	}	function text($field, $value)
	{
		return $value === '' ? '' : " `$field` LIKE '%$value%' ";
	}	function textarea($field, $value)
    {
	     return $value ? " `$field`='$value' " : ''; 
    }
	function username($field, $value)
    {
		$query = $this->db->query("SELECT userid FROM ".DB_PRE."member_cache WHERE username LIKE '%$value%'");
		while($r = $this->db->fetch_array($query))
		{
			$result[] = $r['userid'];  
		}
		$str_userid = implode(",", $result);
		if(!$result) return " `userid` IN ('') ";	
		return ($value === '' || $str_userid == '') ? '' : " `userid` IN('$str_userid') "; 
    }}
?>