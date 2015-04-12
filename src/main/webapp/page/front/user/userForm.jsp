<%@page language="java" pageEncoding="UTF-8"%>
<%@include file="../../layout/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>完善个人资料</title>
</head>
<body flag="admin">
	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-info">
				<div class="panel-heading">
					<div style="display: inline;">完善资料</div>
				</div>

				<div class="panel-body">
					<form class="form-horizontal" role="form" id="regForm" action="/user/update"
						method="post">
						<div class="form-group">
							<label class="col-lg-2 control-label">用户名</label>
							<div class="col-lg-10">
							<label class="form-control-static"><p>${user.uname }</p></label>
								   
							</div>
						</div>
						 
						<div class="form-group">
							<label class="col-lg-2 control-label">昵称</label>
							<div class="col-lg-10">
								<input type="text" name="user.nickName" value="${user.nickName}" class="form-control"
									value="">
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label">真实姓名</label>
							<div class="col-lg-10">
								<input type="text" name="user.realName" value="${user.realName}" class="form-control"
									value="">
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label">email</label>
							<div class="col-lg-10">
								<input type="text" name="user.email" value="${user.email}" class="form-control"
									value="">
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label">联系电话</label>
							<div class="col-lg-10">
								<input type="text" name="user.tel" value="${user.tel}" class="form-control" value="">
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label">QQ</label>
							<div class="col-lg-10">
								<input type="text" name="user.qq" value="${user.qq}" class="form-control" value="">
							</div>
						</div>
						<div class="form-group">
							<div class="col-lg-offset-2 col-lg-10">
								<button type="submit" class="btn btn-success">保存</button>
								<a href="${ctx}/profile" class="btn btn-primary">返回</a>
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
