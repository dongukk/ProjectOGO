<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<!-- 네비게이션 헤드바  -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="Stylesheet">
<link rel="stylesheet" type="text/css" href="ClassList_css/style.css">
<meta charset="UTF-8">
<title>OGO : 행성 카테고리</title>
<jsp:include page="common/nav.jsp" flush="false"/>
</head>
<body>
	<div class="wrap">
		<div class="intro_bg">
		<!-- 임시 nav 막아놓음 -->
			<!--  <div class="header">
				<ul class="nav">
				<a href="#" id="logo">
					<img src="ClassList_img/textlogo.png">
				</a>
				
				<li><a href="#id_main_text0">행성 카테고리</a></li>
				<li><a href="#">MY SPACE</a></li>
				<li><a href="#">공지사항&FAQ</a></li>
				</ul>
			</div>  -->
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
	
	<div class="main_text0" id="link_main_text0">
		<h1>CLASS LIST</h1>
		<div class="contents1">필터링 기능으로 원하는 행성을 찾으세요</div>
		<div class="searchArea">
				<form>
				<input type="search" placeholder="Search">
				<span>검색</span>
				</form>
				</div>
		<!-- 카테고리 -->
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
		<ul class="icons">
		<li>
		<div></div>
		</li>
		<li></li>
		<li></li>		
	</ul>

	
	
	<!--중간 main_text0 end -->
	
	<div class="main_text2">
		<ul>
			<li>
			<div><h1>클래스 등록</h1></div>
			<div>어떤 분야든 전문성을 갖고있다면, 지금 바로 클래스를 등록해주세요</div>
			<div class="more2" onclick="location.href='ClassPage'">
			클래스 등록하기
			</div>
			</li>
			<li></li>
		</ul>
	</div>


	
	<footer>
	<div>
	COMPANY
	</div>
	<div>
	<h3>SUPPORT</h3>
	<br>
	<br>개인정보처리방침
	<br>
	<br>FAQ
	
	</div>
	</footer>
<a href="#">페이지 위로 이동</a>
</body>
</html>