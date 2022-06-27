<%@page import="com.lec.dto.BoardDto"%>
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
	<%
	//ADDING 70 DATA POINTS TO PRACTICE PAGING
	BoardDao dao = BoardDao.getInstance();
	BoardDto dto = new BoardDto();
	for(int i=0 ; i<70 ; i++) {
		dto.setWriter("홍길동" + i);
		dto.setSubject("제목" + i + "입니다");
		dto.setContent(i + "본문입니다");
		dto.setEmail("hong" + i + "@hong.com");
		dto.setPw("1");
		dto.setIp("192.168.10."+ 1);
		int result = dao.insertBoard(dto);
		System.out.println(result==BoardDao.SUCCESS? i + "번째쓰기성공" : i + "번째글쓰기 실패");
	}
	response.sendRedirect("list.jsp");
	%>
</body>
</html>