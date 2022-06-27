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
		<tr><td><a href="<%=conPath %>/board/writeForm.jsp">글쓰기</a></td></tr>
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
	final int PAGESIZE = 10;
	final int BLOCKSIZE = 10;
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null) {
			pageNum="1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage-1)* PAGESIZE + 1;
		int endRow = startRow + PAGESIZE - 1;
	
		BoardDao dao = BoardDao.getInstance();
		int totalCnt = dao.getBoardTotalCnt(); //NUMBER OF TOTAL POSTS
		if(totalCnt == 0) {
			out.println("<tr><td colspan= '5'>등록된 글이 없습니다</td></tr>");
		} else {
			ArrayList<BoardDto> dtos = dao.listBoard(startRow, endRow);
			for (BoardDto d :dtos) {
				out.println("<tr><td>" + d.getNum() + "</td><td>" + d.getWriter()+"</td>");
				out.println("<td class='left'>");
				if(d.getRe_indent() > 0){
					int width = (d.getRe_indent()-1) * 15;
					out.println("<img src='../img/level.gif' width='" + width + "' height = '10'>"); //들여쓰기 공간확보
					out.println("<img src='../img/re.gif'>");
				}
			
				if(d.getReadcount() > 10){
					out.println("<img src = '" + conPath + "/img/hot.gif'>");
				}
				out.println("<a href='content.jsp?num="+ d.getNum()+ "&pageNum=" + pageNum + "'>"  + d.getSubject() +"</a></td>");
				out.println("<td>" + (d.getEmail()!=null ? d.getEmail() : "" ) + "</td><td>" + d.getReadcount() + "</td></tr>");
		}
		}

	
	%>
	</table>
	<div class="paging">
	<%
		int pageCnt = (int)Math.ceil((double)totalCnt /PAGESIZE); //Number of pages
		int startPage = ((currentPage-1)/BLOCKSIZE) *BLOCKSIZE + 1;
		int endPage = startPage + BLOCKSIZE - 1;
		if (endPage > pageCnt ) {
			endPage = pageCnt;
		}
		if (startPage > BLOCKSIZE) {
			out.println("[ <a href='list.jsp?pageNum=" + (startPage-1)+ "'>이전</a> ] ");
		}
		for (int i=startPage ; i<=endPage ; i++) { 
			if (i==currentPage) {
				out.println("[ <b> " + i + "  </b>] ");
			} else {
				out.println("[ <a href='list.jsp?pageNum="+i+"'>"+i+"</a> ] ");
			
			}
		}
		if (endPage < pageCnt) {
			out.println("[ <a href='list.jsp?pageNum="+ (endPage+1) +"'>다음</a> ] ");
		} 
	%>
	</div>
</body>
</html>