<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.dto.heartlist.heartlistDTO"%>
<%@page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>좋아요</title>
<link rel="stylesheet"  href="HeartList/heart_01.css" />
<link rel="stylesheet"  href="HeartList/index6.css" />
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
  
<!-- 여기서부턴 제이쿼리 -->  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
//전체체크
$("#allCheck").on("click", function(){

	var result = this.checked;
	$(".check").each(function(idx, data){
		this.checked=result;;
	});
});



//개별 삭제 버튼
$(".delBtn").on("click", function(){

	var num=$(this).attr("data-xxx");
	location.href="HeartListDelServlet?num="+num;

});




//전체 선택
$("#allCheck").on("click", function(){
	
	var result=this.checked;
	$(".check").each(function(idx,data){
	data.checked=result;
		
	});
	
});



//전체 삭제
$("#delAllCart").on("click", function(){
	
	var num=[];
	$(".check:checked").each(function(idx, ele){
		num[idx] = $(this).val();
	});
	console.log(num);
 	location.href="HeartListDelAllServlet?data="+num; 
});




  
});
</script>   
</head>
<body>
<div class="header">
    <div class="progress-container">
      <div class="progress-bar"></div>
    </div>
  </div>
  <nav class="navBar">
    <div class="navBar_logo" >
      <a href="#"><img src="img/OGOLogo.jpg" alt=""></a>
    </div>
    <ul class="navBar_menu">
      <li><a href="">행성카테고리</a></li>
      <li><a href="MyPageServlet">MYSPACE</a></li>
      <li><a href="">공지사항&FAQ</a></li>
    </ul>
    <ul class="login">
      <!-- 로그인 마이페이지 더미-->
      <li><a href="#"><img src="img/login.png" alt="" style="height: 30px; width: 30px;"></a></li>
      <li><a href="#"><img src="img/mypage.png" alt="" style="height: 30px; width: 30px;"></a></li>
    </ul>
    
      <a href="" class="navBar_btn"><img src="/img/menu.png" alt=""></a>
  </nav>
  
   
     <section>
      <aside>
        <div class="side_bar">
          <p><a href="MyPageServlet" style="">프로필 관리</a></p>
          <p><a href="HeartListServlet">MY 찜</a></p>
          <p><a href="#">수강내역</a></p>
          <p><a href="#">튜터 등록</a></p>
        </div>
      </aside> 
       <main>
       <h1 style="line-height: 2.0; ">MY 찜</h1>
     <h2 style="position: relative; right: 330px; ">MY 찜 목록</h2>



			<table width="100%" cellspacing="0" cellpadding="0" border="0">

				<tr>
					<td height="5">
				</tr>

				<tr>
					<td colspan="10">
						<hr size="1" color="CCCCCC">
					</td>
				</tr>

				<tr>
					<td height="7">
				</tr>

				<tr style="height: 60px;">
					<th class="td_default" align="center"><strong>전체선택</strong><input type="checkbox"
						name="allCheck" id="allCheck" style="width: 100px;"></th>
					<!-- <th class="td_default" align="center"><strong>번호</strong></th> -->
					<th class="td_default" align="center" style="width: 150px;"><strong>클래스번호</strong></th>
					<th class="td_default" align="center"><strong>클래스정보</strong></th>
					<th class="td_default" align="center"><strong>가격</strong></th>
					<th width="100"></th>
					<th width="30"></th>
				</tr>

				<tr>
					<td height="7">
				</tr>



				<tr>
					<td colspan="10">
						<hr size="1" color="CCCCCC">
					</td>
				</tr>
				<form name="myForm">


<%
List<heartlistDTO> list = (List<heartlistDTO>) request.getAttribute("heartList");
for (int i = 0; i < list.size(); i++) {
	heartlistDTO dto = list.get(i);
	int classnum = dto.getClassNum();
	String classname = dto.getClassName();
	int price = dto.getPrice();
	String userid = dto.getUserId();
	int num = dto.getNum();
%>

				<tr>
					<td class="td_default" width="80">
						<!-- checkbox는 체크된 값만 서블릿으로 넘어간다. 따라서 value에 삭제할 num값을 설정한다. --> 
						<input type="checkbox" name="check" id="check81" class="check" value="<%=num %>"></td>
						

					<td class="td_default" width="80"><%=classnum %></td> 
					<!-- <td class="td_default" width="80"><img
				src="images/items/.gif" border="0" align="center"
				width="80" /></td> -->



					<td class="td_default" width="500">
						<br><%=classname %>
					</td>



					<td class="td_default" align="center" width="80"><%=price %></td>



					<td><input type="button" value="신청" onclick="order('81','a')"></td>



					<td class="td_default" align="center" width="30" style='padding-left: 10px'>
				<input type="button" value="삭제" class="delBtn" data-xxx="<%=num%>"></td><!-- data-xxx 사용자 정의 속성 -->
				<td height="10"></td> 


					<td height="10"></td>
				</tr>


				<% } %>

				</form>
				<tr>
					<td colspan="10">
						<hr size="1" color="CCCCCC">
					</td>
				</tr>
				<tr>
					<td height="30">
				</tr>

				<tr>
					<td align="left" colspan="5"><a class="a_black"
						href="javascript:orderAllConfirm(myForm)"> 전체 주문하기 </a>&nbsp;&nbsp;&nbsp;&nbsp;
						<a class="a_black" href="#" id="delAllCart"> 전체삭제하기 </a>&nbsp;&nbsp;&nbsp;&nbsp;</td>
				</tr>
				<tr>
					<td height="20">
				</tr>

			</table>



		</main>   
       <aside></aside>
      </section>
    

</body>
</html>