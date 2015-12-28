<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>数据处理部</title>

<script src="js/jquery-1.8.3.min.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/sha256-min.js"></script>

<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/starter-template.css" rel="stylesheet">

<script type="text/javascript">
    	function UserLoginCheck(){
    		var js_uname = $('#username').val();
    		var js_upassword = $('#password').val();
    		if(js_uname == ""){
    			alert("用户名不能为空！");
    			return false;
    		}
    		if(js_uname.length > 20){
    			alert("用户长度不能大于20字节");
    			return false;
    		}
    		if(js_upassword == ""){
    			alert("密码不能为空！");
    			return false;
    		}
    		if(js_upassword.length > 20 || js_upassword.length < 6){
    			alert("密码长度应为6~20");
    			return false;
    		}
    		else {
    			//$('#password').val(CryptoJS.SHA256(js_upassword));
    			return true;
    		}
    	}
    </script>

</head>

<body>

<!-- 导航栏 -->
	<div class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<div class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li><a href="home.jsp">Home</a></li>
					<li ${op=="login"?"class=\"active\"":""}> <a href="login">登陆</a> </li>
					<li ${op=="register"?"class=\"active\"":""}> <a href="register">注册</a> </li>
				</ul>
			</div>
		</div>
	</div>
<!-- -------------------------------------------------------------------------------------------------->

	<div class="jumbotron">
		<p align="center">
			${op == "login" ? "欢迎用户登陆" : "注册新用户"}
		</p>
	</div>
	
	<c:if test="${not empty param.err}">
		<div><c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}"/></div>
	</c:if>
	<c:if test="${not empty param.out}">
		<div>You've logged out successfully.</div>
	</c:if>
	<c:if test="${not empty param.time}">
		<div>You've been logged out due to inactivity.</div>
	</c:if>
	
	<div class="container" align="center">
		<!-- 
		<form id="form" action=${op == "login" ? "spring_security_check":"register"} method="post" class="form-group">
		--> 
		
		<form id="form" action="<c:url value='${op}'/>" method="post" class="form-group">
			<div class="input-group">
				<div class="col-lg-30">
					<span class="input-group-addon">UserName</span> 
					<input type="text" name="username"  id="username" class="form-control" />
					<br />
				</div>
			</div>
			<div class="input-group">
				<div class="col-lg-30">
					<span class="input-group-addon">Password</span> 
					<input type="password" name="password"  id="password" class="form-control" />
				</div>
			</div>
			<br>
			<div class="form-group">
				<input type="submit" value=${op == "login" ? "登陆" : "注册"} name="submit"
					onClick="return UserLoginCheck();" class="btn btn-primary btn-lg" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="reset" value="重置" class="btn btn-primary btn-lg" />
			</div>
		</form>
	</div>

</body>
</html>