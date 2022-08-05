<%@page import="com.dto.notice.MemberDTO"%>
<%@page import="com.dto.notice.PageDTO"%>
<%@page import="com.dto.notice.NoticeDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<link rel="stylesheet" href="notice_faq_css/noticeTable.css">

<%  PageDTO Pdto = (PageDTO) request.getAttribute("pDTO");
	List<NoticeDTO> list = Pdto.getList();
	
	MemberDTO Mdto = (MemberDTO) session.getAttribute("login");
	System.out.print(Mdto);
%>
<h1>공지사항</h1>
<table>
<tr id="tr1"> <td>No.</td><td>제목</td><td>작성일</td><td>작성자</td> </tr>
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
	
<%	int perpage = Pdto.getPerPage();
	
	int totalcount = Pdto.getTotalCount();
	int totalpage = totalcount/perpage;
	if(totalcount%perpage != 0) totalpage++;
	out.print("<tr><td cellspacing= '0'  colspan='3'>");
	for(int i = 1; i<= totalpage; i++) {
		if(i == curpage) {
			out.print("&nbsp;"+i+"&nbsp;");
		}else {
			out.print("<a href='NoticeListServlet?curPage="+i+"'>"+"&nbsp;"+i+"&nbsp;"+"</a>");
		}//if
	}//for
%>

</td>  
<td><%  if(Mdto.getUserid().equals("admin") && Mdto.getUserpasswd().equals("admin")){ %>
	<input type="button" value="새 글작성" onclick="window.location.href='notice/NewNotice.jsp'">
<% }//if admin %>	</td> 
</tr>
</table>
