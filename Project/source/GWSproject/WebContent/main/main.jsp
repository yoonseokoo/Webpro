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
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	
	<%-- <c:set var="SUCCESS" value="1"/>
	<c:set var="FAIL" value="0"/>
		
		<c:if test="${not empty loginErrorMsg }">
			<script>
				alert('${loginErrorMsg}');
				history.back();
			</script>
		</c:if> --%>

			<div id="mainForm_wrap">
				<img src="${conPath }/img/main1.jpg" >
				<a href=“${conPath}/#” class="btn1">제품보기</a>
				<a href=“${conPath}/#” class="btn2">찾아오기</a>
			</div>
			

	
		
		<jsp:include page="../main/footer.jsp"/>
	</body>
</html>