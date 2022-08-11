<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <%
 	String userId = (String) request.getAttribute("userId");
 	int count = (int) request.getAttribute("count");
 	System.out.println("userId"+userId);
 	System.out.println("count"+count);
 	if (count == 1){
 %>
		 검색한 아이디 [<span style="color: red;"><%= userId %></span>] 는 중복된 아이디입니다. <br>
 			다른 아이디를 입력해주세요.
 <%		
	} else {
 %>
 		 검색한 아이디 [<span style="color: blue;"><%= userId %></span>] 는 사용가능한 아이디입니다.<br>
 		 <button class="btn" id="useIdBtn">아이디 사용하기</button>	
 <% } %>
 
 <script type="text/javascript">
   $(document).ready(function(){
   	$("#useIdBtn").click(function(){
   		// 회원가입 창의 id에 찾은 데이터를 셋팅한다.
   		// opener - 나를 열게한 창
   		// opener.document - 나를 열게한 찬의 문서(HTML)
   		$(opener.document).find("#userId").val("${userId}");
   		// 창닫기를 한다.
   		window.close();
   	});
   });
</script>