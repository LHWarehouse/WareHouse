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
        <title>员工登陆界面</title>

        <!-- CSS -->
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
        <link rel="stylesheet" href="<%=basePath%>assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="<%=basePath%>assets/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="<%=basePath%>assets/css/form-elements.css">
        <link rel="stylesheet" href="<%=basePath%>assets/css/style.css">


        <!-- Favicon and touch icons -->
        <link rel="shortcut icon" href="<%=basePath%>assets/ico/favicon.png">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="<%=basePath%>assets/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="<%=basePath%>assets/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="<%=basePath%>assets/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="<%=basePath%>assets/ico/apple-touch-icon-57-precomposed.png">

    </head>

    <body style="background-color: #707070">

        <!-- Top content -->
        <div class="top-content">
        	
            <div class="inner-bg">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-8 col-sm-offset-2 text">
                            <h1><strong>仓库管理系统 员工</strong> Login Form</h1>
                            <div class="description">
                            	<p>
	                            	这是一个员工登陆的页面，若要管理员登陆点击 <a style="color: #EEAD0E" href="${pageContext.request.contextPath }/indexAdmin"><strong>管理员</strong></a>, 进入管理员登陆界面
                            	</p>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 col-sm-offset-3 form-box">
                        	<div class="form-top">
                        		<div class="form-top-left">
                        			<h3>员工登陆</h3>
                            		<p>输入用户名和密码登陆：</p>
                        		</div>
                        		<div class="form-top-right">
                        			<i class="fa fa-key"></i>
                        		</div>
                            </div>
                            <div class="form-bottom">
                            	<c:if test="${errorinformation == 0}">
                           			<p style="color:#CD0000;"> 不存在用户名</p>
                          		</c:if>
                           	 	<c:if test="${errorinformation == 1}">
                           			<p style="color:#CD0000;"> 密码错误</p>
                          		</c:if>
			                    <form role="form" action="${pageContext.request.contextPath }/LoginCheck.action" method="post" class="login-form">
			                    	<div class="form-group">
			                    		<label class="sr-only" for="form-username">Username</label>
			                        	<input type="text" name="user" placeholder="Username..." class="form-username form-control" id="form-username">
			                        </div>
			                        <div class="form-group">
			                        	<label class="sr-only" for="form-password">Password</label>
			                        	<input type="password" name="password" placeholder="Password..." class="form-password form-control" id="form-password">
			                        </div>
			                        <button type="submit" class="btn">登陆</button>
			                    </form>
		                    </div>
                        </div>
                    </div>
                    
                </div>
            </div>
            
        </div>
        


        <!-- Javascript -->
        <script src="<%=basePath%>assets/js/jquery-1.11.1.min.js"></script>
        <script src="<%=basePath%>assets/bootstrap/js/bootstrap.min.js"></script>
        <script src="<%=basePath%>assets/js/jquery.backstretch.min.js"></script>
        <script src="<%=basePath%>assets/js/scripts.js"></script>
        
        

    </body>

</html>
