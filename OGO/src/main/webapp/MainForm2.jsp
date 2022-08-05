<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 후 main페이지</title>

	<jsp:include page="common/NavBar.html" flush="true" />
	<jsp:include page="common/LoginBar.jsp" flush="true" />
</head>
<body>
	<hr>
	<jsp:include page="LoginMain/MainTest.jsp" flush="true" /><br>
</body>
</html>