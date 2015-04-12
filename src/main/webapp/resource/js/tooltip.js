define(function(require, exports, module) {
	module.exports = {
		container : $('#tooltip'),
		show : function(text) {
			$("html,body").animate({
				scrollTop : 0
			}, 200);
			this.container.html(text);
			this.container.css('width', (text.length * 20) + 'px');
			this.container.show();
		},
		tooltip:function(text){
			this.show(text);
			var me = this;
			setTimeout(function(){
				me.hide();
				
			},3000);
		},
		hide : function() {
			this.container.hide();
			var me = this;
			setTimeout(function() {
				me.hide();

			}, 3000);
		}
	};
});