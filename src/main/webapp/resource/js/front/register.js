define(function(require, exports, module) {
	var tooltip = require('tooltip');
	tooltip.show(msg);
	$('#province').change(
			function(p1, p2, p3) {
				var pid = this.value;
				console.log(ctx);
				$.post(ctx + '/front/querycity', {
					pid : pid
				}, function(result) {
					$('#city').html(
							'<option selected="selected">---请选择---</option>')
					var resultObj = $.parseJSON(result);
					if (resultObj.length == 0) {

					} else {
						for (var i = 0; i < resultObj.length; i++) {
							$('#city').append(
									'<option  value="' + resultObj[i]['id']
											+ '">' + resultObj[i]['name']
											+ '</option>');
						}
					}
				});
			});
	$('#confirmPwd').blur(function(){
		var pwd = $('#pwd').val();
		var pwd2 = $('#confirmPwd').val();
		if(pwd!=pwd2){
			$('#lblConfirmPwd').show().html('密码不一致');
			$('#confirmPwd').focus();
			return;
		}
		$('#lblConfirmPwd').show().html('');
		
	});
	$('#name').blur(function() {
		var name = this.value;
		if (name == null || name == "") {
			$('#lblUser').show().html('用户名不能为空');
		} else {
			$.post(ctx + '/front/checkname', {
				name : name
			}, function(result) {
				if (result == 'false') {
					$('#lblUser').show().html('该用户名已经存在，请使用其他用户名');
				} else {
					$('#lblUser').html('').hide();
				}
			});
		}

	}); 
	$('#regBtn').click(function(){
		var success = true;
		  $("input").each(function(){
			    var valid = $(this).attr('valid');
			    if(valid){
			    	if(valid=='notnull'){
			    		if(!$(this).val()){
			    			tooltip.show('请输入必填项');
			    			success =false;
			    		}
			    	}
			    }
			  });
		return success;
		
	})
})