<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<style type="text/css">
	.find { text-align: center;  margin-top: 200px; }
	#find_btn {
		border: solid;
		padding: 10px;
		margin: 10px;
		width: 400px;
	}
	#cancle{ text-align: center; }
	#loginform div:first-child {margin-top: 0;}	/* 부모 요소 안에 있는 첫번째 자식만을 선택 */
</style>
</head>
<body>
<div class="find">
	<div class = "search-title">
		<h3>아이디 / 비밀번호 찾기</h3>
	</div>
	<div class="d-grid gap-2 col-6 mx-auto" id="find_btn">
	  <button class="btn btn-secondary btn-lg" id="findeid_email" onclick="location.href='findId.jsp'">아이디 찾기</button>
	  <button class="btn btn-secondary btn-lg" id="findid_phone" onclick="location.href='findPw.jsp'">비밀번호 찾기</button>
	</div>	
	<div>
		<button type="button" class="btn btn-dark" id="cancle" onClick="history.back()">취소</button>
	</div>
</div>
 
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</html>