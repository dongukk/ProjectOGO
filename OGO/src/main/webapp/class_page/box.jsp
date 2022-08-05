<%@page import="java.text.NumberFormat"%>
<%@page import="com.dto.classpage.ClassDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int heartYN = Integer.parseInt((String)request.getAttribute("heartYN"));
	//System.out.print(heartYN);
	
	ClassDTO dto = (ClassDTO)request.getAttribute("dto");
	int price= dto.getPrice();
	NumberFormat numberFormat = NumberFormat.getInstance();
	String priceF=numberFormat.format(price);

%>
<div >
<aside>
	<div class="box">
	  <div id="price"><%=priceF %>원</div>
	  <div id="btn" >수강결제</div>
	  <div id="like">
	  	<img id="heart" <%if(heartYN==1){ %>src="class_img/heart2.png"<%}else{ %>src="class_img/heart1.png" <%} %> 
	  	height="35px" width="35px">
	  	<span id="heartCount"></span> <!-- 찜 개수 -->
	  </div>
	</div>
</aside>
</div>