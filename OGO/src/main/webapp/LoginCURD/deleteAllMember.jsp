<%@page import="java.util.Collections"%>
<%@page import="java.util.Arrays"%>
<%@page import="com.dto.login.MemberDTO"%>
<%@page import="com.service.login.MemberService"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String [] UserIds = request.getParameterValues("delCheck");
	//for each 사용 출력 
    List<String> x = Arrays.asList(UserIds);
    System.out.println(x);
     MemberService service = new MemberService();
     int n = service.deleteAll(x);
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <%
  String pName = "";
 for(String name:x){
	 pName +=(name+" ");
 }
  String mesg = pName + " 회원삭제 성공";
  if(n==0){
	  mesg = pName + " 회원삭제 실패";
  }
  out.print(mesg);	  
 %>
 <br>
 <a href="managementMember.jsp">목록보기</a>
</body>
</html>