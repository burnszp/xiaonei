<%@page language="java" pageEncoding="UTF-8"%>
<%@include file="../layout/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>校友录</title>
<style type="text/css">
.todo li:after{
background: #34495;
}
</style>
</head>
<body flag="index">

	<h5>最热群组</h5>
	<div class="row">
		<c:forEach items="${hotGroupList}" var="rec" varStatus="status">
			<div class="col-md-3">
				<div class="tile">
					<img class="tile-image big-illustration" alt=""
						src="${ctx}/resource/flat-ui/2.1.3/images/illustrations/share.png">
					<h3 class="tile-title">
						<a href="${ctx}/group/detail?gid=${rec.id }">${rec.gname}</a>
					</h3>
					<p>${rec.descript}</p>

				</div>

			</div>
		</c:forEach>
	</div>



	<h5>新建群组</h5>
	<div class="row">
		<c:forEach items="${newGroupList}" var="rec" varStatus="status">
			<div class="col-md-3">
				<div class="tile">
					<img class="tile-image big-illustration" alt=""
						src="${ctx}/resource/flat-ui/2.1.3/images/illustrations/share.png">
					<h3 class="tile-title">
						<a href="${ctx}/group/detail?gid=${rec.id}">${rec.gname}</a>
					</h3>
					<p>${rec.descript}</p>

				</div>

			</div>
		</c:forEach>
	</div>

	<div class="row">
		<div class="col-md-8">
			<table class="table">
				<tbody>
					<c:forEach items="${newMessageList}" var="rec" varStatus="status">
						<tr>
							<td><a href="${ctx}/message/message_detail?id=${rec.id}">${rec.title}</a></td>

							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${rec.createtime}" /></td>
							<td> <a href="${ctx}/profilet?uid=${rec.user.id}">${rec.user.nickName}</a></td>
						</tr>

					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="col-md-4">
		<div class="todo mrm">
            <div class="todo-search" style="padding: 5px 22px 2px;">
            <span class="todo-search-field"><p>热门帖子</p></span>
            </div>
            <ul>
            	<c:forEach items="${hotMessageList}" var="rec" varStatus="status">
              <li class="todo" style="padding:5px 42px 21px 25px;">
                 
                <div class="todo-content">
                  <h4 class="todo-name">
                   <a href="${ctx}/message/message_detail?id=${rec.id}">${rec.title}</a>
                  </h4>
                 <a href="${ctx}/profilet?uid=${rec.user.id}">${rec.user.nickName}</a> 
                </div>
              </li>
              </c:forEach>

            
            </ul>
          </div>
		</div>
	</div>


</body>
</html>
