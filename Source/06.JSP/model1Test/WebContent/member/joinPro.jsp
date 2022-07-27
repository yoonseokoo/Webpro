
<%@page import="com.lec.dao.MemberDao"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<% request.setCharacterEncoding("utf-8"); %> <!-- 한글 안깨지게 -->
	<jsp:useBean id="dto" class="com.lec.dto.MemberDto"/>
	<jsp:setProperty property="*" name="dto"/>

	<%
		MemberDao dao = MemberDao.getInstance();
		int result = dao.insert(dto);
		if (result == MemberDao.SUCCESS) {
	%> <script> 
			alert("멤버 추가 성공");
			location.href='../main/main.jsp';
		</script>
	<% } else {  %>
		<script> 
			alert("멤버 추가 실패. 본문이 너무 깁니다");
			history.back();
		</script>	
	<% } %>
	
	</body>
</html>