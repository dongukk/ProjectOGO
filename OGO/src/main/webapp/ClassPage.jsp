<%@page import="com.dto.classpage.ClassDTO"%>
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
<title>클래스 신청</title>
  <jsp:include page="common/NavBar.html" flush="true"></jsp:include>
  
<link rel="stylesheet" href="class_css/classPage.css">
<%
	String heartYN = (String)request.getAttribute("heartYN");
	ClassDTO dto =(ClassDTO)request.getAttribute("dto");
	int classNum=dto.getClassNum();
	
	String userId= "1"; //나중에 session에서 받아오기
%>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
		//찜 버튼 클릭
		$("#like").on("click", function() {
			var heart =$("#heart");
			//ajax 아직 구현중
			/* $.ajax({
				type: "get",
				url: "HeartInsertServlet", //서버에 전달 및 응답
				data: {//사용자가 서버에 전달할 데이터
					classNum: classNum, //data전송
					userId: userId,
					heartYN: heartYN
				},
				dataType: "text", //응답타입
				success: function(data, status, xhr) {//응답성공의 경우
					console.log("success");
					if (heart.attr("src")=="class_img/heart1.png") {
						heart.attr("src","class_img/heart2.png");
					}else {
						heart.attr("src","class_img/heart1.png");
					}
					
				},
				error: function(xhr, status, error) {//에러의 경우
					console.log("error");
					
				}
			});//ajax end  */
			if (heart.attr("src")=="class_img/heart1.png") { //insert 되어야 함 //heartYN이 0이라는 뜻
				
				heart.attr("src","class_img/heart2.png");//success에 넣기 
				
			} else { //찜목록에 이미 있는 경우. delete 되어야 함
				//ajax
				heart.attr("src","class_img/heart1.png");//success에 넣기
			}  
		});//like click
		
		//나중에 클래스별로 img 파일명 저장해서 받아오기
		//클래스 photo 왼쪽 버튼 클릭
		var images = ["1_04.jpg","1_05.jpg","1_06.jpg","1_07.jpg","1_08.jpg"];
		var idx = 0;
		$("#leftBtn").on("click", function() {
			idx--;
			if (idx < 0) {
				idx = 4;
			}
			if (idx == 4) {
				$("#photo1").attr("src", "class_img/"+images[idx]);
				$("#photo2").attr("src", "class_img/"+images[0]);
			}else {
				$("#photo1").attr("src", "class_img/"+images[idx]);
				$("#photo2").attr("src", "class_img/"+images[idx+1]);
			}
			
		});
		//클래스 photo 오른쪽 버튼 클릭
		$("#rightBtn").on("click", function() {
			idx++;
			if (idx > 4) {
				idx = 0;
			}
			if (idx == 4) {
				$("#photo1").attr("src", "class_img/"+images[idx]);
				$("#photo2").attr("src", "class_img/"+images[0]);
			}else {
				$("#photo1").attr("src", "class_img/"+images[idx]);
				$("#photo2").attr("src", "class_img/"+images[idx+1]);
			}
			
		});
		
	});//ready
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
  </div>
<br>
</div>
 <script src="progressbar.js"></script>
</body>
</html>