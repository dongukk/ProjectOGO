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

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<title>클래스 신청</title>
  
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
		
		//수강회차 선택
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
			}
		}) //결제 폼 end
		
		//스크롤시 nav tab 고정
		$(window).scroll(function() {
	        var windowTop = $(this).scrollTop();
	        if(windowTop > 700) {
	            $('#classNav').attr("style","position:fixed;bottom:0;");
	        } else {
	        	//$(".nav-link").removeClass("active");
	        	$('#classNav').attr("style","");
	        }
	        //스크롤 위치 test
	        var scrollTop = $(window).scrollTop();
	        console.log("scrollTop:"+scrollTop);
	        var arr=$(".nav-link").get();
	        //0:classinfo,1:classtutor,2:detail,3:classphoto,4:notice,5:attention
	    })
		
		//navtab test
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
<!-- 네비바 -->
<jsp:include page="common/nav.jsp" flush="false"/>

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
	
  </div>
<br>
</div>
    <!-- Option 1: Bootstrap Bundle with Popper -->
    <!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script> -->
<!--  <script src="progressbar.js"></script> -->
</body>
</html>