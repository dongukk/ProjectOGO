<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
nav{ margin:0; position: fixed; left: 0; top: 0; width:100%; background: #fff; box-shadow: 0 0 5px rgba(0,0,0,.5);}
nav div{ display:flex; position:relative; float:left;}
#mainlogo{margin: 20px 200px 20px 20px;}
#navMenu{ width:600px; margin: 20px auto;}
nav div a{flex: 1; display: block; height: 40px; line-height: 40px; text-align: center; color: gray; text-decoration: none;}
nav div a.on{color: black;}
nav div a:hover{ font-size: 20px; transition: 0.5s;}
nav div > span { position: absolute; left: 0; bottom: 0; width:100px; height: 3px; 
background: #279d76; opacity: 0; transition: all .5s;}
nav div a:nth-child(1).on ~ span {left: 50px; opacity: 1; background-color: green;}
nav div a:nth-child(2).on ~ span {left: 250px; opacity: 1; background-color: orange;}
nav div a:nth-child(3).on ~ span {left: 450px; opacity: 1; background-color: blue;}



</style>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("nav a").click(function() {
		console.log("클릭");
		$(this).addClass("on");
		$(this).siblings().removeAttr("class");
	});
});
</script>
</head>
<body>
	<nav>
	<div id="mainlogo">
		<a href="../MainForm.jsp"><img src="img/OGOLogo.jpg" style="width: 100px; height: 50px;"></a>
    </div>
	  <div id="navMenu">
		<a href="#a"><span>행성카테고리</span></a>
		<a href="#a"><span>MYSPACE</span></a>
		<a href="#a"><span>공지사항&FAQ</span></a>
		<span></span>
	  </div>
	</nav>
</body>
</html>