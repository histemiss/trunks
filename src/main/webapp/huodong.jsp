<%@ page contentType="text/html; charset=GBK" language="java"
	errorPage=""%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>数据处理部</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="css/lightbox.css" type="text/css" media="screen" />
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>

<script src="js/bootstrap.min.js"></script>
<link href="css/bootstrap.css" rel="stylesheet"  type="text/css">
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


<script type="text/javascript">
$(document).ready(function(){ 
  $(".zoom,.ilike").hide();

  $(".zoom").each(function(){//遍历所有对象
  var src=$(this).siblings("img").attr("src");
    $(this).attr({href:src});
  });
  
  $("#nav li").click(function(){
    $("#nav a").removeClass("hover");
    $(this).find("a").addClass("hover");
  });
  
  $("#waterfall li").mouseover(function(){
    $(this).addClass("hover");
    $(this).find(".zoom,.ilike").show();
  });
  
  $("#waterfall li").mouseout(function(){
    $(this).removeClass("hover");
    $(this).find(".zoom,.ilike").hide();
  });
});
</script>
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
                <li class="active"><a href="huodong.jsp">活动</a></li>
                <li ><a href="resource.jsp">DP资源</a></li>
                <li ><a href="report2.jsp">项目报告</a></li>
        </ul>
      </div>
      <!--/.nav-collapse -->
    </div>  
  </div>


