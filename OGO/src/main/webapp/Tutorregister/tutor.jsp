<%@page import="javax.annotation.processing.SupportedSourceVersion"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.dto.login.MemberDTO"%>
<html lang="en">
 <head>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">

<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript">


$(document).ready(function() {

// 취미 다중 체크박스 값 가져오기 함수
// btnChk 라는 버튼이 눌렸을 때, hobby라는 name을 가진 체크박스들을 확인하여 눌린 체크박스의 value값을 가져오도록 코딩
// gHobby라는 새로운 변수를 만들어서 눌린 체크박스의 값을 ',(콤마)'를 이용하여 하나의 변수에 만들어보았으며, 최종으로 만들어진 gHobby 값을 hidden(히든)에 담아서 Controller로 보내주었다.
$('#btnChk').click(function() {
	var gHobby = "";
	$("input[name=hobby]:checked").each(function() 
		{if(gHobby == ""){
			gHobby = $(this).val();
		} else {gHobby = gHobby + "," + $(this).val();}});
			$('#gHobby').val(gSize);});



//nicknameCheck 버튼 클릭 함수 (ajax 비동기 처리)
$("#nicknameCheckBtn").click(function(){
	
	// 닉네임 입력안했을시 이벤트 중지
	var nickname = $("#nickname").val();
	if(nickname.length == 0){
		alert("닉네임을 입력하세요");	
		return false;
	}
	
	// 비동기 처리
	$.ajax({
		url: 'MemberNicknameCheckServlet',
		type: 'get',
		dataType: 'json',
		data: {nickname:nickname},
		success: function(data, status, xhr) {
			if(data > 0) {
				$("#result2").text("닉네임 사용불가능");
				$("#result2").css("color","red");
			} else {
				$("#result2").text("닉네임 사용가능");
				$("#result2").css("color","green");
			}
		},
		error: function(xhr, status, error) {
			console.log(error);
		}			
	}); // end ajax
});	// end nicknameCheck
// 닉네임 중복시 회원가입 이벤트 중지
$("form").submit(function () {
	var result2 = $("#result2").text();
	console.log(result2);
	if(result2 == "닉네임 사용불가능"){
		alert("닉네임이 중복입니다.");
		$("#nickname").focus();
		event.preventDefault();
	}	
});

});	// end ready

// idCheck 버튼 클릭 함수
$(function(){
	$("#idCheckBtn").click(function(){
		// window.open() - window객체로 창은 여는 메서드
		// open(url, name, option)
		// window.open("idCheck1.jsp", "idCheck1", "width=400, height=400, top=100, left=400");
		idCheckWindowOpen();
	});
	// id입력칸 눌러도 idCheck창 오픈
	$("#userId").click(function(){
		idCheckWindowOpen();
	});
	function idCheckWindowOpen(){
		window.open("idCheck1.jsp", "", "width=450, height=200, top=100, left=400");
	}
});
//취소누르면 회원정보창 닫기
$(function(){
$("#close").click( function(){
	
	location.href='MainTest.jsp';
});
});

</script>

<%-- <%
MemberDTO dto=(MemberDTO)session.getAttribute("login");
String userId = dto.getUserId();
String userPasswd=dto.getUserPasswd();
String userName = dto.getUserName();
String nickname = dto.getNickname();
String gender = dto.getGender();
String birth = dto.getBirth();
String phone1 = dto.getPhone1();
String phone2 = dto.getPhone2();
String phone3 = dto.getPhone3();
String post=dto.getPost();
String address1=dto.getAddress1();
String address2=dto.getAddress2();
String email1 = dto.getEmail1();
String email2 = dto.getEmail2();
String profilePhoto = dto.getProfilePhoto();
String hobby = dto.getHobby();
%> --%>
<style type="text/css">
.profile_container {
  position: relative;
  width: 150px;
  height: 150px;
  background-image: url("<%-- <%= "/OGO/upload/member/" + profilePhoto %> --%>");
  background-size: contain;
  background-repeat: no-repeat;
  background-position: center;
  border-radius: 50%;
}

</style>
<link rel="stylesheet"  href="indextutor.css" />
<jsp:include page="NavBar.html" flush="true"></jsp:include>
<jsp:include page="LoginBar.jsp" flush="true" />
</head>
 <body>
 <!-- <header>b
      <div class="logo"></div>
      <div class="menu_container">
       <p><a href="#">행성 카테고리</a></p>
        <p><a href="#">BEST</a></p>
        <p><a href="#">MY SPACE</a></p>
        <p><a href="#">공지사항&FAQ</a></p>
      </div>
      <img class="mode" />
    </header>
          <div class="auth">
      <p><a href="createMember.jsp">회원가입</a></p>
      <p><a href="loginTest.html">로그인</a></p>
    </div> -->
    
   <!--  <div class="header_b">
    <div class="progress-container">
      <div class="progress-bar"></div>
    </div>
  </div> -->
