<%@page import="java.util.function.Function"%>
<%@page import="java.util.*"%>
<%@ page import="org.apache.ibatis.javassist.compiler.ast.Member"%>
<%@ page import="com.dto.login.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>O G O</title>
<%
	// 회원가입후 mesg 출력
	String mesg = (String)session.getAttribute("memberAdd");
	if(mesg!=null){
%>
	<script type="text/javascript">
		alert("<%= mesg %>");
	</script>
<% 
	session.removeAttribute("memberAdd");
	} 
%>
<% 
	// 회원정보 꺼내기
	MemberDTO dto = (MemberDTO) session.getAttribute("login");
	String userId = dto.getUserId();
	String userName = dto.getUserName();
	String nickname = dto.getNickname();
	String gender = dto.getGender();
	String birth = dto.getBirth();
	String phone1 = dto.getPhone1();
	String phone2 = dto.getPhone2();
	String phone3 = dto.getPhone3();
	String email1 = dto.getEmail1();
	String email2 = dto.getEmail2();
	String profilePhoto = dto.getProfilePhoto();
	String hobby = dto.getHobby();
	// hobby 문자열데이터를 배열로 변환, 리스트에 저장
	String [] hobbyArr = hobby.split(",");  	   // ,콤마로 구분해서 배열생성
	List<String> hobbyList = Arrays.asList(hobbyArr);
	System.out.println(hobbyList); 
%>    
</head>
<body>
	<h1>로그인 후 메인페이지(정보 넘어오는거 확인용)</h1> <br>
	<h2>로그인 회원 정보</h2> <br>
	<!-- 사진 불러오는 방법 : /프로젝트명/사진저장경로/ + 사진명 -->
	<img id="profilePhoto" src="<%= "/projectA_Cho_0804/upload/member/" + profilePhoto %>"><br>
	프로필사진<br><br>
	아이디 : <%= userId %><br>
	이름 : <%= userName %><br>
	닉네임 : <%= nickname %><br>
	성별 : <%= gender %><br>
	생일 : <%= birth.substring(0, 10) %><br>
	핸드폰 : <%= phone1 %>-<%= phone2 %>-<%= phone3 %><br>
	이메일 : <%= email1 %>@<%= email2 %><br>
	취미 : <%= hobbyList %><br><br>
<%-- <a href="logoutServlet">로그아웃</a>
	<a href="MyPageServlet">마이페이지</a>
	<br><br><br>
<%
	if(userId.equals("admin")){
%>
		<h2>관리자용 페이지</h2><br>
		<a href="LoginMain/managementMember.jsp">회원관리 페이지</a><br>
		
<% } %> --%>
	
</body>
</html>