<%@page import="com.dto.login.MemberDTO"%>
<%@page import="com.dto.login.PageDTO"%>
<%@page import="com.service.login.MemberService"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	MemberService service = new MemberService();
    List<MemberDTO> list = service.select();
 
   /*  PageDTO Pdto = (PageDTO) request.getAttribute("pDTO");
	List<MemberDTO> Plist = Pdto.getList(); */
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
	
	// 체크박스 다중선택
	function chk(n) {
		var lang= $(".delCheck");
		for(var i=0; i< lang.length; i++){
			lang[i].checked= n.checked;
		}
	}
	
	// 선택된 항목 회원들 삭제
	function delAll() {
		document.querySelector("#MemberForm").action='deleteAllMemberServlet'; 
	}
	
	// 회원 1명 삭제
	function delMember(n) {
		event.preventDefault(); 
		location.href="deleteMemberServlet?userId="+n;		
	}

</script>
<style type="text/css">
	#title{text-align: center; margin-top: 100px;}
	#MemberForm {min-width: 1550px; margin-bottom: 50px;}
	#MemberForm #table{ border: 1px solid !important; margin-left: auto; margin-right: auto;} 
	#MemberForm #table_head {height: 50px; color: white; background-color: gray;}
	#MemberForm #hobby{width: 400px;}
	#MemberForm #deleteAllMember{margin-left: 50px; margin-top: 10px;}
	#MemberForm #searchName{float: left;}
	#MemberForm #order{float: right; margin-right: 0;}
</style>
</head>
<body>
<h1 id="title">회원관리 목록</h1>
<form id="MemberForm">
<table border="1" cellpadding=5 cellspacing=10 id="table">
<!-- 검색기능 -->
		<tr>
			<td colspan="5">
				<form id="searchName" action="EmpListServlet">
					<select name="searchName">
						<option value="nickname">닉네임</option>
						<option value="job">등급</option>
					</select> <input type="text" name="searchValue"> <input
						type="submit" value="검색">
				</form>
			</td>

			<td colspan="10">
			  <form id="order" action="EmpOrderServlet">
			 	 등급 순 : <input type="radio" name="order" value="job" checked="checked"/>
			     닉네임 순 : <input type="radio" name="order" value="nickname"  />
				  <input type="submit" value="정렬">
               </form>
			</td>

		</tr>
	<tr id="table_head">
	   <th><input type="checkbox" name="delCheckAll" id="delCheckAll" onclick="chk(this)"></th>
	   <th>userId</th>
	   <th>nickname</th>
	   <th>birth</th>
	   <th>phone</th>
	   <th>주소</th>
	   <th>email</th>
	   <th id="hobby">hobby</th>
	   <th>등급</th>
	   <th>탈퇴</th>
	 </tr>
<%
   for(MemberDTO dto: list){
	String userId = dto.getUserId();
%>
 <tr>
    <td><input type="checkbox" name="delCheck"  class="delCheck" value="<%= dto.getUserId()%>"></td>
    <td><%= dto.getUserId()%></td>
    <td><%= dto.getNickname()%></td>
    <td><%= dto.getBirth().substring(0,10)%></td>
    <td><%= dto.getPhone1()%>-<%= dto.getPhone2()%>-<%= dto.getPhone3()%></td>
    <td><%= dto.getAddress2()%></td>
    <td><%= dto.getEmail1()%>@<%= dto.getEmail2()%></td>
    <td><%= dto.getHobby()%></td>
    <td><%if( userId.equals("admin")) { %>관리자
        <%} else if( userId.contains("tutor")) { %>강사
    	<%} else {%>일반회원
    <%}%></td>
    <td><button onclick="delMember('<%=dto.getUserId() %>')" >탈퇴</button></td>
  </tr>
<%
   }
%>  
</table>
<button id="deleteAllMember" onclick="delAll()">선택한 회원 탈퇴</button>
</form>
</body>
</html>