<%@page language="java" pageEncoding="UTF-8"%>
<%@include file="../../layout/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>地区管理</title>
</head>
<body flag="admin">
	<div class="row">
		<div class="col-md-12">
			<ol class="breadcrumb">
				<li><a href="/${ctx}">首页</a></li>
				<li><a href="${ctx}/admin">系统管理</a></li>
				<li class="active">地区管理</li>
			</ol>
		</div>
	</div>

	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-info">
				<div class="panel-heading">
					<div style="display: inline;">地区管理</div>
					<div style="display: inline; float: right; margin-top: -5px;">
						<!-- 						<div class="btn-group"> -->
						<!-- 							<button data-toggle="dropdown" -->
						<!-- 								class="btn btn-primary dropdown-toggle" type="button"> -->
						<!-- 								&nbsp;&nbsp;&nbsp;&nbsp;操作 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span -->
						<!-- 									class="caret"></span> -->
						<!-- 							</button> -->
						<!-- 							<ul role="menu" class="dropdown-menu"> -->
						<!-- 								<li><a href="#" flag="view">查看</a></li> -->
						<!-- 								<li><a href="#" flag="del">删除 </a></li>  -->
						<!-- 							</ul> -->
						<!-- 						</div> -->
					</div>
				</div>

				<div class="panel-body">
					<table class="table table-hover table-condensed table-bordered ">
						<thead>
							<th><label class="checkbox" for="checkboxall"> <input
									type="checkbox" id="checkboxall" data-toggle="checkbox"
									class="custom-checkbox"><span class="icons"><span
										class="icon-unchecked"></span><span class="icon-checked"></span></span>

							</label></th>
							<th>名称</th>


						</thead>

						<tbody>
							
							<c:if test="${!empty list }">

								<c:forEach items="${list}" var="rec" varStatus="status">
									<tr>
										<td><label class="checkbox" for="checkbox${status.index}">
												<input type="checkbox" value="${rec.id}"
												id="checkbox${status.index}" data-toggle="checkbox"
												class="custom-checkbox"><span class="icons"><span
													class="icon-unchecked"></span><span class="icon-checked"></span></span>

										</label></td>
										<td>${rec.name}</td>


									</tr>
								</c:forEach>
							</c:if>
							<tr><td colspan="2"><c:if test="${empty list}">
								该省份下没有数据！
							</c:if></td></tr>
						</tbody>
						
					</table>
					
					<div class="pagination" id="page"
						url="${ctx}/admin/region/cities?pid=${pid}"></div>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		var pageSize = '${pager.pageSize}';
		var pageNumber = '${pager.pageNumber}';
		var pageCount = '${pager.pageCount}';
		seajs.use('${ctx}/resource/js/admin/region')
	</script>
</body>
</html>
