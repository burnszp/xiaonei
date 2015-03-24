define(function(require, exports, module) {
	var Page = require('page');
	var Tooltip = require('tooltip');
	var tooltip = new Tooltip();
	new Page(pageSize, pageNumber, pageCount);
	$('a[flag="view"').click(function() {
		tooltip.tooltip('完善中...');
	});
	$('a[flag="del"').click(function() {
		tooltip.tooltip('完善中...');
	});
	if ($('[data-toggle="switch"]').length) {
		$('[data-toggle="switch"]').bootstrapSwitch();
	}
	$('.mrl').click(function(){
		 var me = $(this);
		 var id = me.attr('id');
		 var status = me.attr('status')=="0"?"1":"0";
		 $.post(ctx+'/admin/updategroupstatus/',{id:id,status:status},function(result){
			 if(result){
				 me.attr('status',status);
				  
			 }
		 });
	});

});