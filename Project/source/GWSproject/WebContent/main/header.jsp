<%@page import="com.project.dto.MemberDto"%>
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
<link href="${conPath }/css/header.css" rel="stylesheet">
<body>
	<header>
	<div id="header_up">
		<c:if test="${empty member }">
			<div class="gnb">
				<ul>
					<li><a href="${conPath }/joinView.do">회원가입</a></li>
					<li><a href="${conPath }/loginView.do">로그인</a></li>
					<li><a href="${conPath }/list.do">검색</a></li>
				</ul>
			</div>
		</c:if>
		<c:if test="${not empty member }">
			<div class="gnb">
				<ul>
					<li><a href="${conPath }/list.do">고객센터</a></li>
					<li><a href="${conPath}/logout.do">로그아웃</a></li>
					<li><a href="${conPath}/modifyView.do">정보수정</a></li>
					<li><a a href="${conPath}/myInfoView.do">${member.mName }님 ▶</a>
				</ul>
			</div>
		</c:if>
			<div class="logo" onclick="location.href='${conPath}/main/main.jsp'">
				<img src="${conPath }/img/logo.png">
			</div>	
	</div>
			<div class="lnb">
				<ul>
					<li ><a href="#1">HISTORY</a></li>
					<li ><a href="#2">PRODUCTS</a></li>
					<li ><a href="#3">LOCATION</a></li>
					<li ><a href="#4">BOARD</a></li>
					<li ><a href="#5">ABOUT</a></li>
				</ul>
			</div>
	</header>
</body>
</html>



