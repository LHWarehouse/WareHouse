<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="itcast" uri="http://itcast.cn/common/"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>admin仓库管理</title>

<!-- Bootstrap Core CSS -->
<link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="<%=basePath%>css/metisMenu.min.css" rel="stylesheet">

<!-- DataTables CSS -->
<link href="<%=basePath%>css/dataTables.bootstrap.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="<%=basePath%>css/sb-admin-2.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="<%=basePath%>css/font-awesome.min.css" rel="stylesheet"
	type="text/css">
<link href="<%=basePath%>css/boot-crm.css" rel="stylesheet"
	type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>
	<% 
		// 取得session对象
    	HttpSession hs = request.getSession();
    	
    	// 取得当前用户
    	String user = (String)hs.getAttribute("admin");
    	if(user == null || user.equals("")){
    		response.sendRedirect("../indexAdmin");
    	}
	%>

	<div id="wrapper">

		<!-- Navigation -->
		<nav class="navbar navbar-default navbar-static-top" role="navigation"
			style="margin-bottom: 0">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="index.html">GNZM仓库管理系统 v1.0</a>
		</div>
		<!-- /.navbar-header -->

		<ul class="nav navbar-top-links navbar-right">
			<li>
				<a style="font-size:18px;color:#EE7600;">
				<%
				out.print("管理员   "+user+"，您好！");
				%>
				 </a>
			</li>
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#"> <i class="fa fa-envelope fa-fw"></i>
					<i class="fa fa-caret-down"></i> </a>
				<ul class="dropdown-menu dropdown-messages">
					<li><a href="#">
							<div>
								<strong>经历a</strong> <span class="pull-right text-muted">
									<em>今天</em> </span>
							</div>
							<div>晚上找你吃饭，顺便聊一下明天那批出货的事情...</div> </a>
					</li>
					<li class="divider"></li>
					<li><a class="text-center" href="#"> <strong>查看全部消息</strong>
							<i class="fa fa-angle-right"></i> </a>
					</li>
				</ul> <!-- /.dropdown-messages -->
			</li>
			<!-- /.dropdown -->
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#"> <i class="fa fa-tasks fa-fw"></i>
					<i class="fa fa-caret-down"></i> </a>
				<ul class="dropdown-menu dropdown-tasks">
					<li><a href="#">
							<div>
								<p>
									<strong>任务 1</strong> <span class="pull-right text-muted">完成80%</span>
								</p>
								<div class="progress progress-striped active">
									<div class="progress-bar progress-bar-success"
										role="progressbar" aria-valuenow="80" aria-valuemin="0"
										aria-valuemax="100" style="width: 80%">
										<span class="sr-only">完成80%</span>
									</div>
								</div>
							</div> </a>
					</li>
					<li class="divider"></li>
					<li><a href="#">
							<div>
								<p>
									<strong>任务 2</strong> <span class="pull-right text-muted">完成40%</span>
								</p>
								<div class="progress progress-striped active">
									<div class="progress-bar progress-bar-info" role="progressbar"
										aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"
										style="width: 40%">
										<span class="sr-only">完成40%</span>
									</div>
								</div>
							</div> </a>
					</li>
					<li class="divider"></li>
					<li><a href="#">
							<div>
								<p>
									<strong>任务 3</strong> <span class="pull-right text-muted">完成60%</span>
								</p>
								<div class="progress progress-striped active">
									<div class="progress-bar progress-bar-warning"
										role="progressbar" aria-valuenow="60" aria-valuemin="0"
										aria-valuemax="100" style="width: 60%">
										<span class="sr-only">完成60%</span>
									</div>
								</div>
							</div> </a>
					</li>
					<li class="divider"></li>
					<li><a class="text-center" href="#"> <strong>查看所有任务</strong>
							<i class="fa fa-angle-right"></i> </a>
					</li>
				</ul> <!-- /.dropdown-tasks -->
			</li>
			<!-- /.dropdown -->
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#"> <i class="fa fa-bell fa-fw"></i>
					<i class="fa fa-caret-down"></i> </a>
				<ul class="dropdown-menu dropdown-alerts">
					<li><a href="#">
							<div>
								<i class="fa fa-comment fa-fw"></i> 新回复 <span
									class="pull-right text-muted small">4分钟之前</span>
							</div> </a>
					</li>
					<li class="divider"></li>
					<li><a href="#">
							<div>
								<i class="fa fa-envelope fa-fw"></i> 新消息 <span
									class="pull-right text-muted small">4分钟之前</span>
							</div> </a>
					</li>
					<li class="divider"></li>
					<li><a href="#">
							<div>
								<i class="fa fa-tasks fa-fw"></i> 新任务 <span
									class="pull-right text-muted small">4分钟之前</span>
							</div> </a>
					</li>
					<li class="divider"></li>
					<li><a href="#">
							<div>
								<i class="fa fa-upload fa-fw"></i> 服务器重启 <span
									class="pull-right text-muted small">4分钟之前</span>
							</div> </a>
					</li>
					<li class="divider"></li>
					<li><a class="text-center" href="#"> <strong>查看所有提醒</strong>
							<i class="fa fa-angle-right"></i> </a>
					</li>
				</ul> <!-- /.dropdown-alerts -->
			</li>
			<!-- /.dropdown -->
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#"> <i class="fa fa-user fa-fw"></i>
					<i class="fa fa-caret-down"></i> </a>
				<ul class="dropdown-menu dropdown-user">
					<li><a href="#"><i class="fa fa-user fa-fw"></i> 用户设置</a>
					</li>
					<li><a href="#"><i class="fa fa-gear fa-fw"></i> 系统设置</a>
					</li>
					<li class="divider"></li>
					<li><a href="${pageContext.request.contextPath }/jsp/admin_logout"><i class="fa fa-sign-out fa-fw"></i>
							退出登录</a>
					</li>
				</ul> <!-- /.dropdown-user -->
			</li>
			<!-- /.dropdown -->
		</ul>
		<!-- /.navbar-top-links -->

		<div class="navbar-default sidebar" role="navigation">
			<div class="sidebar-nav navbar-collapse">
				<ul class="nav" id="side-menu">
					<li class="sidebar-search">
						<div class="input-group custom-search-form">
							<input type="text" class="form-control" placeholder="查询内容...">
							<span class="input-group-btn">
								<button class="btn btn-default" type="button">
									<i class="fa fa-search" style="padding: 3px 0 3px 0;"></i>
								</button> </span>
						</div> <!-- /input-group --></li>
					<li><a
						href="${pageContext.request.contextPath }/jsp/add_goods"
						class="active"><i class="fa fa-arrow-right fa-fw"></i> 新增货品入库</a>
					</li>
					<li><a
						href="${pageContext.request.contextPath }/jsp/admin_manage"><i
							class="fa fa-edit fa-fw"></i> 货品管理</a>
					</li>
					<li><a
						href="${pageContext.request.contextPath }/jsp/goods_datalog"><i
							class="fa fa-folder-o fa-fw"></i> 货品出入库日志管理</a>
					</li>
					<li><a
						href="${pageContext.request.contextPath }/jsp/store_manage"> <i
							class="fa fa-pinterest-square fa-fw"></i> 店铺管理</a></li>
				</ul>
			</div>
			<!-- /.sidebar-collapse -->
		</div>
		<!-- /.navbar-static-side --> </nav>

		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h2 class="page-header">入库货品</h2>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="panel panel-default">
				<div class="panel-body">

					<div class="modal-header">

						<h4 class="modal-title" id="myModalLabel">入库货品信息</h4>
					</div>
					<div class="modal-body">
						<form class="form-horizontal" id="edit_goods_form">

							<div class="form-group">
								<label for="edit_customerName" class="col-sm-2 control-label">货品ID</label>
								<div class="col-sm-6">
									<input type="text" class="form-control" id="edit_goods_id"
										placeholder="ID" name="goods_id">
								</div>
							</div>
							<div class="form-group">
								<label for="edit_customerName" class="col-sm-2 control-label">货品名称</label>
								<div class="col-sm-6">
									<input type="text" class="form-control" id="edit_goods_name"
										placeholder="名称" name="goods_name">
								</div>
							</div>

							<div class="form-group">
								<label for="edit_zipcode" class="col-sm-2 control-label">货品颜色</label>
								<div class="col-sm-6">
									<input type="text" class="form-control" id="edit_goods_color"
										placeholder="颜色" name="goods_color">
								</div>
							</div>
							<div class="form-group">
								<label for="edit_address" class="col-sm-2 control-label">货品价格</label>
								<div class="col-sm-6">
									<input type="text" class="form-control" id="edit_goods_price"
										placeholder="价格" name="goods_price">
								</div>
							</div>
							<div class="form-group">
								<label for="edit_customerName" class="col-sm-2 control-label">入库总数</label>
								<div class="col-sm-6">
									<input type="text" class="form-control" id="edit_goods_total"
										placeholder="总数" name="goods_total">
								</div>
							</div>
							<div class="form-group">
								<label for="edit_custLevel" class="col-sm-2 control-label">货品类别</label>
								<div class="col-sm-6">
									<select class="form-control" id="edit_goods_category"
										name="goods_category_id">
										<option value="">--请选择--</option>
										<c:forEach items="${fromType}" var="item">
											<option value="${item.category_id}">${item.category_goods_name
												}</option>
										</c:forEach>
									</select>
								</div>
							</div>


						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary"
							onclick="updateCustomer()">保存修改</button>
					</div>
				</div>
			</div>
			<div class="row"></div>
		</div>
		<!-- /#page-wrapper -->

	</div>



	<!-- jQuery -->
	<script src="<%=basePath%>js/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="<%=basePath%>js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="<%=basePath%>js/metisMenu.min.js"></script>

	<!-- DataTables JavaScript -->
	<script src="<%=basePath%>js/jquery.dataTables.min.js"></script>
	<script src="<%=basePath%>js/dataTables.bootstrap.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="<%=basePath%>js/sb-admin-2.js"></script>

	<script type="text/javascript">
		function updateCustomer() {
		
			if($("#edit_goods_id").val() == ''){
				alert("表单中有空！");
			}
			else if($("#edit_goods_id").val().length != 6){
				alert("货品id不是6位数！");
			}
			else if($("#edit_goods_name").val() == ''){
				alert("表单中有空！！");
			}
			else if($("#edit_goods_color").val() == ''){
				alert("表单中有空！");
			}
			else if($("#edit_goods_price").val() == ''){
				alert("表单中有空！");
			}
			else if($("#edit_goods_total").val() == ''){
				alert("表单中有空！");
			}
			else if($("#edit_goods_category").val() == ''){
				alert("表单中有空！");
			}
			else{
				
				$.ajax({
				type:"get",
				url:"<%=basePath%>goods/checkgoods.action",
				data:{"id":$("#edit_goods_id").val()},
				success:function(data) {
					if(data == "have_goods"){
				
					alert("货品库中有该货物，不能新建");
					window.location.reload();
				}
				else{
				$.post("<%=basePath%>goods/addnew.action",$("#edit_goods_form").serialize(),function(data){
				alert("入库成功！");
				window.location.reload();});
				}
					
				}
			});
				
				
			
			}
		}
		
		
	</script>

</body>

</html>
