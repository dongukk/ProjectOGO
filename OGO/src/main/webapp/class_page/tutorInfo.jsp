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
<div id="classTutor" class="page mb-5">
	<div class="classpage_tab2">
	  <div class="name">
	    <h2 class="tab_menu">클래스 행성 튜터 소개</h2>
	  </div>
	</div>  
<div id="tab_scrollbar" class="classpage_tab2n">		
  <div class="row">
    <div class="col-sm-2">
		<div class="tutor ProfileImg" id="tutor ProfileImg" style="text-align: center;">
			<img src="class_img/tutor_2.png" width="100" height="100">
		</div>
		<div id="tutor nickName" style="text-align: center;">
			<b><%= nickName %></b>
		</div>
	</div>
	<div class="col-sm-10">
		<div class="tutor Info" id="tutor Info" >
			<%=con_tutor %><br>
		</div>
	</div>
  </div>
 </div>
</div>