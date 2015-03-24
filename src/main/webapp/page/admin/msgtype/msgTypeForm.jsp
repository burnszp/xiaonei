<%@page language="java" pageEncoding="UTF-8"%>
<%@include file="../../layout/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>帖子类型查看-${obj.name}</title>
</head>
<body flag="admin">
	<div class="row">
		<div class="col-md-12">
			<ol class="breadcrumb">
				<li><a href="/${ctx}">首页</a></li>
				<li><a href="${ctx}/admin">系统管理</a></li>
				<li><a href="${ctx}/admin/msgtype">帖子类型管理</a></li>
				<li class="active">帖子类型查看</li>
			</ol>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-info">
				<div class="panel-heading">
					<div style="display: inline;">帖子类型管理</div>
				</div>

				<div class="panel-body">
					<form class="form-horizontal" role="form" action="${ctx}/admin/msgtype/save" method="post">
						<input type="hidden" name="msgtype.id" value="${obj.id}"/>
						<div class="form-group">
							<label class="col-lg-2 control-label">名称</label>
							<div class="col-lg-10">
								<input type="text" name="msgtype.name" class="form-control" value="${obj.name}">
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label">备注</label>
							<div class="col-lg-10">
								<input type="text" name="msgtype.descript" class="form-control" value="${obj.descript}">
							</div>
						</div>
						<div class="form-group">
							<div class="col-lg-offset-2 col-lg-10">
								<a href="${ctx }/admin/msgtype" class="btn btn-primary">返回</a>
								<button type="submit" class="btn btn-success">保存</button>
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
