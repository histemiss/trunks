<%@ page contentType="text/html; charset=GBK" language="java"
	errorPage=""%>

<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>

<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<title>���ݴ���</title>

<script src="http://cdn.bootcss.com/jquery/1.10.2/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/starter-template.css" rel="stylesheet">
<script type="text/javascript">
    	function UserLoginCheck(){
    		var js_uname = document.getElementById("uname").value;
    		var js_upassword = document.getElementById("upassword").value;
    		if(js_uname == ""){
    			alert("�û�������Ϊ�գ�");
    			return false;
    		}
    		if(js_uname.length > 20){
    			alert("�û����Ȳ��ܴ���20�ֽ�");
    			return false;
    		}
    		if(js_upassword == ""){
    			alert("���벻��Ϊ�գ�");
    			return false;
    		}
    		if(js_upassword.length > 20 || js_password < 6){
    			alert("���볤��ӦΪ6~20");
    			return false;
    		}
    		else
    			return true;
    	}
    </script>

<!-- ����ע�� -->
<!--[if lt IE 9]><script src="../../docs-assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="http://cdn.bootcss.com/html5shiv/3.7.0/html5shiv.min.js"></script>
      <script src="http://cdn.bootcss.com/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
</head>

<body>
	<span style="color: red; font-weight: bold"> <%
		if (request.getAttribute("err") != null)
		{
			out.println(request.getAttribute("err") + "<br/>");
		}
	%>
	</span>

	<div class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<font color="white" size="6"><%if(session.getAttribute("UserName") != null){
						out.println(session.getAttribute("UserName"));
					}%>
				</font>
			</div>
			<div class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<%if(session.getAttribute("UserName") != null){
						out.println("<li><a href=\"user_logout\">Logout</a></li>");
					}%>
					<li><a href="home.jsp">Home</a></li>
					<li><a href="user_login.jsp">Login</a></li>
					<li class="active"><a href="user_regist.jsp">Regist</a></li>
					<%if(session.getAttribute("UserName") != null){
						out.println("<li><a href=\"choujiang.jsp\">�齱</a></li>");
					}%>
					<%if(session.getAttribute("UserName") != null){
						out.println("<li><a href=\"report.jsp\">���߱���</a></li>");
					}%>
					<%if(session.getAttribute("UserName") != null){
						out.println("<li><a href=\"huodong.jsp\">�</a></li>");
					}%>
					<%if(session.getAttribute("UserName") != null){
						out.println("<li><a href=\"resource.jsp\">DP��Դ</a></li>");
					}%>
					<%if(session.getAttribute("UserName") != null){
						out.println("<li><a href=\"resource2.jsp\">��Ŀ����</a></li>");
					}%>

				</ul>
			</div>
			<!--/.nav-collapse -->
		</div>
	</div>
	<div class="jumbotron">
		<p align="center">ע���˺�</p>
	</div>
	<div class="container" align="center">
		<form action="user_regist" method="post" class="form-group">
			<div class="input-group">
				<div class="col-lg-30">
					<span class="input-group-addon">UserName</span> <input type="text"
						name="UserName" id="uname" class="form-control" /><br />
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
				<input type="submit" value="ע    ��"
					onClick="return UserLoginCheck();" class="btn btn-primary btn-lg" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="reset" value="��    ��" class="btn btn-primary btn-lg" />
			</div>
		</form>
	</div>

</body>
</html>
