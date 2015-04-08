<%@page language="java" pageEncoding="UTF-8"%>
<%@include file="../../layout/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>用户查看-${obj.uname}</title>
</head>
<body flag="admin">
	<div class="row">
		<div class="col-md-12">
			<ol class="breadcrumb">
				<li><a href="/${ctx}">首页</a></li>
				<li><a href="${ctx}/admin">系统管理</a></li>
				<li><a href="${ctx}/admin/user">用戶管理</a></li>
				<li class="active">用戶查看</li>
			</ol>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-info">
				<div class="panel-heading">
					<div style="display: inline;">用户管理</div>
				</div>

				<div class="panel-body">
					<form class="form-horizontal" role="form" >
						<input type="hidden" name="user.id" value="${obj.id}"/>
						<div class="form-group">
							<label class="col-lg-2 control-label">用户名</label>
							<div class="col-lg-10">
								<input type="text" name="user.uname" class="form-control" value="${obj.uname}">
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label">昵称</label>
							<div class="col-lg-10">
								<input type="text" name="user.nickName" class="form-control" value="${obj.nickName}">
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label">email</label>
							<div class="col-lg-10">
								<input type="text" name="user.email" class="form-control" value="${obj.email}">
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label">tel</label>
							<div class="col-lg-10">
								<input type="text" name="user.email" class="form-control" value="${obj.tel}">
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label">QQ</label>
							<div class="col-lg-10">
								<input type="text" name="user.email" class="form-control" value="${obj.qq}">
							</div>
						</div>
						<div class="form-group">
							<div class="col-lg-offset-2 col-lg-10">
								<a href="${ctx }/admin/user" class="btn btn-primary">返回</a>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>


	<script type="text/javascript">
		$('#back').click(function() {

			window.location.href = ctx + "/admin/user";
		});
		//seajs.use('${ctx}/resource/js/admin/user')
	</script>
</body>
</html>
