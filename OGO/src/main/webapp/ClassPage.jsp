<%@page import="com.dto.login.MemberDTO"%>
<%@page import="com.dto.classpage.ClassDTO"%>
<%@page import="com.dto.classpage.ClassImgDTO"%>
<%@page import="org.apache.ibatis.javassist.bytecode.stackmap.TypeData.ClassName"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- tosspayment -->
<script src="https://js.tosspayments.com/v1"></script>
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<title>클래스 신청</title>
<!-- 네비바 -->
<jsp:include page="common/nav.jsp" flush="false"/>

<link rel="stylesheet" href="class_css/classPage.css">
<link rel='stylesheet' href='class_comment_css/comment.css'>
<%
	String heartYN = (String)request.getAttribute("heartYN");
	String heartCount = String.valueOf(request.getAttribute("heartCount"));
	ClassDTO cDTO =(ClassDTO)request.getAttribute("cDTO");
	int classNum=cDTO.getClassNum();
	///
	MemberDTO mDTO= (MemberDTO)session.getAttribute("login"); 
	String userId=null;
	if(mDTO!=null){
		userId = mDTO.getUserId();
	}

	
%>
<!-- ajax cdn -->
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
		//찜 버튼 클릭
		$("#heart").on("click", function() {
			
			if ("<%=userId%>" == null || "<%=userId%>"=="null") {
				alert("로그인 후 사용가능합니다");
			}else {
				var heart =$("#heart");
				//ajax 
				$.ajax({
					type: "get",
					url: "HeartServlet",
					dataType: "text",
					async: false,
					data: { //서버에 넘겨줄 데이터
						userId : "<%=userId%>",
						classNum : <%=classNum%>,
						heartYN : <%=heartYN%>
					},
					success: function(data, status, xhr) {
						console.log("success");
						console.log(data);
						if (data=="insert") {
							heart.attr("src","class_img/heart2.png");
							alert("찜 목록에 추가되었습니다");
						}else { //delete인 경우
							heart.attr("src","class_img/heart1.png");
							alert("찜 목록에서 삭제되었습니다");
						}
					},
					error: function(xhr, status, e) {
						console.log("heart error");
						console.log(e, status);
					}
				})//ajax end
				
				//찜 개수 구하기
				$.ajax({
					type: "get",
					url: "HeartCountServlet",
					dataType: "text",
					data: { //서버에 넘겨줄 데이터
						classNum : <%=classNum%>
					},
					success: function(data, status, xhr) {
						console.log("count success");
						$("#heartCount").text(data);
					},
					error: function(xhr, status, e) {
						console.log("count error");
						console.log(e, status);
					}
				})//ajax end
			}
		});//like click
		

		var idxArr= [];
		$(".dropdown-item").on("click", function() {
			var selectSchedule = $(this).text();
			var scheduleChoice =$("#scheduleChoice");
			
			var idx= selectSchedule.substring(0, 1);
			
			if (idxArr.indexOf(idx, 0)== -1) {
				idxArr.push(idx);
				
				scheduleChoice.append("<div class='input-group mb-1' id='select"+idx+"'>"+
						"<input type='text' class='form-control' value="+selectSchedule+" readonly>"+
						"<button type='button' class='btn' id='close"+idx+"'>X</button>"+
						"<br></div>");
				
				$("#selectSched"+idx).val(selectSchedule.substring(4));
			}else {
				alert("이미 선택한 회차입니다.");
			}
			
			//선택회차 개별 삭제 기능
			$("#close"+idx).on("click", function() {
				$("#select"+idx).detach();
				var del = idxArr.indexOf(idx);
				if (del > -1) {
					idxArr.splice(del, 1);
				}
				$("#selectSched"+idx).val(""); //hidden 태그 value도 삭제
			})
			
		})//수강회차 선택 end
		
		
		
		
		
		//수강결제 폼 submit-수강결제 시 (수강결제 버튼 클릭)
		$("#payForm").on("submit", function() {
			var count=0;
			for (var i = 1; i <= 10; i++) {
				var value=$("#selectSched"+i);
				if (value.val().length>0) {
					count++;
				}
			}
			if ("<%=userId%>"==null || "<%=userId%>"=="null") { //로그인을 하지 않은 경우
				alert("로그인이 필요합니다");
				event.preventDefault();
			}else if (count==0) { //회차를 선택하지 않은 경우
				alert("원하는 수강 회차를 선택해주세요");
				event.preventDefault();
			}else{ //로그인 되어있고, 수강회차도 선택한 경우
				//수강결제정보 ajax
				$.ajax({
					type: "post",
					url: "ClassOrderInfoServlet",
					dataType: "text",
					async: false,
					data: { //서버에 넘겨줄 데이터
						classNumber : $("#classNumber").val(),
						selectSched1 : $("#selectSched1").val(),
						selectSched2 : $("#selectSched2").val(),
						selectSched3 : $("#selectSched3").val(),
						selectSched4 : $("#selectSched4").val(),
						selectSched5 : $("#selectSched5").val(),
						selectSched6 : $("#selectSched6").val(),
						selectSched7 : $("#selectSched7").val(),
						selectSched8 : $("#selectSched8").val(),
						selectSched9 : $("#selectSched9").val(),
						selectSched10 : $("#selectSched10").val(),
						classPrice : $("#classPrice").val()
					},
					success: function(data, status, xhr) {
						console.log("orderInfo success");
						if (data!="성공") {
							alert(data);
							/* 나의 버튼 트리거 */
						}
					},
					error: function(xhr, status, e) {
						console.log("orderInfo error");
						console.log(e, status);
					}
				})//ajax end
			}
		}) //결제 폼 end
		
		
		$("#Pay_button1").click(function() {
		  
		if (<%=userId%> != null) {			
			$.ajax({
				type: "get",
				url: "PayMain",
				data: {
					/* "ordernum" : "제발 지랄좀 하지마" */
					"userId" : "<%=userId%>",
					"classNum" : "<%=classNum%>"
					}, 
				dataType: "json",
				success: function (data, status, xhr) {
					$("#Pay_span1_CLASSNAME").html(data.CLASSNAME);
					$("#Pay_span2_PLACE").html(data.PLACE);
					$("#Pay_span3_countDate").html( data.countDate+"회");
					$(".Pay_span4_price").html(data.price);
					$("#customerName").val(data.customerName);
					$("#orderNum").val(data.orderNum);
					
				},
				error: function(xhr, status, error) {
					/* console.log(status+error); */
				}
			});//ajax
			
			
		}else {
			e.preventDefault();
			alert("로그인 후 이용해주세요");
		}//else
			
		});//button.click
	
		
		
		//스크롤시 nav tab 고정
		$(window).scroll(function() {
	        var windowTop = $(this).scrollTop();
	        var scrollTop = $(window).scrollTop();
	        if(windowTop > 700) {
	            $('#classNav').attr("style","position:fixed;bottom:0;"); //네비탭 고정
	          	//스크롤 위치 test
		        if (scrollTop >= ($("#classInfo").offset().top-400)) {
		        	$(".nav-link").removeAttr("style");
					$(".nav-link").removeClass("active");
					$("#classInfoNav").addClass("active");
					$("#classInfoNav").attr("style","font-weight:bold;background-color:blueviolet;color:white;");
				}if (scrollTop >= ($("#classTutor").offset().top-300)) {
					$(".nav-link").removeAttr("style");
					$(".nav-link").removeClass("active");
					$("#classTutorNav").addClass("active");
					$("#classTutorNav").attr("style","font-weight:bold;background-color:blueviolet;color:white;");
				}if (scrollTop >= ($("#detail").offset().top-300)) {
					$(".nav-link").removeAttr("style");
					$(".nav-link").removeClass("active");
					$("#detailNav").addClass("active");
					$("#detailNav").attr("style","font-weight:bold;background-color:blueviolet;color:white;");
				}if (scrollTop >= ($("#classPhoto").offset().top-300)) {
					$(".nav-link").removeAttr("style");
					$(".nav-link").removeClass("active");
					$("#classPhotoNav").addClass("active");
					$("#classPhotoNav").attr("style","font-weight:bold;background-color:blueviolet;color:white;");
				}if (scrollTop >= ($("#notice").offset().top-300)) {
					$(".nav-link").removeAttr("style");
					$(".nav-link").removeClass("active");
					$("#noticeNav").addClass("active");
					$("#noticeNav").attr("style","font-weight:bold;background-color:blueviolet;color:white;");
				}if (scrollTop >= ($("#attention").offset().top-300)) {
					$(".nav-link").removeAttr("style");
					$(".nav-link").removeClass("active");
					$("#attentionNav").addClass("active");
					$("#attentionNav").attr("style","font-weight:bold;background-color:blueviolet;color:white;");
				}if (scrollTop < $("#classInfo").offset().top) {
					$(".nav-link").removeClass("active");
					$(".nav-link").attr("style","");
				}
	        } else {
	        	$('#classNav').attr("style",""); //네비탭 고정 해제
	        }
	        
	    })
		//navtab 이동
		$('#classNav > ul > li > a').click(function(e) {
		    var href = $(this).attr('href');
		    var targetTop = $(href).offset().top;
		    $('html').stop().animate({scrollTop:targetTop}, 300);
		    e.preventDefault();
		})
			
	})//script
