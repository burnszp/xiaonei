define(function(require, exports, module) {
	
	var Tooltip = require('tooltip');
	var tooltip = new Tooltip();
	var Page = require('page');
	new Page(pageSize, pageNumber, pageCount);
	var selectedIds = "";
	
	$('a[flag="view"').click(function(){ 
		var checkboxs = $('input[type="checkbox"]:checked');
		if(checkboxs.length==0){
			tooltip.show('请至少选择一条记录进行查看');
			return
		}
		if(checkboxs.length>1){
			tooltip.show('请选择一条记录进行查看');
			return;
		}else{
			window.location.href=ctx+"/admin/userform?id="+$(checkboxs[0]).val();
		}
		
	});
	$('a[flag="del"').click(function(){
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
			window.location.href=ctx+"/admin/userdel?ids="+selectedIds;
		});
	});
});