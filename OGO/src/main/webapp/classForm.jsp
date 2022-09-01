<%@page import="com.dto.classpage.ClassDTO"%>
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
    <!-- 네비바 -->
	<jsp:include page="common/nav.jsp" flush="false"/>
    <style type="text/css">
    	.classCreate{
    		margin-top: 100px;
    		margin-left: 300px;
    		margin-right: 300px;
    		margin-bottom: 200px;
    	}
    	#classCreateTitle{
    		text-align: center;
    	}
    	#classFormButton{
    		background-color: blueviolet;
    	}
    </style>
<%
	MemberDTO mDTO =(MemberDTO)session.getAttribute("login");
	
	String userId=mDTO.getUserId(); //튜터가 될 유저의 아이디
%>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
		//submit시 null이면 전송x
		$("#classOpenForm").on("submit", function() {
			var className=$("#className").val();
			var category=$("#category").val();
			var subCategory=$("#subCategory").val();
			var schedule1=$("#schedule1").val();
			var classPrice=$("#classPrice").val();
			var post=$("#post").val();
			var address1=$("#address1").val();
			var address2=$("#address2").val();
			var classPhoto1=$("#classPhoto1").val();
			var textClassInfo=$("#textClassInfo").val();
			var textTutorInfo=$("#textTutorInfo").val();
			var textNotice=$("#textNotice").val();
			var textAttention=$("#textAttention").val();
			
			if (className.length==0) {
				alert("클래스명을 입력해주세요");
				event.preventDefault();
			}else if (category.length==0) {
				alert("카테고리를 선택해주세요");
				event.preventDefault();
			}else if (subCategory.length==0) {
				alert("서브카테고리를 선택해주세요");
				event.preventDefault();
			}else if (schedule1.length==0) {
				alert("클래스 일정을 추가해주세요");
				event.preventDefault();
			}else if (classPrice.length==0) {
				alert("클래스 가격을 입력해주세요");
				event.preventDefault();
			}else if (post.length==0 && address1.length==0 && address2.length==0) {
				alert("주소를 입력해주세요");
				event.preventDefault();
			}else if (textClassInfo.length==0) {
				alert("클래스 소개를 입력해주세요");
				event.preventDefault();
			}else if (textTutorInfo.length==0) {
				alert("튜터 소개를 입력해주세요");
				event.preventDefault();
			}else if (textNotice.length==0) {
				alert("클래스 공지사항을 입력해주세요");
				event.preventDefault();
			}else if (textAttention.length==0) {
				alert("클래스 유희사항을 입력해주세요");
				event.preventDefault();
			}else{
				alert("클래스 등록이 완료되었습니다.");
			}
			
		}) 
		//클래스 일정 추가
		var idx= 0;
		$("#scheduleBtn").on("click", function() {
			var classDate= $("#classDate").val();
			var classStartTime= $("#classStartTime").val();
			var classEndTime= $("#classEndTime").val();
			var schedule= classDate+"&nbsp;"+classStartTime+"~"+classEndTime;
			
			idx++;
			//var idx2=null;
			
			if (idx <= 10) {
				// 개별 삭제는 나중에 다시 시도
				
				$("#classSchedule").append("<div class='input-group mb-3' id='sched"+idx+"'>"+
						"<span class='input-group-text'>"+idx+"회차</span>"+
						"<input type='text' class='form-control' value="+schedule+" readonly>"+
					//	"<button type='button' class='btn' id='close"+idx+"'>X</button>"+//버튼추가
						"<br></div>");
				$("#schedule"+idx).val(schedule); //hidden에 value값 넣기 -> 파싱해야됨
				console.log($("#schedule"+idx).val()); 
				
			}else {
				alert("클래스는 최대 10회차까지만 등록 가능합니다")
			} 
			
			
		});//end scheduleBtn
		
		//클래스 일정 전체 삭제
		$("#allDelete").on("click", function() {
			idx=0;
			$("#classSchedule").empty();
		})
		
		//카테고리 선택
		$("#category").on("change", function() {
			var category= $("#category").val();
			var subCategory = $("#subCategory");
			
			if (category=="뷰티") {
				subCategory.empty();
				subCategory.append('<option selected>Sub Category</option>'+
						"<option class='subCategory' value='메이크업'>메이크업</option>"+
			      		"<option class='subCategory' value='스타일링'>스타일링</option>");
			}else if (category=="외국어") {
				subCategory.empty();
				subCategory.append('<option selected>Sub Category</option>'+
						  '<option class="subCategory" value="영어">영어</option>'+
					      '<option class="subCategory" value="일본어·중국어">일본어·중국어</option>'+
					      '<option class="subCategory" value="기타외국어">기타 외국어</option>');
			}else if (category=="댄스·뮤직") {
				subCategory.empty();
				subCategory.append('<option selected>Sub Category</option>'+
						  '<option class="subCategory" value="댄스">댄스</option>'+
					      '<option class="subCategory" value="뮤직">뮤직</option>');
			}else if (category=="요리·공예") {
				subCategory.empty();
				subCategory.append('<option selected>Sub Category</option>'+
						  '<option class="subCategory" value="요리·음료">요리·음료</option>'+
					      '<option class="subCategory" value="공예·DIY">공예·DIY</option>')
			}else if (category=="드로잉·디자인·영상") {
				subCategory.empty();
				subCategory.append('<option selected>Sub Category</option>'+
						  '<option class="subCategory" value="디자인">디자인</option>'+
					      '<option class="subCategory" value="영상">영상</option> ');
			}else if (category=="Category") {
				subCategory.empty();
				subCategory.append('<option selected>Sub Category</option>');
			}
			
		})
		
		//클래스 위치 - 지도추가
		$("#postButton").on("click", function() {
			$("#map").empty();
			$("#classPlace").attr("class", "card");
			$("#card").attr("class", "card-body");
			$("#map").attr("style", "width:100%;height:350px;");
		})

		//카테고리 정보 저장 - 카테고리별로 이미지 저장 위해서
		$("#subCategory").on("change", function() {
			var sCategory=$("#subCategory").val();
			console.log("classForm.jsp "+$("#subCategory").val());
			//ajax 
				$.ajax({
					type: "get",
					url: "ClassCategoryServlet", //servlet에서 session에 카테고리 정보 저장
					dataType: "text",
					async: false,
					data: { //서버에 넘겨줄 데이터
						sCategory : sCategory
					},
					success: function(data, status, xhr) {
						console.log("success");
						console.log(data);
					},
					error: function(xhr, status, e) {
						console.log("error");
						console.log(e, status);
					}
				})//ajax end
		})//카테고리end
		
		//동일한 튜터, 클래스명 있는지 확인
		$("#className").on("keyup", function() {
			var className= $("#className").val();
			//ajax 
				$.ajax({
					type: "get",
					url: "ClassNameSearchServlet", //servlet에서 session에 카테고리 정보 저장
					dataType: "text",
					async: false,
					data: { //서버에 넘겨줄 데이터
						userid : "<%=userId%>",
						className : className
					},
					success: function(data, status, xhr) {
						console.log("success");
						//console.log(data);
						$("#classSearch").text(data);
					},
					error: function(xhr, status, e) {
						console.log("error");
						console.log(e, status);
					}
				})//ajax end
				//클래스명 빈칸이면 classSearch 메세지 삭제
				if (className.length==0) {
					$("#classSearch").text("");
				}
		})//classSearch end
	
	})//ready
