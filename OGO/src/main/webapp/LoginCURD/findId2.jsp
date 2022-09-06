<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.container{
	text-align: center;
	margin-top: 300px;
	min-width: 400px;		
}
.found-success{
	display: inline-block;
	border: solid;
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
 		    <input type="button" id="btnLogin" value="로그인" onClick="location.href='MainFormServlet'"/>
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
 		    <input type="button" id="btnback" value="다시 찾기" onClick="history.back()"/>
 		    <input type="button" id="btnjoin" value="회원가입" onClick="location.href='createMemberServlet'"/>
       	</div>
       </div>  
       <%
  }
 %> 
      </form>
</body>
</html>