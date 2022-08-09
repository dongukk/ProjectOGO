<%@page import="com.dto.classpage.ClassDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ClassDTO cDTO = (ClassDTO)request.getAttribute("cDTO");
	String schedule1 =cDTO.getSchedule1();
	String schedule2 =cDTO.getSchedule2();
	String schedule3 =cDTO.getSchedule3();
	String schedule4 =cDTO.getSchedule4();
	String schedule5 =cDTO.getSchedule5();
	String schedule6 =cDTO.getSchedule6();
	String schedule7 =cDTO.getSchedule7();
	String schedule8 =cDTO.getSchedule8();
	String schedule9 =cDTO.getSchedule9();
	String schedule10 =cDTO.getSchedule10();

	
	String place =cDTO.getPlace();
%>
<div id="detail">
  <div class="name">
    <h2>일정 및 장소 안내</h2>
  </div>
	<hr>
		<div id="classDetail">
			<b>-일정 :</b><br> 
			 &nbsp;&nbsp;1회차 - <%=schedule1 %><br>
			 &nbsp;&nbsp;2회차 - <% if(schedule2!=null){out.print(schedule2);}else{%>해당 클래스의 2회차 일정은 없습니다.<%}%><br>
			 &nbsp;&nbsp;3회차 - <% if(schedule3!=null){out.print(schedule3);}else{%>해당 클래스의 3회차 일정은 없습니다.<%}%><br>
			 &nbsp;&nbsp;4회차 - <% if(schedule4!=null){out.print(schedule4);}else{%>해당 클래스의 4회차 일정은 없습니다.<%}%><br>
			 &nbsp;&nbsp;5회차 - <% if(schedule5!=null){out.print(schedule5);}else{%>해당 클래스의 5회차 일정은 없습니다.<%}%><br>
			 &nbsp;&nbsp;6회차 - <% if(schedule6!=null){out.print(schedule6);}else{%>해당 클래스의 6회차 일정은 없습니다.<%}%><br>
			 &nbsp;&nbsp;7회차 - <% if(schedule7!=null){out.print(schedule7);}else{%>해당 클래스의 7회차 일정은 없습니다.<%}%><br>
			 &nbsp;&nbsp;8회차 - <% if(schedule8!=null){out.print(schedule8);}else{%>해당 클래스의 8회차 일정은 없습니다.<%}%><br>
			 &nbsp;&nbsp;9회차 - <% if(schedule9!=null){out.print(schedule9);}else{%>해당 클래스의 9회차 일정은 없습니다.<%}%><br>
			 &nbsp;&nbsp;10회차 - <% if(schedule10!=null){out.print(schedule10);}else{%>해당 클래스의 10회차 일정은 없습니다.<%}%><br>
			<br>
			<b>-장소 :</b> <%= place %>
			<br>
		</div>
	<!-- 아래에 지도 추가 -->
</div>