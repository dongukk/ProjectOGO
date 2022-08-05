<%@page import="com.dto.notice.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% MemberDTO dto = (MemberDTO) session.getAttribute("login"); 
    	String userid = dto.getUserid();
    %>
    <form action="../Create_NoticeServlet" method="get" >
    <table border="1">
    <tr> <td> <input name="ntitle" type="text" placeholder="제목을 입력해 주세요"> </td> <td id="today"></td> <td><%= userid %></td> </tr>
    <tr> <td colspan="3"> <textarea name="textarea" rows="10" cols="50" placeholder="내용을 입력해 주세요"> </textarea></td> </tr>
    </table>
    <input type="submit" value="글 작성하기"><input type="reset" value="다시쓰기">
    </form>
    
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script type="text/javascript">
	let today = new Date();
    var date = today.toLocaleDateString();
	console.log(date);
	$("#today").text(date);
	</script>