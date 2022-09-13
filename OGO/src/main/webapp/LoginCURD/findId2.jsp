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
.container{
	text-align: center;
	margin-top: 300px;
	min-width: 400px;	
		
}
.found-success{
	display: inline-block;
	padding: 10px;
	margin: 10px;
}
.found-fail{
	display: inline-block;
	padding: 10px;
	margin: 10px;
}
</style>
</head>
<body>
<% String userId = (String)request.getAttribute("userId"); %>
 <form name="idsearch" method="post">
      <%
       if (userId != null) {
      %>
      
      <div class = "container">
      	<div class = "found-success">
	      <h4>  회원님의 아이디는 <%=userId%> 입니다</h4> 
	     </div>
	     <div class = "found-login">
 		    <input type="button" id="btnLogin" class="btn btn-dark" value="로그인" onClick="location.href='MainFormServlet'"/>
       	</div>
       </div>
      <%
  } else {
 %>
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