<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.dto.login.MemberDTO" %>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<style type="text/css">
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
    content: url(LoginImg/icon_naver.png);
    position : absolute;
    left : 15px;
    top : 12px;
}
a.btn2:before {
    content: url(LoginImg/icon_kakao.png);
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
#naver_id_login{
	display: none;
}

nav ul {
    list-style:none;
    margin:0;
    padding:0;
}
nav li {
    margin: 10px;
    padding: 0;
    border : 0;
    text-align: center;
}
nav a{
	text-align: center;
	text-decoration: none;
}
nav img{
	margin: 0 auto;
	display:block; 
	position:relative; 
	height: 30px;
	width: 30px;
}
</style>


<nav class="navbar navbar-expand-lg navbar-light bg-white">
  <div class="container-fluid">
     <a class="navbar-brand" href="../MainForm.jsp">
      <img src="img/OGOLogo.jpg" style="width: 100px; height: 50px;" >
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
	<div class="collapse navbar-collapse" id="navbarSupportedContent">
	  <ul class="navbar-nav me-auto mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="../ClassListServlet">행성카테고리</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="../MyPageServlet">MYSPACE</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="../NoticeListServlet">공지사항&FAQ</a>
        </li>
      </ul>
	  <ul class="navbar-nav col-md-2">
<%
MemberDTO dto = (MemberDTO)session.getAttribute("login");
// 로그인시 회원인증 후 login 데이터 세션에 저장

if(dto != null){
		String nickname = dto.getNickname();
		String userId = dto.getUserId();
%>
	  안녕하세요. <%= nickname %>님<br>
	<%  if(userId.equals("admin")){ // 이중 if문%>	<!-- 관리자 계정 로그인 -->
		<li class="nav-item"><a class="nav-link active" aria-current="page" href="logoutServlet" id="logout"><img src="../common/img/logoutImg.png">로그아웃</a></li>
		<li class="nav-item"><a class="nav-link active" aria-current="page" href="logoutServlet" id="logout"><img src="../common/img/logoutImg.png">회원관리</a></li>
	<%  } else{ %>	<!-- 로그인한 경우 -->
	    <li class="nav-item"><a class="nav-link active" aria-current="page" href="logoutServlet" id="logout"><img src="../common/img/logoutImg.png">로그아웃</a></li>
	 <%	}} else{ %>	<!-- 로그인 안한 경우 -->
	  	<li class="nav-item"><a class="nav-link active" aria-current="page" href="#" data-bs-toggle="modal" data-bs-target="#lgoinModal"><img src="../common/img/login.png">로그인</a></li>
	    <li class="nav-item"><a class="nav-link active" aria-current="page" href="LoginCURD/createMember.jsp"><img src="../common/img/createMember.png">회원가입</a></li>
	 <% } // end if~else %>	   
	  </ul>
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
  	var naver_id_login = new naver_id_login("ekZ3X4W9E8FY6vv_Y7AK", "http://localhost:8083/OGO/LoginCURD/naverCollback.jsp");
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
