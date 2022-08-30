<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${conPath }/css/style.css" rel="stylesheet">
<style>
	#content {
		width: 800px; 
		height:350px;
		margin: 50px auto;
	}
	img{
		width: 100px;
	}
</style>
</head>
<body>
	<a>${member.mname }님 (${member.mid})</a>
	<a href="${conPath }/member/loginForm.do">로그인</a>
	<a href="${conPath }/groups/groupList.do?mid=${member.mid}">그룹보기</a>
</body>
</html>
