<?php
class member_search
{
	var $db;
	var $modelid;
	var $fields;
	var $table;
	var $pages;
	var $sql;
	var $common_fields;
	var $model_fields;
	
	function __construct($modelid)
	{
		global $db;
		$this->db = &$db;
		$this->modelid = intval($modelid);
		$this->common_fields = cache_read('common_fields.inc.php', WSLM_ROOT.'member/admin/include/fields/');
		if($this->modelid < 1) return false;
		$this->set_modelid($this->modelid);
		$this->set();
	}
	
	function member_search($modelid)
	{
		$this->__construct($modelid);
	}
	
	function set()
	{
		$where = array();
		foreach($this->fields as $field=>$v)
		{
			$func = $v['formtype'];
			$pre = isset($this->common_fields[$field]) ? 'a.' : 'b.';
			if($v['issearch'] && isset($_GET[$field]) && method_exists($this, $func))
			{	 
				 $where[$field] = $this->$func($pre.$field, $_GET[$field]);
			}
			if($v['isorder'])
			{
				$this->order[] = $pre.$field.' ASC';
				$this->order[] = $pre.$field.' DESC';
			}
		}
		$where = implode(' AND ', array_filter($where));
		$orderby = in_array($_GET['orderby'], $this->order) ? $_GET['orderby'] : 'a.userid DESC';
		if($this->modelid)
		{
			if($where) $where = "AND $where";
			$sql = "SELECT * FROM $this->table WHERE a.userid=b.userid AND a.userid=i.userid $where ORDER BY $orderby";
		}
		else
		{
			return true;
		}
		$this->sql = $sql;
		return true;
	}

	function set_modelid()
	{
		global $MODEL;
		if(!isset($MODEL[$this->modelid])) return false;
		$this->table = $this->modelid ? '`'.DB_PRE.'member_cache` a, `'.DB_PRE.'member_info` i, `'.DB_PRE.'member_'.$MODEL[$this->modelid]['tablename'].'` b': '`'.DB_PRE.'member_cache` a';
		$this->model_fields = cache_read($this->modelid.'_fields.inc.php', CACHE_MODEL_PATH);
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
			if(isset($r['avatar']))
			{
				$userid = intval($r['userid']);
				$r['avatar'] = avatar($userid);
			}
			$data[] = $r;
		}
		$this->db->free_result($result);
		return $data;
	}
    function areaid($field, $value)
    {
	     return $value == 0 ? '' : " $field='$value' "; 
    }	function box($field, $value)
	{
		return $value === '' ? '' : " $field='$value' ";
	}
    function catids($field, $value)
    {
	     return $value == 0 ? '' : " $field='$value' "; 
    }	function datetime($field, $value)
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
		return $value === '' ? '' : " $field LIKE '%$value%' ";
	}	function number($field, $value)
	{
	    $sql = '';
	    if($value['start']) $sql .= " $field>='$value[start]'";
	    if($value['end']) $sql .= " $field<='$value[end]'";
		return $sql;
	}	function text($field, $value)
	{
		return $value === '' ? '' : " $field LIKE '%$value%' ";
	}	function textarea($field, $value)
    {
	     return $value ? " $field='$value' " : ''; 
    }}
?>