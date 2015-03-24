define(function(require, exports, module) {
	var Tooltip = require('tooltip');
	var tooltip = new Tooltip();
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
	
	
	function test(){
		var inputs = $('form:input');
		console.log( $('form'));
//		var sels = $('form:select');
//		inputs.concat(sels); 
		console.log(inputs);
	}
	$('#name').blur(function() {
		console.log(this.value);
		console.log(this);
		var name = this.value;
		if (name == null || name == "") {
			tooltip.tooltip("用户名不能为空");
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
})