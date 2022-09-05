<%@page import="com.dto.login.MemberDTO"%>
<%@page import="com.dto.notice.PageDTO"%>
<%@page import="com.dto.notice.NoticeDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&family=Secular+One&display=swap" rel="stylesheet">
	
	<link rel="stylesheet" href="notice_faq_css/noticeTable.css">

<%  PageDTO Pdto = (PageDTO) request.getAttribute("pDTO");
	List<NoticeDTO> list = Pdto.getList();
	
	MemberDTO Mdto = (MemberDTO) session.getAttribute("login");
%>
<div style="font-size: 80px;   font-family: 'Secular One', sans-serif; color: black; padding-top: 66px;"  >NOTICE</div>
<table id="notice_table1">
<tr id="tr1"> <td>No.</td><td id="td2">제목</td><td id="td3">작성일</td><td>작성자</td> </tr>
<% 
int curpage = Pdto.getCurPage();
//for (NoticeDTO dto : list ) { 
for(int i=0; i< list.size(); i++){
%>
<tr>    
		<td>
		<% if(curpage == 1) {%>
		<%= i+1 %>
		<% } else { %>
		<%= ((curpage-1)*6+i)+1 %>
		<% } %>
		</td>
		<td><a id="a1" href="NoticeContentServlet?Nnum=<%= list.get(i).getNnum()%>"><%= list.get(i).getNtitle() %></a></td>
		<td><%= list.get(i).getNdate() %></td>
		<td><%= list.get(i).getNickname() %></td> 
</tr>
<% }//for %>


</table>
	<table id="notice_table2">
		<tr>
			<td colspan="2" id="notice_perage1">
				<br>
				<%	int perpage = Pdto.getPerPage();
					
					int totalcount = Pdto.getTotalCount();
					int totalpage = totalcount/perpage;
					if(totalcount%perpage != 0) totalpage++;
					for(int i = 1; i<= totalpage; i++) {
						if(i == curpage) {
							out.print("&nbsp;"+i+"&nbsp;");
						}else {
							out.print("<a href='NoticeListServlet?curPage="+i+"'>"+"&nbsp;"+i+"&nbsp;"+"</a>");
						}//if
					}//for
				%>
			</td>
		</tr>
		<tr>
			<td>
					<%  if(Mdto != null) {
				
				if(Mdto.getUserId().equals("admin") && Mdto.getUserPasswd().equals("admin")){ %>
					 <input id="btn" style="  color: #ffffff; background: #8041D9; float: right;" type="button" value="새 글작성" onclick="window.location.href='notice/NewNotice.jsp'">
				<% }
				}//if admin %> 
			</td>
		<tr>
</table>