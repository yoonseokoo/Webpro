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
<%-- <% session.setAttribute("admin", "test"); %>  --%> 
<!-- 사용자가 로그인 성공 : session.setAttribute("customer") -->
<!-- 관리자가 로그인 성공 : session.setAttribute("admin") -->
	<c:if test="${empty customer && empty admin }">
	<!-- 로그인 전 메뉴 -->
	<ul>
		<li><a href="">로그인</a></li>
	</ul>
	</c:if>
	<c:if test="${not empty customer && empty admin }">
	<!-- 사용자 모드로 로그인 후 메뉴 -->
	<ul>
		<li><a href="">고객센터</a></li>
	</ul>
	</c:if>
	<c:if test="${empty customer && not empty admin }">
	<!-- 관리자 모드로 로그인 후 메뉴 -->
	<ul>
		<li><a href="">공지사항</a></li>
	</ul>
	</c:if>
</body>
</html>