<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>core library</h2>
	<c:forEach var="i" begin="1" end="3" step="1"> <!-- SAME AS: for (int i=1 ; i<=3 ; i++) -->
	<p>${i }번쨰, 안녕하세요</p>
	</c:forEach>
	
	<h2>fmt(formatting) library</h2>
	<fmt:formatNumber value="3333.146592" pattern="#,###.00"/> <!--putting the pattern I want -->

	<h2>Other (function) libraries</h2>
	ID 파라미터를 대문자로 : ${fn:toUpperCase(param.id) }
</body>
</html>