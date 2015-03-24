<%@page language="java" pageEncoding="UTF-8"%>
<%@include file="../layout/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>管理员登录</title>
</head>
<body flag="index">
	<div class="row">

		<div class="col-md-12">
			<div class="panel panel-info"
				style="width: 600px; margin-left: auto; margin-right: auto;">
				<div class="panel-heading">
					<div style="display: inline;">管理员登录</div>
				</div>

				<div class="panel-body">
					<form class="form-horizontal" role="form" id="regForm" action="${ctx}/admin/login"
						method="post">
						<div class="form-group">
							<label class="col-lg-2 control-label">用户名</label>
							<div class="col-lg-10">
								<input type="text"   name="uname" class="form-control"  placeholder="请输入用户名"> 
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label">密码</label>
							<div class="col-lg-10">
								<input type="password" 
									name="pwd" class="form-control" value="">
							</div>
						</div>
						 
						<div class="form-group">
							<div class="col-lg-offset-2 col-lg-10">
								<button type="submit" class="btn btn-success">登录</button>
							</div>
						</div>
					</form>
				</div>
			</div>

		</div>

	</div> 
		<script type="text/javascript">
		 var msg = '${msg}';
		seajs.use('${ctx}/resource/js/admin/login')
	</script>
</body>

</html>
