<%@page import="javax.swing.text.Document"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복 체크</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
  
<script type="text/javascript">
$(document).ready(function() {
//idCheckBtn 버튼 클릭 함수 (ajax 비동기 처리)
$("#idCheckBtn").click(function(){
	// 닉네임 입력안했을시 이벤트 중지
	var userId = $("#userId").val();
	if(userId.length == 0){
		alert("아이디를 입력하세요");	
		return false;
	}
	// 비동기 처리
	$.ajax({
		url: '../MemberIdCheckServlet',
		type: 'get',
		dataType: 'json',
		data: {userId:userId},
		success: function(data, status, xhr) {
			console.log("중복된 아이디 수(data) : "+data);
			
			$("#result1").text(userId);
			if(data == "1"){				
				$("#result2").text(" 는 중복 아이디입니다.");
				$("#result1").css("color","red");	
				$("#useIdBtn").hide();
			} else if (data == "0"){
				$("#result2").text(" 는 사용 가능한 아이디입니다.");
				$("#result1").css("color","green");
				$("#useIdBtn").show();
			}
			spinner.style.visibility = 'hidden';
		},
		error: function(xhr, status, error) {
			console.log(error);
		}			
	}); // end ajax	
});	// end idCheck


$("#useIdBtn").click(function(){
	// 회원가입 창의 id에 찾은 데이터를 셋팅한다.
	// opener - 나를 열게한 창
	// opener.document - 나를 열게한 찬의 문서(HTML)
	$(opener.document).find("#userId").val($("#userId").val());	
	// 창닫기를 한다.
	window.close();
});	// end useIdBtn


});	// end ready
</script>
<style type="text/css">
	h1{
		text-align: center;
	}
	#result1{
		font-size: 30px;
		font-weight: bold;
		font-style: italic;
	}
	
</style >  
	
</head>
<body>
<div class="container">
<h1>아이디 중복 체크</h1>
<hr>
	<div class="form-group">
		<label>아이디 입력</label>
		<input name="userId" id="userId" type="text" class="form-control"
		placeholder="입력 후 체크버튼 클릭" required="required">		
		<button id="idCheckBtn">체크</button> 
	</div>

	<hr>
	<div class="d-flex justify-content-center">
 		<div class="spinner-border" role="status" id="spinner">	<!-- id 부여 -->
    	<span class="visually-hidden">Loading...</span>
		</div>
	</div>
	<span id="result1"></span>
	<span id="result2"></span>
	<button id="useIdBtn" style="display: none;">아이디 사용하기</button>

</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script type="text/javascript">	/* 이벤트 작성 */
	let spinner = document.getElementById('spinner');
	spinner.style.visibility = 'hidden';
	$("#idCheckBtn").click(function() {
		let spinner = document.getElementById('spinner');
		spinner.style.visibility = 'visible';
	})
	
</script>
</body>
</html>