<%@page language="java" pageEncoding="UTF-8"%>
<%@include file="../layout/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>群组管理</title>
</head>
<body flag="admin">
	<div class="row">
		<div class="col-md-12">
			<ol class="breadcrumb">
				<li><a href="/${ctx}">首页</a></li>
				<li><a href="${ctx}/admin">系统管理</a></li>
				<li class="active">群组管理</li>
			</ol>
		</div>
	</div>

	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-info">
				<div class="panel-heading">
					<div style="display: inline;">群组管理</div>
				</div>

				<div class="panel-body">
					<table class="table table-hover table-condensed table-bordered">
						<thead>
							 
							<th>名称</th>
							<th>备注</th>
							<th>状态</th>

						</thead>

						<tbody>
							<c:forEach items="${list}" var="rec" varStatus="status">
								<tr>
									<td><a href="${ctx}/group/detail?gid=${rec.id}">${rec.gname}</a></td>
									<td>${rec.descript}</td>
									<td><select class="form-control" id="statusSel${rec.id}"
										recid="${rec.id}">
											<option value="0" ${rec.status=="0"?"selected":""}>审核中</option>
											<option value="1" ${rec.status=="1"?"selected":""}>活动</option>
											<option value="2" ${rec.status=="2"?"selected":""}>关闭</option>
											<option value="3" ${rec.status=="3"?"selected":""}>解散</option>
									</select></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="pagination" id="page" url="${ctx}/admin/group"></div>
				</div>
			</div>
		</div>
	</div>

	<div id="statusModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">确定此操作？</h4>
				</div>
				<div class="modal-body">
						<form class="form-horizontal" role="form" >
						<div class="form-group">
							<label class="col-lg-2 control-label">备注</label>
							<div class="col-lg-10">
							<textarea rows="5" cols="10" class="form-control" id="statusMsg"></textarea>	   
							</div>
						</div>
						</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-primary" data-dismiss="modal" id="changeMsgBtn">确定</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

	<script type="text/javascript">
		var pageSize = '${pager.pageSize}';
		var pageNumber = '${pager.pageNumber}';
		var pageCount = '${pager.pageCount}';
		seajs.use('${ctx}/resource/js/admin/group')
	</script>
</body>
</html>
