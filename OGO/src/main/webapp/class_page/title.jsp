<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.dto.classpage.ClassDTO"%>
<%
	ClassDTO cDTO = (ClassDTO)request.getAttribute("cDTO");
	String className= cDTO.getClassName();
	String nickName = (String)request.getAttribute("nickName");
%>   
<div class="mt-4 mb-4">
	<p style="font-size: 39px"><b><%=className%></b></p>
	<img src="class_img/tutor_2.png" width="40px" height="40px">&nbsp;
	<%=nickName %> 튜터
</div> 
<div class="imgAll mb-4">
  <div>
	<div id="bigImg" >
	  <img src="class_img/1_01.jpg" height="70%" width="90%">
	</div>
  </div> 
</div>

<!-- 네비 탭 -->
<div id="classNav">
	<ul class="nav nav-tabs" >
	  <li class="nav-item">
	    <a class="nav-link" href="#classInfo">클래스 행성 소개</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link" href="#classTutor">튜터 소개</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link" href="#detail">일정 및 장소 안내</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link" href="#classPhoto">클래스 사진</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link" href="#notice">공지사항</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link" href="#attention">유의사항</a>
	  </li>
	</ul>
</div>