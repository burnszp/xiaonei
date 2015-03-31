<%@page language="java" pageEncoding="UTF-8"%>
<%@include file="../layout/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>个人中心</title>
</head>
<body flag="index">
	<div class="row">
		<div class="col-md-12">
			<div class="bs-example bs-example-tabs" role="tabpanel"
				data-example-id="togglable-tabs">
				<ul id="myTab" class="nav nav-tabs" role="tablist">
					<li role="presentation" class="active"><a href="#home"
						id="home-tab" role="tab" data-toggle="tab" aria-controls="home"
						aria-expanded="true">基本资料</a></li>
					<li role="presentation" class=""><a href="#messagelist"
						role="tab" id="profile-tab" data-toggle="tab"
						aria-controls="profile" aria-expanded="false">我的帖子</a></li>
					<li role="presentation" class="dropdown"><a href="#"
						id="myTabDrop1" class="dropdown-toggle" data-toggle="dropdown"
						aria-controls="myTabDrop1-contents" aria-expanded="false">我的群组
							<span class="caret"></span>
					</a>
						<ul class="dropdown-menu" role="menu" aria-labelledby="myTabDrop1"
							id="myTabDrop1-contents">
							<li class=""><a href="#dropdown1" tabindex="-1" role="tab"
								id="dropdown1-tab" data-toggle="tab" aria-controls="dropdown1"
								aria-expanded="false">我加入的群组</a></li>
							<li><a href="#dropdown2" tabindex="-1" role="tab"
								id="dropdown2-tab" data-toggle="tab" aria-controls="dropdown2"
								aria-expanded="false">我创建的群组</a></li>
						</ul></li>
					<li role="presentation" class=""><a href="#password"
						role="tab" id="profile-tab" data-toggle="tab"
						aria-controls="profile" aria-expanded="false">修改密码</a></li>

					<li role="presentation" class=""><a href="#msgbox" role="tab"
						id="profile-tab" data-toggle="tab" aria-controls="profile"
						aria-expanded="false">收件箱</a></li>
				</ul>
				<div id="myTabContent" class="tab-content">
					<div role="tabpanel" class="tab-pane fade active in" id="home"
						aria-labelledby="home-tab">
						<br>
						<form class="form-horizontal" role="form" id="regForm"
							action="/admin/user/save" method="post">
							<input type="hidden" name="user.id" value="${user.id}">
							<div class="form-group">
								<label class="col-lg-2 control-label">用户名</label>
								<div class="col-lg-10">
									<p class="form-control-static">${user.uname}</p>
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">昵称</label>
								<div class="col-lg-10">
									<p class="form-control-static">${user.nickName}</p>
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">真实姓名</label>
								<div class="col-lg-10">
									<p class="form-control-static">${user.realName}</p>
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">email</label>
								<div class="col-lg-10">
									<p class="form-control-static">${user.email}</p>
								</div>
							</div>

							<div class="form-group">
								<label class="col-lg-2 control-label">联系电话</label>
								<div class="col-lg-10">
									<p class="form-control-static">${user.tel}</p>
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">QQ</label>
								<div class="col-lg-10">
									<p class="form-control-static">${user.qq}</p>
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label"><a
									class="btn btn-primary" href="${ctx}/profile/update">完善个人资料</a></label>

							</div>

						</form>
					</div>
					<div role="tabpanel" class="tab-pane fade" id="messagelist"
						aria-labelledby="messagelist-tab">
						<table class="table table-hover table-condensed table-bordered ">
							<thead>
								<th>标题</th>
								<th>创建日期</th>
								<th>状态</th>
							</thead>

							<tbody>
								<c:forEach items="${msgList}" var="rec" varStatus="status">
									<tr>
										<td><a target="_blank"
											href="/message/message_detail?id=${rec.id}">${rec.title}</a></td>
										<td><fmt:formatDate pattern="yyyy-MM-dd"
												value="${rec.createtime}" /></td>
										<td>${rec.status==0?"发布中":"已关闭"}</td>

									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div role="tabpanel" class="tab-pane fade" id="password"
						aria-labelledby="password-tab">
						<br>
						<form class="form-horizontal" role="form" id="regForm"
							action="${ctx}/user/changepwd" method="post">
							<div class="form-group">
								<label class="col-lg-2 control-label">原有密码</label>
								<div class="col-lg-6">
									<input type="password" id="oldpwdTxt" name="oldpwd"
										class="form-control" value="">
								</div>
								<div class="col-lg-4"></div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">新密码</label>
								<div class="col-lg-6">
									<input type="password" id="pwdTxt" name="pwd"
										class="form-control" value="">
								</div>
								<div class="col-lg-4"></div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">重复密码</label>
								<div class="col-lg-6">
									<input type="password" id="rePwdTxt" name="rePwd"
										class="form-control" value="">
								</div>
								<div class="col-lg-4"></div>
							</div>
							<div class="form-group">
								<div class="col-lg-offset-2 col-lg-10">
									<button type="submit" id="changePwdBtn" class="btn btn-success">修改</button>
								</div>
							</div>
						</form>
					</div>
					<div role="tabpanel" class="tab-pane fade" id="dropdown1"
						aria-labelledby="dropdown1-tab">
						<div class="row">
							<div class="col-md-12">
								<table class="table">

									<tbody>
										<c:set value="0" var="joinedGroup" scope="page"></c:set>
										<c:forEach items="${groupList}" var="group">
											<c:if test="${group.creatorId!=user.id}">
												<c:set value="1" var="joinedGroup"></c:set>
												<tr>
													<td><a href="${ctx}/group/detail?gid=${group.id}">${group.gname}</a></td>
													<td>${group.descript}</td>
													<td>${group.college.cname}</td>
													<td>${group.region.name}</td>
													<td><c:if test="${group.status==2}">			
															已关闭
														</c:if> <c:if test="${group.status==3}">
															已解散
														</c:if></td>
												</tr>
											</c:if>

										</c:forEach>

									</tbody>
								</table>
								<c:if test="${pageScope.joinedGroup==0 }">
									<a href="${ctx}/group/list">你还没有加入任何群组，现在加入吧</a>
								</c:if>
							</div>
						</div>
					</div>
					<div role="tabpanel" class="tab-pane fade" id="dropdown2"
						aria-labelledby="dropdown2-tab">
						<div class="row">
							<div class="col-md-12">
								<c:set value="0" var="myGroup" scope="page"></c:set>
								<table class="table">

									<tbody>
										<c:forEach items="${groupList}" var="group">
											<c:if test="${group.creatorId==user.id}">
												<c:set value="1" var="myGroup"></c:set>
												<tr>
													<td><a href="${ctx}/group/detail?gid=${group.id}">${group.gname}</a></td>
													<td>${group.descript}</td>
													<td>${group.college.cname}</td>
													<td>${group.region.name}</td>
													<td><c:if test="${group.status==1}">
															<a href="${ctx}/group/jiesan?gid=${group.id}">解散该群组</a>
														</c:if> <c:if test="${group.status==2}">			
															已关闭
														</c:if> <c:if test="${group.status==3}">
															已解散
														</c:if></td>
												</tr>
											</c:if>
										</c:forEach>
									</tbody>
								</table>
								<c:if test="${pageScope.myGroup==0 }">
									<a href="${ctx}/group/add">你还没有创建任何群组，立即创建</a>
								</c:if>
							</div>
						</div>
					</div>
					<div role="tabpanel" class="tab-pane fade" id="msgbox"
						aria-labelledby="msgbox-tab">
						<table class="table table-hover table-condensed table-bordered">
							<thead>
								<th>消息内容</th>
								<th>发送者</th>
								<th>发送日期</th>
							</thead>
							<tobdy>
							<c:forEach items="${msgBoxList}" var="msg">
							<tr>
								<td>
								  ${msg.descript}
								</td>
								<td>${msg.sendUser}</td>
								<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${rec.sendDate}" /></td>
							</tr>
							</c:forEach>
							</tobdy>
						</table>

					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		var msg = '${msg}';
		seajs.use('${ctx}/resource/js/front/profile')
	</script>
</body>

</html>
