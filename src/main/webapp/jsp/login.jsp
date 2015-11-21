<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<title>数据处理部</title>

<script src="http://cdn.bootcss.com/jquery/1.10.2/jquery.min.js"></script>
<script src="js/bootstrap.js"></script>
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/starter-template.css" rel="stylesheet">
<script type="text/javascript">
    	function UserLoginCheck(){
    		var js_uname = document.getElementById("uname").value;
    		var js_upassword = document.getElementById("upassword").value;
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
    		if(js_upassword.length > 20 || js_password < 6){
    			alert("密码长度应为6~20");
    			return false;
    		}
    		else
    			return true;
    	}
    </script>

<!-- 条件注释 -->
<!--[if lt IE 9]><script src="../../docs-assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="http://cdn.bootcss.com/html5shiv/3.7.0/html5shiv.min.js"></script>
      <script src="http://cdn.bootcss.com/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
</head>

<body>
<!-- -------------------------------------------------------------------------------------------------->
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
		<div></div>
		<p align="center">
			${op == "login" ? "欢迎用户登陆" : "注册新用户"}
		</p>
	</div>
	<span style="color: red; font-weight: bold"> ${err} </span>
	<div class="container" align="center">
		<form action=${op} method="post" class="form-group">
			<div class="input-group">
				<div class="col-lg-30">
					<span class="input-group-addon">UserName</span> <input type="text"
						name="UserName"  id="uname" class="form-control" /><br />
				</div>
			</div>
			<div class="input-group">
				<div class="col-lg-30">
					<span class="input-group-addon">Password</span> <input
						type="password" name="UserPasswd"  id="upassword"
						class="form-control" />
				</div>
			</div>
			<br>
			<br>
			<div class="form-group">
				<input type="submit" value=${op == "login" ? "登陆" : "注册"}
					onClick="return UserLoginCheck();" class="btn btn-primary btn-lg" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="reset" value="重置" class="btn btn-primary btn-lg" />
			</div>
		</form>
	</div>

</body>
</html>