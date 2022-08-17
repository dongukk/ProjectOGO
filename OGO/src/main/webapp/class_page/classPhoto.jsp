<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="classPhoto" id="classPhoto">
  <div class="name">
    <h2>클래스 Photo</h2>
  </div>
  <hr>
 
<div class="classPhoto2 mb-5">
	<div class="container">
	  <div id="photo">
    	<div class="photoBtn"> <!-- 왼쪽으로 넘기는 버튼 -->
    	  <img class="photoBtn2" id="leftBtn" src="class_img/leftbutton.png" width= "50px">
    	</div>
    	<div class="photo"> <!-- 이미지1 -->
    	  <img class="photoSize" id="photo1" src="class_img/1_04.jpg">
    	</div>
    	<div class="photo"> <!-- 이미지2 -->
    	  <img class="photoSize" id="photo2" src="class_img/1_05.jpg">
    	</div>
    	<div class="photoBtn"> <!-- 오른쪽으로 넘기는 버튼 -->
    	  <img class="photoBtn2" id="rightBtn" src="class_img/rightbutton.png" width= "50px">
    	</div>
      </div>
    </div> 
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
	      <img src="class_img/1_02.jpg" class="d-block w-100 h-100" >
	    </div>
	    <div class="carousel-item">
	      <img src="class_img/1_03.jpg" class="d-block w-100 h-100" >
	    </div>
	    <div class="carousel-item">
	      <img src="class_img/1_04.jpg" class="d-block w-100 h-100" >
	    </div>
	    <div class="carousel-item">
	      <img src="class_img/1_05.jpg" class="d-block w-100 h-100" >
	    </div>
	    <div class="carousel-item">
	      <img src="class_img/1_06.jpg" class="d-block w-100 h-100" >
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