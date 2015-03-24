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
					<div style="display: inline; float: right; margin-top: -5px;">
						<div class="btn-group">
							<button data-toggle="dropdown"
								class="btn btn-primary dropdown-toggle" type="button">
								&nbsp;&nbsp;&nbsp;&nbsp;操作 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
									class="caret"></span>
							</button>
							<ul role="menu" class="dropdown-menu">
								<li><a href="#" flag="view">查看</a></li>
								<li><a href="#" flag="del">删除 </a></li>
							</ul>
						</div>
					</div>
				</div>

				<div class="panel-body">
					<table class="table table-hover table-condensed table-bordered">
						<thead>
							<th style="width: 30px;"><label class="checkbox"
								for="checkboxall"> <input type="checkbox"
									id="checkboxall" data-toggle="checkbox" class="custom-checkbox"><span
									class="icons"><span class="icon-unchecked"></span><span
										class="icon-checked"></span></span>

							</label></th>
							<th>名称</th>
							<th>备注</th>
							<th>状态</th>

						</thead>

						<tbody>
							<c:forEach items="${list}" var="rec" varStatus="status">
								<tr>
									<td><label class="checkbox" for="checkbox${status.index}">
											<input type="checkbox" value="${rec.id}"
											id="checkbox${status.index}" data-toggle="checkbox"
											class="custom-checkbox"><span class="icons"><span
												class="icon-unchecked"></span><span class="icon-checked"></span></span>

									</label></td>
									<td><a href="${ctx}/admin/groupform?id=${rec.id}">${rec.gname}</a></td>
									<td>${rec.descript}</td>
									<td>
										<!-- <select value="0"><option>审核中</option>
											<option value="1">活动小组</option>
											<option value="2">已关闭</option></select>
											 --> <span class="mrl"  id="${rec.id}" status="${rec.status}" title="点击更改小组状态" > <input type="checkbox" ${rec.status==0?"checked":"" } data-on-text="活动" data-off-text="已关闭"
											data-toggle="switch" name="switch-0${status.index+1}" data-on-color="success"
											id="custom-switch-0${status.index+1}" />
									</span>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="pagination" id="page" url="${ctx}/admin/group"></div>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		var pageSize = '${pager.pageSize}';
		var pageNumber = '${pager.pageNumber}';
		var pageCount = '${pager.pageCount}';
		seajs.use('${ctx}/resource/js/admin/group')
	</script>
</body>
</html>
