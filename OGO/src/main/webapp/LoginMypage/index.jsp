<%@page import="javax.annotation.processing.SupportedSourceVersion"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.dto.login.MemberDTO"%>

<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">

<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="LoginMypage/index4.css??ver0.1" type="text/css" />
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
// 취미 다중체크박스 전체선택,해제
$("#hobbyAll").click(function() {
	if($("#hobbyAll").is(":checked")) $("input[name=hobby]").prop("checked", true);
	else $("input[name=hobby]").prop("checked", false);
});
// 하위항목 체크박스 모두 선택시 상위 전체체크박스 활성화 기능
$("input[name=hobby]").click(function() {
	var total = $("input[name=hobby]").length;
	var checked = $("input[name=hobby]:checked").length;
	
	if(total != checked) 
		$("#hobbyAll").prop("checked", false);
	else 
		$("#hobbyAll").prop("checked", true); 
});

// 비번확인
// 키 이벤트 발생시 패스워드 일치여부 검사 
$("#userPasswd2").keyup(function(){
	var passwd = $("#userPasswd").val();
	var mesg = "비밀번호가 일치하지 않습니다.";
	if(passwd == $(this).val()){
		mesg = "비밀번호 일치";
		$("#result").css("color","green");
	} else {
		$("#result").css("color","red");
	}
	$("#result").text(mesg);
});

// 이메일 선택 이벤트
$("#sel").change(function (){
	$("#email2").val($(this).val());
});

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

<%
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
%>

<style type="text/css">
.profile_container {
  position: relative;
  width: 150px;
  height: 150px;
  background-image: url("<%= "/OGO/upload/member/" + profilePhoto %>");
  background-size: contain;
  background-repeat: no-repeat;
  background-position: center;
  border-radius: 50%;
}

.info_input p {
 height: 10px;
}

#nicknameCheckBtn {
  color: white;
  background-color: blueviolet;
  border: none;
  height: 30px;
  border-radius: 4px;
  padding: 0 5px;	
  width: 150px;
}


