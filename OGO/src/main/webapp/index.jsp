<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
	String nickname = request.getParameter("nickname"); 
	String email = request.getParameter("email"); 
	String name = request.getParameter("name"); 

%>
	닉네임 : <%=nickname %><br>
	이메일 : <%=email %><br>
	이름 : <%=name %>
</body>
</html>