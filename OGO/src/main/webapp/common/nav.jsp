<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.dto.login.MemberDTO" %>

<meta charset="UTF-8">
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="common/nav.css">

<nav>
	<div id="nav_logo">
		<a href="MainForm.jsp"><img src="common/img/OGOLogo.jpg"></a>
    </div>
    
	<div id="nav_Menu">
		<a class="nav_menu" href="ClassListServlet"><span>행성카테고리</span></a>
		<a class="nav_menu" href="MyPageServlet"><span>MYSPACE</span></a>
		<a class="nav_menu" href="NoticeListServlet"><span>공지사항&FAQ</span></a>
		<span></span>
	</div>
	
	<div id="nav_login">
<%
MemberDTO dto = (MemberDTO)session.getAttribute("login");
// 로그인시 회원인증 후 login 데이터 세션에 저장

if(dto != null){
		String nickname = dto.getNickname();
		String userId = dto.getUserId();
%>
	<div id="loginName">
		<%= nickname %>님
	</div>
	<div id="loginBar">
	<%  if(userId.equals("admin")){ // 이중 if문%>	
		<a href="logoutServlet" id="logout"><img src="common/img/logOut.png">로그아웃</a>
		<a href="LoginMain/managementMember.jsp"><img src="common/img/member.png">회원관리</a>
	<%  } else{ %>
		<a href="logoutServlet" id="logout">로그아웃</a>
<%	}} else{ %>
	<!-- <a href="#" onclick="popUp()">로그인<img src="common/img/login.png" id="img_b"></a> -->
	<!-- <a href="#" data-toggle="modal" data-target="#myModal">로그인<img src="common/img/login.png" id="img_b"></a> -->
	<!-- Button trigger modal -->
	<!-- <button type="button" data-bs-toggle="modal" data-bs-target="#lgoinModal">로그인</button> -->
	<!-- 로그인 -->
	<a href="#" data-bs-toggle="modal" data-bs-target="#lgoinModal"><img src="common/img/logIn.png">로그인</a>
	<!-- 회원가입 -->
	<a href="LoginCURD/createMember.jsp"><img src="common/img/signUp.png">회원가입</a>
<% } // end if~else %>	
	</div>
	</div>
</nav>	
	
	
	<!-- Modal -->
<div class="modal fade" id="lgoinModal" tabindex="-1" aria-labelledby="lgoinModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <!-- <div class="modal-header">
       <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div> -->
        <div class="modal-body">   
             
         <img src="LoginImg/closeBtn.png"  id="modal_close" class="btn-close" data-bs-dismiss="modal" aria-label="Close" align="right">
        	<br><br>
       
		<img src="LoginImg/login.jpg" id="modal_logo">
		<h1 style="text-align: center;"><a href="createMemberServlet" style="text-decoration: none;" id="a_create">OGO가 처음이신가요?</a><br></h1>	
			<br>
		<form action="loginServlet">	<!-- 로그인하면 가는 페이지 삽입할것-->
			<div class="int-area">	<!-- div(전체적인 틀을 잡아줌, 각각의 블럭을 알맞게 배치) -->
				<input type="text" name="userId" id="userId"
				autocomplete="off" required>	<!-- autocomplete(이전에 입력한 비슷한값들 드롭다운 옵션), required(폼 데이터(form data)가 서버로 제출되기 전 반드시 채워져 있어야 하는 입력 필드를 명시) -->
				<label for="userId">USER NAME</label>	<!-- label(for속성이용 다른요소와 결합가능) -->			
			</div>
			<div class="int-area">
				<input type="password" name="userPasswd" id="userPasswd"
				autocomplete="off" required>
				<label for="userPasswd">PASSWORD</label>				
			</div>
			<div class="caption" style="text-align: right;">			
				<a href="">Forgot Id, password?</a>
			</div>
			<div class="btn-area">
				<button type="submit">LOGIN</button><br><br>
				<div id="naver_id_login"></div>
				<a class="btn btn1" href="#" id="naverlogin">네이버 계정으로 로그인</a>
                <a class="btn btn2" href="https://www.kakaocorp.com/" target="_blank" onclick="window.close();">카카오 계정으로 로그인</a>
			</div>
			
		</form>
      </div>
    </div>
  </div>
</div>

<script type="text/javascript">
// 네비 메뉴바 애니메이션 효과부여
$(document).ready(function() {
	$("nav a").click(function() {
		console.log("클릭");
		$(this).addClass("on");
		$(this).siblings().removeAttr("class");
	});
});

// 네이버 아이디로 로그인
  	var naver_id_login = new naver_id_login("ekZ3X4W9E8FY6vv_Y7AK", "http://localhost:8097/OGO/LoginCURD/naverCollback.jsp");
  	var state = naver_id_login.getUniqState();
  	naver_id_login.setButton("white", 3,50);
  	naver_id_login.setDomain("hbrMjKeDCL");
  	naver_id_login.setState(state);
  	naver_id_login.setPopup();
  	naver_id_login.init_naver_id_login();

 // 네이버 로그인 커스텀 버튼으로 작동
  	$("#naverlogin").click(function() {
  		var naverLogin = document.getElementById("naver_id_login").firstChild;
        naverLogin.click();
	});
  	
 // 로그아웃 처리
  	 $("#logout").click(function() {
	  	   logoutPopUp= window.open("https://nid.naver.com/nidlogin.logout", "_blank", "width=1,height=1");
	  	   logoutPopUp.close();
  	});  
  </script>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	