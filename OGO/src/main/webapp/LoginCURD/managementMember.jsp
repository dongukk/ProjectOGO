<%@page import="com.dto.login.MemberDTO"%>
<%@page import="com.service.login.MemberService"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	MemberService service = new MemberService();
    List<MemberDTO> list = service.select();
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function chk(n) {
		var lang= document.querySelectorAll(".delCheck");
		for(var i=0; i< lang.length; i++){
			lang[i].checked= n.checked;
		}
	}
	function delAll() {
		document.querySelector("#MemberForm").action='deleteAllMember.jsp';
	}
	function delMember(n) {
		 event.preventDefault(); 
		location.href="deleteMember.jsp?UserId="+n;		
	}
</script>
</head>
<body>
<h1>관리자 회원관리 목록</h1>
<form id="MemberForm">
<table border="1">
	<tr>
	   <th><input type="checkbox" name="delCheckAll" id="delCheckAll" onclick="chk(this)">전체선택</th>
	   <th>userId</th>
	   <th>userPasswd</th>
	   <th>userName</th>
	   <th>nickname</th>
	   <th>gender</th>
	   <th>birth</th>
	   <th>phone</th>
	   <th>우편번호</th>
	   <th>도로명주소</th>
	   <th>지번주소</th>
	   <th>email(</th>
	   <th>profilePhoto</th>
	   <th>hobby</th>
	   <th>삭제</th>
	 </tr>
<%
   for(MemberDTO dto: list){
%> 
 <tr>
    <td><input type="checkbox" name="delCheck"  class="delCheck" value="<%= dto.getUserId()%>"></td>
    <td><%= dto.getUserId()%></td>
    <td><%= dto.getUserPasswd()%></td>
    <td><%= dto.getUserName()%></td>
    <td><%= dto.getNickname()%></td>
    <td><%= dto.getGender()%></td>
    <td><%= dto.getBirth().substring(0,10)%></td>
    <td><%= dto.getPhone1()%>-<%= dto.getPhone2()%>-<%= dto.getPhone3()%></td>
    <td><%= dto.getPost()%></td>
    <td><%= dto.getAddress1()%></td>
    <td><%= dto.getAddress2()%></td>
    <td><%= dto.getEmail1()%>@<%= dto.getEmail2()%></td>
    <td><%= dto.getProfilePhoto()%></td>
    <td><%= dto.getHobby()%></td>
    <td><button onclick="delMember('<%=dto.getUserId() %>')" >삭제</button></td>
  </tr>
<%
   }
%>  
</table>
<button id="deleteAllMember" onclick="delAll()">선택된 항목 삭제</button>
</form>
</body>
</html>