<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../../layout/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>帖子详情页</title>
</head>
<body flag="index">
	<div class="row">
		<div class="col-md-12">
			<h4>${message.title}</h4>
		</div>
	</div>
	<hr>
	<div class="row">
		<div class="col-md-2">

			${message.user.nickName}<br>
			<fmt:formatDate value="${message.createtime}" pattern="yyyy-MM-dd" />
		</div>
		<div class="col-md-10">${message.descript}</div>
	</div>
	<c:forEach items="${message.replayList}" var="replayMsg">
		<hr>
		<div class="row">
			<div class="col-md-2">

				${replayMsg.user.nickName}<br>
				<fmt:formatDate value="${replayMsg.createtime}" pattern="yyyy-MM-dd" />
			</div>
			<div class="col-md-10">${replayMsg.descript}</div>
		</div>
	</c:forEach>
	<div class="row" id="replayDiv">
		<br>
		<br>
		<div class="col-md-12">
			<div class="form-group">
				<label>回复内容:</label>
				<textarea id="replayTxt" class="form-control" rows="3"></textarea>
			</div>
			<button class="btn btn-primary" id="replayBtn" style="float: right;">提交</button>
		</div>
	</div>



	<script type="text/javascript">
		var tid = "${message.tid}";//帖子类型，从母贴获得
		var gid = "${message.gid}";
		var rid = "${message.id}";
		seajs.use('js/front/message-detail');
	</script>
</body>
</html>