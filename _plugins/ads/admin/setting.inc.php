<?php
defined('IN_WSLM') or exit('Access Denied');

if($dosubmit)
{
	$setting['htmldir'] = trim($setting['htmldir']);
	if(!$setting['htmldir']) showmessage('Ads dir is null !');
	module_setting($mod, $setting);
	if(trim($M['htmldir']) != '' && $M['htmldir'] != $setting['htmldir'])
	{
		@unlink(WSLM_ROOT.'/data/'.$M['htmldir'].'.php');
		dir_delete(WSLM_ROOT.'/data/'.$M['htmldir'].'/');
		$forward = '?mod=ads&file=ads_place&action=createhtml';
	}
	$filename = WSLM_ROOT.'/data/'.$setting['htmldir'].'.php';
	if(!file_exists($filename))
	{
		$data = "<?php\nchdir('../ads/');\nrequire './ad.php';\n?>";
		file_put_contents($filename, $data);
		@chmod($filename, 0777);
	}
	showmessage($LANG['save_setting_success'], $forward);
}
else
{
	@extract(new_htmlspecialchars($M));
    include admin_tpl('setting');
}
?>