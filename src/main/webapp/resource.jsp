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
<script src="js/bootstrap.min.js"></script>
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/starter-template.css" rel="stylesheet">

<script type="text/javascript">
function changefilename() {
	$("#filename").val($("#file").val());
}

function submitclick() {
	if (! $("#file").val()) {
		alert("没选择文件 上传什么？");
		return false;
	}
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
					<li><a href="user_regist.jsp">Regist</a></li>
            		<li><a href="choujiang.jsp">抽奖</a></li>
            		<li><a href="report.jsp">在线报告</a></li>
            		<li><a href="huodong.jsp">活动</a></li>
            		<li class="active" ><a href="resource.jsp">DP资源</a></li>
            		<li ><a href="report2.jsp">项目报告</a></li>

				</ul>
			</div>
			<!--/.nav-collapse -->
		</div>	
	</div>
	<div class="jumbotron">
		<h3>数据处理部</h3>
	</div>
	
	<form method="POST" enctype="multipart/form-data" action="upload">
		File to upload: 
		<input type="file" id="file" name="file" onchange="changefilename()"  ><br /> 
		<input id='filename' name='filename' class='hide' />
		<input type="submit" value="上传" onClick="return submitclick();">
	</form>


</body>
</html>
