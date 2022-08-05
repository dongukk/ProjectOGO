<%@page import="javax.annotation.processing.SupportedSourceVersion"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
});

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
		window.open("idCheck1.jsp", "", "width=450, height=200, top=100, left=400");
	}
});

<%
	String hobbys = request.getParameter("hobbys");
%>
</script>
<style type="text/css">
	#div_left {
	  width: 38%;
	  float: left;
	  margin-left: 7%;
	  margin-bottom: 0%;
	}
	#div_right {
	  width: 50%;
	  float: right;
	  margin-left: 5%;
	  margin-bottom: 0%;
	}
	h1{
		text-align: center;
		margin-bottom: 50px;
	}
	#img_b {
		width: 80%;
		height: 80%;
		margin-top: 5%;
		margin-right: 10%;
		margin-bottom: 10%;
	}
	.checkbox-group{
		border:1px solid; 
		padding:10px;
		padding-left: 30px;
	}
	.div_submit{
		text-align: center;
	}

</style>

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
		<div class="form-group">
			<label for="email">이메일(*)</label><br>
			<!-- type : email - 모바일의 키패드가 email입력 패드로 바뀐다. 입력한 데이터가 이메일 양식에 맞는지 검사한다. -->
			<input type="text" name="email1" id="email1" required="required">@
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
		<a>이용약관, 개인정보 수집 및 이용, 위치정보 이용약관(선택), 프로모션 안내메일 수신(선택)에 모두 동의합니다.</a>
		<span style="color: gray;">내용을 모두 확인하였고 동의합니다.</span>
		<br><br>
		<div class="div_submit">
			<button class="btn btn-default" type="submit">가입</button>	<!-- 임시로 로그인후 페이지 출력 -->
			<button class="btn btn-default" type="reset">새로고침</button>
			<button class="btn btn-default closeBtn" type="button" onclick="window.close();" id="close">닫기</button>
		</div>
	</form>
</div>


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