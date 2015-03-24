<%@page import="org.enilu.xiaoyou.entity.admin.AdminUser"%>
<%@page import="org.enilu.xiaoyou.entity.User"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@include file="../layout/taglibs.jsp"%>
<%@ taglib prefix="sitemesh"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title><sitemesh:title /></title>
<!-- Loading Bootstrap -->
<link href="${ctx}/resource/flat-ui/2.2.0/css/vendor/bootstrap.min.css"
	rel="stylesheet">


<!-- Loading Flat UI -->
<link href="${ctx}/resource/flat-ui/2.2.0/css/flat-ui.css"
	rel="stylesheet">

<link href="${ctx}/resource/flat-ui/2.2.0/assets/css/docs.css"
	rel="stylesheet">
<link href="${ctx}/resource/css/main.css" rel="stylesheet">

<link rel="shortcut icon"
	href="${ctx}/resource/flat-ui/2.2.0/img/favicon.ico">

<!-- HTML5 shim, for IE6-8 support of HTML5 elements. All other JS at the end of file. -->
<!--[if lt IE 9]>
      <script src="${ctx}/resource/flat-ui/2.2.0/js/html5shiv.js"></script>
      <script src="${ctx}/resource/flat-ui/2.2.0/js/respond.min.js"></script>
    <![endif]-->

<script src="${ctx}/resource/seajs/2.2.0/sea-debug.js"></script>
<script src="${ctx}/resource/flat-ui/2.2.0/js/vendor/jquery.min.js"></script>
<script src="${ctx}/resource/flat-ui/2.2.0/js/flat-ui.js"></script>
<!-- <script src="${ctx}/resource/flat-ui/2.2.0/assets/js/application.js"></script> -->
<script src="${ctx}/resource/flat-ui/2.2.0/assets/js/prettify.js"></script>
<script type="text/javascript">
	var ctx = '${ctx}';
	// Set configuration
	seajs
			.config({
				base : "${ctx}/resource/",
				alias : {
					//"jquery" : "jquery/jquery-2.1.1.min.js",
					"jquery-ui" : "flat-ui/2.2.0/js/jquery-ui-1.10.3.custom.min.js",
					"juqery-ui_touch" : "flat-ui/2.2.0/js/jquery.ui.touch-punch.min.js",
					"bootstrap" : "flat-ui/2.2.0/js/bootstrap.min.js",
					"bootstrap-select" : "flat-ui/2.2.0/js/bootstrap-select.js",
					"jquery-tagsinput" : "flat-ui/2.2.0/js/jquery.tagsinput.js",
					"jquery-placeholder" : "flat-ui/2.2.0/js/jquery.placeholder.js",
					"typeahead" : "flat-ui/2.2.0/js/typeahead.js",
					"page" : "js/page",
					"tooltip" : "js/tooltip"

				}
			});
	// 加载入口模块
	seajs.use("${ctx}/resource/js/common");
</script>
<decorator:head />
</head>
<body
	<sitemesh:getProperty property="body.flag" writeEntireProperty="true"/>>

	<nav class="navbar navbar-default" role="navigation">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#navbar-collapse-01">
				<span class="sr-only"></span>
			</button>
			<a class="navbar-brand" href="${ctx}/">校友会</a>
		</div>
		<div class="collapse navbar-collapse" id="navbar-collapse-01">
			<ul class="nav navbar-nav">
				<li flag="type"><a href="${ctx}/">校友志</a></li>
				<li flag="my"><a href="#">我的小窝</a></li>
				<%
					Object adminObj= session.getAttribute("admin");
					if (adminObj != null) {
					 
				%>
				<li flag="admin"><a href="${ctx}/admin">系统管理</a></li>
				<li flag="adminlogout"><a href="${ctx}/admin/logout">注销管理员</a></li>
				<%} %>

			</ul>

			<form class="navbar-form navbar-left" action="#" role="search">

				<div class="form-group">
					<div class="input-group">
						<input class="form-control" id="navbarInput-01" type="search"
							placeholder="Search"> <span class="input-group-btn">
							<button type="submit" class="btn">
								<span class="fui-search"></span>
							</button>
						</span>
					</div>
				</div>
				<div class="form-group">
					<div class="input-group">
						<p class="bg-warning" id="tooltip"
							style="padding: 0px 0px 0px 0px; margin: 0px 0px;"></p>
					</div>
				</div>
			</form>
			<ul class="nav navbar-nav navbar-right">

				<%
					Object obj = session.getAttribute("user");
					if (obj == null) {
				%>
				<li><a href="${ctx }/front/regist">注册</a></li>
				<li><a href="${ctx }/page/front/login.jsp">登录</a></li>
				<%
					} else {
						User user = (User) obj;
				%>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">欢迎光临:<%=user.getNickName()%> <b
						class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="${ctx}/profile">个人中心</a></li>
						<li class="divider"></li>
						<li><a href="${ctx}/logout">注销</a></li>
					</ul></li>


				<%
					}
				%>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</nav>
	<!-- /navbar -->
	<div class="container">
		<sitemesh:body />
	</div>
	<footer>
		<div class="container" style="margin-top: 10px;">
			<div class="row">
				<div class="col-xs-7">
					<h3 class="footer-title">欢迎光临</h3>
					<p>
						喜欢这个网站吗?欢迎加入我们<br> 欢迎联系我们.<br>
					</p>
					<a class="footer-brand" href="mailto:82552623@qq.com"> <img
						src="${ctx}/resource/flat-ui/2.1.3/images/footer/logo.png"
						alt="Open Idea">
					</a>
				</div>
				<!-- /col-xs-7 -->

				<div class="col-xs-5">
					<div class="footer-banner">
						<h3 class="footer-title">开源创意</h3>
						<ul>
							<li>你有什么好的创意，请提出来</li>
							<li>我们一起将创意变为现实</li>
						</ul>
						Go to: <a href="http://enilu.github.io/" target="_blank">OpenIdea</a>
					</div>
				</div>
			</div>
		</div>
	</footer>

</body>
</html>