<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<style type="text/css">
.newPw-form{
	text-align: center;
	margin: 200px; auto;
	min-width: 400px;	
}
.newPw-section{
	display: inline-block;
	border: solid;
	padding: 10px;
	margin: 10px;
}	
.newPw-section div{
	margin: 10px;
	top : 10px;
	padding: 10px 0px;
}
.input-group label{ margin: auto; padding-right: 10px;}
.newPw{ padding-top: 20px !important;}
.newPw2{ padding-bottom: 0px !important;}

.container{
	text-align: center;
	margin-top: 300px;
	min-width: 400px;		
}
.found-fail{
	display: inline-block;
	padding: 10px;
	margin: 10px;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	
	$("#enter").click(function(){
		var newPw = $("#newPw").val();
		var newPw2 = $("#newPw2").val();
		
		if(newPw.length==0){
			event.preventDefault();	
			alert("변경할 비밀번호를 입력하세요");
		} else if(newPw2.length==0){
			event.preventDefault();	
			alert("비밀번호 확인을 입력하세요");
		} 
		if(newPw != newPw2){
			event.preventDefault();	
			alert("비밀번호가 일치하지않습니다.");
		}
	});	// end enter
	
});	// end ready
</script>
</head>
<body>
<% 
	String userId = (String)request.getAttribute("userId"); 
%>
 
      <%
       if (userId != null) {
      %>
      
      <form class="newPw-form" method = "POST" action="PwUpdateServlet">
      	<input type="hidden" name="userId" value="<%=userId%>">
			<div class = "search-title">
				<h3>비밀번호 찾기</h3>
			</div>
		<section class = "newPw-section">
			<div class = "newPw">
				<label>새 비밀번호</label>
				<input type="text" name="newPw" id="newPw" size=25>
			<br>
			</div>
			<div class = "newPw2">
				<label>비밀번호 확인</label>
				<input type="text" name="newPw2" id="newPw2" size=25><br>
			</div>
			<br>
		</section>
		<div class ="btnSearch">
			<button type="submit" class="btn btn-dark" name="enter" id="enter">비밀번호 변경하기</button>
	 	</div>
	</form>
      <%
  } else {
 %>
 	<form name="idsearch" method="post">
        <div class = "container">
      	<div class = "found-fail">
	      <h4>  등록된 정보가 없습니다 </h4>  
	     </div>
	     <div class = "found-login">
 		    <input type="button" id="btnback" class="btn btn-dark" value="다시 찾기" onClick="history.back()"/>
 		    <input type="button" id="btnjoin" class="btn btn-dark" value="회원가입" onClick="location.href='createMemberServlet'"/>
       	</div>
       </div>  
       <%
  }
 %> 
      </form>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</html>