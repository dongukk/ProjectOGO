<%@page import="java.util.List"%>
<%@page import="com.dto.ClassList.ClassListDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="style2.css">
<meta charset="UTF-8">
<title>OGO : 행성 카테고리</title>
</head>
<body>
	<div class="wrap">
		<div class="intro_bg">
			<div class="header">
				<ul class="nav">
				<a href="#" id="logo">
					<img src="image/whitelogo.png" width="150" height="60">
				</a>
				
				<li><a href="#id_main_text0">행성 카테고리</a></li>
				<li><a href="#">MY SPACE</a></li>
				<li><a href="#">공지사항&FAQ</a></li>
				</ul>
			</div>
			<div class="intro_text">
			<h1>내가 원하는 행성으로, 바로 착지!</h1>
			<h4 class="contents1">배우고 싶었던 분야를 전문가에게 직접, 원하는 일정에 들어보세요</h4>
			</div>	
		</div>
	</div>		
	<!-- intro end -->
	
	<ul class="amount">
	<li>
		<div>
			<div class="contents1">지금까지 생성된 행성 수</div>
			<div class="result">815</div>
		</div>
	</li>
	<li>
		<div>
			<div class="contents1">우주를 탐험 중인 비행사</div>
			<div class="result">3,234</div>
		</div>
	</li>
	<li>
		<div>
			<div class="contents1">최종 목표 행성수</div>
			<div class="result">100,000+</div>
		</div>
	</li>
	<li>
		<div>
			<div class="contents1">함께 하는 이들</div>
			<div class="result">21,084</div>
		</div>
	</li>
	</ul>
	<!-- amount end -->
	
	<!-- 본문 시작 -->
	<div class="main">
	<div class="main_text0" id="link_main_text0">
		<h1>CLASS LIST</h1>
		<div class="contents1">필터링 기능으로 원하는 행성을 찾으세요</div>
		</div>
	
	
	<!-- 필터링 시작 !!!!대실패!!!!-->
	<main class="search container">
			<ul class="select_list sticky_list" style="transition: top 0.2s ease 0s;">
			<li>
			<button type="button" class="dropdown_filed">
			"카테고리"
			</button>
			<div class="filter_contents filter_depth3 filter_category">
				<ul class="depth1_list">
					<li class="depth1" data-id>뷰티</li>
					<li class="depth1" data-id>외국어</li>
					<li class="depth1" data-id>댄스·뮤직</li>
					<li class="depth1" data-id>요리·공예</li>
					<li class="depth1" data-id>드로잉·디자인·영상</li>
				</ul>
				<!--  [D] depth1 개수만큼 .sub_contents 생성 -->
				<div class="sub_contents">
					<ul>
						<li data-tier2="" class="sub_cate">메이크업</li>
						<li data-tier2="" class="sub_cate">스타일링</li>
					</ul>
					<ul>
						<li data-tier2="" class="sub_cate">영어</li>
						<li data-tier2="" class="sub_cate">일본어·중국어</li>
						<li data-tier2="" class="sub_cate">기타 외국어</li>
					</ul>
					<ul>
						<li data-tier2="" class="sub_cate">댄스</li>
						<li data-tier2="" class="sub_cate">뮤직</li>
					</ul>
					<ul>
						<li data-tier2="" class="sub_cate">요리·음료</li>
						<li data-tier2="" class="sub_cate">공예·DIY</li>
					</ul>
					<ul>
						<li data-tier2="" class="sub_cate">디자인</li>
						<li data-tier2="" class="sub_cate">영상</li>
					</ul>
				</div></div>
				<li>
				<button type="button" class="dropdown_filed">
				"지역"
				</button>
				<div class="filter_contents filter_depth3 filter_region">
				<form action>
					<ul class="depth1_list">
						<li class="depth1">
						서울
						<span class="count"></span>
						</li>
						<li class="depth1">
						경기
						<span class="count"></span>
						</li>
						<li class="depth1">
						인천
						<span class="count"></span>
						</li>
						<li class="depth1">
						부산
						<span class="count"></span>
						</li>
						<li class="depth1">
						경상,대구,울산
						<span class="count"></span>
						</li>
						<li class="depth1">
						대전,충청
						<span class="count"></span>
						</li>
						<li class="depth1">
						강원
						<span class="count"></span>
						</li>
						<li class="depth1">
						광주,전라,제주
						<span class="count"></span>
						</li>
						</ul>
						</form>
						</div>		
					
					<li>
						<button type="button" class="dropdown_filed">
						"일정"
						</button>
						<div class="filter_contents filter_depth2 filter_schedule">
						<form action>
						<div class="depth2">
							<p class="filter_title">요일</p>
							<ul>
								<li class="list">
									<input type="checkbox" class="blind" id="mon" name="day" value="1">
									<lable for="mon" class="inp_chkbox">월요일</lable>
								</li>
								<li class="list">
									<input type="checkbox" class="blind" id="tue" name="day" value="2">
									<lable for="tue" class="inp_chkbox">화요일</lable>
									</li>
									<li class="list">
									<input type="checkbox" class="blind" id="wed" name="day" value="3">
									<lable for="wed" class="inp_chkbox">수요일</lable>
									</li>
									<li class="list">
									<input type="checkbox" class="blind" id="thu" name="day" value="4">
									<lable for="thu" class="inp_chkbox">목요일</lable>
									</li>
									<li class="list">
									<input type="checkbox" class="blind" id="fri" name="day" value="5">
									<lable for="fri" class="inp_chkbox">금요일</lable>
									</li>
									<li class="list">
									<input type="checkbox" class="blind" id="sat" name="day" value="6">
									<lable for="sat" class="inp_chkbox">토요일</lable>
									</li>
									<li class="list">
									<input type="checkbox" class="blind" id="sun" name="day" value="0">
									<lable for="sun" class="inp_chkbox">일요일</lable>
									</li>
								</ul>
							</div>
						</form>
						<div class="depth2">
						<p class="filter_title">시간</p>
						<ul>
						<li classs="list">
							<input type="checkbox" class="blind" id="morning" name="time" value="1">
							<lable for="morning" class="inp_chkbox">오전 (6:00 - 12:00)</lable>
						</li>
						<li class="list">
							<input type="checkbox" class="blind" id="afternoon" name="time" value="2">
							<lable for="afternoon" class="inp_chkbox">오후 (12:00 - 16:00)</lable>
						</li>
							<li class="list">
							<input type="checkbox" class="blind" id="evening" name="time" value="2">
							<lable for="evening" class="inp_chkbox">저녁 (18:00 - 24:00)</lable>
						</li>
						</ul>
					</div>
			</div>
		</ul>
	</main>



	<!-- 상품 목록 (임시) 3개씩 정렬 -->
