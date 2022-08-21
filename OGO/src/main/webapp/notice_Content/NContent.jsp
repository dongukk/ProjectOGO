<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.dto.login.MemberDTO"%>
<%@page import="com.dto.notice.NoticeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function() {
		
		$("#update").click(function () {
			if ($("textarea").value == null || $("#titleC").value == null) {
				event.preventDefault();
				alert("내용을 입력해 주세요");
			} else {
				 $("form").attr("action", "Update_NoticeServlet"); 
				 $("form").submit();
			} //else
			 
		});//수정
			
	});
	</script>

<% NoticeDTO dto = (NoticeDTO) request.getAttribute("dto");
	MemberDTO Mdto = (MemberDTO) session.getAttribute("login");
	
	if ( Mdto == null || !Mdto.getUserId().equals("admin") ) {
	%>

<br><br><br><br><br>
<table class="tablewidth">
	<tr>
	 <td id="title">${dto.ntitle}</td><td>${dto.nickname}</td><td>${dto.ndate}</td>
	</tr>
	
	<tr>
	<td colspan="3" id="noticeContent">${dto.ncontent}<br><br><br><br></td>
	</tr>
</table>
	
<% } else if (  Mdto.getUserId().equals("admin") && Mdto.getUserPasswd().equals("admin")  ) { %>
	<br><br><br><br><br>
	<form method="get" action="#">
	<table class="tablewidth">
  <tr>
  	<td id="nnum"> <input type="hidden" name="nnum" value="<%= dto.getNnum() %>"> NO. ${dto.nnum} </td>
    <td id="Atitle"> <input id="titleC" type="text" name="ntitle"  value="${dto.ntitle}"> </td>
    <td class="tds" > ${dto.nickname} </td>
    <td class="tds" > ${dto.ndate} </td>
  </tr>
  <tr>
    <td colspan="4"> <textarea id="textarea" name="ncontent">&#10;&#10;<%=dto.getNcontent()%></textarea> </td>
  </tr>
</table>
<input class="btn" type="button" value="수정" id="update"> 
<input class="btn" type="button" value="삭제" onclick="window.location.href='Delete_NoticeServlet?nnum=<%= dto.getNnum() %>'">
</form>


<% }//else %>
<br>
<input class="btn" type="button" value="목록으로" onclick="location.href='NoticeListServlet'">