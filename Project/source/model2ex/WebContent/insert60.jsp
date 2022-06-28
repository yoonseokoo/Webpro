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
		String mId = "gico";
		String fTitle = "제목" + i + "입니다";
		String fContent = i + "본문입니다";
		String fFilename = null;
		String fIp = "192.168.10."+ 1;
		dao.insertBoard( mId,  fTitle,  fContent,  fFilename,  fIp);
	}
	response.sendRedirect("../list.do");
	%>
</body>
</html>

ing fIp) {