<%@page import="java.io.Console"%>
<%@page import="com.dto.login.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	MemberDTO dto=(MemberDTO)session.getAttribute("login");
	System.out.println(dto);
%>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$(".more2").on("click", function() {
			console.log(<%=dto%>);
			if (<%=dto%>==null) {
				alert("로그인 후 이용해주세요");
				event.preventDefault();
			}
		})
	})	

</script>