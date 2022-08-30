<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    <c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title></title>
      <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
      <style>
      	#info{
      		position:relative;
      		width:90%;
      		text-align:center;
      		overflow:hidden;
      		margin:50px auto;
      	}
      
      	#info .addressLists{
      		float:left;
      		padding:5px;
      		margin: 10px auto;
      		width:20%;
      		text-align: left;
      		
      	}
      	#info .mapShow{
      		float:left;
      		margin: 10px auto;
      		width:80%;
      	}
      	#map{
      		height:800px;
      	}
      	h1{
      		font-size:3em;
      		
      	}
      	.label {
      		font-size:1.3em;
      		padding-top:20px;
      		font-weight:bold;
      	}
      	.locationAdd {
      		border-bottom: 1px solid lightgrey;
      		padding-bottom:30px;
      	}
      	.locationAdd:HOVER {
      		color:grey;
      		cursor: pointer;
      	}
      	div.scrollable {
		    width:100%;
			height: 800px;
			margin: 0;
			padding: 0;
			overflow: scroll;
		}
		h2{
			text-align:center;
		}
      </style>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	
	<div id="info">
		<h1> 찾아오기</h1><br>
			<table class="addressLists">
			<tr><td><div class="scrollable">
			<c:set var="i" value="1"/>
			<h2>◀ 지점찾기 ▶</h2>
				<c:forEach var="dto" items="${locationLists }">
						<div class="label">${dto.lStore }</div>
						<div class="locationAdd" style="color:#9D9C8C;">${dto.lAddress }</div>
						<c:set var="i" value="${i+1 }"/>
				</c:forEach>
				</div></td></tr>
			</table>
			
			<table class="mapShow">
				<tr><td><div id="map" ></div></td></tr>
			</table>
		
	</div>
	

	
	
	 

	<script src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=ae3ac4b51969b9d13ac49b8c2739c3b0&libraries=services"></script>
	<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(37.56575216993657  , 126.97951280073256), // 지도의 중심좌표
	        level: 8 // 지도의 확대 레벨
	    };  
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	// 주소로 좌표를 검색합니다
	
		$(document).ready(function(){
	 		list = ${locationLists };
	 		$.each(list, function (idx, item) {
	 			geocoder.addressSearch(item, function(result, status) {
	
	 		    // 정상적으로 검색이 완료됐으면 
	 		     if (status === kakao.maps.services.Status.OK) {
	
	 		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
	 		        // 결과값으로 받은 위치를 마커로 표시합니다
	 		        var marker = new kakao.maps.Marker({
	 		            map: map,
	 		            position: coords
	 		        });
						
	 		       	var iwContent = '<div style="width:150px;text-align:center;padding:6px 0;">'+item+'</div>'; // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
	 		      	var infowindow = new kakao.maps.InfoWindow({
	 		    	    content : iwContent
	 		      	});
	 		    	   
	 		    	
	 		        
					
	 		      kakao.maps.event.addListener(marker, 'mouseover', function() {
	 		    	  // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
	 		    	    infowindow.open(map, marker);
	 		    	   
	 		    	});
	 		    	// 마커에 마우스아웃 이벤트를 등록합니다
	 		    	kakao.maps.event.addListener(marker, 'mouseout', function() {
	 		    	    // 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
	 		    	    infowindow.close();
	 		    	});
	 		    
	 		     }
	 		});
		});
	 		
	});
	</script>
	

	
	<jsp:include page="../main/footer.jsp"/>
</html>


	