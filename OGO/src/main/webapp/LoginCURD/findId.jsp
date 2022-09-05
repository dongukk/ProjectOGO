<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<style type="text/css">
	.findid {
		margin: 200px;
		text-align: center;
				
	}
	#findid_btn {
		border: solid;
		padding: 10px;
		margin: 10px;
	}

</style>
</head>
<body>
<div class="findid">
	<div class = "search-title">
		<h3>아이디찾기</h3>
	</div>
	<div class="d-grid gap-2 col-6 mx-auto" id="findid_btn">
	  <button class="btn btn-secondary btn-lg" id="findeid_email" onclick="location.href='findId_email.jsp'">이메일로 찾기</button>
	  <button class="btn btn-secondary btn-lg" id="findid_phone" onclick="location.href='findId_phone.jsp'">폰번호로 찾기</button>
	</div>
	<div>
		<button type="button" class="btn btn-dark" onClick="history.back()">취소</button>
	</div>
</div>
	
 
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</html>