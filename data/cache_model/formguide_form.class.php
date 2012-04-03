<?php
class formguide_form
{
	var $formid;
	var $fields;

    function __construct($formid)
    {
		global $db;
		$this->db = &$db;
		$this->formid = $formid;
		$this->fields = cache_read($this->formid.'_formfields.inc.php', CACHE_MODEL_PATH);		
	}

	function formguide_form($formid)
	{
		$this->__construct($formid);
	}
	
	function get($data = array())
	{
		global $_groupid;
		$info = array();
		if(empty($this->fields)) return false;

		foreach($this->fields as $field=>$v)
		{
			if(check_in($_groupid, $v['unsetgroupids'])) continue;
			$func = $v['formtype'];
			$value = isset($data[$field]) ? htmlspecialchars($data[$field], ENT_QUOTES) : '';
			$form = $this->$func($field, $value, $v);
			$info[$field] = array('name'=>$v['name'], 'field'=>$field, 'tips'=>$v['tips'], 'form'=>$form, 'star'=>$v['minlength'], 'islistbackgroud'=>$v['isbackground']);
		}
		return $info;
	}

	function areaid($field, $value, $fieldinfo)
	{
		global $AREA;
		extract($fieldinfo);
		$js = "<script type=\"text/javascript\">
					function area_load(id)
					{
						$.get('".WSLM_PATH."load.php', { field: 'areaid', id: id, value: '".$field."' },
							  function(data){
								$('#load_$field').append(data);
							  });
					}
					function area_reload()
					{
						$('#load_$field').html('');
						area_load(0);
					}
					area_load(0);
			</script>";
		if($value)
		{
			$areaname = $AREA[$value]['name'];
			return "<input type=\"hidden\" name=\"info[$field]\" id=\"$field\" value=\"$value\">
			<span onclick=\"this.style.display='none';\$('#reselect_$field').show();\" style=\"cursor:pointer;\">$areaname <font color=\"red\">点击重选</font></span>
			<span id=\"reselect_$field\" style=\"display:none;\">
			<span id=\"load_$field\"></span> 
			<a href=\"javascript:area_reload();\">重选</a>
			</span>$js";
		}
		else
		{
			return "<input type=\"hidden\" name=\"info[$field]\" id=\"$field\" value=\"$value\">
			<span id=\"load_$field\"></span>
			<a href=\"javascript:area_reload();\">重选</a>$js";
		}
	}

	function box($field, $value, $fieldinfo)
	{
		extract($fieldinfo);
		if(!$value) $value = $defaultvalue;
		if($boxtype == 'radio')
		{
			return form::radio($options, 'info['.$field.']', $field, $value, $cols, $css, $formattribute, $width);
		}
		elseif($boxtype == 'checkbox')
		{
			return form::checkbox($options, 'info['.$field.']', $field, $value, $cols, $css, $formattribute, $width);
		}
		elseif($boxtype == 'select')
		{
			return form::select($options, 'info['.$field.']', $field, $value, $size, $css, $formattribute);
		}
		elseif($boxtype == 'multiple')
		{
			return form::multiple($options, 'info['.$field.']', $field, $value, $size, $css, $formattribute);
		}
	}
	function datetime($field, $value, $fieldinfo)
	{
		extract($fieldinfo);
		if(!$value)
		{
			if($defaulttype == 0)
			{
				$value = '';
			}
			elseif($defaulttype == 1)
			{
				$df = $dateformat == 'datetime' ? 'Y-m-d H:i:s' : 'Y-m-d';
				$value = date($df, TIME);
			}
			else
			{
				$value = $defaultvalue;
			}
		}
		if(substr($value, 0, 10) == '0000-00-00') $value = '';
		$isdatetime = $dateformat == 'datetime' ? 1 : 0;
		$str = form::date("info[$field]", $value, $isdatetime);
		return $str;
	}
	function editor($field, $value, $fieldinfo)
	{
		extract($fieldinfo);
		if(!$value) $value = $defaultvalue;
		if($this->userid && $this->fields[$field]['storage'] == 'file') $value = content_get($this->userid, $field);
		$data = "<textarea name=\"info[$field]\" id=\"$field\" style=\"display:none\">$value</textarea>\n";
		return $data.form::editor($field, $toolbar, $width, $height);
	}
	function file($field, $value, $fieldinfo)
	{
		global $M;
		extract($fieldinfo);
		if(!$value) $value = $defaultvalue;
		return "<input type=\"text\" name=\"info[$field]\" id=\"$field\" value=\"$value\" size=\"$size\" class=\"$css\" $formattribute/> <input type=\"hidden\" name=\"{$field}_aid\" value=\"0\"> <input type=\"button\" name=\"{$field}_upimage\" id=\"{$field}_upimage\" value=\"上传文件\" style=\"width:60px\" onclick=\"javascript:openwinx('".WSLM_PATH.$M[url]."upload_field.php?uploadtext={$field}&formid={$formid}&fieldid={$fieldid}&type=file','upload','450','350')\"/>";
	}
	function image($field, $value, $fieldinfo)
	{
		global $catid,$WSLM,$M;
		extract($fieldinfo);
		if(!$value) $value = $defaultvalue;
		return "<input type=\"text\" name=\"info[$field]\" id=\"$field\" value=\"$value\" size=\"$size\" class=\"$css\" $formattribute/> <input type=\"hidden\" name=\"{$field}_aid\" value=\"0\"> <input type=\"button\" name=\"{$field}_upimage\" id=\"{$field}_upimage\" value=\"上传图片\" style=\"width:60px\" onclick=\"javascript:openwinx('/$M[url]upload_field.php?uploadtext={$field}&formid={$formid}&fieldid={$fieldid}&type=image','upload','450','350')\"/> <input name=\"cutpic\" type=\"button\" id=\"cutpic\" value=\"裁剪图片\" onclick=\"CutPic('$field','$WSLM[siteurl]')\"/>";
	}
	function number($field, $value, $fieldinfo)
	{
		extract($fieldinfo);
		if(!$value) $value = $defaultvalue;
		return form::text('info['.$field.']', $field, $value, 'text', 10, $css, $formattribute, $minlength, $maxlength, $pattern, $errortips);
	}
	function template($field, $value, $fieldinfo)
	{
		extract($fieldinfo);
		if(!$value) $value = $defaultvalue;
		return form::select_template('info['.$field.']', $field, $value, $size);
	}
	function text($field, $value, $fieldinfo)
	{
		extract($fieldinfo);
		if(!$value) $value = $defaultvalue;
		$type = $ispassword ? 'password' : 'text';
		return form::text('info['.$field.']', $field, $value, $type, $size, $css, $formattribute, $minlength, $maxlength, $pattern, $errortips);
	}
	function textarea($field, $value, $fieldinfo)
	{
		extract($fieldinfo);
		if(!$value) $value = $defaultvalue;
		return form::textarea('info['.$field.']', $field, $value, $rows, $cols, $css, $formattribute);
	}
}
?>