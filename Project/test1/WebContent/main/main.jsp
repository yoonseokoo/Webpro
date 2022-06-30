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
	<link href="${conPath }/css/main.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>  
	
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	
	<c:set var="SUCCESS" value="1"/>
	<c:set var="FAIL" value="0"/>
		
		<c:if test="${not empty loginErrorMsg }">
			<script>
				alert('${loginErrorMsg}');
				history.back();
			</script>
		</c:if>
		<c:if test="${not empty loginResult }">
			<script>
				alert('로그인 성공');
			</script>
		</c:if>
		
	<c:if test="${not empty  modifyResult}">
		<script>
			alert('${modifyResult}');
		</script>
	</c:if>
	<c:if test="${not empty  modifyErrorMsg}">
		<script>
			alert('${modifyErrorMsg}');
			history.back();
		</script>
	</c:if> 
			<div id="mainForm_wrap1">
				<img src="${conPath }/img/main1.jpg" >
				<a href=“${conPath}/#” class="btn1">제품보기</a>
				<a href=“${conPath}/#” class="btn2">찾아오기</a>
				
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
					<br><a href=“${conPath}/#” >찾아오기</a>
				</p>
			</div>
			<div class="slide_banner">
				<figure>
		  			<img src="${conPath }/img/ssp1.jpg" width="auto" height="400">
					<img src="${conPath }/img/ssp2.jpg" width="auto" height="400">
					<img src="${conPath }/img/ssp3.jpg" width="auto" height="400">
					<img src="${conPath }/img/ssp4.jpg" width="auto" height="400">
					<img src="${conPath }/img/ssp5.jpg" width="auto" height="400">
					<img src="${conPath }/img/ssp6.jpg" width="auto" height="400">
					<img src="${conPath }/img/ssp7.jpg" width="auto" height="400">
				</figure>
			</div>
		
		<jsp:include page="../main/footer.jsp"/>
		
	</body>
</html>