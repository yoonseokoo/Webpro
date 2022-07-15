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
	<h1>${greeting }</h1>
	<hr>
	<h3>Board 관련 요청 경로</h3>
		<h4><a href="${conPath }/board/write">board의 Write로 가기</a></h4>
		<h4><a href="${conPath }/board/content">board의 content 로 가기</a></h4>
		<h4><a href="${conPath }/board/list">board의 list 로 가기</a></h4>
		<h4><a href="${conPath }/board/reply">board의 reply로 가기</a></h4>
	<hr>
	<h3>Member 관련 요청 경로</h3>
		<p><button onclick="location.href='${conPath}/member?method=join'">회원가입</button></p>
		<p><button onclick="location.href='${conPath}/member?method=login'">로그인</button></p>
		<p><button onclick="location.href='${conPath}/member?method=logout'">로그아웃</button></p>
		<p><button onclick="location.href='${conPath}/member?method=infoModify'">정보수정</button></p>
</body>
</html>