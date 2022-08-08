<%@page import="com.dto.login.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <title>클래스 등록</title>
    <style type="text/css">
    	.one{
    		margin-top: 100px;
    		margin-left: 300px;
    		margin-right: 300px;
    		margin-bottom: 200px;
    	}
    	#two{
    		text-align: center;
    	}
    </style>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
		$("#classOpenForm").on("submit", function() {
			var className=$("#className").val();
			var category=$("#category").val();
			var subCategory=$("#subCategory").val();
			var classDate=$("#classDate").val();
			var classStartTime=$("#classStartTime").val();
			var classEndTime=$("#classEndTime").val();
			var classPrice=$("#classPrice").val();
			var post=$("#post").val();
			var address1=$("#address1").val();
			var address2=$("#address2").val();
			var classPhoto1=$("#classPhoto1").val();
			
			if (className.length==0) {
				alert("클래스명을 입력해주세요");
				event.preventDefault();
			}else if (category.length==0) {
				alert("카테고리를 선택해주세요");
				event.preventDefault();
			}else if (subCategory.length==0) {
				alert("서브카테고리를 선택해주세요");
				event.preventDefault();
			}else if (classDate.length==0) {
				alert("클래스 날짜를 선택해주세요");
				event.preventDefault();
			}else if (classStartTime.length==0) {
				alert("클래스 시작 시간을 입력해주세요");
				event.preventDefault();
			}else if (classEndTime.length==0) {
				alert("클래스 종료 시간을 입력해주세요");
				event.preventDefault();
			}else if (classPrice.length==0) {
				alert("클래스 가격을 입력해주세요");
				event.preventDefault();
			}
			
			
		}) 
		var idx= 0;
		$("#scheduleBtn").on("click", function() {
			var classDate= $("#classDate").val();
			var classStartTime= $("#classStartTime").val();
			var classEndTime= $("#classEndTime").val();
			var schedule=  classDate+" "+classStartTime+"~"+classEndTime;
			
			idx++;
			if (idx <= 10) {
				$("#classSchedule").append("<div class='input-group mb-3'>"+
						"<span class='input-group-text'>"+idx+"회차</span>"+
						"<input type='text' class='form-control' value="+schedule+" readonly>"+
						"<span class='input-group-text'>X</span><br>"+
						"</div>");
				$("#schedule"+idx).val(schedule);
				//console.log($("#schedule"+idx).val());
			}else {
				alert("클래스는 최대 10회차까지만 등록 가능합니다");
			}
			
		});//end
		
		
	})//ready
</script>
  </head>
  <body>
<%
	MemberDTO mDTO =(MemberDTO)session.getAttribute("login");
	/* if(mDTO==null){
		
	} */
	String userId=mDTO.getUserId(); //튜터가 될 유저의 아이디
