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
<div id="detail">
  <div class="name">
    <h2>일정 및 장소 안내</h2>
  </div>
	<hr>
		<div id="classDetail">
			<b style="font-size: 20px;">-일정 :</b><br> 
			 &nbsp;&nbsp;1회차 - <%=schedule1 %><br>
			 &nbsp;&nbsp;2회차 - <% if(schedule2!=null){out.print(schedule2);}else{%>해당 클래스의 2회차 일정은 없습니다.<%}%><br>
			 &nbsp;&nbsp;3회차 - <% if(schedule3!=null){out.print(schedule3);}else{%>해당 클래스의 3회차 일정은 없습니다.<%}%><br>
			 &nbsp;&nbsp;4회차 - <% if(schedule4!=null){out.print(schedule4);}else{%>해당 클래스의 4회차 일정은 없습니다.<%}%><br>
			 &nbsp;&nbsp;5회차 - <% if(schedule5!=null){out.print(schedule5);}else{%>해당 클래스의 5회차 일정은 없습니다.<%}%><br>
			 &nbsp;&nbsp;6회차 - <% if(schedule6!=null){out.print(schedule6);}else{%>해당 클래스의 6회차 일정은 없습니다.<%}%><br>
			 &nbsp;&nbsp;7회차 - <% if(schedule7!=null){out.print(schedule7);}else{%>해당 클래스의 7회차 일정은 없습니다.<%}%><br>
			 &nbsp;&nbsp;8회차 - <% if(schedule8!=null){out.print(schedule8);}else{%>해당 클래스의 8회차 일정은 없습니다.<%}%><br>
			 &nbsp;&nbsp;9회차 - <% if(schedule9!=null){out.print(schedule9);}else{%>해당 클래스의 9회차 일정은 없습니다.<%}%><br>
			 &nbsp;&nbsp;10회차 - <% if(schedule10!=null){out.print(schedule10);}else{%>해당 클래스의 10회차 일정은 없습니다.<%}%><br>
			<br>
			<b style="font-size: 20px;">-장소 :</b><br>
			&nbsp;&nbsp;<%= place %>
			<br>
			<!-- <p style="margin-top:-12px">
			    <em class="link">
			        <a href="javascript:void(0);" onclick="window.open('http://fiy.daum.net/fiy/map/CsGeneral.daum', '_blank', 'width=981, height=650')">
			            혹시 주소 결과가 잘못 나오는 경우에는 여기에 제보해주세요.
			        </a>
			    </em>
			</p> -->
			<div id="map" style="width:80%;height:350px;"></div>
			
			
		</div>
	<!-- 아래에 지도 추가 -->
</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=50c0d79ee2b49a1d798768425a5d4203&libraries=services"></script>
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
            content: '<div style="width:150px;text-align:center;padding:6px 0;">Here!</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
        
        //이미지 지정
       var markerImage = new kakao.maps.MarkerImage(
              'img/earth.png',
              new kakao.maps.Size(80, 80), new kakao.maps.Point(34, 34));
          marker.setImage(markerImage);
    } 
});    
</script>
