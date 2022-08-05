<%@page import="com.dto.notice.FaqDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <meta charset="utf-8"> 
    <title>O G O공지사항</title>
	
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
 <% List<FaqDTO> list = (List<FaqDTO>) request.getAttribute("faqList");
 	System.out.print(list);
 %>
<h1 >FAQ 자주 물어보는 질문</h1>
<table>
<% for ( int i =0; i<list.size(); i++ )  {%>
<tr> <td  id="<%= list.get(i).getFaqnum() %>" class="faq">
		 <%= list.get(i).getFaqtitle() %></td> </tr>
<tr> <td class="faq_A" id="A<%= list.get(i).getFaqnum() %>"><%= list.get(i).getFaqcontent() %></td> </tr>
<% } %>
</table>
