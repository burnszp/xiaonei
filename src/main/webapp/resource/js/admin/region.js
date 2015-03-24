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
});