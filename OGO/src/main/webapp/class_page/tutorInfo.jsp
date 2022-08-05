<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String nickName = (String)request.getAttribute("nickName");
	HashMap<String,String> classContents =
			(HashMap<String,String>)request.getAttribute("classContents");
	String con_tutor =classContents.get("con_tutor");
	con_tutor=con_tutor.replaceAll("(\r\n|\r|\n|\n\r)", "<br>");//개행 작업
%>
<div id="classTutor">
<h2>클래스 행성 튜터 소개</h2>
	<hr>
	<div class="tutor ProfileImg" id="tutor ProfileImg">
		<img src="class_img/tutor_2.png" width="100" height="100">
		<b><%= nickName %></b>
	</div>
	<div class="tutor Info" id="tutor Info" >
		<%=con_tutor %><br>
	</div>
</div>