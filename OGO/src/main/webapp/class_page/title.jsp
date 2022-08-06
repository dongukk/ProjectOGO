<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.dto.classpage.ClassDTO"%>
<%
	ClassDTO cDTO = (ClassDTO)request.getAttribute("cDTO");
	String className= cDTO.getClassName();
%>   
 
<div class="imgAll">
  <div>
	<div id="bigImg" >
	  <img src="class_img/1_01.jpg" height="70%" width="100%">
	</div>

  </div> 
  
  <!-- 캐러셀 -->
<!-- 	<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
	  <div class="carousel-inner">
	    <div class="carousel-item active">
	      <img src="class_img/1_01.jpg" class="d-block w-100 " height="400px;">
	    </div>
	    <div class="carousel-item">
	      <img src="class_img/1_02.jpg" class="d-block w-100 " height="400px;">
	    </div>
	    <div class="carousel-item">
	      <img src="class_img/1_03.jpg" class="d-block w-100 " height="400px;">
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
	</div> -->
</div>
<br>
<div >
  <p style="font-size: 39px"><b><%=className%></b></p>
</div>
