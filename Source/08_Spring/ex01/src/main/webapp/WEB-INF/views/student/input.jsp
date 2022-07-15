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
<h3>cnt : ${cnt }</h3>
	<form action="${conPath }/student/input.do" method="get">
		이름 <input type="text" name="name">
		국어 <input type="number" name="kor">
		영어 <input type="number" name="eng">
		수학 <input type="number" name="math">
		<input type="submit" value="input">
	</form>
</body>
</html>