</script>

</head>
<body>


<div class="wrap">
  <div id="right">
	<!-- 결제 박스 -->
	<jsp:include page="class_page/box.jsp" flush="true"></jsp:include>
  </div>
  <div id="left">
	<!-- 클래스 이미지, 클래스 이름 -->
	<jsp:include page="class_page/title.jsp" flush="true"></jsp:include>
	<br>
	<!-- 네비탭 -->
	<jsp:include page="class_page/classNavtab.jsp"></jsp:include>
	<br>
	<!-- 클래스 소개 -->
	<jsp:include page="class_page/classInfo.jsp" flush="true"></jsp:include>
	<br>
	<!-- 튜터 소개 -->
	<jsp:include page="class_page/tutorInfo.jsp" flush="true"></jsp:include>
	<br>
	<!-- 일정 및 장소 안내 -->
	<jsp:include page="class_page/detail.jsp" flush="true"></jsp:include>
	<br>
	<!-- 클래스 포토 -->
	<jsp:include page="class_page/classPhoto.jsp" flush="true"></jsp:include>
	<br>
	<!-- 공지사항 -->
	<jsp:include page="class_page/notice.jsp" flush="true"></jsp:include>
	<br>
	<!-- 유의사항 -->
	<jsp:include page="class_page/attention.jsp" flush="true"></jsp:include>
	<br>
	<!-- 수강생 후기 아래에 추가 -->
	<jsp:include page="class_page/comment_index.jsp" flush="true"></jsp:include>
	<br>
	<!-- 결제버튼 -->
