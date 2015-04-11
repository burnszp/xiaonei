<%@page language="java" pageEncoding="UTF-8"%>
<%@include file="../../layout/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>黑板报</title>
<style type="text/css">
.todo li:after{
background: #34495;
}
</style>
</head>
<body flag="group">

	<div class="row">
		<c:forEach items="${obj}" var="rec" varStatus="status">
			<div class="col-md-3">
				<div class="tile">
					<img class="tile-image big-illustration" alt=""
						src="${ctx}/resource/images/group/${rec.id}.png">
					<h3 class="tile-title">
						<a href="${ctx}/group/detail?gid=${rec.id }">${rec.gname}</a>
					</h3>
					<p>${rec.descript}</p>
				</div>
			</div>
		</c:forEach>
	</div>


 

</body>
</html>