%>
  <div class="one">
  	<div id="two">
  		<h1>클래스 등록</h1>
  	</div>
  	<br>
    <!-- <form class="row g-3" id="classOpenForm" action="../ClassOpenServlet" method="post" enctype="multipart/form-data"> -->
    <form class="row g-3" id="classOpenForm" action="../ClassOpenServlet" method="post">
     <input type="hidden" id="schedule1" name="schedule1" value="">
     <input type="hidden" id="schedule2" name="schedule2" value="">
     <input type="hidden" id="schedule3" name="schedule3" value="">
     <input type="hidden" id="schedule4" name="schedule4" value="">
     <input type="hidden" id="schedule5" name="schedule5" value="">
     <input type="hidden" id="schedule6" name="schedule6" value="">
     <input type="hidden" id="schedule7" name="schedule7" value="">
     <input type="hidden" id="schedule8" name="schedule8" value="">
     <input type="hidden" id="schedule9" name="schedule9" value="">
     <input type="hidden" id="schedule10" name="schedule10" value="">
     
	  <div class="col-md-12">
	    <label for="tutorId" class="form-label">튜터 ID</label>
	    <!-- 현재 로그인 한 아이디 정보 받아옴 -->
	    <input class="form-control" type="text" id="tutorId" name="tutorId" value="<%=userId %>" readonly>
	  </div>
	  <div class="col-md-12">
	    <label for="className" class="form-label">클래스명</label>
	    <input type="text" class="form-control" id="className" name="className" placeholder="클래스명을 입력해주세요">
	  </div>
	  <div class="col-md-6">
	    <label for="category" class="form-label">클래스 종류</label>
	    <select id="category" class="form-select" name="category">
	      <option selected>Category</option>
	      <option class="category" value="뷰티">뷰티</option>
	      <option class="category" value="외국어">외국어</option>
	      <option class="category" value="댄스·뮤직">댄스·뮤직</option>
	      <option class="category" value="요리·공예">요리·공예</option>
	      <option class="category" value="드로잉·디자인·영상">드로잉·디자인·영상</option>
	    </select>
	  </div>
	  <div class="col-md-6">
	    <label for="subCategory" class="form-label">클래스 종류</label>
	    <select id="subCategory" class="form-select" name="subCategory">
	      <option selected>Sub Category</option>
	      <option class="subCategory" value="메이크업">메이크업</option>
	      <option class="subCategory" value="스타일링">스타일링</option>
	      <option class="subCategory" value="영어">영어</option>
	      <option class="subCategory" value="일본어·중국어">일본어·중국어</option>
	      <option class="subCategory" value="기타외국어">기타 외국어</option>
	      <option class="subCategory" value="댄스">댄스</option>
	      <option class="subCategory" value="뮤직">뮤직</option>
	      <option class="subCategory" value="요리·음료">요리·음료</option>
	      <option class="subCategory" value="공예·DIY">공예·DIY</option>
	      <option class="subCategory" value="디자인">디자인</option>
	      <option class="subCategory" value="영상">영상</option>
	    </select>
	  </div>
	  <div class="col-12">
	    <label for="classDate" class="form-label">클래스 일자</label>
	    <input type="date" class="form-control" id="classDate" name="classDate">
	  </div>
	  <div class="col-md-6">
	       <label for="classStartTime" class="form-label">클래스 시작 시간</label>
	       <input type="time" class="form-control" id="classStartTime" name="classStartTime">
	  </div>
	  <div class="col-md-6">
	       <label for="classEndTime" class="form-label">클래스 종료 시간</label>
	       <input type="time" class="form-control" id="classEndTime" name="classEndTime">
	  </div>
	  <div class="col-12">
	    <button type="button" class="btn btn-primary" id="scheduleBtn">일정 추가하기</button>
	  </div>
	  
	  <div class="col-12" >
	  	<label for="classSchedule" class="form-label">클래스 일정</label>
	  	<div id="classSchedule"></div>
	  </div>
	  <div class="col-12">
	  	<label for="classPrice" class="form-label">클래스 가격</label>
	  	<div class="input-group mb-3">
		  <span class="input-group-text">₩</span>
		  <input type="text" class="form-control" id="classPrice" name="classPrice"
		  style="text-align: right;" placeholder="99,999">
		  <span class="input-group-text">(원)</span>
	  	</div>
	  </div>
	  <div class="col-12">
	    <label for="classPlace" class="form-label">클래스 위치</label>
	    <div class="input-group">
	      <label class="input-group-text" for="post">우편번호</label>
	      <input type=text class="form-control" id="post" name="post">
	      <button type="button" class="btn btn-secondary" onclick="execDaumPostcode()">우편번호찾기</button>
	  	</div>
	  </div>
	  <div class="col-6 mb-3">
	    <input type=text class="form-control" id="address1" name="address1" placeholder="도로명주소">
	  </div>
	  <div class="col-6 mb-3">
	    <input type=text class="form-control" id="address2" name="address2" placeholder="지번주소">
	  </div>
	  <div class="col-12">
	    <label class="form-label">클래스 소개 사진 업로드 (최대 5장까지 가능)</label>
	    <div class="input-group mb-3">
	      <input type="file" class="form-control" id="classPhoto1">
	      <label class="input-group-text" for="classPhoto1">Upload</label>
	  	</div>
	    <div class="input-group mb-3">
	      <input type="file" class="form-control" id="classPhoto2">
	      <label class="input-group-text" for="classPhoto2">Upload</label>
	  	</div>
	    <div class="input-group mb-3">
	      <input type="file" class="form-control" id="classPhoto3">
	      <label class="input-group-text" for="classPhoto3">Upload</label>
	  	</div>
	    <div class="input-group mb-3">
	      <input type="file" class="form-control" id="classPhoto4">
	      <label class="input-group-text" for="classPhoto4">Upload</label>
	  	</div>
	    <div class="input-group mb-3">
	      <input type="file" class="form-control" id="classPhoto5">
	      <label class="input-group-text" for="classPhoto5">Upload</label>
	  	</div>
	  </div>
	  
	  <div class="mb-3">
	  	<label for="textClassInfo" class="form-label">클래스 소개</label>
	  	<textarea class="form-control" id="textClassInfo" name="textClassInfo" rows="5"></textarea>
	  </div>
	  <div class="mb-3">
	  	<label for="textTutorInfo" class="form-label">튜터 소개</label>
	  	<textarea class="form-control" id="textTutorInfo" name="textTutorInfo" rows="5"></textarea>
	  </div>
	  <div class="mb-3">
	  	<label for="textNotice" class="form-label">클래스 공지사항</label>
	  	<textarea class="form-control" id="textNotice" name="textNotice" rows="5"></textarea>
	  </div>
	  <div class="mb-3">
	  	<label for="textAttention" class="form-label">클래스 유의사항</label>
	  	<textarea class="form-control" id="textAttention" name="textAttention" rows="5"></textarea>
	  </div>
	  <div class="col-12">
	    <button type="submit" class="btn btn-primary">등록하기</button>
	  </div>
	</form>
   
   </div>
    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    -->
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