<div id="main">
  <ul id="waterfall">
      
        <li>
          <div class="img_block">
              <img src="files/IMG001.jpg" />
                <a href="#" rel="lightbox[plants]" class="zoom">放大</a>
          </div>
            <h3>TITLE</h3>
          <p>简介文字</p>
    </li>
        
        <li>
          <div class="img_block">
              <img src="files/IMG002.jpg" />
                <a href="#" rel="lightbox[plants]" title="标题" class="zoom">放大</a>
      </div>
            <h3>标题测试</h3>
          <p>简介文字</p>
    </li>
        
        <li>
          <div class="img_block">
              <img src="files/IMG003.jpg" />
                <a href="#" rel="lightbox[plants]" title="标题" class="zoom">放大</a>
          </div>
            <h3>标题测试</h3>
          <p>简介文字</p>
    </li>
        
        <li>
          <div class="img_block">
              <img src="files/IMG004.jpg" />
                <a href="#" rel="lightbox[plants]" title="标题" class="zoom">放大</a>
          </div>
            <h3>标题测试</h3>
          <p>简介文字</p>
    </li>
        
        <li>
          <div class="img_block">
              <img src="files/IMG005.jpg" />
                <a href="#" rel="lightbox[plants]" title="标题" class="zoom">放大</a>
          </div>
            <h3>标题测试</h3>
          <p>简介文字</p>
    </li>
        
        <li>
          <div class="img_block">
              <img src="files/IMG006.jpg" />
                <a href="#" rel="lightbox[plants]" title="标题" class="zoom">放大</a>
          </div>
            <h3>标题测试</h3>
          <p>简介文字</p>
    </li>
        
        <li>
          <div class="img_block">
              <img src="files/IMG007.jpg" />
                <a href="#" rel="lightbox[plants]" title="标题" class="zoom">放大</a>
          </div>
            <h3>标题测试</h3>
          <p>简介文字</p>
    </li>
        
        <li>
          <div class="img_block">
              <img src="files/IMG008.jpg" />
                <a href="#" rel="lightbox[plants]" title="标题" class="zoom">放大</a>
          </div>
            <h3>标题测试</h3>
          <p>简介文字</p>
    </li>
        
        <li>
          <div class="img_block">
              <img src="files/IMG009.jpg" />
                <a href="#" rel="lightbox[plants]" title="标题" class="zoom">放大</a>
          </div>
            <h3>标题测试</h3>
          <p>简介文字</p>
    </li>
        
        <li>
          <div class="img_block">
              <img src="files/IMG010.jpg" />
                <a href="#" rel="lightbox[plants]" title="标题" class="zoom">放大</a>
          </div>
            <h3>标题测试</h3>
          <p>简介文字</p>
    </li>
        
        <li>
          <div class="img_block">
              <img src="files/IMG011.jpg" />
                <a href="#" rel="lightbox[plants]" title="标题" class="zoom">放大</a>
          </div>
            <h3>标题测试</h3>
          <p>简介文字</p>
    </li>
        
        <li>
          <div class="img_block">
              <img src="files/IMG012.jpg" />
                <a href="#" rel="lightbox[plants]" title="标题" class="zoom">放大</a>
          </div>
            <h3>标题测试</h3>
          <p>简介文字</p>
    </li>
        
        <li>
          <div class="img_block">
              <img src="files/IMG013.jpg" />
                <a href="#" rel="lightbox[plants]" title="标题" class="zoom">放大</a>
          </div>
            <h3>标题测试</h3>
          <p>简介文字</p>
    </li>
        
        <li>
          <div class="img_block">
              <img src="files/IMG014.jpg" />
                <a href="#" rel="lightbox[plants]" title="标题" class="zoom">放大</a>
          </div>
            <h3>标题测试</h3>
          <p>简介文字</p>
    </li>
        
        <li>
          <div class="img_block">
              <img src="files/IMG015.jpg" />
                <a href="#" rel="lightbox[plants]" title="标题" class="zoom">放大</a>
          </div>
            <h3>标题测试</h3>
          <p>简介文字</p>
    </li>
        
        <li>
          <div class="img_block">
              <img src="files/IMG016.jpg" />
                <a href="#" rel="lightbox[plants]" title="标题" class="zoom">放大</a>
          </div>
            <h3>标题测试</h3>
          <p>简介文字</p>
    </li>
        
        <li>
          <div class="img_block">
              <img src="files/IMG017.jpg" />
                <a href="#" rel="lightbox[plants]" title="标题" class="zoom">放大</a>
          </div>
            <h3>标题测试</h3>
          <p>简介文字</p>
    </li>
        
        <li>
          <div class="img_block">
              <img src="files/IMG018.jpg" />
                <a href="#" rel="lightbox[plants]" title="标题" class="zoom">放大</a>
          </div>
            <h3>标题测试</h3>
          <p>简介文字</p>
    </li>
        
       
        
        <li>
          <div class="img_block">
              <img src="files/IMG019.jpg" />
                <a href="#" rel="lightbox[plants]" title="标题" class="zoom">放大</a>
          </div>
            <h3>标题测试</h3>
          <p>简介文字</p>
    </li>
        
        <li>
          <div class="img_block">
              <img src="files/IMG020.jpg" />
                <a href="#" rel="lightbox[plants]" title="标题" class="zoom">放大</a>
          </div>
            <h3>标题测试</h3>
          <p>简介文字</p>
    </li>
        
        
        
        <li>
          <div class="img_block">
              <img src="files/IMG021.jpg" />
                <a href="#" rel="lightbox[plants]" title="标题" class="zoom">放大</a>
          </div>
            <h3>标题测试</h3>
          <p>简介文字</p>
    </li>
        
        <li>
          <div class="img_block">
              <img src="files/IMG022.jpg" />
                <a href="#" rel="lightbox[plants]" title="标题" class="zoom">放大</a>
          </div>
            <h3>标题测试</h3>
          <p>简介文字</p>
    </li>
        
        <li>
          <div class="img_block">
              <img src="files/IMG023.jpg" />
                <a href="#" rel="lightbox[plants]" title="标题" class="zoom">放大</a>
          </div>
            <h3>标题测试</h3>
          <p>简介文字</p>
    </li>
        
        <li>
          <div class="img_block">
              <img src="files/IMG024.jpg" />
                <a href="#" rel="lightbox[plants]" title="标题" class="zoom">放大</a>
          </div>
            <h3>标题测试</h3>
          <p>简介文字</p>
    </li>
       
        
        <li>
          <div class="img_block">
              <img src="files/IMG025.jpg" />
                <a href="#" rel="lightbox[plants]" title="标题" class="zoom">放大</a>
          </div>
            <h3>标题测试</h3>
          <p>简介文字</p>
    </li>
        
    </ul>
  
  <div class="clear"></div>
  
  <div style="visibility:hidden" id="loading" class="loading"><p><img src="images/loading.gif" /><img src="images/load.gif" /></p></div>

</div>
<script type="text/javascript" src="js/lightbox.js"></script>
<script type="text/javascript" src="js/jquery.masonry.min.js"></script>
<script type="text/javascript">
$(function(){

  var $waterfall = $('#waterfall');
  
  $waterfall.masonry({
    columnWidth: 230
  });
  
});
</script>

</body>
</html>
