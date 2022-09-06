<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<style type="text/css">
	.find_id-form{
		text-align: center;
		margin: 200px; auto;
		min-width: 400px;	
	}
	.form-search{
		display: inline-block;
		border: solid;
		padding: 10px;
		margin: 10px;
	}	
	.form-search div{
		margin: 10px;
		top : 10px;
		padding: 10px 0px;
	}
	.input-group label{ margin: auto; padding-right: 10px;}
	.find-name{ padding-top: 20px !important;}
	.find-email{ padding-bottom: 0px !important;}
</style>
</head>

<body>
	
	<form class="find_id-form" method = "POST" action="../findIdServlet">
			<div class = "search-title">
				<h3>아이디 찾기</h3>
			</div>
		<section class = "form-search">
			<div class = "find-name">
				<label>이름</label>
				<input type="text" name="findName" placeholder = "username" size=25>
			<br>
			</div>
			<div class = "find-email">
				<label>이메일</label>
				<input type="text" name="findEmail" placeholder = "@email" size=25>
			</div>
			<br>
		</section>
		<div class ="btnSearch">
			<button type="submit" class="btn btn-dark" name="enter">찾기</button>
			<button type="button" class="btn btn-dark" name="cancle" onClick="history.back()">취소</button>
	 	</div>
	</form>
 
</body>
<script type="text/javascript">
	function id_search() {
		var frm = document.idfindscreen;
	 	if (frm.member_name.value.length < 1) {
		  alert("이름을 입력해주세요");
		  return;
		 }

		 if (frm.member_phone.value.length != 13) {
			  alert("핸드폰번호를 정확하게 입력해주세요");
			  return;
		 }

		 frm.method = "post";
		 frm.action = "findIdResult.jsp"; //넘어간화면
		 frm.submit();  
	 }

</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</html>