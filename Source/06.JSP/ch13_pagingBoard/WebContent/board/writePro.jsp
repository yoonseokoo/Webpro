<%@page import="com.lec.dao.BoardDao"%>
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
	<jsp:useBean id="dto" class="com.lec.dto.BoardDto"/>
	<jsp:setProperty property="*" name="dto"/>

	<%
		dto.setIp(request.getRemoteAddr()); //요청한 곳의 주소 address
		BoardDao dao = BoardDao.getInstance();
		int result = dao.insertBoard(dto);
		if (result == BoardDao.SUCCESS) {
	%> <script> 
			alert("게시물 업로드 성공");
			location.href='list.jsp';
		</script>
	<% } else {  %>
		<script> 
			alert("게시물 업로드 실패. 본문이 너무 깁니다");
			history.back();
		</script>	
	<% } %>
	
	</body>
</html>