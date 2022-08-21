<%@page import="com.dto.login.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <% MemberDTO dto = (MemberDTO) session.getAttribute("login"); 
    	String userid = dto.getUserId();
    %>
    <br><br><br> <!-- 위에서 3칸 내려옴 -->
    <div class="row">
		<div class="col-md-4"></div> <!-- 입력칸을 가운데로 만들기 위한 빈 공간 -->
		<div class="col-md-4">
    <form action="../Create_NoticeServlet" method="get" >
    <table>
    
    <tr> <td style=" width: 60%"> <input id="title" name="ntitle" type="text" placeholder="제목을 입력해 주세요" > </td> 
    <td id="today" class="tds"></td> 
    <td class="tds"><%= userid %></td> </tr>
    
    <tr> <td colspan="3"> <textarea name="textarea" rows="30" cols="100" > </textarea></td> </tr>
    </table>
    <input type="submit" value="글 작성하기" class="btn">
    <input type="reset" value="다시쓰기" class="btn">
    </form>
    </div>
		<div class="col-md-4" ></div> <!-- 입력칸을 가운데로 만들기 위한 빈 공간 -->
	</div>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script type="text/javascript">/* 오늘 날짜 불러오기 */
	let today = new Date();
    var date = today.toLocaleDateString();
	console.log(date);
	$("#today").text(date);
	
	$("form").submit(function() {
		console.log($("textarea").value);
		console.log($("#title").value);
		
 		if ($("textarea").value == null || $("#title").value == null) {
			event.preventDefault();
			alert("내용을 입력해 주세요");
		}  

	});
	</script>