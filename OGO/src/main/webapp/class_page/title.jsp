<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.dto.classpage.ClassDTO"%>
<%
	ClassDTO dto = (ClassDTO)request.getAttribute("dto");
	String className= dto.getClassName();
%>   
 
<div class="imgAll">
  <div>
	<div id="bigImg" >
	  <img src="class_img/1_01.jpg" height="400px" width="650px">
	</div>
	<!-- <div id="smallImg" >
	  <img src="class_img/1_02.jpg" height="150px" width="300px">
	  <img src="class_img/1_03.jpg" height="150px" width="300px">
	</div> -->
  </div>
</div>
<div >
  <p style="font-size: 38px"><b><%=className%></b></p>
</div>
