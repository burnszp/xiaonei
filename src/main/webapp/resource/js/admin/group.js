define(function(require, exports, module) {
	var Page = require('page');
	var tooltip = require('tooltip');
	new Page(pageSize, pageNumber, pageCount);
	if ($('[data-toggle="switch"]').length) {
		$('[data-toggle="switch"]').bootstrapSwitch();
	}
	$('.mrl').click(function() {
		var me = $(this);
		var id = me.attr('id');
		var status = me.attr('status') == "0" ? "1" : "0";
		$.post(ctx + '/admin/updategroupstatus/', {
			id : id,
			status : status
		}, function(result) {
			if (result) {
				me.attr('status', status);

			}
		});
	});
	var groupId = "";
	var status = 0;
	$('select').change(function(p1, p2) {
		status = $(this).val();
		groupId = $(this).attr('recid');
		$('#statusModal').modal();
	});
	$('#changeMsgBtn').click(function() {
		var statusMsg = $('#statusMsg').val();
		$.post(ctx + '/admin/updategroupstatus', {
			id : groupId,
			status : status,
			msg : statusMsg
		}, function() {
			tooltip.tooltip('更改群组状态成功');
		});
	});

});