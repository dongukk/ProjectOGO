<%@page import="javax.annotation.processing.SupportedSourceVersion"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script type="text/javascript">

$(document).ready(function() {

// 취미 다중체크박스 전체선택,해제
$("#hobbyAll").click(function() {
	if($("#hobbyAll").is(":checked")) $("input[name=hobby]").prop("checked", true);
	else $("input[name=hobby]").prop("checked", false);
});
// 하위항목 체크박스 모두 선택시 상위 전체체크박스 활성화
$("input[name=hobby]").click(function() {
	var total = $("input[name=hobby]").length;
	var checked = $("input[name=hobby]:checked").length;
	
	if(total != checked) 
		$("#hobbyAll").prop("checked", false);
	else 
		$("#hobbyAll").prop("checked", true); 
});


//이용약관 다중체크박스 전체선택,해제
$("#tserviseALL").click(function() {
	if($("#tserviseALL").is(":checked")) $("input[name=tservise]").prop("checked", true);
	else $("input[name=tservise]").prop("checked", false);
});
// 하위항목 체크박스 모두 선택시 상위 전체체크박스 활성화
$("input[name=tservise]").click(function() {
	var total = $("input[name=tservise]").length;
	var checked = $("input[name=tservise]:checked").length;
	
	if(total != checked) 
		$("#tserviseALL").prop("checked", false);
	else 
		$("#tserviseALL").prop("checked", true); 
});

// 이용약관 동의 이벤트
<!-- check Box 이벤트처리를 위한 Script -->
$("#tserviceOK").click(function(){
	event.preventDefault();
	   if ( ! $("#tservise1").is(":checked")) {
	    alert('이용동의 약관에 동의하지 않았습니다.');  
	    return false; 
	   }
	   if (! $("#tservise2").is(":checked")) {
	    alert('개인정보 수집 및 이용에 대한 안내를 동의하지 않았습니다.'); 
	    return false; 
	   }
	 	$(this).attr("data-dismiss","modal");
	 	$("#tserviceOK2").css("color","green");
}); 
$("#tserviceNO").click(function () {	
	alert("이용약관에 동의하지 않으시면 회원가입이 안됩니다.")
	return false; 
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
		url: '../MemberNicknameCheckServlet',
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
	if(result2 == "닉네임 사용불가능"){
		alert("닉네임이 중복입니다.");
		$("#nickname").focus();
		event.preventDefault();
	}	
	
		// 이용약관 비동의 이벤트 중지
	if ( ! $("#tservise1").is(":checked")) {
	   alert('이용동의 약관에 동의하지 않았습니다.');  
	   return false; 
	}
	if (! $("#tservise2").is(":checked")) {
		alert('개인정보 수집 및 이용에 대한 안내를 동의하지 않았습니다.'); 
		return false; 
	}
}); // end form submit

});	// end ready

// idCheck 버튼 클릭 함수
$(function(){
	$("#idCheckBtn").click(function(){
		idCheckWindowOpen();
	});
	// id입력칸 눌러도 idCheck창 오픈
	$("#userId").click(function(){
		idCheckWindowOpen();
	});
	function idCheckWindowOpen(){
		// window.open() - window객체로 창은 여는 메서드
		// open(url, name, option)
		window.open("idCheck1.jsp", "", "width=600, height=300, top=100, left=400");
	}
});

<%
	String hobbys = request.getParameter("hobbys");
