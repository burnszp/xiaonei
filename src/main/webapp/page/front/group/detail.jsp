<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../../layout/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>${group.gname}-群组频道</title>
</head>
<body flag="index">
	<div class="row">
		<div class="col-md-8">
			<h4>${group.gname }</h4>
			<h5>${group.descript}</h5>

			<span>${group.college.cname}</span><br> <span>所属地点：${group.region.name}</span>
			<br> <span>创建日期：<fmt:formatDate
					value="${group.createtime}" pattern="yyyy-MM-dd" /></span>
		</div>
		<div class="col-md-4">
			<h6>群组成员</h6>
			<c:forEach items="${userList }" var="user">
				<a href="/user/user_detail?uid=${user.id }">${user.nickName }</a>
				<br />
			</c:forEach>
			<div class="btn-toolbar">
				<div class="btn-group">
					<c:if test="${group.status==1}">
					<a href='${ctx}/group/${inGroup=="1"?"quit":"join"}?gid=${group.id}' class="btn btn-primary ">${inGroup=="1"?"退出":"加入" } </a> <a
						href="${ctx}/message/add?gid=${group.id}" class="btn btn-primary ">发帖 </a>
					</c:if>  
					<c:if test="${group.status==2}">
						已关闭
					</c:if>
					<c:if test="${group.status==3}">
						已解散
					</c:if>
						
				</div>
			</div>

		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<table class="table">
				<thead>
					<tr>
						<th>帖子名称</th>
						<th>创建者</th>
						<th>帖子状态</th>
						<th>发帖时间</th>
					</tr>
				</thead>
				<c:forEach items="${messageList}" var="message">
					<tr>
						<td><a href="/message/message_detail?id=${message.id }">${message.title }</a></td>
						<td> <a href="${ctx}/profilet?uid=${message.user.id}">${message.user.nickName}</a></td>
						<td>${message.status==0?'发布中':'已关闭' }</td>
						<td><fmt:formatDate value="${message.createtime }"
								type="date" dateStyle="default" /></td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div class="col-md-12" align="center">
			<input type="hidden" value="1" id="pageNumber" />
			<button class="btn btn-hg btn-primary" id="reloadMore">加载更多...</button>
		</div>
	</div>
	<script type="text/javascript">
		var gid = "${group.id}";
		var msg = "${msg}";
		
		seajs.use('js/front/group-detail');
	</script>
</body>

</html>