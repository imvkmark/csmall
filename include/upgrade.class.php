<?php 
class upgrade
{
	var $modules;
	var $update_url;
	var $http;

	function upgrade()
	{
		global $db;
		$this->db = &$db;
		$this->update_url = 'http://update.wslm.cn/';
		$this->http = load('http.class.php');
	}

	function check()
	{
		$url = $this->url('check');
        if(!$this->http->get($url)) return false;
		return $this->http->get_data();
	}

	function url($action = 'check')
	{
		global $MODULE, $WSLM, $_username, $_email;
        $modules = '';
		foreach($MODULE as $module=>$m)
		{
			$modules .= ','.$module.'|'.$m['version'];
		}
		$modules = substr($modules, 1);
		$pars = array(
			'action'=>$action,
			'wslm_username'=>$WSLM['wslm_username'],
			'sitename'=>urlencode($WSLM['sitename']),
			'siteurl'=>$WSLM['siteurl'],
			'charset'=>CHARSET,
			'version'=>WSLM_VERSION,
			'release'=>WSLM_RELEASE,
			'os'=>PHP_OS,
			'php'=>phpversion(),
			'mysql'=>$this->db->version(),
			'browser'=>urlencode($_SERVER['HTTP_USER_AGENT']),
			'username'=>urlencode($_username),
			'email'=>$_email,
			'modules'=>$modules,
			);
		$data = http_build_query($pars);
		$verify = md5($data.$WSLM['wslm_password']);
		return $this->update_url.'?'.$data.'&verify='.$verify;
	}

	function notice()
	{
		return $this->url('notice');
	}

	function download()
	{
		@set_time_limit(600);
		$url = $this->url('download');
        if(!$this->http->get($url)) return false;
		$data = $this->http->get_data();
		return file_put_contents(WSLM_ROOT.'data/upgrade.php', $data);
	}
}
?>