%>
</script>
<style type="text/css">
	#div_top{
		margin-top: 5%;
	}
	#div_left {
	  width: 40%;
	  float: left;
	  margin-left: 5%;
	  margin-bottom: 0%;
	}
	#div_right {
	  width: 45%;
	  height : 1100px;
	  float: right;
	  margin-left: 5%;
	  margin-right: 5%;
	  margin-bottom: 5%;
	}
	h1{
		text-align: center;
		margin-bottom: 50px;
	}
	#img_b {
		width: 100%;
		height: 100%;
		margin-top: 5%;
		margin-right: 10%;
		margin-bottom: 10%;
		/* 이미지 날라오기 애니메이션 */
		animation-duration: 3s;
  		animation-name: slidein;  
	}
	@keyframes slidein {
	  from {
	    margin-left: 100%;
	    width: 300%
	  }
	
	  to {
	    margin-left: 0%;
	    width: 100%;
	  } 
	  
	.checkbox-group{
		border:1px solid; 
		padding:10px;
		padding-left: 30px;
	}
	.div_submit{
		text-align: center;
	}
	h3{
		text-align: left;
		margin-left: 50px;
	}
	.tservise{
		position: relative;
        top: 2.2px;
        left: 2px;
	}
	#d2{
		text-align: left;
		margin-left: 50px;
	}
</style>
</head>
<body>
<div id="div_top"></div>
<div id="div_right">
	<img src="../LoginImg/b.jpg" id="img_b">
