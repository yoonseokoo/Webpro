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
	<form action="${conPath }/input.do" method="get">
		<p>이름 : <input type="text" name="name" value="${student.name }"></p>
		<p>아이디 : <input type="number" name="id" placeholder="ID는 자연수" value='<c:if test="${student.id!=0 }">${student.id }</c:if>'></p>
		<input type="submit">
	</form>
	<h4>${nameError }</h4>
	<h4>${idError }</h4>
</body>
</html>