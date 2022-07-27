<%@page import="com.lec.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String conPath = request.getContextPath();
%> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="<%=conPath%>/css/header.css" rel="stylesheet">

<body>
	<header>
		<h1>애플리케이션 배포</h1>
		<div class="nav">
				<ul>
					<li><a href="<%=conPath%>/member/joinForm.jsp">회원등록</a></li>
					<li><a href="<%=conPath%>/member/list.jsp">회원조회/수정</a></li>
					<li><a href="<%=conPath%>/money/sales.jsp">매출조회</a></li>
					<li><a href="<%=conPath%>/main/main.jsp">홈으로</a></li>
				</ul>
		</div>
	</header>
</body>
</html>



