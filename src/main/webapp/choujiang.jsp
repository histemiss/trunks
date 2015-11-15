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


<title>数据处理部</title>
<script src="http://cdn.bootcss.com/jquery/1.10.2/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
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

<meta name="keywords" content="jQuery抽奖转盘,jQuery转盘抽奖,jQuery圆盘抽奖,jQuery抽奖代码,jQuery抽奖插件,jQuery方块抽奖" />
<meta name="description" content="JS代码网提供jQuery插件,jQuery抽奖插件,jQuery圆盘抽奖插件学习教程和代码下载使用" />

<style type="text/css">
#lottery{width:684px;height:684px;margin:20px auto 0;background:url(images/bg.jpg) no-repeat;padding:50px 55px;}
#lottery table td{width:142px;height:142px;text-align:center;vertical-align:middle;font-size:24px;color:#333;font-index:-999}
.lottery-unit{margin-top:0px;}
#lottery table td a{width:284px;height:284px;line-height:150px;display:block;text-decoration:none;}
#lottery table td.active{background-color:#edc81a;}
</style>

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
            		<li class="active"><a href="choujiang.jsp">抽奖</a></li>
            		<li><a href="report.jsp">在线报告</a></li>
            		<li><a href="huodong.jsp">活动</a></li>
            		<li ><a href="resource.jsp">DP资源</a></li>
            		<li ><a href="report2.jsp">项目报告</a></li>
				</ul>
			</div>
			<!--/.nav-collapse -->
		</div>	
	</div>
<div id="lottery">
	<table border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td class="lottery-unit lottery-unit-0"><img src="images/1.png"></td>
			<td class="lottery-unit lottery-unit-1"><img src="images/2.png"></td>
			<td class="lottery-unit lottery-unit-2"><img src="images/4.png"></td>
            <td class="lottery-unit lottery-unit-3"><img src="images/3.png"></td>
		</tr>
		<tr>
			<td class="lottery-unit lottery-unit-11"><img src="images/7.png"></td>
			<td colspan="2" rowspan="2"><a href="#"></a></td>
			<td class="lottery-unit lottery-unit-4"><img src="images/5.png"></td>
		</tr>
		<tr>
			<td class="lottery-unit lottery-unit-10"><img src="images/1.png"></td>
			<td class="lottery-unit lottery-unit-5"><img src="images/6.png"></td>
		</tr>
        <tr>
			<td class="lottery-unit lottery-unit-9"><img src="images/3.png"></td>
			<td class="lottery-unit lottery-unit-8"><img src="images/6.png"></td>
			<td class="lottery-unit lottery-unit-7"><img src="images/8.png"></td>
            <td class="lottery-unit lottery-unit-6"><img src="images/7.png"></td>
		</tr>
	</table>
	
</div>

<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
var lottery={
	index:-1,	//当前转动到哪个位置，起点位置
	count:0,	//总共有多少个位置
	timer:0,	//setTimeout的ID，用clearTimeout清除
	speed:20,	//初始转动速度
	times:0,	//转动次数
	cycle:50,	//转动基本次数：即至少需要转动多少次再进入抽奖环节
	prize:-1,	//中奖位置
	init:function(id){
		if ($("#"+id).find(".lottery-unit").length>0) {
			$lottery = $("#"+id);
			$units = $lottery.find(".lottery-unit");
			this.obj = $lottery;
			this.count = $units.length;
			$lottery.find(".lottery-unit-"+this.index).addClass("active");
		};
	},
	roll:function(){
		var index = this.index;
		var count = this.count;
		var lottery = this.obj;
		$(lottery).find(".lottery-unit-"+index).removeClass("active");
		index += 1;
		if (index>count-1) {
			index = 0;
		};
		$(lottery).find(".lottery-unit-"+index).addClass("active");
		this.index=index;
		return false;
	},
	stop:function(index){
		this.prize=index;
		return false;
	}
};

function roll(){
	lottery.times += 1;
	lottery.roll();
	if (lottery.times > lottery.cycle+10 && lottery.prize==lottery.index) {
		clearTimeout(lottery.timer);
		lottery.prize=-1;
		lottery.times=0;
		click=false;
	}else{
		if (lottery.times<lottery.cycle) {
			lottery.speed -= 10;
		}else if(lottery.times==lottery.cycle) {
			var index = Math.random()*(lottery.count)|0;
			lottery.prize = index;		
		}else{
			if (lottery.times > lottery.cycle+10 && ((lottery.prize==0 && lottery.index==7) || lottery.prize==lottery.index+1)) {
				lottery.speed += 110;
			}else{
				lottery.speed += 20;
			}
		}
		if (lottery.speed<40) {
			lottery.speed=40;
		};
		//console.log(lottery.times+'^^^^^^'+lottery.speed+'^^^^^^^'+lottery.prize);
		lottery.timer = setTimeout(roll,lottery.speed);
	}
	return false;
}

var click=false;

window.onload=function(){
	lottery.init('lottery');
	$("#lottery a").click(function(){
		if (click) {
			return false;
		}else{
			lottery.speed=100;
			roll();
			click=true;
			return false;
		}
	});
};
</script>

</body>
</html>
