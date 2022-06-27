<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
	<c:set var="nowDate" value="<%=new Date(System.currentTimeMillis()) %>"/>
	<c:set var="nowTimes" value="<%=new Timestamp(System.currentTimeMillis()) %>"/>
	<c:set var="nowDateUtil" value="<%=new java.util.Date() %>"/>
	${nowDate }<br>
	${nowTimes }<br>
	${nowDateUtil }<br>
	
	<!-- Example for nowDate (works the same with nowTiems and nowDateUtil) -->
	<h2>EXAMPLES OF FORMATING DATE TYPES:</h2>
	<h5>PRINTING ONLY THE DATE</h5>
	<fmt:formatDate value="${nowDate }" type="date" dateStyle="short"/></br>
	<fmt:formatDate value="${nowDate }" type="date" dateStyle="medium"/></br>
	<fmt:formatDate value="${nowDate }" type="date" dateStyle="long"/></br>
	<fmt:formatDate value="${nowDate }" type="date" dateStyle="full"/></br>
	
	<h5>PRINTING ONLY THE TIME</h5>
	<fmt:formatDate value="${nowDate }" type="time" timeStyle="short"/></br>
	<fmt:formatDate value="${nowDate }" type="time" timeStyle="medium"/></br>
	<fmt:formatDate value="${nowDate }" type="time" timeStyle="long"/></br>
	<fmt:formatDate value="${nowDate }" type="time" timeStyle="full"/></br>
	
	<h5>PRINTING BOTH DATE & TIME</h5>
	<!-- (2022-06-15, 14:20) -> YY or yy:22 | yyyy/YYYY: 2022 | MM: 06 | M: 6 | dd:15 | HH :14 | hh : 02 -->
	<fmt:formatDate value="${nowDate }" type="both" dateStyle="long" timeStyle="short"/></br>
	<fmt:formatDate value="${nowDate }" pattern="yyyy년MMM월dd일(E요일) hh:mm:ss:SS(a)"/></br>
	<fmt:formatDate value="${nowDate }" pattern="yy-MM-dd(E) HH:mm:ss:SS(a)"/></br>
	
	
	
</body>
</html>