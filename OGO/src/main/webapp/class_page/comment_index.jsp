<%@page import="com.dto.login.MemberDTO"%>
<%@page import="com.dto.classpage.ClassCommentDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
 	 <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  	 <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
 	 <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&family=Jua&family=Nanum+Gothic+Coding&family=Noto+Sans+KR:wght@900&family=Sunflower:wght@300&display=swap" rel="stylesheet">
	<link rel='stylesheet' href='comment.css'>
	
	 <% String mesg = (String) session.getAttribute("mesg"); 
 	if(mesg != null){
 %>
	alert("<%= mesg %>");

<%} session.removeAttribute("mesg"); %>
    <form action="Create_CommentServlet" id="cmt_form" method="get" >

    
	        <div class="cmt_header cmheader">수강생 후기
	        </div> <!--header-->
	        <div class="score">
	                 <b id="cmt_score">★4.3</b> <!--더미텍스트: 평균구하는 값 기입필요-->
	                 <b id="cmt_total">/ 5.0</b>
	        </div>
	
	        <div class="line1"><hr class="cmt_line1"></div>
	        <div class="line2"><hr class="cmt_line2"></div>
	        <div class="line3"><hr class="cmt_line3"></div>
	        <div class="line4"><hr class="cmt_line4"></div>
	     
	        <div class="img1"></div>
	        <div class="img2"></div>
	        <div class="img3"></div>
	        
	        <%
	List<ClassCommentDTO> cmtlist = (List<ClassCommentDTO>) request.getAttribute("commentlist"); 
	for(int i=0; i< cmtlist.size(); i++){
%>

	<%if(i==0||i%3==0) { %>
	        <div class="notice1"><br>
	        	<p id="notice_detail"><b>&nbsp&nbsp<%=cmtlist.get(i).getComment_notice()%></b></p>
	        </div> <!--임시 text DB연동-->
	<%} %>
	<%if(i==1||i%3==1) { %>
	        <div class="notice2"><br>
	        	<p id="notice_detail"><b>&nbsp&nbsp<%=cmtlist.get(i).getComment_notice()%></b></p>
	        </div> <!--임시 text DB연동-->
	<%} %>
	<%if(i==2||i%3==2) { %>
	        <div class="notice3"><br>
	        	<p id="notice_detail"><b>&nbsp&nbsp<%=cmtlist.get(i).getComment_notice()%></b></p>
	        </div> <!--임시 text DB연동-->
	<%} %>
	<% 
	} 
%>	

	        <!-- <button class="button_body" id="cmt_button1">글쓰기</button> -->

    <!-- Button to Open the Modal -->
<button type="button" class="btn btn-primary button_body" id="cmt_button1" data-toggle="modal" data-target="#myModal"
 	style="background-color: purple;">쓰기</button>

<!-- The Modal -->
   
<div class="modal" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
  
        <h4 class="modal-title">글쓰기</h4>
        <!-- <button type="button" class="close" data-dismiss="modal">&times;close</button> -->
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <textarea id="cmt_textarea" name="cmttextarea" rows="5" cols="60"></textarea>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
	    
	   	
       	<button type="submit" class="cmt_submit" 
      		style="position: relative; background-color: rgb(220,53,69); 
      		color: white; border: 0px; border-radius: 4px; width: 54px; height: 38px;
      		text-align: center;">확인</button>
        <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
      </div>

    </div>
  </div>
</div>
  </form>
  
  <form action="Update_CommentSerlvet" method="get">
<!-- Button trigger modal -->
<button type="button" class="btn btn-primary" id="cmt_button2" data-bs-toggle="modal" data-bs-target="#staticBackdrop">수정</button>
<!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">수정하기</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
         <textarea id="cmt_textarea" name="cmttextarea2" rows="5" cols="60"></textarea>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-primary" onclick="location.herf='Update_CommentSerlvet'">확인</button>
      </div>
    </div>
  </div>
</div>
</form>
   <!--   <form action="Update_CommentSerlvet" method="get">
      	<input type="button" id="upadatebtn" style="position: relative; background-color: rgb(220,53,69); 
      		color: white; border: 0px; border-radius: 4px; width: 54px; height: 38px;
      		text-align: center;" />수정
      </form> -->
    <!-- 수강후기 끝 -->
    
 