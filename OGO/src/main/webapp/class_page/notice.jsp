<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	HashMap<String,String> classContents =
		(HashMap<String,String>)request.getAttribute("classContents");
	String con_notice =classContents.get("con_notice");
	con_notice=con_notice.replaceAll("(\r\n|\r|\n|\n\r)", "<br>");//개행 작업
%>
<div id="notice" class="mb-5">
  <div class="name">
    <h2>공지사항</h2>
  </div>
  <hr>
  <div class="m-2">
    <%=con_notice %>
    <br>
  </div>
</div>
