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

<title>index</title>
<script src="http://cdn.bootcss.com/jquery/1.10.2/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/starter-template.css" rel="stylesheet">

</head>

<body>
	<span style="color: red; font-weight: bold"> ${err}</span>

	<div class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<font color="white" size="6"> ${user_name} </font>
			</div>
			<div class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li><a href="home.jsp">Home</a></li>
            		<li><a href="choujiang.jsp">抽奖</a></li>
            		<li><a href="report.jsp">在线报告</a></li>
            		<li><a href="huodong.jsp">活动</a></li>
            		<li><a href="resource.jsp">DP资源</a></li>
            		<li><a href="report2.jsp">项目报告</a></li>
					<li><a href="<c:url value='/logout'/>">注销</a></li>
				</ul>
			</div>
			<!--/.nav-collapse -->
		</div>	
	</div>
	<div class="jumbotron">
		<h3>数据处理部</h3>
		${user_name},欢迎登录！  
	</div>

	<table>
		<c:forEach items="${arrFiles}" var="element">
			<tr> <td> <a href="download/${element.strPath}" > ${element.strName} </a> </td></tr>
		</c:forEach>
	</table>
	
</body>
</html>
