<%@page import="com.lec.dto.BoardDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.lec.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="<%=conPath %>/css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<table>
		<caption>게시판</caption>
		<tr><td><a href="<%=conPath%>writeForm.jsp">글쓰기</a></td></tr>
	</table>
	<table>
		<tr>
			<th>글번호</th>
			<th>작성자</th>
			<th>글제목</th>
			<th>메일</th>
			<th>조회수</th>
		</tr>
	<%
		BoardDao dao = BoardDao.getInstance(); //making dao variable
		int totalCnt = dao.getBoardTotalCnt();
		if(totalCnt == 0) {
			out.println("<tr><td colspan= '5'>등록된 글이 없습니다</td></tr>");
		} else {
			ArrayList<BoardDto> dtos = dao.listBoard();
			for (BoardDto d :dtos) {
				out.println("<tr><td>" + d.getNum() + "</td><td>" + d.getWriter());
				out.println("<td class='left'>");
				if(d.getReadcount() > 10) {
					out.println("<img src = '" + conPath + "/img/hot.gif'>");
				}
				out.println("<a href = '" + conPath + "/board/content.jsp?num="+d.getNum()+"'>" + d.getSubject() + "</a></td>");

			out.println("<td>" + (d.getEmail()!=null ? d.getEmail() : "" )+ "</td><td>" + d.getReadcount() + "</td></tr>");
		}
		}
	%>
	</table>
</body>
</html>