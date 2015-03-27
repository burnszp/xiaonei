<%@page language="java" pageEncoding="UTF-8"%>
<%@include file="../layout/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>用户注册</title>
</head>
<body flag="index">
	<div class="row">

		<div class="col-md-12">
			<div class="panel panel-info"
				style="width: 600px; margin-left: auto; margin-right: auto;">
				<div class="panel-heading">
					<div style="display: inline;">用户注册</div>
				</div>

				<div class="panel-body">
					<form class="form-horizontal" role="form" id="regForm" action="/admin/user/save"
						method="post">
						<div class="form-group">
							<label class="col-lg-2 control-label">用户名</label>
							<div class="col-lg-10">
								<input type="text" id="name" name="user.uname"
									class="form-control"  placeholder="请输入用户名"
								 	> <label id="lblUser" style="color:red;"
									style="display: none;"></label>  
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label">密码</label>
							<div class="col-lg-10">
								<input type="password" onblur="checkPwd()" id="pwd"
									name="user.pwd" class="form-control" value="">
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label">确认密码</label>
							<div class="col-lg-10">
								<input type="password" id="confirmPwd" class="form-control"
									value="" onblur=""><span id="uspan"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label">昵称</label>
							<div class="col-lg-10">
								<input type="text" name="user.nickName" class="form-control"
									value="">
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label">真实姓名</label>
							<div class="col-lg-10">
								<input type="text" name="user.realName" class="form-control"
									value="">
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label">email</label>
							<div class="col-lg-10">
								<input type="text" name="user.email" class="form-control"
									value="">
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label">联系方式</label>
							<div class="col-lg-10">
								<input type="text" name="user.tel" class="form-control" value="">
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label">QQ</label>
							<div class="col-lg-10">
								<input type="text" name="user.qq" class="form-control" value="">
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label">选择地区</label>
							<div class="col-lg-10">
								<select id="province">
									<option selected="selected">---请选择---</option>
									<c:forEach items="${regions}" var="p">
										<option value="${p.id}">${p.name}</option>
									</c:forEach>
								</select> <select id="city">
									<option selected="selected">---请选择---</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<div class="col-lg-offset-2 col-lg-10">
								<button type="submit" class="btn btn-success">保存</button>
							</div>
						</div>
					</form>
				</div>
			</div>

		</div>

	</div>
	<script type="text/javascript" >
		seajs.use('${ctx}/resource/js/front/register')
	</script>
</body>

</html>
