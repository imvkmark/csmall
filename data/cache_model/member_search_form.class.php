<?php
class member_search_form
{
	var $db;
	var $modelid;
	var $fields;
	var $common_fields;
	var $model_fields;
	var $userid;
	var $order;

    function __construct($modelid)
    {
		global $db;
		$this->db = &$db;
		$this->modelid = $modelid;
		$this->model_fields = $this->modelid ? cache_read($this->modelid.'_fields.inc.php', CACHE_MODEL_PATH) : '';
		$this->common_fields = cache_read('common_fields.inc.php', WSLM_ROOT.'member/admin/include/fields/');
        $this->fields = $this->modelid ? array_merge($this->common_fields, $this->model_fields) : $this->common_fields;
        $this->set();
    }

	function member_search_form($modelid)
	{
		$this->__construct($modelid);
	}

	function set()
	{
		$this->where = array();
		if(!is_array($this->fields) || empty($this->fields)) return false;
		foreach($this->fields as $field=>$v)
		{
			$func = $v['formtype'];
			if($v['issearch'] && method_exists($this, $func))
			{
				$value = isset($_GET[$field]) ? $_GET[$field] : '';
				$form = $this->$func($field, $value, $v);
				$this->where[$field] = array('name'=>$v['name'], 'tips'=>$v['tips'], 'form'=>$form, 'star'=>$v['minlength']);
			}
			if($v['isorder'])
			{
				$pre = isset($this->common_fields[$field]) ? 'a.' : 'b.';
				$this->order[$pre.$field.' ASC'] = $v['name'].' 升序';
				$this->order[$pre.$field.' DESC'] = $v['name'].' 降序';
			}
		}
		return true;
	}

	function get_where()
	{
		return $this->where;
	}

	function get_order()
	{
		return $this->order;
	}

	function areaid($field, $value, $fieldinfo)
	{
		global $AREA;
		extract($fieldinfo);
		$js = "<script type=\"text/javascript\">
					function area_load(id)
					{
						\$.get('load.php', { field: 'areaid', id: id,  value: '".$field."'  },
							  function(data){
								\$('#$field').val(id);
								\$('#load_$field').append(data);
							  });
					}
					function area_reload()
					{
						\$('#load_$field').html('');
						area_load(0);
					}
					area_load(0);
			</script>";
		if($value)
		{
			$areaname = $AREA[$value]['name'];
			return "<input type=\"hidden\" name=\"$field\" id=\"$field\" value=\"$value\">
			<span onclick=\"this.style.display='none';\$('reselect_$field').style.display='';\" style=\"cursor:pointer;\">$areaname <font color=\"red\">点击重选</font></span>
			<span id=\"reselect_$field\" style=\"display:none;\">
			<span id=\"load_$field\"></span> 
			<a href=\"javascript:area_reload();\">重选</a>
			</span>$js";
		}
		else
		{
			return "<input type=\"hidden\" name=\"$field\" id=\"$field\" value=\"$value\">
			<span id=\"load_$field\"></span>
			<a href=\"javascript:area_reload();\">重选</a>$js";
		}
	}
	function box($field, $value, $fieldinfo)
	{
		extract($fieldinfo);
		if($boxtype == 'radio')
		{
			return form::radio( $options, $field, $field, $value, $cols, $css, $formattribute, $width);
		}
		else
		{
			return form::select($options, $field, $field, $value, $size, $css, $formattribute);
		}
	}
 	function datetime($field, $value, $fieldinfo)
	{
		extract($fieldinfo);
		$isdatetime = $dateformat == 'datetime' ? 1 : 0;
		return form::date("{$field}[start]", $value['start'], $isdatetime).' - '.form::date("{$field}[end]", $value['end'], $isdatetime);
	}	function editor($field, $value, $fieldinfo)
	{
		return form::text($field, $field, $value, 'text', 10);
	}
	function number($field, $value, $fieldinfo)
	{
		extract($fieldinfo);
		return form::text($field.'[start]', $field, $value['start'], 'text', 10, $css, $formattribute).' - '.form::text($field.'[end]', $field, $value['end'], 'text', 10, $css, $formattribute);
	}
	function text($field, $value, $fieldinfo)
	{
		return form::text($field, $field, $value, 'text', 10);
	}
	function textarea($field, $value, $fieldinfo)
	{
		return "<input type=\"text\" name=\"$field\" value=\"$value\" size=\"10\">";
	}
}
?>