<table width="100%" cellspacing="0" cellpadding="0">

	<tr>
		<td>
			<table align="center" width="710" cellspacing="0" cellpadding="0" border="0">
				
				<tr>
					<td height="5"></td>
				</tr>
				<tr>
					<td height="1" colspan="8" bgcolor="CECECE"></td>
				</tr>
				<tr>
					<td height="10"></td>
				</tr>

				<tr>
				<% List<ClassListDto> listDTO = (List<ClassListDto>) request.getAttribute("listDTO"); %>
				<% for(int i=0; i<listDTO.size(); i++){ %>
				<td>
							<table style='padding:15px'>
								<tr>
									<td>
										
									</td>
								</tr>
								<tr>
								
									<td height="10">
								</tr>
								<tr>
									<td class= "td_default" align ="center">
										<a class= "a_black" href=""> 
										<br>
										</a>
										<font color="gray">
										<!-- 이미지 더미// 나중에 이미지 연결 수정할 것 -->
										<a href="#">
										 <img src="classlistimg/B_lan/lan1_1.jpg" width="320" height="210">
										</a>
										</font>
									</td>
									
								</tr>
								<tr>
									<td height="10">
								</tr>
								<tr>
									<td class="td_gray" align ="center"><strong>
									<%= listDTO.get(i).getClassName() %></strong>
									</td>
								</tr>
								<tr>
									<td height="10">
								</tr>
								<tr>
									<td class="td_red" align ="center"><font color="red">
									<%= listDTO.get(i).getPrice() %>	</font>
									</td>
								</tr>
							</table>
						</td>
					<!-- 한줄에 3개씩 보여주기 -->	
				   <%
				      if(i%3==0){
				   %>
				       <tr>
				        <td height="30">
				       </tr>
				   <%
				      }//end if
				   %>		
						
<%
    }//end for
%>
				
			</table>
		</td>
	</tr>
	<tr>
		<td height="50">
	</tr>
</table>
    



		
				
	
	
