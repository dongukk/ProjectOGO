<%@page import="com.dto.login.MemberDTO"%>
<%@page import="com.service.login.MemberService"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String UserId = request.getParameter("UserId");
	System.out.println("deleteMember.jsp======"+UserId);
     MemberService service = new MemberService();
     int n = service.delete(UserId);
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <%
  String mesg = UserId + " 회원삭제 성공";
  if(n!=1){
	  mesg = UserId + " 회원삭제 실패";
  }
  out.print(mesg);	  
 %>
 <br>
 <a href="managementMember.jsp">목록보기</a>
</body>
</html>