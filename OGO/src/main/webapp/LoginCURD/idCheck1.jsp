
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복 체크</title>

  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


</head>
<body>
<div class="container">
<h1>아이디 중복 체크</h1>
<!-- hr - 수평선 그리기 태그 -->
<hr>
<form action="../MemberIdCheckServlet" method="post">
	<div class="form-group">
		<label>아이디 입력</label>
		<input name="userId" type="text" class="form-control"
		placeholder="입력 후 체크버튼 클릭" required="required">
		<button class="CheckBtn">체크</button>
	</div>
</form>
<hr>
<jsp:include page="idCheck2.jsp" flush="true"></jsp:include><br>
<div id="result"></div>
</div>
</body>
</html>