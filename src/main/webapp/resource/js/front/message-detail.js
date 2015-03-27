define(function(require, exports, module) {
	var Tooltip = require('tooltip');
	var tooltip = new Tooltip;
	/**
	 * 给回复按钮添加点击事件
	 */
	$('#replayBtn').click(function() {
		var content = $('#replayTxt').val().trim();
		if (content == '') {
			tooltip.tooltip('回复内容不能为空');
			return;
		}
		console.log(content);
		$.post(ctx + '/message/addreplay', {
			'msg.descript' : content,
			'msg.gid' : gid,
			'msg.replayId' : rid
		}, function(result) {
			var message = eval('(' + result + ')');
			// 将json格式的字符串转换为json对象
			if (message.contains('error:')) {
				tooltip.tooltip(message.split(':')[1]);
				return;
			}
			
			if (message == null) {
				tooltip.tooltip('提交数据发生错误！');
				return;
			}
			// 将返回的帖子添加到帖子顶部
			var divmessage = '<hr><div class="row"><div class="col-md-2">';
			divmessage += message.user.nickName + '<br>';
			divmessage += message.createtime.substring(0, 10);
			divmessage += '</div><div class="col-md-10">';
			divmessage += message.descript;
			divmessage += '</div></div>'
			$('#replayDiv').before(divmessage);
		});
	});
});