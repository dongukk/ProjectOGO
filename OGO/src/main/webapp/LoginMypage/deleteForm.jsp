<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

function check(){
	if(!document.delf.password.value){
		alert("비밀번호를 입력해주세요");
		return false;
	}
	
}

</script>
</head>
<body>

<h1>비밀번호를 입력하세요</h1>
<form action="deletepro.jsp" name="delf" method="post" onsubmit="return check()">
<h4>Password<input type="password" name="password"></h4>
<input type="submit" value="회원탈퇴"/>
<input type="button" value="취소" onclick="window.location='../LoginMain/MainTest.jsp'">
</form>

</body>
</html>