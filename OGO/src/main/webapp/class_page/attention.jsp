<%@page import="java.util.Set"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.HashMap"%>
<!DOCTYPE html>
<%
	HashMap<String,String> classContents 
		= (HashMap<String,String>)request.getAttribute("classContents");
	String attention=classContents.get("con_attention");
	attention=attention.replaceAll("(\r\n|\r|\n|\n\r)", "<br>");//개행 작업
%>
<div class="page attention mb-5" id="attention">
  <div class="name">
    <h2>유의사항</h2>
  </div>
  <hr>
  <div class="m-2">
	<%=attention %>
  </div>
</div>

