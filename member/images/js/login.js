function login()
{
	var wslm_auth = get_cookie('wslm_auth');
	var action = wslm_auth ? 'logined' : 'login_form';
    var url = wslm_path + 'member/login.php';
    var pars = 'action='+action+'&auth='+wslm_auth;
	var myAjax = new Ajax.Updater(
					'loginstats',
					url,
					{
					method: 'post',
					parameters: pars
					}
	             ); 
}

function loging()
{
	if($F('username') == '') 
	{
		alert('用户名不能为空！');
		return false;
	}
	else if($F('password') == '') 
	{
		alert('密码不能为空！');
		return false;
	}
	else
	{
		var loginurl = wslm_path + "member/login.php";
		var pars = "action=login_ajax&username="+$F('username')+"&password="+$F('password')+"&cookietime="+$F('cookietime');
		var myAjax = new Ajax.Request(loginurl, {method: 'post', parameters: pars, onComplete: logindo});
	}
}

function logindo(Request)
{
	if(Request.responseText != '') alert(Request.responseText);
    login();
}

function logouting()
{
    var loginurl = wslm_path + "member/logout.php";
    var pars = "action=logout_ajax";
    var myAjax = new Ajax.Request(loginurl, {method: 'post', parameters: pars, onComplete: logoutdo});
}

function logoutdo(Request)
{
	if(Request.responseText != '') alert(Request.responseText);
    login();
}
