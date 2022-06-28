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
	<c:set var="SUCCESS" value="1"/>
	<c:set var="FAIL" value="0"/>
		<c:if test="${not empty loginErrorMsg }">
			<script>
				alert('${loginErrorMsg}');
				history.back();
			</script>
		</c:if>

		<c:if test="${empty member }">
			<div id="mainForm_wrap">
				<h2>Main</h2>
			</div>
		</c:if>
	
		<c:if test="${not empty member }">
			<div id="mainForm_wrap">
				<table>
					<h2>${member.mName }(${member.mId })님 어서오세요</h2>
				</table>
			</div>		
		</c:if>
		<jsp:include page="../main/footer.jsp"/>
	</body>
</html>