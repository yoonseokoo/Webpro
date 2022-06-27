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

	BoardDao dao = BoardDao.getInstance();
	for(int i=0 ; i<70 ; i++) {
		String bname = "홍길동" + i;
		String btitle = "제목" + i + "입니다";
		String bcontent = i + "본문입니다";
		String bip = "192.168.10."+ 1;
		dao.write(bname, btitle, bcontent, bip);
	}
	response.sendRedirect("../list.do");
	%>
</body>
</html>
