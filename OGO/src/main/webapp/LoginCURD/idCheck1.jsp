<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복 체크</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  
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
			console.log("data"+data);
			$("#count").val(data);	
		},
		error: function(xhr, status, error) {
			console.log(error);
		}			
	}); // end ajax
	
	String userId = $("#userId").val();
	String count =  $("#count").val();
 	System.out.println("userId"+userId);
 	System.out.println("count"+count); 
});	// end idCheck

});	// end ready
</script>
  

</head>
<body>
<div class="container">
<h1>아이디 중복 체크</h1>
<!-- hr - 수평선 그리기 태그 -->
<hr>
	<div class="form-group">
		<label>아이디 입력</label>
		<input name="userId" id="userId" type="text" class="form-control"
		placeholder="입력 후 체크버튼 클릭" required="required">
		<input type="hidden" id="count">
		<button id="idCheckBtn">체크</button>
	</div>

<hr>
<%-- <jsp:include page="idCheck2.jsp" flush="true"></jsp:include><br> --%>
<!-- 검색한 아이디 <span id="result" style="color: red;"></span>는 중복된 아이디입니다. <br>
다른 아이디를 입력해주세요. -->
<div id="result"></div>
</div>
</body>
</html>