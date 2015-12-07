<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<title>数据处理部</title>

<script src="http://cdn.bootcss.com/jquery/1.10.2/jquery.min.js"></script>
<script src="http://echarts.baidu.com/build/dist/echarts.js"></script>
<script src="js/bootstrap.min.js"></script>
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/starter-template.css" rel="stylesheet">

<!-- 条件注释 -->
<!--[if lt IE 9]><script src="../../docs-assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="http://cdn.bootcss.com/html5shiv/3.7.0/html5shiv.min.js"></script>
      <script src="http://cdn.bootcss.com/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->

<script type="text/javascript" src='js/relationship.js'></script>
</head>

<body>
	<div class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<font color="white" size="6"> ${user_name} </font>				
			</div>
			<div class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li class="active"><a href="home.jsp">Home</a></li>

					<c:if test="${not empty user_name}">
						<li><a href="choujiang.jsp">抽奖</a></li>
						<li><a href="report.jsp">在线报告</a></li>
						<li><a href="huodong.jsp">活动</a></li>
						<li><a href="resource.jsp">DP资源</a></li>
						<li><a href="resource2.jsp">项目报告</a></li>
						<li><a href="<c:url value='/logout'/>">注销</a></li>
					</c:if>
					<c:if test="${empty user_name}">
						<li><a href="welcome">登陆</a></li>
						<li><a href="register">注册</a></li>
					</c:if>
				</ul>
			</div>
			<!--/.nav-collapse -->
		</div>	
	</div>
	<div class="jumbotron">
		<h3>数据处理部</h3>
		<div class="js1" style="float:right;margin-top:-80px;">
		<h4>团队规模：</h4>
		<h5>拥有一支30多人的专业数据处理团队，其中7名经理，3名高级数据处理程序员。</h5>
		<h4>程序员资历：</h4>
		<h5>均为计算机、统计学、社会学专业背景为主，从业经历多为1年以上。</h5></div>
		<!-- <%=session.getAttribute("UserName")%>,欢迎登录！  -->
	</div>	<div id="dp_map" style="height:600px;width:600px;text-align:center;float:left;"></div>
	<div id="dp_job" style="height:625px;width:600px;text-align:center;float:right;"><img src="images/dp.png"></div>

</html>
