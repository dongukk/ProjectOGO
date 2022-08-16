<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.dto.login.MemberDTO" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>

<!-- <link rel="stylesheet" href="LoginCSS/login.css"> -->
<!-- <link rel="stylesheet" href="common/LoginBar.css"> -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<style type="text/css">
#login_bar{
	text-align: right;
	margin: 0px 30px 0px 30px ;
	padding: 0px;
}
#img_a{
	height: 30px; 
	width: 30px;
}
#img_b{
	height: 30px; 
	width: 30px;
}
#img_logo { 
	display: block; margin: 10px auto; 
	width: 150px;
	height: 150px;
}
#img_close{
	display: block; 
	width: 30px;
	height: 30px;
}
a.btn {
    text-align: center;
    display: block;
    width: 380px;
    text-decoration: none;	/* a태그 밑줄 삭제 */
    border-radius: 5px;
    line-height: 20px;
    color: white;
    font-size: 14px;
    padding: 13px;
    opacity: 0.8;	/* 불투명 설정(0에 가까울수록 투명하다) */
    margin-left: 10px;
    margin-bottom: 10px;
    position: relative;	/* 요소 자기 자신의 원래 위치(static일 때의 위치)를 기준으로 배치 */
}
a.btn:hover { 
    opacity:1;	/* 마우스올려둘시 투명도 없어짐 */
}
a.btn1{
    border: 1px solid rgb(66, 192, 66);
    border-width: 3px;
}
a.btn2{
    border: 1px solid rgb(219, 206, 19);
    border-width: 3px;
}
a.btn1:before {
    content: url(../LoginImg/icon_naver.png);
    position : absolute;
    left : 15px;
    top : 12px;
}
a.btn2:before {
    content: url(../LoginImg/icon_kakao.png);
    position : absolute;
    left : 15px;
    top : 12px;
}
/* a태그 링크 이벤트 */
a.btn:visited {	/* 클릭전 */
  color : white;
}
a.btn:hover {	/* 마우스 위에 올려뒀을때 */
  color : red;
}
a.btn:active {	/* 마우스 누르는중 */
  color : green
}    
#a_create:hover {	/* 마우스 위에 올려뒀을때 */
  color : red;
}
.modal-body {
	font-family: 'Noto Sans KR', sans-serif;	/* 구글폰트에서 글자스타일 가져옴 */	
	margin: auto;	
} 
.modal-content {
	background-color: rgba(0,0,0,.7);
}
.login-form {position: relative; z-index: 2;}
.login-form h1 {
	font-size: 32px; color: rgb(128, 128, 128);
	text-align: center;
	margin-bottom: 60px;
}    

.int-area {
	width: 400px; 
	position: relative;	/* 요소 자기 자신을 기준으로 배치 */
	margin-top: 20px; 
}
.int-area:first-child {margin-top: 0;}	/* 부모 요소 안에 있는 첫번째 자식만을 선택 */
.int-area input {
	width: 100%;
	padding: 20px 10px 10px;
	background-color: transparent;	/*  미리 다른 배경 색상이 설정되어 있을 경우 filter 메서드와 충돌할 가능성이 있기 때문에 설정해놨음 */
	border: none;
	border-bottom: 1px solid #999;
	font-size: 18px; color: white;
	outline: none;		/* 외곽선 없음 */
}
.int-area label {
	position: absolute; left: 10px; top: 15px;
	font-size: 18px; color: #999;	/* 이벤트 효과전 설정 */
	transition:top .5s ease;		/* 애니메이션효과(위로, 0.5초에 걸쳐,느리게시작 점점빨라졌다가 느려지면서 종료) */
}

/* id,pw 입력시 텍스트 올라가는 애니메이션 위치*/
.int-area input:focus + label,	/* focus 했을때 */
.int-area input:valid + label {	/* 값입력안하고 로그인 눌렀을때 */
	 top: -2px;		/* 정해진 공간에서 2px정도 위로 */
	 font-size: 13px; color: #166cea;	/* 13포인트까지, 파랑색으로 */
}

.btn-area {
	margin-top: 30px;
}

/* 로그인버튼 이미지설정 */
.btn-area button {
	width: 100%;
	height: 50px;
	background:rgb(255, 0, 255);
	color: #fff;
	font-size: 20px;
	border: none;			/* 선없게 */
	border-radius: 10px; 	/* 테두리 꼭지점 둥글게 */
	cursor: pointer;		/* 마우스를 경고창뜨는 글자 위로 커서이동 */
	opacity: 0.6;
}
.btn-area button:hover{
	opacity: 1;
}
/* caption태그 이미지설정 */
.caption {
	margin-top:20px;
	text-align: center;
}
.caption a {
	font-size: 15px; color: #999;
	text-decoration: none;	/* 선 안보이게 */
}	
</style>
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
	<!-- <a href="#" onclick="popUp()">로그인<img src="common/img/login.png" id="img_b"></a> -->
	<!-- <a href="#" data-toggle="modal" data-target="#myModal">로그인<img src="common/img/login.png" id="img_b"></a> -->
	<!-- Button trigger modal -->
	<button type="button" data-bs-toggle="modal" data-bs-target="#lgoinModal">로그인</button>
	<a href="LoginCURD/createMember.jsp">회원가입</a>
<% } // end if~else %>	
	</div>
  	
<!-- Modal -->
<div class="modal fade" id="lgoinModal" tabindex="-1" aria-labelledby="lgoinModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <!-- <div class="modal-header">
       <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div> -->
        <div class="modal-body">   
             
         <img src="LoginImg/closeBtn.png"  id="img_close" class="btn-close" data-bs-dismiss="modal" aria-label="Close" align="right">
        	<br><br>
       
		<img src="LoginImg/login.jpg" id="img_logo">
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
				<!-- 네이버아이디로로그인 버튼 노출 영역 -->
				<div id="naverIdLogin"></div><br>
				<%-- <a class="btn btn1"href="<%=apiURL%>" src="http://static.nid.naver.com/oauth/small_g_in.PNG">네이버 계정으로 로그인</a> --%>
                <a class="btn btn2"href="https://www.kakaocorp.com/" target="_blank" onclick="window.close();">카카오 계정으로 로그인</a>
			</div>
			
		</form>
      </div>
    </div>
  </div>
</div>
<!-- //네이버아이디로로그인 버튼 노출 영역 -->

<!-- 네이버아디디로로그인 초기화 Script -->
<script type="text/javascript">
	var naverLogin = new naver.LoginWithNaverId(
		{
			clientId: "ekZ3X4W9E8FY6vv_Y7AK",
			callbackUrl: "http://localhost:8083/OGO/test.jsp",
			isPopup: false, /* 팝업을 통한 연동처리 여부 */
			loginButton: {color: "white", type: 3, height: 50} /* 로그인 버튼의 타입을 지정 */
		}
	);
	
	/* 설정정보를 초기화하고 연동을 준비 */
	naverLogin.init();
	
</script>
<!-- // 네이버아이디로로그인 초기화 Script -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</head>
	