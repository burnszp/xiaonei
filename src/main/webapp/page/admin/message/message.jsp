<%@page language="java" pageEncoding="UTF-8"%>
<%@include file="../../layout/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>帖子管理</title>
</head>
<body flag="admin">
	<div class="row">
		<div class="col-md-12">
			<ol class="breadcrumb">
				<li><a href="/${ctx}">首页</a></li>
				<li><a href="${ctx}/admin">系统管理</a></li>
				<li class="active">帖子管理</li>
			</ol>
		</div>
	</div>

	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-info">
				<div class="panel-heading">
					<div style="display: inline;">帖子管理</div>
					<div style="display: inline; float: right; margin-top: -5px;">
						<div class="btn-group">
							<button data-toggle="dropdown"
								class="btn btn-primary dropdown-toggle" type="button">
								&nbsp;&nbsp;&nbsp;&nbsp;操作 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
									class="caret"></span>
							</button>
							<ul role="menu" class="dropdown-menu">
							</ul>
						</div>
					</div>
				</div>

				<div class="panel-body">
					<table class="table table-hover table-condensed table-bordered ">
						<thead>
							<th style="width:30px;"><label class="checkbox" for="checkboxall"> <input
									type="checkbox" id="checkboxall" data-toggle="checkbox"
									class="custom-checkbox"><span class="icons"><span
										class="icon-unchecked"></span><span class="icon-checked"></span></span>

							</label></th>
							<th>标题</th>
							<th>创建日期</th>
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
									<td><a href="${ctx}/message/message_detail?id=${rec.id}">${rec.title}</a></td>
									<td><fmt:formatDate pattern="yyyy-MM-dd" value="${rec.createtime}"/></td>
									<td>${rec.status==0?"发布中":"已关闭"}</td>

								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="pagination" id="page" url="${ctx}/admin/message"></div>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		var pageSize = '${pager.pageSize}';
		var pageNumber = '${pager.pageNumber}';
		var pageCount = '${pager.pageCount}';
		seajs.use('${ctx}/resource/js/admin/message')
	</script>
</body>
</html>
