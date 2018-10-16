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
								<strong>经理a</strong> <span class="pull-right text-muted">
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
						href="${pageContext.request.contextPath }/jsp/admin_manage"
						class="active"><i class="fa fa-edit fa-fw"></i> 货品管理</a>
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
					<h2 class="page-header">货品管理</h2>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="panel panel-default">
				<div class="panel-body">
					<form class="form-inline"
						action="${pageContext.request.contextPath }/jsp/list.action"
						method="post">
						<div class="form-group">
							<label for="customerName">货品ID</label> <input type="text"
								class="form-control" id="goodsId" value="${goodsId }"
								name="goodsId">
						</div>
						<div class="form-group">
							<label for="customerFrom">货物类别</label> <select
								class="form-control" id="goodsCategory" placeholder="货品分类"
								name="goodsCategoryId">
								<option value="">--请选择--</option>
								<c:forEach items="${fromType}" var="item">
									<option value="${item.category_id}"
										<c:if test="${item.category_id == goods_category_id}"> selected</c:if>>${item.category_goods_name
										}</option>
								</c:forEach>
							</select>
						</div>

						<button type="submit" class="btn btn-primary">查询</button>
					</form>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">货物信息列表</div>
						<!-- /.panel-heading -->
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
								<c:forEach items="${page.rows}" var="row">
									<tr>
										<td>${row.goods_id}</td>
										<td>${row.goods_name}</td>
										<td>${row.goods_color}</td>
										<td>${row.goods_price}</td>
										<td>${row.goods_total}</td>
										<td>${row.goods_status}</td>
										<td>${row.goods_category_id}</td>
										<td><a href="#" class="btn btn-primary btn-xs"
											data-toggle="modal" data-target="#customerEditDialog"
											onclick="editCustomer(${row.goods_id})">修改</a> <a href="#"
											class="btn btn-success btn-xs" data-toggle="modal"
											data-target="#InGoodsEditDialog"
											onclick="inGoodsDialog(${row.goods_id})">入库</a> <a href="#"
											class="btn btn-info btn-xs" data-toggle="modal"
											data-target="#OutGoodsEditDialog"
											onclick="outGoodsDialog(${row.goods_id})">出库</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<div class="col-md-12 text-right">
							<itcast:page
								url="${pageContext.request.contextPath }/jsp/list.action" />
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-12 -->
			</div>
		</div>
		<!-- /#page-wrapper -->

	</div>
	<!-- 出库编辑对话框 -->
	<div class="modal fade" id="OutGoodsEditDialog" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-body">
					<form class="form-horizontal" id="edit_goods_outwarehouse">
						<div class="form-group">
							<input type="hidden" id="out_goods_id" name="goods_id" /> <input
								type="hidden" id="out_goods_name" name="goods_name" /> <input
								type="hidden" id="out_goods_color" name="goods_color" /> <input
								type="hidden" id="out_goods_status" name="goods_status" /> <a>该货品仓库现存货品数量：</a><a
								id="out_goods_status1"></a> <label for="edit_customerName"
								class="col-sm-2 control-label">出库 <a
								id="out_goods_name1"><a />
							</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="out_goods_number"
									placeholder="数量" name="goods_total"></input>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary"
								onclick="outGoods()">出库</button>
						</div>
					</form>
				</div>
			</div>
		</div>

	</div>
	<!-- 入库编辑对话框 -->
	<div class="modal fade" id="InGoodsEditDialog" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-body">
					<form class="form-horizontal" id="edit_goods_inwarehouse">
						<div class="form-group">
							<input type="hidden" id="in_goods_id" name="goods_id" /> <input
								type="hidden" id="in_goods_name" name="goods_name" /> <input
								type="hidden" id="in_goods_color" name="goods_color" /> <label
								for="edit_customerName" class="col-sm-2 control-label">入库
							</label><a id="new_goods_name"><a />
								<div class="col-sm-4">
									<input type="text" class="form-control" id="in_goods_number"
										placeholder="数量" name="goods_total"></input>
								</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary" onclick="inGoods()">入库</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- 货品编辑对话框 -->
	<div class="modal fade" id="customerEditDialog" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">修改货品信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="edit_customer_form">
						<input type="hidden" id="edit_goods_id" name="goods_id" /> <input
							type="hidden" name="goods_name" /> <input type="hidden"
							name="goods_total" /> <input type="hidden" name="goods_status" />

						<div class="form-group">
							<label for="edit_customerName" class="col-sm-2 control-label">货品ID</label>
							<div>
								<label for="edit_customerName" class="col-sm-1 control-label"><a
									id="edit_goods_id1"></a>
								</label>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_customerName" class="col-sm-2 control-label">货品名称</label>
							<div>
								<label for="edit_customerName" class="col-sm-2 control-label"><a
									id="edit_goods_name"></a>
								</label>
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
							<label for="edit_customerName" class="col-sm-2 control-label">货品总数</label>
							<div>
								<label for="edit_customerName" class="col-sm-1 control-label"><a
									id="edit_goods_total"></a>
								</label>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_customerName" class="col-sm-2 control-label">现存货物</label>
							<div>
								<label for="edit_customerName" class="col-sm-1 control-label"><a
									id="edit_goods_status"></a>
								</label>
							</div>
						</div>


					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary"
						onclick="updateCustomer()">保存修改</button>
				</div>
			</div>
		</div>
	</div>


	<!-- /#wrapper -->

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
		function editCustomer(id) {
			$.ajax({
				type:"get",
				url:"<%=basePath%>jsp/edit.action",
				data:{"id":id},
				success:function(data) {
					$("#edit_goods_name").html(data.goods_name);
					$("#edit_goods_id1").html(data.goods_id);
					$("#edit_goods_id").val(data.goods_id);
					$("#edit_goods_color").val(data.goods_color);
					$("#edit_goods_price").val(data.goods_price);
					$("#edit_goods_total").html(data.goods_total);
					$("#edit_goods_status").html(data.goods_status);		
				}
			});
		}
		function updateCustomer() {
			$.post("<%=basePath%>goods/update.action",$("#edit_customer_form").serialize(),function(data){
				alert("货品更新成功！");
				window.location.reload();
			});
		}
		//出库货品时 传参id 查询该货品id返回的货品pojo对象
		function outGoodsDialog(id) {
			$.ajax({
				type:"get",
				url:"<%=basePath%>jsp/edit.action",
				data:{"id":id},
				success:function(data) {
					$("#out_goods_id").val(data.goods_id);
					$("#out_goods_name").val(data.goods_name);
					$("#out_goods_color").val(data.goods_color);
					$("#out_goods_name1").html(data.goods_name);
					$("#out_goods_status1").html(data.goods_status);
					$("#out_goods_status").val(data.goods_status);
				}
			});
		}
		//出库按钮点击后的入库事件
		function outGoods(){
			if(parseInt($("#out_goods_number").val()) >= parseInt($("#out_goods_status").val())){
				alert("仓库现存并没有这么多！");
			}
			else if($("#out_goods_number").val() == ""){
				alert("所填数字不能为空！");
			}
			else
			{
				$.post("<%=basePath%>goods/outWarehouse.action",$("#edit_goods_outwarehouse").serialize(),function(data){
				alert("货品出库成功！");
				window.location.reload();
			});}
			
		}
		//入库货品时 传参id 查询该货品id返回的货品pojo对象
		function inGoodsDialog(id) {
			$.ajax({
				type:"get",
				url:"<%=basePath%>jsp/edit.action",
				data:{"id":id},
				success:function(data) {
					$("#in_goods_id").val(data.goods_id);
					$("#in_goods_name").val(data.goods_name);
					$("#in_goods_color").val(data.goods_color);
					$("#new_goods_name").html(data.goods_name);
				}
			});
		}
		//入库按钮点击后的入库事件
		function inGoods(){
			if($("#in_goods_number").val() == ""){
				alert("所填数字不能为空！");
			}
			else{
			$.post("<%=basePath%>goods/inWarehouse.action",$("#edit_goods_inwarehouse").serialize(),function(data){
				alert("货品入库成功！");
				window.location.reload();
			});}
		}
		
		
		function deleteGoods(id) {
		if(confirm('确实要删除该客户吗?')) {
				$.post("<%=basePath%>customer/delete.action",{"id":id},function(data){
					alert("客户删除更新成功！");
					window.location.reload();
				});
			}
		}
	</script>

</body>

</html>
