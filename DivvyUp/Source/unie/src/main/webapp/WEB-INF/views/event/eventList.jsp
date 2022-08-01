<%@ page language="java" contentType="text/html; charset= UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<title>Home</title>
	<meta charset="UTF-8">
	<link href="${conPath }/css/style.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.0.js" ></script>
	<script>
		$(document).ready(function(){
			
		});
	</script>
</head>
<body>
		<table>
			<caption>BOOK LIST</caption>
			
			<c:forEach var="event" items="${eventList }">
			<tr>
				<td>
				   이벤트 아이디: ${event.eid }<br>
				   <a href="${conPath }/event.do?method=eventDetail&eid=${event.eid}">
				   이벤트 이름:  ${event.ename }<br>
				   이벤트 내용:  ${event.econtent }<br>
				   이벤트 사진: <img src="${conPath }/bookImgFileUpload/${event.eimage}"></a><br>
				   이벤트 총지출:  ${event.eamount }<br>
				   이벤트 주소:  ${event.eaddress }<br>
				   이벤트 참여 자:  ${event.ecount }<br>
				   날짜:  ${event.erdate }<br>
				   낸 사람:  ${event.mid }<br>
				</td>
				</tr>
			</c:forEach>
			
		</table>
	
</body>
</html>