<!--   <nav class="navBar">
    <div class="navBar_logo" >
      <a href="#"><img src="img2/OGOLogo.jpg" alt=""></a>
    </div>
    <ul class="navBar_menu">
      <li><a href="">BEST</a></li>
      <li><a href="">MYSPACE</a></li>
      <li><a href="">공지사항&FAQ</a></li>
    </ul>
    <ul class="login">
      로그인 마이페이지 더미
      <li><a href="#"><img src="img2/login.png" alt="" style="height: 30px; width: 30px;"></a></li>
      <li><a href="#"><img src="img2/mypage.png" alt="" style="height: 30px; width: 30px;"></a></li>
    </ul>
    
    <a href="" class="navBar_btn"><img src="img2/menu.png" alt=""></a>
    
  </nav> -->

       <section>
      <aside>
        <div class="side_bar">
          <p><a href="MyPageServlet">프로필 관리</a></p>
          <p><a href="HeartListServlet">My 찜</a></p>
          <p><a href="#">수강내역</a></p>
          <p><a href="TutorServlet">튜터 등록</a></p>
        </div>
      </aside>  
                <main style="width: 100%;">
        <h1>튜터 등록</h1>
 <%--        <div class="profile_container">	<!-- 이거떄문에 뒤에 사진이 겹쳐서 막아놨어요. 조정해주세요 -->
        <form action="photoch.html">
       	 	<img id="change_image" src="<%= "/projectA_0731/upload/member/" + profilePhoto %>" 
	          	url="./profile.jpeg" width="150" height="150"/>
      		<button type="button">
	            <img class="change_image" src="change.jpeg"/>
          	</button>
         </form>
         </div> --%>
         
        <div class="profile_container">
        <form action="photoch.html">
         	<button>
         		<img class="change_image" src="LoginImg/change.jpeg"  url="./profile.jpeg"  accept=".jpg, .png, .jpeg"/>
         	</button>
        </form>
        </div>
           
           
<!--  <div class="container"> -->
<!-- <div id="div_root">
<div id="div_top">
	<img src="img/a.jpg" id="img_a">
</div>
<div id="div_left"> -->

	<form action="MemberUpdateServlet" method="post">	<!-- enctype: 파일업로드 -->

		<div class="info_input2">
	<input type="hidden"  value="  name="userId" ><!-- hidden 을 이용한 id 전송 -->
        	    <p>튜터명</p>	
		</div>
		
		



<%-- 				<div class="info_input2">			
		               <p>닉네임(*)</p>		
			<input name="nickname"  type="text"  required="required"  value="<%= nickname%>" >
				<input name="nickname" id="nickname" class="form-control" required="required" class="form-control" 
					placeholder="힌트기능 : 닉네임 중복체크를 이용하세요." value="" > 
				<div class="input-group-btn">
					<button type="button" id="nicknameCheckBtn" class="btn btn-default">닉네임 중복체크</button>
					
				</div>
			</div> --%>
			
			<div style="text-align: right;">
				<span id="result2"></span>
			</div><br>
		
		
		
		<div class="info_input2">
            <p>튜터 자격 인증</p>
            <div class="form-floating">
            <button class="submit_button" type="submit" 
            style="width: 100px; height: 30px; font-size: medium; position: relative; left : 450px; bottom: 50px;">업로드</button>
  <textarea class="form-control" placeholder="자격을 인증할 수 있는 자격증, 교육이력 등을 반드시 첨부해주세요! 미첨부 시 튜터 등록에서 제외될 수 있습니다." id="floatingTextarea2" style="height: 80px"></textarea>
  <label  for="floatingTextarea2">자격을 인증할 수 있는 자격증</label>
</div>
         	
         	
         	<!-- <textarea rows="8" cols="80" placeholder="자격을 인증할 수 있는 자격증, 교육이력 등을 반드시 첨부해주세요! 미첨부 시 튜터 등록에서 제외될 수 있습니다." style="margin-top: 0;"></textarea> -->
            <div></div>
          </div>      
          <br>
          
		 <div class="info_input2"><!-- 동적 셀렉트 -->
			<p>자격 분야 선택</p>
			   <p>.
      <select class="form-select form-select-sm" aria-label=".form-select-sm example" id="s1" onchange="optionChange();" style="width: 300px; display: inline;">
        <option>분야 선택</option>
        <option value="a">뷰티</option>
        <option value="b">외국어</option>
        <option value="c">댄스·뮤직</option>
        <option value="d">요리·공예</option>
        <option value="e">드로잉·디자인·영상</option>
      </select>
      <select class="form-select form-select-sm" aria-label=".form-select-sm example" id="s2" style="width: 300px; float: right; display: inline;">
      <option></option>
      </select>
    </p>
    <script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
    <script>
      function optionChange() {
        var a = ['메이크업','스타일링'];
        var b = ['영어','일본어 중국어','기타 외국어'];
        var c = ['댄스','뮤직'];
        var d = ['요리·음료','공예·DIY'];
        var e = ['디자인','영상'];
        var v = $( '#s1' ).val();
        var o;
        if ( v == 'a' ) {
          o = a;
        } else if ( v == 'b' ) {
          o = b;
        } else if ( v == 'c' ) {
          o = c;
        } else if ( v == 'd' ) {
          o = d;
        } else if ( v == 'e' ) {
          o = e;
        } 
        else {
          o = [];
        }
        $( '#s2' ).empty();
        $( '#s2' ).append( '<option></option>' );
        for ( var i = 0; i < o.length; i++ ) {
          $( '#s2' ).append( '<option>' + o[ i ] + '</option>' );
        }
      }
    </script>
		</div><br>
		
		
		

		  <div class="info_input2">
            <p>튜터 소개</p>
					<div class="form-floating">
						<textarea class="form-control" placeholder="hungry"
							id="floatingTextarea2" style="height: 150px"></textarea>
						<label for="floatingTextarea2" class="count">최소 50자 이상으로 자유롭게 소개해주세요</label>
					</div>
		</div><br>
		
		<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
		<script>
		//글자수 세기
		$(document).ready(function() {
			
			$("#count").on("keydown", function(){
				var count=0;
				$("#count").val();
				
			})
			
		}
		
		
		</script>
		
		
		
		<button class="submit_button" type="submit">저장하기</button>    
     <button class="closeBtn"  type="button"  id="close" >취소</button>
    
	</form>

</main>
  <aside></aside>
</section>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>