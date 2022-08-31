<%@page import="com.dto.notice.FaqDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <meta charset="utf-8"> 
    <title>O G O : NOTICE</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@800&family=Urbanist:wght@800&display=swap" rel="stylesheet">

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
 
<div style="display: flex; width: 1200px; height: 300px; position: absolute; left:18%; right:auto;">
	<div>
		<table>
			<tr>
				<td style="font-family: 'Urbanist', sans-serif; font-size: 200px; color: black; line-height: 180px;">FAQ</td>
			</tr>
			<tr>
				<td style="font-family: 'Nanum Gothic', sans-serif; font-size: 40px;">자주 묻는 질문을 모아봤어요</td>
			</tr>		
		</table>
	</div>
	
				
			<div style="position: relative; left: 10%; right:auto; width: 400px; ">
			<% for ( int i =0; i<list.size(); i++ )  {%>
			<div class="accordion accordion-flush" id="accordionFlushExample" style="border: 3px solid #c4c4c4; border-radius: 5px;">
			 <div class="accordion-item w-75" ></div>
			    <h2 class="accordion-header" id="flush-heading<%=i%>">
			      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse<%=i%>" aria-expanded="false" aria-controls="flush-collapse<%=i%>" 
			      	style="background: rgb(250, 248, 247); color: black; ">
			        <%= list.get(i).getFaqtitle() %>
			      </button>
			    </h2>
			    <div id="flush-collapse<%=i%>" class="accordion-collapse collapse" aria-labelledby="flush-heading<%=i%>" data-bs-parent="#accordionFlushExample">
			      <div class="accordion-body"><%= list.get(i).getFaqcontent() %></div>
			    </div>
			</div>    
			<% } %>
			</div>
			
			
</div>

