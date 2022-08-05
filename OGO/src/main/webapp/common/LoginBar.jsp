<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.dto.login.MemberDTO" %>
<link rel="stylesheet" href="common/LoginBar.css">
<script type="text/javascript">
	// 로그인창 가운데 출력
	function popUp() {
		var child;
	 	var width=500;
		var height=700;
		var left = Math.ceil(( window.screen.width - width )/2);
		var top = Math.ceil(( window.screen.height - height )/2);  
		child= window.open("LoginMain/login.html", "", "width="+width+", height="+height+", left="+left+",top="+top);
	} 
</script>
	<div id="login_bar">
<%
MemberDTO dto = (MemberDTO)session.getAttribute("login");
// 로그인시 회원인증 후 login 데이터 세션에 저장

if(dto != null){
		String userName = dto.getUserName();
		String userId = dto.getUserId();
%>

안녕하세요. <%= userName %>님<br>
	<%  if(userId.equals("admin")){ // 이중 if문%>	
		<a href="LoginMain/managementMember.jsp">회원관리 페이지</a><br>
		<a href="logoutServlet">로그아웃</a>
		<a href="MyPageServlet">마이페이지<img src="common/img/mypage.png" id="img_a"></a>
		<a href="#">장바구니</a>
	<%  } else{ %>
		<a href="logoutServlet">로그아웃</a>
		<a href="MyPageServlet">마이페이지</a>
		<a href="#">장바구니</a>
<%	}} else{ %>
	<a href="#" onclick="popUp()">로그인<img src="common/img/login.png" id="img_b"></a>
<% } // end if~else %>	
	</div>
