<%@page import="java.text.NumberFormat"%>
<%@page import="com.dto.classpage.ClassDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int heartYN = Integer.parseInt((String)request.getAttribute("heartYN"));
	//System.out.print(heartYN);
	String heartCount = String.valueOf(request.getAttribute("heartCount"));
	
	ClassDTO cDTO = (ClassDTO)request.getAttribute("cDTO");
	int classNum=cDTO.getClassNum();
	int price= cDTO.getPrice();
	NumberFormat numberFormat = NumberFormat.getInstance();
	String priceF=numberFormat.format(price);
	
	String [] arr= new String [10];
	arr[0]=cDTO.getSchedule1();
	arr[1] = cDTO.getSchedule2();
	arr[2] = cDTO.getSchedule3();
	arr[3] = cDTO.getSchedule4();
	arr[4] = cDTO.getSchedule5();
	arr[5] = cDTO.getSchedule6();
	arr[6] = cDTO.getSchedule7();
	arr[7] = cDTO.getSchedule8();
	arr[8] = cDTO.getSchedule9();
	arr[9] = cDTO.getSchedule10();
	String s= null;
%>

    
<div >
<aside>
  <form action="ClassOrderInfoServlet" id="payForm" method="post">
  <!-- 결제 페이지로 넘길 정보 -->
  <input type="hidden" id="classNumber" name="classNumber" value="<%=classNum%>">
  <input type="hidden" id="selectSched1" name="selectSched1">
  <input type="hidden" id="selectSched2" name="selectSched2">
  <input type="hidden" id="selectSched3" name="selectSched3">
  <input type="hidden" id="selectSched4" name="selectSched4">
  <input type="hidden" id="selectSched5" name="selectSched5">
  <input type="hidden" id="selectSched6" name="selectSched6">
  <input type="hidden" id="selectSched7" name="selectSched7">
  <input type="hidden" id="selectSched8" name="selectSched8">
  <input type="hidden" id="selectSched9" name="selectSched9">
  <input type="hidden" id="selectSched10" name="selectSched10">
	<div class="box">
	<div class="container">
	  <div class="row mb-2 mt-2">
	  	<div class="col-md-12 mt-2" id="price" name="price"><%=priceF %>원</div>
	  </div>
	  <div class="row mb-1 ">
		  <div class="btn-group col-md-12" role="group" >
		  	<!-- 드롭다운 -->
			<div class="btn-group" role="group" aria-label="Button group with nested dropdown">
			  <div class="btn-group" role="group">
			    <button class="btn btn-outline-secondary dropdown-toggle" type="button" id="scheduleMenuButton" 
					 style="outline: #6633FF;" data-bs-toggle="dropdown" aria-expanded="false">
					   회차 선택</button>
				<ul class="dropdown-menu" aria-labelledby="scheduleMenuButton">
					<%
				   	   for(int i=0;i<10;i++){
				    		s= arr[i];
				    		if(s != null){
				    %>
					   <li><a class="dropdown-item" id="dropdown<%=(i+1)%>" ><%=(i+1)%>회차:<%=s %></a></li>
					<%
				    		} 
				       }
				    %>
				</ul>
			  </div>
			  <button type="submit" class="btn btn-secondary" id="payBtn">수강결제</button>
			  <!-- <div class="col" id="payBtn"><span id="payBtn2">수강결제</span></div> -->
			</div>	  
	  </div>
	  </div>
	  <div class="row mb-1">
		  <div class="col-md-12" >
		  	<div id="scheduleChoice" class="mt-2">
		  		<!-- <div class='input-group mb-1' >
		  		  <input type='text' class='form-control' value="선택 회차 : 날짜" readonly><br>
		  		</div> -->
		  	</div>
		  </div>	  
	  </div>
	  <div class="row">
		  <div class="col mb-3" id="like">
		  	<img id="heart" <%if(heartYN==1){ %>src="class_img/heart2.png"<%}else{ %>src="class_img/heart1.png" <%} %> 
		  	height="35px" width="35px">
		  	<span id="heartCount" style="font-size: 17px;"><%=heartCount %></span> <!-- 찜 개수 -->
		  </div>
	  </div>
	 
	</div>
	</div>
  </form>
  
</aside>
</div>

