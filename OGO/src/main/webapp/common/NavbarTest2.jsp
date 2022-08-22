<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.dto.login.MemberDTO" %>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<style type="text/css">

/* nav{ position: fixed; left: 0; top: 0; width:100%; background: #fff; box-shadow: 0 0 5px rgba(0,0,0,.5); text-decoration: none; list-style: none;}
 */
nav{ position:static; left: 0; top: 0; width:100%; background: #fff; box-shadow: 0 0 5px rgba(0,0,0,.5); text-decoration: none; list-style: none;}
nav div{ display:flex; position:relative; width: 500px; margin: 0 auto;}
nav div a{flex: 1; display: block; height: 40px; line-height: 40px; text-align: center; color: gray;}
nav div a.on{color: black;}
nav div a:hover{ font-size: 20px; transition: 0.5s;}
nav div > span { position: absolute; left: 0; bottom: 0; width:100px; height: 3px; 
background: #279d76; opacity: 0; transition: all .5s;}
nav div a:nth-child(1).on ~ span {left: 0; opacity: 1; background-color: green;}
nav div a:nth-child(2).on ~ span {left: 100px; opacity: 1; background-color: orange;}
nav div a:nth-child(3).on ~ span {left: 200px; opacity: 1; background-color: blue;}
nav 
</style>


<nav>
	<div>
		<a href="../MainForm.jsp"><img src="img/OGOLogo.jpg" style="width: 100px; height: 50px;"></a>
    </div>
	<div>	
		<!-- <a href="../ClassListServlet">행성카테고리</a>
		<a href="../MyPageServlet">MYSPACE</a>
		<a href="../NoticeListServlet">공지사항&FAQ</a> -->
		<span></span>
		</div>
</nav>

<script type="text/javascript">
$(document).ready(function() {
 // 네비메뉴바 애니메이션
	$("nav a").click(function() {
		console.log("클릭");
		$(this).addClass("on");
		$(this).siblings().removeAttr("class");
	});
});
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
