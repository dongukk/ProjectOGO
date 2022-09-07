<%@page import="com.dto.classpage.ClassDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ClassDTO cDTO = (ClassDTO)request.getAttribute("cDTO");
	String schedule1 =cDTO.getSchedule1();
	String schedule2 =cDTO.getSchedule2();
	String schedule3 =cDTO.getSchedule3();
	String schedule4 =cDTO.getSchedule4();
	String schedule5 =cDTO.getSchedule5();
	String schedule6 =cDTO.getSchedule6();
	String schedule7 =cDTO.getSchedule7();
	String schedule8 =cDTO.getSchedule8();
	String schedule9 =cDTO.getSchedule9();
	String schedule10 =cDTO.getSchedule10();

	
	String place =cDTO.getPlace();
%>
<div id="detail" class="page mb-5">
  <div class="name">
  	<div class="classpage_tab1-1">
   	 <h2 class="tab_menu">일정 및 장소 안내</h2>
    </div>
  </div>
   <div id="tab_scrollbar" class="classpage_tab1-1n classpageTab_hidden">
	<div class="row">
	  <div class="col-sm-2" id="classDetail1" style="text-align: center;">
	  	<b style="font-size: 20px;">-일정 </b><br>
	  </div>
	  <div class="col-sm-10">
	  		1회차 - <%=schedule1 %><br>
			2회차 - <% if(schedule2!=null){out.print(schedule2);}else{%>해당 클래스의 2회차 일정은 없습니다.<%}%><br>
			3회차 - <% if(schedule3!=null){out.print(schedule3);}else{%>해당 클래스의 3회차 일정은 없습니다.<%}%><br>
			4회차 - <% if(schedule4!=null){out.print(schedule4);}else{%>해당 클래스의 4회차 일정은 없습니다.<%}%><br>
			5회차 - <% if(schedule5!=null){out.print(schedule5);}else{%>해당 클래스의 5회차 일정은 없습니다.<%}%><br>
			6회차 - <% if(schedule6!=null){out.print(schedule6);}else{%>해당 클래스의 6회차 일정은 없습니다.<%}%><br>
			7회차 - <% if(schedule7!=null){out.print(schedule7);}else{%>해당 클래스의 7회차 일정은 없습니다.<%}%><br>
			8회차 - <% if(schedule8!=null){out.print(schedule8);}else{%>해당 클래스의 8회차 일정은 없습니다.<%}%><br>
			9회차 - <% if(schedule9!=null){out.print(schedule9);}else{%>해당 클래스의 9회차 일정은 없습니다.<%}%><br>
			10회차 - <% if(schedule10!=null){out.print(schedule10);}else{%>해당 클래스의 10회차 일정은 없습니다.<%}%><br>
			<br><br>
	  </div>
	</div>
	<div class="row">
		<div class="col-sm-2" id="classDetail2" style="text-align: center;">
			<b style="font-size: 20px;">-장소 </b><br>
		</div>
		<div class="col-sm-10">
			<%= place %>
			<br><br>
			<!-- 지도 -->
			<!-- <p style="margin-top:-12px">
			    <em class="link">
			        <a href="javascript:void(0);" onclick="window.open('http://fiy.daum.net/fiy/map/CsGeneral.daum', '_blank', 'width=981, height=650')">
			            혹시 주소 결과가 잘못 나오는 경우에는 여기에 제보해주세요.
			        </a>
			    </em>
			</p> -->
			<div class="card mt-3" style="width: 80%;">
			<div class="card-body">
			  <div id="map" class="" style="width:100%;height:350px;"></div>
		 	</div>  
		</div>
		</div>
	</div>
   </div>		
		
		
		
</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=563690bc120a15ac561d9ce73a5aa24e&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch('<%= place %>', function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;"><b>Here!</b></div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
        
        //이미지 지정
       var markerImage = new kakao.maps.MarkerImage(
              'class_img/map/earth.png',
              new kakao.maps.Size(80, 80), new kakao.maps.Point(34, 34));
          marker.setImage(markerImage);
    } 
});    
</script>
