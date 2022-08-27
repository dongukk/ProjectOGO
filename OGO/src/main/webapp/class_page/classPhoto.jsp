<%@page import="com.dto.classpage.ClassDTO"%>
<%@page import="com.dto.classpage.ClassImgDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ClassImgDTO imgDTO =(ClassImgDTO)request.getAttribute("imgDTO");
	String ClassPhoto1=imgDTO.getClassPhoto1();
	String ClassPhoto2=imgDTO.getClassPhoto2();
	String ClassPhoto3=imgDTO.getClassPhoto3();
	String ClassPhoto4=imgDTO.getClassPhoto4();
	String ClassPhoto5=imgDTO.getClassPhoto5();
	//카테고리별로 경로설정
	ClassDTO cDTO=(ClassDTO)request.getAttribute("cDTO");
	String sCategory=cDTO.getSubcategory();
	String imgSrc="class_img/category/";
	if (sCategory.equals("메이크업")||sCategory.equals("스타일링")){
		imgSrc +="A_뷰티/";
	}else if (sCategory.equals("영어")||sCategory.equals("일본어·중국어")||sCategory.equals("기타 외국어")){
		imgSrc +="B_외국어/";
	}else if (sCategory.equals("댄스")||sCategory.equals("뮤직")){
		imgSrc +="C_댄스,뮤직/";
	}else if (sCategory.equals("요리·음료")||sCategory.equals("공예·DIY")){
		imgSrc +="D_요리,공예/";
	}else if (sCategory.equals("디자인")||sCategory.equals("영상")){
		imgSrc +="E_드로잉,영상/";
	}
	
%>
<div class="page classPhoto" id="classPhoto">
  <div class="name">
    <h2>클래스 Photo</h2>
  </div>
  <hr>
 
 <div class="classPhoto2 mb-5">
	<!-- <div class="container">
	  <div id="photo">
    	<div class="photoBtn"> 왼쪽으로 넘기는 버튼
    	  <img class="photoBtn2" id="leftBtn" src="class_img/leftbutton.png" width= "50px">
    	</div>
    	<div class="photo"> 이미지1
    	  <img class="photoSize" id="photo1" src="class_img/1_04.jpg">
    	</div>
    	<div class="photo"> 이미지2
    	  <img class="photoSize" id="photo2" src="class_img/1_05.jpg">
    	</div>
    	<div class="photoBtn"> 오른쪽으로 넘기는 버튼
    	  <img class="photoBtn2" id="rightBtn" src="class_img/rightbutton.png" width= "50px">
    	</div>
      </div>
    </div>  -->
    
    <!-- 부트스트랩 -->
    <div id="photoPart">
    <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
      <div class="carousel-indicators">
	      <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
	      <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
	      <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
	      <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3" aria-label="Slide 3"></button>
	      <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="4" aria-label="Slide 3"></button>
      </div>
	  <div class="carousel-inner">
	    <div class="carousel-item active">
	      <img src="<%=imgSrc+ClassPhoto1 %>" class="d-block w-100 h-100" >
	    </div>
	    <div class="carousel-item">
	      <img src="<%=imgSrc+ClassPhoto2 %>" class="d-block w-100 h-100" >
	    </div>
	    <div class="carousel-item">
	      <img src="<%=imgSrc+ClassPhoto3 %>" class="d-block w-100 h-100" >
	    </div>
	    <div class="carousel-item">
	      <img src="<%=imgSrc+ClassPhoto4 %>" class="d-block w-100 h-100" >
	    </div>
	    <div class="carousel-item">
	      <img src="<%=imgSrc+ClassPhoto5 %>" class="d-block w-100 h-100" >
	    </div>
	  </div>
	  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
	    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	    <span class="visually-hidden">Previous</span>
	  </button>
	  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
	    <span class="carousel-control-next-icon" aria-hidden="true"></span>
	    <span class="visually-hidden">Next</span>
	  </button>
	</div> 
	</div>
</div> 
<br>
</div>