</div>
<div id="div_left">
<h1>회원 가입</h1>
<div style="text-align: right; color: red;">* 항목은 필수입력 사항입니다.</div>
	<form action="../MemberAddServlet" method="post" enctype="multipart/form-data">	<!-- enctype: 파일업로드 필수형식 -->
		<div class="form-group">					<!-- div태그 : 각각 스타일 지정할수있게 지정 -->
			<label for="userId">아이디(*)</label>			<!-- label태그 : input과 같은기능이라 생각하면 된다. -->
			<div class="input-group">
				<input name="userId" id="userId" required="required" class="form-control" readonly="readonly"
					placeholder="힌트기능 : 아이디 중복체크를 이용하세요."><!-- required : 반드시 쓰시오, autocomplete : 자동완성 -->
				<div class="input-group-btn">
					<button type="button" id="idCheckBtn" class="btn btn-default">아이디 중복체크</button>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="userPasswd">비밀번호(*)</label>
			<input name="userPasswd" id="userPasswd" type="password" required="required" class="form-control" 
				placeholder="비밀번호를 입력해주세요.">		
		</div>
		<div class="form-group">
			<label for="userPasswd2">비밀번호 확인(*)</label>
			<input name="userPasswd2" id="userPasswd2" type="password" required="required" class="form-control" 
			placeholder="비밀번호를 재입력해주세요.">
			<div style="text-align: right;">
				<span id="result"></span>
			</div>
		</div>
		<div class="form-group">			
		<label for="nickname">닉네임(*)</label>			
			<div class="input-group">
				<input name="nickname" id="nickname" class="form-control" required="required" class="form-control" 
					placeholder="힌트기능 : 닉네임 입력후 중복체크를 이용하세요." value="">
				<div class="input-group-btn">
					<button type="button" id="nicknameCheckBtn" class="btn btn-default">닉네임 중복체크</button>
				</div>
			</div>
			<div style="text-align: right;">
				<span id="result2"></span>
			</div>
		</div>
		<div class="form-group">
			<label for="userName">이름(*)</label>
			<input name="userName" id="userName" type="text" required="required" class="form-control" placeholder="이름을 입력하세요.">
		</div>
		<div class="form-group">
			<label>성별(*)</label>
			<div class="form-inline">
				<div class="form-group" style="margin: 0 10px">
					<label><input name="gender" type="radio" class="form-control" id="gender_man" value="남자" checked="checked">
						남자
					</label>
				</div>
				<div class="form-group">
					<label>
						<input name="gender" type="radio" class="form-control" id="gender_woman" value="여자">
						여자
					</label >
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="birth">생년월일(*)</label>
			<!-- <input type="date" value="기본 날짜" min="입력 가능한 가장 빠른 날짜" max="입력 가능한 가장 늦은 날짜"> -->
			<input name="birth" id="birth" type="date" class="form-control" >
		</div>
		<div class="form-group">
			<label>연락처(*)</label>
			<div class="form-inline">
				<select name="phone1" style="height: 25px;" >
					<option>010</option>
					<option>02</option>
					<option>031</option>
					<option>051</option>
				</select>
				- <input name="phone2" class="phone2" style="width:80px" type="text" maxlength="4" required="required"
				 pattern="[0-9]{4}" title="숫자 4자리를 입력할 수 있습니다.">
				- <input name="phone3" class="phone3" style="width:80px" type="text" maxlength="4" required="required"
				 pattern="[0-9]{4}" title="숫자 4자리를 입력할 수 있습니다."> 
			</div>
		</div>
		<div class="form-group">
			<label for="address">주소(*)</label><br>
			<input type="text" name="post" id="post" placeholder="우편번호">
			<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br><br>
			<input type="text" name="address1" id="address1" placeholder="도로명주소">
			<input type="text" name="address2" id="address2" placeholder="지번주소">
			<span id="guide" style="color:#999"></span>
		</div>
		<div class="form-inline">
			<label for="email">이메일(*)</label><br>
			<!-- type : email - 모바일의 키패드가 email입력 패드로 바뀐다. 입력한 데이터가 이메일 양식에 맞는지 검사한다. -->
			<input type="text" name="email1" id="email1" required="required">
			<span class="input-group-text">@</span>	
	        <input type="text" name="email2" id="email2" required="required" placeholder="직접입력" >
	        <select id="sel" style="height: 24px;">	<!-- 선택창 높이 설정 -->
	       		<option selected disabled >이메일 선택</option>  <!-- 선택못하게 설정 -->
		        <option value="daum.net">daum.net</option>
		        <option value="naver.com">naver.com</option>
		        <option value="nate.com">nate.com</option>
		        <option value="yahoo.com">yahoo.com</option>
	       </select>
		</div>
		<div class="form-group">
			<label for="profilePhoto">프로필 사진</label>	<!-- type : file 로 설정 , accept : 업로드파일 형식 제한 -->
			<input name="profilePhoto" type="file" id="profilePhoto" class="form-control" accept=".jpg, .png">
		</div>
		<label for="hobby">관심있는 클래스 분야</label><span> (복수선택 가능)</span>
		<div class="checkbox-group">
			<input type="checkbox" name="hobbyAll" id="hobbyAll"> 전체 선택<br>		
			<input name="hobby" type="checkbox" id="hobby1" value="외국어"> 외국어&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
			<input name="hobby" type="checkbox" id="hobby2" value="스포츠·피트니스"> 스포츠·피트니스&emsp;&emsp;&emsp;&emsp;&emsp;&ensp;&ensp;
			<input name="hobby" type="checkbox" id="hobby3" value="요리·공예·취미"> 요리·공예·취미&emsp;&emsp;&nbsp;<br>
			<input name="hobby" type="checkbox" id="hobby4" value="댄스·뮤직"> 댄스·뮤직&emsp;&emsp;&emsp;&emsp;&emsp;&ensp;&nbsp;
			<input name="hobby" type="checkbox" id="hobby5" value="드로잉·디자인·영상"> 드로잉·디자인·영상&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;
			<input name="hobby" type="checkbox" id="hobby6" value="뷰티·심리.퍼스널 검사"> 뷰티·심리.퍼스널 검사&emsp;
		</div><br>
		<input type="hidden" value="<%= hobbys%>">
		<!-- <button id="btnChk1">버튼</button> -->
		<a href="#" data-toggle="modal" data-target="#myModal">
		  이용약관, 개인정보 수집 및 이용, 위치정보 이용약관(선택), 프로모션 안내메일 수신(선택)에<br> 모두 동의합니다.</a>
		<span id="tserviceOK2" style="color: gray;">내용을 모두 확인하였고 동의합니다.</span>
		<br><br>
		<div class="div_submit">
			<button class="btn btn-default" type="submit">가입</button>
			<button class="btn btn-default" type="reset">새로고침</button>
			<button class="btn btn-default closeBtn" type="button" onclick="location.href='../MainFormServlet'" id="close">닫기</button>
		</div>
		
		
