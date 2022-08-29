<%@page import="com.dto.notice.FaqDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <meta charset="utf-8"> 
    <title>O G O공지사항</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	
	<link rel="stylesheet" href="notice_faq_css/faq.css">
	
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>
      $( document ).ready( function() {
        
        
        $(".faq").on("click", function() {
        	var faqId = $(this).attr("id");
        	$("#A"+faqId).slideToggle();
        });
       
        
      });
    </script>
 <% List<FaqDTO> list = (List<FaqDTO>) request.getAttribute("faqList");%>
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
 
<h1 >FAQ 자주 물어보는 질문</h1>

<% for ( int i =0; i<list.size(); i++ )  {%>
 <div class="accordion-item w-75" >
    <h2 class="accordion-header" id="flush-heading<%=i%>">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse<%=i%>" aria-expanded="false" aria-controls="flush-collapse<%=i%>" style="background: #8041D9; color: #FFFFFF">
        <%= list.get(i).getFaqtitle() %>
      </button>
    </h2>
    <div id="flush-collapse<%=i%>" class="accordion-collapse collapse" aria-labelledby="flush-heading<%=i%>" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body"><%= list.get(i).getFaqcontent() %></div>
    </div>
<% } %>