</style>

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
          <p><a href="HeartListServlet">MY 찜</a></p>
          <p><a href="#">수강내역</a></p>
          <p><a href="#">튜터 등록</a></p>
        </div>
      </aside>  
                <main>
        <h1>MY SPACE</h1>
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
<div style="text-align: left; color: red;">* 항목은 필수입력 사항입니다.</div>
		<div class="info_input">
	<input type="hidden"  value="<%= userId%>"  name="userId" ><!-- hidden 을 이용한 id 전송 -->
        	    <p style="width: 100px;">아이디</p>	<%= userId%>
		</div>
		
		
  <div class="info_input">
             <p style="width: 300px;">비밀번호 변경(*)</p>   
            <input name="userPasswd" id="userPasswd" type="password" required="required"  value="<%= userPasswd%>"  class="form-control" 
				placeholder="비밀번호를 입력해주세요.">		
		</div>
				<div class="info_input">
					 <p style="width: 300px;">비밀번호 변경 확인(*)</p>
					<input name="userPasswd2" id="userPasswd2" type="password"  value="<%= userPasswd%>" 
						required="required"  class="form-control"
						placeholder="비밀번호를 재입력해주세요.">
				</div>
				<div style="text-align: right;">
					<span id="result"></span>
				</div>



				<div class="info_input">			
		               <p style="width: 150px;">닉네임(*)</p>		
			<%-- <input name="nickname"  type="text"  required="required"  value="<%= nickname%>" > --%>
				<input name="nickname" id="nickname" class="form-control" required="required" class="form-control" 
					placeholder="힌트기능 : 닉네임 중복체크를 이용하세요." value="<%= nickname%>" > 
				<div class="input-group-btn">
					<button type="button" id="nicknameCheckBtn" class="btn2">닉네임 중복체크</button>
					
				</div>
			</div>
			<div style="text-align: right;">
				<span id="result2"></span>
			</div>
		
		
		
		<div class="info_input">
            <p style="width: 100px;">이름</p>
           <%= userName %>
            <div></div>
          </div>      
          
          
		 <div class="info_input">
			<p style="width: 100px;">생년월일</p>
			<%-- <input name="birth" id="birth" type="date" class="form-control"  value="<%=birth.substring(0, 10)%>"> --%>	<!-- 생일을 수정하진 않을거니까.. -->
			<%=birth.substring(0, 10)%>
		</div>
		
		
		
		
		       <div class="info_input">
            <p style="width: 100px;">연락처</p>
         <div class="form-inline"><!-- phone1 해야됨 -->
				<select name="phone1" style="height: 25px;" >
					<option  value="010"  <% if("010".equals(phone1)) {%>  selected<%} %> >010</option>
					<option  value="02"  <% if("02".equals(phone1)) {%>  selected<%} %> >02</option>
					<option  value="031" <% if("031".equals(phone1)) {%>  selected<%} %> >031</option>
					<option  value="051"  <% if("051".equals(phone1)) {%>  selected<%} %> >051</option>
				</select>
				- <input name="phone2" class="phone2" style="width:80px" type="text" maxlength="4" required="required"
				 pattern="[0-9]{4}" title="숫자 4자리를 입력할 수 있습니다." value="<%= phone2%>">
				- <input name="phone3" class="phone3" style="width:80px" type="text" maxlength="4" required="required"
				 pattern="[0-9]{4}" title="숫자 4자리를 입력할 수 있습니다."  value="<%= phone3%>"> 
			</div>
		</div>
		
		
		
		      <div class="info_input3">
            <p style="width: 100px; height: 15px;">주소(*)</p>
			  <input type="text" name="post" id="post" placeholder="우편번호" value="<%= post %>">
			<input type="button"  class="but"     onclick="execDaumPostcode()" value="우편번호 찾기"><br>
     </div> 
     
       <div class="info_input3">
			<input type="text"  size="50"  name="address1" id="address1" placeholder="도로명주소" value="<%=address1%>">
     </div> 
     
            <div class="info_input4">
			<input type="text"   size="50"   name="address2" id="address2" placeholder="지번주소" value="<%=address2%>">
			<span id="guide" style="color:#999"></span>
     </div> 

	
		
		
		
		  <div class="info_input">
            <p style="width: 100px;">이메일</p> 
			<!-- type : email - 모바일의 키패드가 email입력 패드로 바뀐다. 입력한 데이터가 이메일 양식에 맞는지 검사한다. -->
			<input type="text" name="email1" id="email1" required="required" value="<%= email1%>">@
	        <input type="text" name="email2" id="email2" required="required" placeholder="직접입력"  value="<%= email2%>">
	        <select id="sel" style="height: 27px;">
	       		<option selected >이메일 선택</option>  <!-- disabled 있었는데 지웠음 다른거 모르겠음 -->
		        <option value="daum.net">daum.net</option>
		        <option value="naver.com">naver.com</option>
		        <option value="nate.com">nate.com</option>
		        <option value="yahoo.com">yahoo.com</option>
	       </select>
		</div>

		<label for="hobby">관심있는 클래스 분야</label><span> (복수선택 가능)</span>
		<div class="checkbox-group">
			<input type="checkbox" name="hobbyAll" id="hobbyAll"> 전체 선택<br>		
			<input name="hobby" type="checkbox" id="hobby1" value="디자인·영상·개발" > 디자인·영상·개발&emsp;
			<input name="hobby" type="checkbox" id="hobby2" value="외국어" > 외국어&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;
			<input name="hobby" type="checkbox" id="hobby3" value="재테크·투잡" > 재테크·투잡&emsp;&emsp;&nbsp;
			<input name="hobby" type="checkbox" id="hobby4" value="댄스·뮤직"> 댄스·뮤직 &emsp;<br>
			<input name="hobby" type="checkbox" id="hobby5" value="피트니스·스포츠"> 피트니스·스포츠&nbsp;&nbsp;&nbsp;
			<input name="hobby" type="checkbox" id="hobby6" value="뷰티·마인드.펫" > 뷰티·마인드.펫&emsp;&nbsp;
			<input name="hobby" type="checkbox" id="hobby7" value="드로잉·사진·글"> 드로잉·사진·글&emsp;<br>
		</div><br>
		<button class="submit_button" type="submit">저장하기</button>    
     <button class="closeBtn"  type="button"  id="close" >취소</button>
     <div class="exit"><a href="LoginMypage/deleteForm.jsp">회원 탈퇴하기</a></div>
	</form>

</main>
  <aside></aside>
</section>
 

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js" ></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('post').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('address1').value = fullRoadAddr;
                document.getElementById('address2').value = data.jibunAddress;

                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

                } else {
                    document.getElementById('guide').innerHTML = '';
                }
            }
        }).open();

    }
</script> 