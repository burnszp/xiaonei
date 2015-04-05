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
				<li class="active"><a href="${ctx}/admin/region">地区管理</a></li>
			</ol>
		</div>
	</div>

	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-info">
				<div class="panel-heading">
					<div style="display: inline;">【${province.name}】下的地市列表</div>
				</div>

				<div class="panel-body">
					<table class="table table-hover table-condensed table-bordered ">
						<thead>
							 <th>地区编码</th>
							<th>名称</th>
							<th>经度</th>
							<th>纬度</th>


						</thead>

						<tbody>
							
							<c:if test="${!empty list }">

								<c:forEach items="${list}" var="rec" varStatus="status">
									<tr>
										 <td>${rec.id}</td>
										<td>${rec.name}</td>
										<td>${rec.lng}</td>
										<td>${rec.lat}</td>

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
