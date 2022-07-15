<%@ page language="java" contentType="text/html; charset= UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${conPath }/css/style.css" rel="stylesheet">
</head>
<body>
	<h2>This page is StudentNG.jsp</h2>
	<h3>failed ID during confirm : ${id } (model's id)</h3>
	<h3>failed ID during confirm : ${param.id } (parameter's id)</h3>
</body>
</html>