<div class="modal fade" id="myModal" data-backdrop="static" data-keyboard="false">	<!-- data-backdrop="static" 속성은 모달창 주의의 검은 배경을 클릭하여도 창이 닫히지 않는다.  data-keyboard="false" 옵션은 esc 키를 눌러도 창을 닫지 않게 해준다. -->
    <div class="modal-dialog modal-xl modal-dialog-centered">	<!-- modal-dialog-centered 속성은 모달창 내용이 화면 중앙으로 나오도록, -->
      <div class="modal-content">
     
        <!-- Modal Header -->
        <div class="modal-header">
          <!-- <h4 class="modal-title">이 용 약 관</h4> -->
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
<div id="d1" style="text-align: center;">
 <img src="../LoginImg/logo.jpg" width="400" height="200">
 <h2 align="center">회원가입을 환영합니다.</h2><br/><br/>
  <tr>
	  <div id="d2">
		   <td align="left"><font size="2">이용약관, 개인정보 수집 및 이용, 위치정보 이용약관(선택),
		   프로모션 안내 메일 수신<br>(선택)에 모두 동의합니다.</font></td>
		   <td><input type="checkbox" class="tservise" name="tserviseALL" id="tserviseALL"></td><hr/>
		  </tr>
	  </div>
 <div id="accordion">
  
   <h3><a href="#"><font size="2">OGO 이용약관 동의(필수)</font><input type="checkbox" class="tservise" name="tservise" id="tservise1"/></a></h3>
   <td><textarea readonly="readonly" rows="5" cols="66">
제 1 조 (목적)

이 약관은 OGO 주식회사 ("회사" 또는 "OGO")가 제공하는 OGO 및 OGO 관련 제반 서비스의 이용과 관련하여 회사와 회원과의 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.


제 2 조 (정의)

이 약관에서 사용하는 용어의 정의는 다음과 같습니다.
①"서비스"라 함은 구현되는 단말기(PC, TV, 휴대형단말기 등의 각종 유무선 장치를 포함)와 상관없이 "회원"이 이용할 수 있는 OGO 및 OGO 관련 제반 서비스를 의미합니다.
②"회원"이라 함은 회사의 "서비스"에 접속하여 이 약관에 따라 "회사"와 이용계약을 체결하고 "회사"가 제공하는 "서비스"를 이용하는 고객을 말합니다.
③"아이디(ID)"라 함은 "회원"의 식별과 "서비스" 이용을 위하여 "회원"이 정하고 "회사"가 승인하는 문자와 숫자의 조합을 의미합니다.
④"비밀번호"라 함은 "회원"이 부여 받은 "아이디와 일치되는 "회원"임을 확인하고 비밀보호를 위해 "회원" 자신이 정한 문자 또는 숫자의 조합을 의미합니다.
⑤"유료서비스"라 함은 "회사"가 유료로 제공하는 각종 온라인디지털콘텐츠(각종 정보콘텐츠, VOD, 아이템 기타 유료콘텐츠를 포함) 및 제반 서비스를 의미합니다.
⑥"포인트"라 함은 서비스의 효율적 이용을 위해 회사가 임의로 책정 또는 지급, 조정할 수 있는 재산적 가치가 없는 "서비스" 상의 가상 데이터를 의미합니다.
⑦"게시물"이라 함은 "회원"이 "서비스"를 이용함에 있어 "서비스상"에 게시한 부호ㆍ문자ㆍ음성ㆍ음향ㆍ화상ㆍ동영상 등의 정보 형태의 글, 사진, 동영상 및 각종 파일과 링크 등을 의미합니다. 
   </textarea>
   <h3><a href="#"><font size="2">개인정보 수집 및 이용에 대한 안내(필수)</font><input type="checkbox" class="tservise" name="tservise" id="tservise2"/></a></h3>
   <div>
     <textarea readonly="readonly" rows="5" cols="66">

