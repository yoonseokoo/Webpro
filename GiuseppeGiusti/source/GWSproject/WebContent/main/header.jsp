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
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin> 
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200;400&display=swap" rel="stylesheet">

<body>
	<header>
	<div id="header_up">
		<c:if test="${empty member }">
			<div class="gnb1">
				<ul>
					<li><a href="${conPath }/joinView.do">회원가입</a></li>
					<li><a href="${conPath }/loginView.do">로그인</a></li>
					<li>
						<form action="${conPath }/productSearch.do">
				         	<input type="text" name="schName" value="${param.schName }" class="searchInput" >
				        	<input type="submit" value="검색" class="searchBtn" >
				      </form>
					</li>
				</ul>
			</div>
		</c:if>
		<c:if test="${not empty member }">
			<div class="gnb2">
				<ul>
					<li><a href="${conPath }/orderHistory.do?mId=${member.mId }">주문내역</a></li>
					<li><a href="${conPath }/myCart.do?mId=${member.mId }">장바구니</a></li>
					<li>
						<form action="${conPath }/productSearch.do">
				         	<input type="text" name="schName" value="${param.schName }" class="searchInput" >
				        	<input type="submit" value="검색" class="searchBtn" >
				      </form>
					</li>
					<li><a href="${conPath }/list.do">고객센터</a></li>
					<li><a href="${conPath}/logout.do">로그아웃</a></li>
					<li><a href="${conPath}/modifyView.do">정보수정</a></li>
					<li>${member.mName }님 ▶</li>
				</ul>
			</div>
		</c:if>
			<div class="logo" onclick="location.href='${conPath}/main/main.jsp'">
				<img src="${conPath }/img/logo.png">
			</div>	
	</div>
			<div class="lnb" id="lnb">
				<ul>
					<li ><a href="${conPath}/HistoryView.do"">HISTORY</a></li>
					<li ><a href="${conPath}/productGroup.do">PRODUCTS</a></li> 
					<li ><a href="${conPath}/location.do">LOCATION</a></li>
					<li ><a href="${conPath}/list.do">BOARD</a></li>
					<li ><a href="${conPath}/productALL.do">SHOP ALL</a></li>
				</ul>
			</div>
			<section class="sec1"></section>
	</header>
</body>
</html>