<button id="Pay_button1" class="btn btn-primary" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" aria-controls="offcanvasRight">결제</button>

<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
  <div class="offcanvas-header">
    <h4 id="offcanvasRightLabel">결제 목록을 확인해 주세요</h4>
    <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
  </div>
  <div class="offcanvas-body">
    <span id="Pay_span1_CLASSNAME"></span>
    <br>
    <br>
    <span id="Pay_span2_PLACE"></span>
    <br>
    <br>
    <span id="Pay_span3_countDate"></span> &nbsp;&nbsp;    
    <span id="Pay_price" class="Pay_span4_price"></span>
    <span>원</span>
 	<br>
 	<br> 
 	<input type="hidden" id="customerName" value="">
 	<input type="hidden" id="orderNum" value="">
 	
 	
 	<section>
      <!-- ... -->
      <span>총 주문금액</span>
      <span class="Pay_span4_price" id="Pay_span4_price"></span>
      <span>원</span>
      <button id="payment-button">결제하기</button>
    </section>
    
    <script>
      var clientKey = 'test_ck_D5GePWvyJnrK0W0k6q8gLzN97Eoq'
      var tossPayments = TossPayments(clientKey)
      var button = document.getElementById('payment-button') // 결제하기 버튼
	  var Cname = document.getElementById("Pay_span1_CLASSNAME"); //결제할 class이름
	  var Cprice = document.getElementById("Pay_span4_price");
      var CnameT = Cname.innerText/* +"외 3건" */;
      var Cusername = document.getElementById("customerName");
      var CorderNum = document.getElementById("orderNum");
	  
      button.addEventListener('click', function () {
    	  console.log(CnameT); //????????????????????????????????왜때문 빈칸????????????????

        tossPayments.requestPayment('카드', {
          amount: Cprice.innerText,
          orderId: CorderNum.value,
          orderName: Cname.innerText,
          customerName: Cusername.value,
          successUrl:'http://localhost:8097/OGO/PaySuccess',
          failUrl: 'http://localhost:8097/Pay/fail.jsp',
        })
      })
    </script>

  </div>
</div>
 	
  </div>
<br>
</div>
    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>