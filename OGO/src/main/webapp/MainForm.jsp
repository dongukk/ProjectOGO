<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main 페이지</title>

<!-- 로그인처리 -->
<%
	String mesg = (String)session.getAttribute("mesg");
	if(mesg!=null){
%>
	<script type="text/javascript">
		alert(" <%= mesg %> "); 
	</script>
<% 
	session.removeAttribute("mesg");
	} 
%>

    
	<jsp:include page="common/nav.jsp" flush="false"/>
</head>
<body>
	
	<jsp:include page="common/ScrollAni.jsp" flush="false"/>
	<jsp:include page="common/MainPage.html" flush="false"/>

</body>
</html>