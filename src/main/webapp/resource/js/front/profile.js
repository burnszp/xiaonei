define(function(require, exports, module) {
	var Tooltip = require('tooltip');
	var tooltip = new Tooltip();
	if (msg && msg != '') {		
		tooltip.tooltip(msg);
	}
	$('#oldpwdTxt').blur(function( ) {
		var oldPwd = $(this).val();
		$.post(ctx + '/user/checkoldpwd', {
			oldPwd : oldPwd
		}, function(result) {
			console.log(result);
			if (result == 'false') {
				$('#oldpwdTxt').focus();
				tooltip.tooltip('原有密码输入不正确');
			}
		});
	});
	
	$('#changePwdBtn').click(function(){
		var pwd = $('#pwdTxt').val();
		var rePwd = $('#rePwdTxt').val();
		if(pwd!=rePwd){
			tooltip.tooltip('前后密码不一致');
			return false;
		}
	});
})