<%@page import="com.project.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${conPath }/css/history.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>

$(document).ready(function(){
	
});



</script>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div id="mainForm_wrap1">
		<img src="${conPath }/img/gis.jpg" >
	</div>
	<div id="mainForm_wrap2">
			<h1><img src="${conPath }/img/monogram.PNG" ></h1>
	</div>
	<div id="mainForm_wrap3">
			<p>
				<b>SINCE 1605 <br> ITALY’S OLDEST <br> BALSAMIC VINEGAR PRODUCER</b>
			</p>
			<p>
				<br>Since the seventeenth century, the Giusti family has been producing balsamic vinegar, passing down a recipe that creates a complex harmony of flavors and a product of excellence, appreciated all over the world.
			</p>
			<p>
				<br><a href="${conPath}/location.do">찾아오기</a>
			</p>
	</div>
	
	



	<jsp:include page="../main/footer.jsp"/>
</body>
</html>