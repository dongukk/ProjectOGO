<%@page import="com.dto.notice.MemberDTO"%>
<%@page import="com.dto.notice.NoticeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function() {
		$("#update").click(function () {
			 $("form").attr("action", "Update_NoticeServlet"); 
			 $("form").submit();
			
		});//수정
			
	});
	</script>

<% NoticeDTO dto = (NoticeDTO) request.getAttribute("dto");
	MemberDTO Mdto = (MemberDTO) session.getAttribute("login");

	if( Mdto.getUserid().equals("admin") && Mdto.getUserpasswd().equals("admin") ){
	%>
	<div>
	<a href="NoticeListServlet">목록으로</a>
	</div>
	
	<form method="get" action="#">
	<table>
  <tr>
  	<td> <input type="hidden" name="nnum" value="<%= dto.getNnum() %>"> NO. ${dto.nnum} </td>
    <td> <input type="text" name="ntitle" style="width: 400px;" value="${dto.ntitle}"> </td>
    <td> ${dto.nickname} </td>
    <td> ${dto.ndate} </td>
  </tr>
  <tr>
    <td colspan="4"> <textarea style="width: 600px; height: 400px;" name="ncontent"><%=dto.getNcontent()%></textarea> </td>
  </tr>
</table>
<input type="button" value="수정" id="update"> <input type="button" value="삭제" onclick="window.location.href='Delete_NoticeServlet?nnum=<%= dto.getNnum() %>'">
</form>
<% } else { %>
<div>
	<a href="NoticeListServlet">목록으로</a>
</div>

<table border='1'>
	<tr>
	 <td>${dto.ntitle}</td><td>${dto.nickname}</td><td>${dto.ndate}</td>
	</tr>
	
	<tr>
	<td colspan="3">${dto.ncontent}<br><br><br><br></td>
	</tr>
</table>

<% }//else %>