<%@page import="java.io.Console"%>
<%@page import="com.dto.login.MemberDTO"%>
<%@page import="com.dto.login.PageDTO"%>
<%@page import="com.service.login.MemberService"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	
	PageDTO pDTO = (PageDTO) request.getAttribute("pDTO");
	List<MemberDTO> list = pDTO.getList();
	
	String searchName = (String)request.getAttribute("searchName");
	String  searchValue = (String)request.getAttribute("searchValue");
	if(searchValue==null) {searchValue = "";}
	System.out.println("search : "+searchName +"\t" + searchValue);
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
	#ManageMember {padding-top: 100px; padding-bottom: 10px;}
	#ManageMember #title {text-align: center;  margin-bottom: 30px; }
	#ManageMember #table { border: 1px solid !important; margin-left: auto; margin-right: auto; min-width: 1550px; margin-bottom: 5px;} 
	#ManageMember #table_head {height: 50px; color: white; background-color: gray;}
	#ManageMember #hobby {width: 400px;}
	#ManageMember #deleteAllMember {margin-left: 20px; margin-top: 10px;}
	#ManageMember #search {float: left;}
	#memberPage {text-align: center; font-size: 20px; font-family: 'Noto Sans KR', sans-serif; margin-left: auto; margin-right: auto; margin-top: 10px;}
    #memberPage a {text-decoration: none; }
    
</style>
</head>
<body>
<section id="ManageMember">
<h1 id="title">회원관리 목록</h1>
<table border="1" cellpadding=10 id="table">
<!-- 검색기능 -->
		<tr>
			<td colspan="5">
				<form id="search" action="ManageListServlet">
					<select name="searchName" >
						<option value="nickname" <% if("nickname".equals(searchName) || searchName == null){ %> selected="selected" <%}%> >닉네임</option>
						<option value="address" <% if("address".equals(searchName)){ %> selected="selected" <%}%> >주소</option>
					</select> 
					<input type="text" name="searchValue" value="<%=searchValue%>">	
					<input type="submit" id="searcBtn" value="검색">
				</form>
			</td>
		</tr>
<form id="MemberForm">
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
<% } %>  <!-- end for -->
</table>
<div id="memberPage">
	
				<%	
				int curPage = pDTO.getCurPage();	//현재 볼 페이지 번호
		        int perPage = pDTO.getPerPage();	//한페이지에 보여질 목록 수 
				int totalCount = pDTO.getTotalCount(); //전체 레코드 갯수 
				int totalPage = totalCount/perPage;	// 전체 페이지 수
				if(totalCount%perPage!=0) totalPage++;	// ex) 전체레코드 9개/보여질목록수 2개 = 나머지1  전체페이지 증가++
		        for(int i=1; i<= totalPage; i++){		// 1부터 전체피이즈수까지 증가
		          	if(i== curPage){					// 만약 i가 현재볼 페이지라면
		          		out.print(i+"&nbsp;");			// i를 보여준다
		          	}else{								// RowBound(offset, limit) // 시작 idx, 몇개
		          		                                //   offset = (원하는 페이지, -1)* perpage
		          		                                //   limit = purpage
		          		out.print("<a href='ManageListServlet?curPage="+i+"&searchName="+searchName+"&searchValue="+searchValue+"'>"+"&nbsp;"+i+"&nbsp;"+"</a>");
		          	}
		        }//end for
				%>
</div>
<button id="deleteAllMember" onclick="delAll()">선택한 회원 탈퇴</button>
</form>
</section>
</body>
</html>