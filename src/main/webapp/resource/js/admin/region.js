define(function(require, exports, module) {
	var Page = require('page');
	var tooltip = require('tooltip');
	new Page(pageSize, pageNumber, pageCount);
	$('a[flag="view"').click(function() {
		tooltip.tooltip('完善中...');
	});
	$('a[flag="del"').click(function() {
		tooltip.tooltip('完善中...');
	});
});