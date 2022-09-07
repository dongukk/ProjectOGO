<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	HashMap<String,String> classContents = 
		(HashMap<String,String>)request.getAttribute("classContents");
	String con_class =classContents.get("con_class");
	con_class=con_class.replaceAll("(\r\n|\r|\n|\n\r)", "<br>");//개행 작업
%>

<div id="classInfo" class="page mb-5">
  <div>
    <!-- <h2>클래스 행성 소개</h2> -->
    <div class="classpage_tab1"> 
    <p style="font-size: 32px; " class="tab_menu">클래스 행성 소개</p>
    </div>
  </div>
 	 <div id="tab_scrollbar" class="classpage_tab1n">
	  <div id="classInfo" class="m-2">
			<%= con_class %><br> 
	  </div>
 	 </div>
</div>