<!-- 드롭박스로 오른쪽 정렬 <div class="filter">최신순/</div> -->
<!-- 	<div class="top">
	<div class="sorting">
    <button class="dropbtn">
      <span class="dropbtn_content">최신순</span>
      <span class="dropbtn_click" style="font-family: Material Icons; font-size : 20px; color : #3b3b3b; float:right;"
        onclick="dropdown()"><img src="/image/dropdown_icon.jpg"></span>
    </button>
    <div class="dropdown-content">
      <div class="sort" onclick="showMenu(this.innerText)">최신순</div>
      <div class="sort" onclick="showMenu(this.innerText)">인기순</div>
      <div class="sort" onclick="showMenu(this.innerText)">금액이 높은순</div>
      <div class="sort" onclick="showMenu(this.innerText)">금액이 낮은순</div>
    </div>
  </div>
		</div> -->
		
		<!-- 좌측 검색창-->
		<div class="menu">
		<div class="searchArea">
				<form>
				<input type="search" placeholder="Search">
				<span>검색</span>
				</form>
				</div>
		<!-- 좌측 카테고리 -->
		<ul class="category">
		<li>
			<a href="#">뷰티</a>
			<ul class="subcate">
				<li><a href="#">메이크업</a></li>
				<li><a href="#">스타일링</a></li>
			</ul>
		</li>
		<li>
			<a href="#">외국어</a>
			<ul class="subcate">
				<li><a href="#">영어</a>	
				<li><a href="#">일본어·중국어</a>	
				<li><a href="#">기타 외국어</a>	
			</ul>
		</li>
		<li>
			<a href="#">댄스·뮤직</a>
			<ul class="subcate">
				<li><a href="#">댄스</a>	
				<li><a href="#">뮤직</a>	
			</ul>
		</li>
		<li>
			<a href="#">요리·공예</a>
			<ul class="subcate">
				<li><a href="#">요리·음료</a>	
				<li><a href="#">공예·DIY</a>		
			</ul>
		</li>
		<li>
			<a href="#">드로잉·디자인·영상</a>
			<ul class="subcate">
				<li><a href="#">디자인</a>	
				<li><a href="#">영상</a>	
			</ul>
		</li>
		</ul>
		</div>
		
			

	<!--중간 main_text0 end -->
	
	<div class="main_text2">
		<ul>
			<li>
			<div><h1>클래스 등록</h1></div>
			<div>어떤 분야든 전문성을 갖고있다면, 지금 바로 클래스를 등록해주세요</div>
			<div class="more2">
			클래스 등록하기
			</div>
			</li>
			<li></li>
		</ul>
	</div>

	<!-- footer html 현재 기능 아무것도 없음-->
	<footer>
	<div class="container">
		<div class="f_top">
			<ul class="f_nav">
				<li class="depth1">
				<p class="tit">COMPANY</p>
					<ul class="depth2">
						<li><a href="#" target="_blank">회사 소개</a></li>
						<br>
						<li><a href="#" target="_blank">언론 보도</a></li>
					</ul>	
				</li>
				<li class="depth1">
				<p class="tit">POLICIES</p>
					<ul class="depth2">
						<li><a href="#" target="_blank">이용약관</a></li>
						<br>
						<li><a href="#" target="_blank">개인정보처리방침</a></li>
					</ul>	
				</li>
				<li class="depth1">
				<p class="tit">SUPPORT</p>
					<ul class="depth2">
						<li><a href="#" target="_blank">FAQ</a></li>
						<br>
						<li><a href="#" target="_blank">공지사항</a></li>
					</ul>	
				</li>
				<li class="depth1">
				<p class="tit">B2B</p>
					<ul class="depth2">
						<li><a href="#" target="_blank">기업교육</a></li>
						<br>
						<li><a href="#" target="_blank">브랜드제휴</a></li>
					</ul>	
				</li>
			</ul>
		</div>
	</div>
	
	<div class="container2">
		<div class="f_info">
			<p>상호:(주)오고  |  주소 : 서울특별시 강남구 테헤란로 70 5층  |  사업자등록번호 : 123-45-67890  |  대표자명 : 김취준</p>
			<p>(주)오고는 통신판매중개자이며 통신판매의 당사자가 아닙니다. 따라서 (주)오고는 튜터가 등록한 상품·클래스정보 및 거래에 관한
의무와 책임을 지지 않습니다. 단, (주)오고가 튜터로 등록, 판매한 클래스는 튜터로서 의무와 책임을 부담합니다.</p>
			<br>
			<p>Copyright ⓒ2022 ogo inc, ltd. All rights reserved</p>
		</div>
	</div>
	</footer>
<a href="#">페이지 위로 이동</a>

<script src="./index.js"></script>
</body>
</html>