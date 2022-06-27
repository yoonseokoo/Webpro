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
	
	<!-- Parameter that has been received: subject, content, email, pw, num -->
	<!-- Parameters needed to call updateBoard: subject, content, email, pw, num, ip-->
	
	<%	
		dto.setIp(request.getRemoteAddr());
		BoardDao dao = BoardDao.getInstance();
		int result = dao.updateBoard(dto);
		if(result == BoardDao.SUCCESS) {
	 %> <script>
			alert('글 수정 성공');
			location.href = 'list.jsp';
		</script>

	<% } else { %>
		<script>
			alert('글 수정 실패');
			history.go(-1);	
		</script>
	<% } %>
	
	
</body>
</html>