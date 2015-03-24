define(function(require, exports, module) {
	if(msg&&msg!=''){
		var Tooltip = require('tooltip');
		var tooltip = new Tooltip();
		tooltip.tooltip(msg);
	}
})