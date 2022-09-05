<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.dto.classpage.ClassDTO"%>
<%@page import="com.dto.classpage.ClassImgDTO"%>
<%
	ClassDTO cDTO = (ClassDTO)request.getAttribute("cDTO");
	String className= cDTO.getClassName();
	String nickName = (String)request.getAttribute("nickName");
	ClassImgDTO imgDTO =(ClassImgDTO)request.getAttribute("imgDTO");
	String ClassPhoto1=imgDTO.getClassPhoto1();
	//카테고리별로 경로설정
	String sCategory=cDTO.getSubCategory();
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
<div class="mt-4 mb-4">
	<p style="font-size: 39px"><b><%=className%></b></p>
	<img src="class_img/tutor_2.png" width="40px" height="40px">&nbsp;
	<%=nickName %> 튜터
</div> 
<div class="imgAll mb-4">
  <div>
	<div id="bigImg" >
	  <img src="<%=imgSrc+ClassPhoto1%>" height="70%" width="90%">
	</div>
  </div> 
</div>