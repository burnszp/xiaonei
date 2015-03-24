<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../../layout/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>发表帖子</title>
</head>
<body flag="index">
	<div class="row">
		<div class="col-md-12">
			<h4>发表帖子</h4>
			<form action="${ctx}/message/save" method="post">
				<input type="hidden" name="msg.gid" value="${gid}">
				<div class="form-group">
					<label>标题</label> <input type="text" class="form-control"
						name="msg.title">
				</div>
				<div class="form-group">
					<label>帖子类型</label> <select name="msg.tid">
						<c:forEach items="${typeList}" var="type">
							<option value="${type.id}">${type.name}</option>
						</c:forEach>
					</select>
				</div>
				<div class="form-group">
					<label for="exampleInputPassword1">帖子内容</label>
					<textarea name="msg.descript" class="form-control" rows="10"></textarea>
				</div>
				<button type="submit" class="btn btn-primary">提交</button>
			</form>
		</div>
	</div>
</body>
</html>