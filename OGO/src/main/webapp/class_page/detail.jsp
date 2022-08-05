<%@page import="com.dto.classpage.ClassDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ClassDTO cDTO = (ClassDTO)request.getAttribute("cDTO");
	String schedule =cDTO.getSchedule();
	String place =cDTO.getPlace();
%>
<div id="detail">
  <div class="name">
    <h2>일정 및 장소 안내</h2>
  </div>
	<hr>
		<div id="classDetail">
			-일정 : <%=schedule %><br>
			<br>
			-장소 : <%= place %>
			<br>
		</div>
	<!-- 아래에 지도 추가 -->
</div>