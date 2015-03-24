define(function(require,exports,module){
	if(msg){
		var Tooltip = require('tooltip');
		var tooltip = new Tooltip();
		tooltip.tooltip(msg);
		
	}
	/**
	 * 给加载更多按钮注册点击方法
	 */
	$('#reloadMore').click(function(){
			// 1，获取当前页面显示的最新的帖子的所属页数
			var pageNumber = (Number)($('#pageNumber').val())+1;
			// 2，根据当前页数加1，去后台查询指定页数的10条帖子，
			$.post(ctx+'/group/getmsg',{page:pageNumber,gid:gid},function(result){
				// 将json格式的字符串转换为json对象
				var messageList = eval(result);
				if(messageList.length==0){
					$('#reloadMore').removeClass('btn-primary').addClass('btn-default').text('没有新贴子');
				}
				
				// 3，将查询回来的帖子追加到页面帖子列表尾部。
				var trList = "";
				for(var i=0;i<messageList.length;i++){
					var message = messageList[i];
					var tr='<tr><td><a href="message/magessage_detail?id='+message.id+'">'+message.title+'</a></td>';
						tr+='<td><a href="#">'+message.user.nickName+'</a></td>';
						tr+='<td>'+(message.status==0?'发布中':'已关闭')+'</td>';
						tr+='<td>'+message.createtime+'</td></tr>'
						trList+=tr;
					
				}
				$('.table').append(trList);
				$('#pageNumber').val(pageNumber);
			});

		
	});
});