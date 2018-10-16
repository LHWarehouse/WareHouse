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
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

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
						href="${pageContext.request.contextPath }/jsp/add_goods"><i
							class="fa fa-arrow-right fa-fw"></i> 新增货品入库</a>
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
						href="${pageContext.request.contextPath }/jsp/store_manage"
						class="active"><i class="fa fa-pinterest-square fa-fw"></i>
							店铺管理</a>
					</li>
				</ul>
			</div>
			<!-- /.sidebar-collapse -->
		</div>
		<!-- /.navbar-static-side --> </nav>

		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h2 class="page-header">店铺管理</h2>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- 店铺层叠图  -->
			<ul id="myTab" class="nav nav-tabs">
				<li class="active"><a href="#home" data-toggle="tab"> 店铺A</a>
				</li>
				<li><a href="#ios" data-toggle="tab">店铺B</a>
				</li>

			</ul>
			<div id="myTabContent" class="tab-content">
				<div class="tab-pane fade in active" id="home">
					<div class="panel-body">

						<a href="#" class="btn btn-primary btn-3x" data-toggle="modal"
							data-target="#warehouShowToA">从仓库中入库</a> <a href="#"
							class="btn btn-primary btn-3x" data-toggle="modal"
							data-target="#storebShow">从店铺B中入库</a>

					</div>
					<!-- 展示商店a的存货 -->
					<div class="col-lg-12">
						<div class="panel panel-default">
							<table class="table table-bordered table-striped">
								<thead>
									<tr>
										<th>ID</th>
										<th>货物名称</th>
										<th>货物颜色</th>
										<th>货物价格(单位：元)</th>
										<th>货物数量</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${storeA}" var="row">
										<tr>
											<td>${row.goods_id}</td>
											<td>${row.goods_name}</td>
											<td>${row.goods_color}</td>
											<td>${row.goods_price}</td>
											<td>${row.goods_status}</td>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>

				</div>
				<div class="tab-pane fade" id="ios">
					<div class="panel-body">
						<a href="#" class="btn btn-primary btn-3x" data-toggle="modal"
							data-target="#warehouShowToB">从仓库中入库</a> <a href="#"
							class="btn btn-primary btn-3x" data-toggle="modal"
							data-target="#storeaShow">从店铺A中入库</a>
					</div>
					<!-- 展示商店b的存货 -->
					<div class="col-lg-12">
						<div class="panel panel-default">
							<table class="table table-bordered table-striped">
								<thead>
									<tr>
										<th>ID</th>
										<th>货物名称</th>
										<th>货物颜色</th>
										<th>货物价格(单位：元)</th>
										<th>货物数量</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${storeB}" var="row">
										<tr>
											<td>${row.goods_id}</td>
											<td>${row.goods_name}</td>
											<td>${row.goods_color}</td>
											<td>${row.goods_price}</td>
											<td>${row.goods_status}</td>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>

				</div>

			</div>
		</div>
	</div>
	<!-- 在a店里入库时的仓库列表展示 -->
	<div class="modal fade" id="warehouShowToA" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="panel panel-default">
					<table class="table table-bordered table-striped">
						<thead>
							<tr>
								<th>ID</th>
								<th>货物名称</th>
								<th>货物颜色</th>
								<th>货物价格(单位：元)</th>
								<th>货物总数</th>
								<th>仓库货存</th>
								<th>货物类型</th>
								<th>货物操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${page}" var="row">
								<tr>
									<td>${row.goods_id}</td>
									<td>${row.goods_name}</td>
									<td>${row.goods_color}</td>
									<td>${row.goods_price}</td>
									<td>${row.goods_total}</td>
									<td>${row.goods_status}</td>
									<td>${row.goods_category_id}</td>
									<td><a href="#" class="btn btn-primary btn-xs"
										data-toggle="modal" data-target="#numberbox_WarehouseToStoreA"
										onclick="WarehouseToStoreA(${row.goods_id})">转入到本店</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>

				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="numberbox_WarehouseToStoreA" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-body">
					<form class="form-horizontal" id="WarehouseToStoreA">
						<div class="form-group">
							<input type="hidden" id="goods_id1" name="goods_id" />
							<input type="hidden" id="goods_name1" name="goods_name" />
							<input type="hidden" id="goods_color1" name="goods_color" />
							<input type="hidden" id="goods_price1" name="goods_price" />
							<input type="hidden" id="old_goods_status1" name="old_goods_status" />
							 <label
								for="edit_customerName" class="col-sm-2 control-label">转入
							</label><a id="goods_name"><a />
								<div class="col-sm-4">
								<input type="text" class="form-control" id="goods_status1"
										placeholder="数量" name="goods_status"></input>
								</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary" onclick="inWarehouseToStoreA()">转入</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- 商店a页面里从b转入的响应框 -->
	<div class="modal fade" id="storebShow" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="panel panel-default">
					<table class="table table-bordered table-striped">
						<thead>
							<tr>
								<th>ID</th>
								<th>货物名称</th>
								<th>货物颜色</th>
								<th>货物价格(单位：元)</th>
								<th>货物数量</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${storeB}" var="row">
								<tr>
									<td>${row.goods_id}</td>
									<td>${row.goods_name}</td>
									<td>${row.goods_color}</td>
									<td>${row.goods_price}</td>
									<td>${row.goods_status}</td>
									<td><a href="#" class="btn btn-primary btn-xs"
										data-toggle="modal" data-target="#numberbox"
										onclick="ToStoreA(${row.goods_id})">转入到本店</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>

				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="numberbox" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-body">
					<form class="form-horizontal" id="StoreBToStoreA">
						<div class="form-group">
							<input type="hidden" id="goods_id3" name="goods_id" />
							<input type="hidden" id="goods_name3" name="goods_name" />
							<input type="hidden" id="goods_color3" name="goods_color" />
							<input type="hidden" id="goods_price3" name="goods_price" />
							<input type="hidden" id="old_goods_status3" name="old_goods_status" />
							 <label
								for="edit_customerName" class="col-sm-2 control-label">转入
							</label><a id="goods_name"><a />
								<div class="col-sm-4">
								<input type="text" class="form-control" id="goods_status3"
										placeholder="数量" name="goods_status"></input>
								</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary" onclick="inStoreBToStoreA()">转入</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- 在b店里入库时的仓库列表展示 -->
	<div class="modal fade" id="warehouShowToB" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="panel panel-default">
					<table class="table table-bordered table-striped">
						<thead>
							<tr>
								<th>ID</th>
								<th>货物名称</th>
								<th>货物颜色</th>
								<th>货物价格(单位：元)</th>
								<th>货物总数</th>
								<th>仓库货存</th>
								<th>货物类型</th>
								<th>货物操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${page}" var="row">
								<tr>
									<td>${row.goods_id}</td>
									<td>${row.goods_name}</td>
									<td>${row.goods_color}</td>
									<td>${row.goods_price}</td>
									<td>${row.goods_total}</td>
									<td>${row.goods_status}</td>
									<td>${row.goods_category_id}</td>
									<td><a href="#" class="btn btn-primary btn-xs"
										data-toggle="modal" data-target="#numberbox_WarehouseToStoreB"
										onclick="WarehouseToStoreB(${row.goods_id})">转入到本店</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>

				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="numberbox_WarehouseToStoreB" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-body">
					<form class="form-horizontal" id="WarehouseToStoreB">
						<div class="form-group">
							<input type="hidden" id="goods_id2" name="goods_id" />
							<input type="hidden" id="goods_name2" name="goods_name" />
							<input type="hidden" id="goods_color2" name="goods_color" />
							<input type="hidden" id="goods_price2" name="goods_price" />
							<input type="hidden" id="old_goods_status2" name="old_goods_status" />
							 <label
								for="edit_customerName" class="col-sm-2 control-label">转入
							</label><a id="goods_name"><a />
								<div class="col-sm-4">
								<input type="text" class="form-control" id="goods_status2"
										placeholder="数量" name="goods_status"></input>
								</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary" onclick="inWarehouseToStoreB()">转入</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- 商店b页面里从a转入的响应框 -->
	<div class="modal fade" id="storeaShow" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="panel panel-default">
					<table class="table table-bordered table-striped">
						<thead>
							<tr>
								<th>ID</th>
								<th>货物名称</th>
								<th>货物颜色</th>
								<th>货物价格(单位：元)</th>
								<th>货物数量</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${storeA}" var="row">
								<tr>
									<td>${row.goods_id}</td>
									<td>${row.goods_name}</td>
									<td>${row.goods_color}</td>
									<td>${row.goods_price}</td>
									<td>${row.goods_status}</td>
									<td><a href="#" class="btn btn-primary btn-xs"
										data-toggle="modal" data-target="#numberbox2"
										onclick="ToStoreB(${row.goods_id})">转入到本店</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>

				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="numberbox2" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-body">
					<form class="form-horizontal" id="StoreAToStoreB">
						<div class="form-group">
							<input type="hidden" id="goods_id4" name="goods_id" />
							<input type="hidden" id="goods_name4" name="goods_name" />
							<input type="hidden" id="goods_color4" name="goods_color" />
							<input type="hidden" id="goods_price4" name="goods_price" />
							<input type="hidden" id="old_goods_status4" name="old_goods_status" />
							 <label
								for="edit_customerName" class="col-sm-2 control-label">转入
							</label><a id="goods_name"><a />
								<div class="col-sm-4">
								<input type="text" class="form-control" id="goods_status4"
										placeholder="数量" name="goods_status"></input>
								</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary" onclick="inStoreAToStoreB()">转入</button>
						</div>
					</form>
				</div>
			</div>
		</div>
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
		$(function () {
        $('#myTab li:eq(1) a').tab('show');});
 
       
        function WarehouseToStoreA(id){
        	$.ajax({
				type:"get",
				url:"<%=basePath%>jsp/StoreToStoreSelectQuery.action",
				data:{"id":id},
				success:function(data) {
					$("#goods_id1").val(data.goods_id);
					$("#goods_color1").val(data.goods_color);
					$("#goods_name1").val(data.goods_name);
					$("#goods_price1").val(data.goods_price);
					$("#old_goods_status1").val(data.goods_status);
				}
			});
        }
        function inWarehouseToStoreA(){
        	if($("#goods_status1").val() == ""){
				alert("所填数字不能为空！");
			}
			//如下这里要转化变量类型，所以由此可见我们在开发时应时刻注意入参的变量类型以及返回对象的数据类型，不然会发送久思不得解的尴尬场面
			else if(parseInt($("#goods_status1").val()) > parseInt($("#old_goods_status1").val())){
				alert("货存没有那没多");
			}
			else{
			$.post("<%=basePath%>goods/WarehouseToStoreA.action",$("#WarehouseToStoreA").serialize(),function(data){
				alert("转入成功！");
				window.location.reload();
			});}
        }
        
        function ToStoreA(id){
        	$.ajax({
				type:"get",
				url:"<%=basePath%>jsp/StoreToStoreSelectQueryFromB.action",
				data:{"id":id},
				success:function(data) {
					$("#goods_id3").val(data.goods_id);
					$("#goods_color3").val(data.goods_color);
					$("#goods_name3").val(data.goods_name);
					$("#goods_price3").val(data.goods_price);
					$("#old_goods_status3").val(data.goods_status);
				}
			});
        }
        function inStoreBToStoreA(){
        	if($("#goods_status3").val() == ""){
				alert("所填数字不能为空！");
			}
			//如下这里要转化变量类型，所以由此可见我们在开发时应时刻注意入参的变量类型以及返回对象的数据类型，不然会发送久思不得解的尴尬场面
			else if(parseInt($("#goods_status3").val()) > parseInt($("#old_goods_status3").val())){
				alert("货存没有那没多");
			}
			else{
			$.post("<%=basePath%>goods/StoreBToStoreA.action",$("#StoreBToStoreA").serialize(),function(data){
				alert("转入成功！");
				window.location.reload();
			});}
        }
        
        
        function WarehouseToStoreB(id){
        	$.ajax({
				type:"get",
				url:"<%=basePath%>jsp/StoreToStoreSelectQuery.action",
				data:{"id":id},
				success:function(data) {
					$("#goods_id2").val(data.goods_id);
					$("#goods_color2").val(data.goods_color);
					$("#goods_name2").val(data.goods_name);
					$("#goods_price2").val(data.goods_price);
					$("#old_goods_status2").val(data.goods_status);
				}
			});
        }
        function inWarehouseToStoreB(){
        	if($("#goods_status2").val() == ""){
				alert("所填数字不能为空！");
			}
			//如下这里要转化变量类型，所以由此可见我们在开发时应时刻注意入参的变量类型以及返回对象的数据类型，不然会发送久思不得解的尴尬场面
			else if(parseInt($("#goods_status2").val()) > parseInt($("#old_goods_status2").val())){
				alert("货存没有那没多");
			}
			else{
			$.post("<%=basePath%>goods/WarehouseToStoreB.action",$("#WarehouseToStoreB").serialize(),function(data){
				alert("转入成功！");
				window.location.reload();
			});}
     	}
 		function ToStoreB(id){
 			$.ajax({
				type:"get",
				url:"<%=basePath%>jsp/StoreToStoreSelectQueryFromA.action",
				data:{"id":id},
				success:function(data) {
					$("#goods_id4").val(data.goods_id);
					$("#goods_color4").val(data.goods_color);
					$("#goods_name4").val(data.goods_name);
					$("#goods_price4").val(data.goods_price);
					$("#old_goods_status4").val(data.goods_status);
				}
			});
 		}
 		function inStoreAToStoreB(){
        	if($("#goods_status4").val() == ""){
				alert("所填数字不能为空！");
			}
			//如下这里要转化变量类型，所以由此可见我们在开发时应时刻注意入参的变量类型以及返回对象的数据类型，不然会发送久思不得解的尴尬场面
			else if(parseInt($("#goods_status4").val()) > parseInt($("#old_goods_status4").val())){
				alert("货存没有那没多");
			}
			else{
			$.post("<%=basePath%>goods/StoreAToStoreB.action",$("#StoreAToStoreB").serialize(),function(data){
				alert("转入成功！");
				window.location.reload();
			});}
        }
	</script>
	
</body>


</html>
