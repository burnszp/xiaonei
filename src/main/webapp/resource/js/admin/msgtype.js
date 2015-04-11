define(function(require, exports, module) {
	var Page = require('page');
	new Page(pageSize, pageNumber, pageCount);
	var tooltip = require('tooltip');
	$('a[flag="del"').click(function() {
			
			selectedIds="";
			var checkboxs = $('input[type="checkbox"]:checked');
			if(checkboxs.length==0){
				tooltip.show('请选择要删除的项');
				return
			}
			checkboxs.each(function(i,val) { 
				selectedIds+=$(val).val()+",";
			});
			$('#myModal').modal();
			$('#modalOk').unbind().click(function(){
				window.location.href=ctx+"/admin/msgtype/delete?ids="+selectedIds;
		});
	});
});