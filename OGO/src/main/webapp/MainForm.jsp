<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>O G O</title>


<%
	String mesg = (String)session.getAttribute("mesg");
	if(mesg!=null){
%>
	<script type="text/javascript">
		alert("<%= mesg %>");
	</script>
<% 
	session.removeAttribute("mesg");
	} 
%>
	<jsp:include page="common/NavBar.html" flush="true" />
	<jsp:include page="common/LoginBar.jsp" flush="true" />	
</head>
<body>
	<hr><br>
	<h1 style="text-align: center;">로그인 전 main페이지</h1>

</body>
</html>