</script>
  </head>
  <body>

  <div class="classCreate">
  	<div id="classCreateTitle">
  		<h1>클래스 등록</h1>
  	</div>
  	<br>
    <!-- <form class="row g-3" id="classOpenForm" action="../ClassOpenServlet" method="post" enctype="multipart/form-data"> -->
    <form class="row g-3" id="classOpenForm" action="ClassAddServlet" method="post" enctype="multipart/form-data">
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
	  	<span id="classSearch"></span>
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
	    </select>
	  </div>
	  <div class="col-12 mb-3" >
	  	<label for="classSchedule" class="form-label">클래스 일정 (*최대 10회차까지 등록 가능합니다)</label><br>
	  	<div class="btn-group mb-3" role="group">
	  	  <button type="button" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#updateSchedule">일정 추가하기</button>
	  	  <button type="button" class="btn btn-outline-primary" id="allDelete">전체 삭제</button>
	  	</div>
	  	
	  	<!-- modal - 일정추가하기 -->
	  	<div class="modal fade" id="updateSchedule" tabindex="-1" aria-labelledby="updateScheduleLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="updateScheduleLabel">클래스 일정 추가하기</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        <!-- <form class="classDateUpdate"> -->
		          <div class="mb-3">
		            <label for="classDate" class="form-label">클래스 일자</label>
	    			<input type="date" class="form-control" id="classDate" name="classDate">
		          </div>
		          <div class="col-md-6 mb-3">
		            <label for="classStartTime" class="form-label">클래스 시작 시간</label>
	       			<input type="time" class="form-control" id="classStartTime" name="classStartTime">
		          </div>
		          <div class="col-md-6 mb-3">
				    <label for="classEndTime" class="form-label">클래스 종료 시간</label>
				    <input type="time" class="form-control" id="classEndTime" name="classEndTime">
				  </div>
		        <!-- </form> -->
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
		        <button type="button" class="btn btn-primary" id="scheduleBtn">등록</button>
		      </div>
		    </div>
		  </div>
		</div>
	  	<div id="classSchedule"></div>
	  </div>
	  
	  <div class="col-12">
	  	<label for="classPrice" class="form-label">클래스 가격</label>
	  	<div class="input-group mb-3">
		  <span class="input-group-text">₩</span>
		  <!-- 0-9 제외한 문자 제거 후 ''으로 replace -->
		  <input type="text" class="form-control" id="classPrice" name="classPrice"
		  style="text-align: right;" placeholder="99,999" 
		  oninput="this.value = this.value.replace(/[^0-9]/g, '');"><!-- 숫자만 입력할 수 있도록 함 -->
		  <span class="input-group-text">(원)</span>
	  	</div>
	  </div>
	  <div class="col-12">
	    <label class="form-label">클래스 위치</label>
	    <div class="input-group">
	      <label class="input-group-text" for="post">우편번호</label>
	      <input type=text class="form-control" id="post" name="post">
	      <button type="button" id="postButton" class="btn btn-secondary" onclick="execDaumPostcode()">우편번호찾기</button>
	  	  <span id="guide" style="color:#999"></span>
	  	</div>
	  </div>
	  <div class="col-6 mb-2">
	    <input type=text class="form-control" id="address1" name="address1" placeholder="도로명주소">
	  </div>
	  <div class="col-6 mb-2">
	    <input type=text class="form-control" id="address2" name="address2" placeholder="지번주소">
	  </div>
	  <!-- 지도 -->
	  <div id="classPlace"  >
	    <div id="card" >
	  	  <!-- <div id="map" style="width:100%;height:350px;"></div> -->
	  	  <div id="map"></div>
	    </div>
	  </div>
	  
	  <div class="col-12 mt-3">
	    <label class="form-label">클래스 소개 사진 업로드 (*최대 5장까지 가능합니다)</label>
	    <div class="input-group mb-3">
	      <input type="file" class="form-control" id="classPhoto1" name="classPhoto1">
	      <label class="input-group-text" for="classPhoto1">Upload</label>
	  	</div>
	    <div class="input-group mb-3">
	      <input type="file" class="form-control" id="classPhoto2" name="classPhoto2">
	      <label class="input-group-text" for="classPhoto2">Upload</label>
	  	</div>
	    <div class="input-group mb-3">
	      <input type="file" class="form-control" id="classPhoto3" name="classPhoto3">
	      <label class="input-group-text" for="classPhoto3">Upload</label>
	  	</div>
	    <div class="input-group mb-3">
	      <input type="file" class="form-control" id="classPhoto4" name="classPhoto4">
	      <label class="input-group-text" for="classPhoto4">Upload</label>
	  	</div>
	    <div class="input-group mb-3">
	      <input type="file" class="form-control" id="classPhoto5" name="classPhoto5">
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
	  <div class="d-grid gap-2 col-6 mx-auto">
	    <button type="submit" class="btn btn-secondary" id="classFormButton">등록하기</button>
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
				
                // 주소를 따로 함수로 빼준다.
                MapAddress(fullRoadAddr);
                
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

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=563690bc120a15ac561d9ce73a5aa24e&libraries=services"></script>	
<script>


function MapAddress(addr) {
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
	    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	    level: 1 // 지도의 확대 레벨
	};  

	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 

	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();

	// 주소로 좌표를 검색합니다
	geocoder.addressSearch(addr, function(result, status) {

	// 정상적으로 검색이 완료됐으면 
	 if (status === kakao.maps.services.Status.OK) {

	    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

	    // 결과값으로 받은 위치를 마커로 표시합니다
	    var marker = new kakao.maps.Marker({
	        map: map,
	        position: coords
	    });

	     // 인포윈도우로 장소에 대한 설명을 표시합니다
	    var infowindow = new kakao.maps.InfoWindow({
	        content: '<div style="width:150px;text-align:center;padding:6px 0;"><b>이 행성의 위치가 맞나요?</b></div>'
	    });
	    infowindow.open(map, marker);

	    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	    map.setCenter(coords);
	    
	    //이미지 지정
	    var markerImage = new kakao.maps.MarkerImage(
	    	    'class_img/map/earth.png',
	    	    new kakao.maps.Size(80, 80), new kakao.maps.Point(34, 34));
	    	marker.setImage(markerImage);
	    	
	    	
	} 
	});
}

</script>