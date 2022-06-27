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
	<c:set var="num" value="1234567.8"/>
	<p>num : ${num }</p>
	<p>세자리마다 comma : <fmt:formatNumber value="${num }" groupingUsed="true"/></p>
	<p>세자리마다 comma : <fmt:formatNumber value="${num }" pattern="#,###.#"/></p>
	<p>소수점 2자리 (한자리 경우에는 0) : <fmt:formatNumber value="${num }" pattern="#,###,00"/></p>
	<p>소수점 2자리 (소수점 한자리인 경우 한자리만) :  <fmt:formatNumber value="${num }" pattern="#,###.##"/></p>
	<c:set var="num" value="3.149"/>
	<p> 소수점 2자리 (소수점 두자리 이상의 반올림) : <fmt:formatNumber value="${num }" pattern="#,###.##"/></p>
</body>
</html>