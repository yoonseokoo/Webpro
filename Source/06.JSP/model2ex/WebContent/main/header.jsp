<%@page import="com.lec.dto.MemberDto"%>
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
		
		<c:if test="${empty member }">
			<div class="gnb">
				<ul>
					<li><a href="${conPath }/list.do">고객센터</a></li>
					<li><a href="${conPath }/joinView.do">회원가입</a></li>
					<li><a href="${conPath }/loginView.do">로그인</a></li>
				</ul>
			</div>
			<div class="logo" onclick="location.href='#logo'">
				<img src="http://www.moel.go.kr/images/layout/logo.png">
			</div>	
			<div class="lnb">
				<ul>
					<li ><a href="#1">로그인전 메뉴1</a></li>
					<li ><a href="#2">로그인전 메뉴2</a></li>
					<li ><a href="#3">로그인전 메뉴3</a></li>
					<li ><a href="#4">로그인전 메뉴4</a></li>
				</ul>
			</div>

		</c:if>
		
		
		
		
		
		
		<c:if test="${not empty member }">
			<div class="gnb">
				<ul>
					<li><a href="${conPath }/list.do">고객센터</a></li>
					<li><a href="${conPath}/logout.do">로그아웃</a></li>
					<li><a href="${conPath}/modifyView.do">정보수정</a></li>
					<li><a>${member.mName }님 ▶</a>
				</ul>
			</div>
			<div class="logo" onclick="location.href='#logo'">
				<img src="http://www.moel.go.kr/images/layout/logo.png">
			</div>
			<div class="lnb">
				<ul>
					<li ><a href="#1">로그인후 메뉴1</a></li>
					<li ><a href="#2">로그인후 메뉴2</a></li>
					<li ><a href="#3">로그인후 메뉴3</a></li>
					<li ><a href="#4">로그인후 메뉴4</a></li>
				</ul>
			</div>
			
			</c:if>

		
		
	</header>
</body>
</html>



