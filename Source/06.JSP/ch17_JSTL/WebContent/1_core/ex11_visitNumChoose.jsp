<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${conPath }/css/style.css" rel="stylesheet">
</head>
<body>
	<c:set var="visitNum" value="${param.visitNum }"/>
	<c:choose>
		<c:when test="${visitNum eq 0 }">
			<h2>첫 방문 감사합니다</h2>
		</c:when>
		<c:when test="${visitNum > 0 && visitNum < 5 }">
			<h2>더 자주 뵙고싶어요</h2>
		</c:when>
		<c:when test="${visitNum >=5 }">
			<h2>자주 방문해주셔서 감사합니다</h2>
		</c:when>
		<c:when test="${visitNum < 0 }">
			<h2>제데로 된 방문 횟수를 받지 못했습니다</h2>
		</c:when>
	</c:choose>
</body>
</html>