<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	HashMap<String,String> classContents = 
		(HashMap<String,String>)request.getAttribute("classContents");
	String con_class =classContents.get("con_class");
	con_class=con_class.replaceAll("(\r\n|\r|\n|\n\r)", "<br>");//개행 작업
%>
<div id="classInfo">
  <div class="name">
    <!-- <h2>클래스 행성 소개</h2> -->
    <p style="font-size: 32px; ">클래스 행성 소개</p>
  </div>
  <hr>
  <div id="classInfo">
	<%= con_class %><br> 
  </div>
</div>