<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	HashMap<String,String> classContents =
		(HashMap<String,String>)request.getAttribute("classContents");
	String con_notice =classContents.get("con_notice");
	con_notice=con_notice.replaceAll("(\r\n|\r|\n|\n\r)", "<br>");//개행 작업
%>
<div class="classpage_tab2-1"> 
<div id="notice" class="page mb-5">
	  <div class="name">
	    <h2 class="tab_menu">공지사항</h2>
	  </div>
	</div>
</div>
<div id="tab_scrollbar" class="classpage_tab2-1n classpageTab_hidden">	
  <div class="m-2">
    <%=con_notice %>
    <br>
  </div>
</div>