정보통신망법 규정에 따라 OGO에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.


1. 수집하는 개인정보

이용자는 회원가입을 하지 않아도 정보 검색, 뉴스 보기 등 대부분의 OGO 서비스를 회원과 동일하게 이용할 수 있습니다. 이용자가 메일, 캘린더, 카페, 블로그 등과 같이 개인화 혹은 회원제 서비스를 이용하기 위해 회원가입을 할 경우, OGO는 서비스 이용을 위해 필요한 최소한의 개인정보를 수집합니다.
 
   </textarea>
   </div>
   <h3><a href="#"><font size="2">위치정보 이용약관 동의(선택)</font><input type="checkbox" class="tservise" name="tservise" id="tservise3"/></a></h3>
   <div>
     <textarea readonly="readonly" rows="5" cols="66">

위치정보 이용약관에 동의하시면, 위치를 활용한 광고 정보 수신 등을 포함하는 OGO 위치기반 서비스를 이용할 수 있습니다.


제 1 조 (목적)
이 약관은 OGO 주식회사 (이하 “회사”)가 제공하는 위치정보사업 또는 위치기반서비스사업과 관련하여 회사와 개인위치정보주체와의 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.


제 2 조 (약관 외 준칙)
이 약관에 명시되지 않은 사항은 위치정보의 보호 및 이용 등에 관한 법률, 정보통신망 이용촉진 및 정보보호 등에 관한 법률, 전기통신기본법, 전기통신사업법 등 관계법령과 회사의 이용약관 및 개인정보취급방침, 회사가 별도로 정한 지침 등에 의합니다.


제 3 조 (서비스 내용 및 요금)
①회사는 직접 위치정보를 수집하거나 위치정보사업자인 이동통신사로부터 위치정보를 전달받아 아래와 같은 위치기반서비스를 제공합니다. 1.Geo Tagging 서비스: 게시글 등록 시점의 개인위치정보주체의 위치정보를 게시글과 함께 저장합니다.
2.위치정보를 활용한 검색결과 제공 서비스: 정보 검색을 요청하거나 개인위치정보주체 또는 이동성 있는 기기의 위치정보를 제공 시 본 위치정보를 이용한 검색결과 및 주변결과(맛집, 주변업체, 교통수단 등)를 제시합니다.
3.위치정보를 활용한 친구찾기 및 친구맺기: 현재 위치를 활용하여 친구를 찾아주거나 친구를 추천하여 줍니다.
4.연락처 교환하기: 위치정보를 활용하여 친구와 연락처를 교환할 수 있습니다.
5.현재 위치를 활용한 광고정보 제공 서비스: 광고정보 제공 요청 시 개인위치정보주체의 현 위치를 이용하여 광고소재를 제시합니다.
6. 이용자 보호 및 부정 이용 방지: 개인위치정보주체 또는 이동성 있는 기기의 위치를 이용하여 권한없는 자의 비정상적인 서비스 이용 시도 등을 차단합니다.
 </textarea>
   </div>
 </div>
 <h3><a href="#"><font size="2">이벤트 등 프로모션 알림 메일 수신(선택)</font><input type="checkbox" class="tservise" name="tservise" id="tservise4"/></a></h3>
 <hr>
 <div align="center">
  <br/>
	  <input type="submit" value="동의" id="tserviceOK"> <!-- data-dismiss="modal" 속성은 모달창을 닫을 수 있게 해준다. -->
	  <input type="reset" value="비동의" id="tserviceNO">		 
  <br/>
 </div>
    	
</form>

    <!-- 2. Bootstrap JS코드 넣기 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</body>
</html>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
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