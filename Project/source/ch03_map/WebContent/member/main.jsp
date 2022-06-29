<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey="></script>
</head>
<body>
	<c:set var="SUCCESS" value="1"/>
	<c:set var="FAIL" value="0"/>
	<c:if test="${joinResult ==SUCCESS}">
		<script>swal('회원가입 성공','감사합니다','success');</script>
	</c:if>
	<c:if test="${joinResult ==FAIL}">
		<script>swal('회원가입 실패','다시 시도하시던지','error');</script>
	</c:if>
	<button onclick="location='${conPath}/joinView.do'">회원가입</button>
	<h2>회원가입한 회원의 주소를 마크함</h2>
	<hr>
	
	<div id="map" style="width:600;height:500px;"></div>

	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4c3b3a0a6b54af370ecb2b23f6ddcdf0&libraries=services"></script>
	<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
	        level: 10 // 지도의 확대 레벨
	    };  
	
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	</script>
	
	<c:forEach var="dto" items="${list }">
		<script>
		// 주소로 좌표를 검색합니다
			geocoder.addressSearch('${dto.address}', function(result, status) {
			
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
			            content: '<div class="info-title" style="width:150px;text-align:center;padding:0;">${dto.name}(${dto.id})</div>',
			            removable : true
			        });
			        infowindow.open(map, marker);
			
			        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			        map.setCenter(coords);
			    } 
			});    
		</script>
	</c:forEach>
</body>
</html>