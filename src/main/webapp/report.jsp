<%@ page contentType="text/html; charset=GBK" language="java"
	errorPage=""%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

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
<link href="css/table.css" rel="stylesheet">

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
            		<li class="active"><a href="report.jsp">在线报告</a></li>
            		<li><a href="huodong.jsp">活动</a></li>
            		<li ><a href="resource.jsp">DP资源</a></li>
            		<li ><a href="report2.jsp">项目报告</a></li>
            		
				</ul>
			</div>
			<!--/.nav-collapse -->
		</div>	
	</div>
	<div>
    <div class='cont'>
    	<div class='tt1'>
    		<h1> 研究目的与背景 </h1>
    		<h2>华视传媒成立于2005年4月，拥有中国最大的公交地铁全覆盖的户外数字移动电视广告联播网。为了充分了解数字移动电视媒体的价值及客观评估其广告效果，华视传媒委托央视市场研究股份有限公司为其进行调查服务。</h2>
	    	<div id="main1" class="main" ></div>
			    <!-- ECharts单文件引入 -->

			<h1> 出示广告版前分媒体广告到达状况 </h1>
			<h2>出示广告版前，强生美林儿童退烧药广告的公交液晶电视到达率为29.8%，公交液晶电视是受访者认知强生美林儿童退烧药广告的主要途径之一。</h2>
			<div id="main2" class="main" ></div>
			<h1>公交液晶电视广告接触频次</h1>
			<h2>受访者通过公交液晶电视接触强生美林儿童退烧药广告的频率为平均1.6次/天。</h2>
			<div id='main3' class="main"></div>

			<h1>广告内容回忆</h1>
			<h2>广告内容方面，出示广告版之前声称看过广告的受访者对情节“妈妈转了几个圈变成了消防员”、“妈妈接到小宝发烧的电话”和画外音“小宝发烧了”的记忆较为深刻。</h2>
			<div id='main4' class="main"></div>
			<div id='main5' class="main"></div>

			<h1></h1>
		
		</div>	    <!-- ECharts单文件引入 -->
	</div>
    <script src="http://echarts.baidu.com/build/dist/echarts.js"></script>
    <script src="js/table.js"></script>

	</div>
	
</body>
</html>
