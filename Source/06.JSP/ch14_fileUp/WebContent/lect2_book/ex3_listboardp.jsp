<%@page import="com.lec.book.BookDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.lec.book.BookDao"%>
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
<%
	String pageNum = request.getParameter("pageNum");
		if(pageNum==null) pageNum="1";
		int currentPage = Integer.parseInt(pageNum);
		final int PAGESIZE=3, BLOCKSIZE=4;
		int startRow = (currentPage-1) * PAGESIZE + 1;
		int endRow = startRow + PAGESIZE - 1;
		
		
		BookDao bDao = BookDao.getInstance();
		ArrayList<BookDto> books = bDao.listBook(startRow, endRow);
%>

	<caption>책 리스트</caption>
	<tr>
		<th>BOOK ID</th>
		<th>TITLE</th>
		<th>IMAGE</th>
		<th>PRICE</th>
		<th>DISCOUNT</th>
	</tr>
<%
	if(books.size()==0) {
		out.println("<tr><td colspan='5'>등록된 책이 없습니다</td></tr>");
	} else {
		for (BookDto book : books) {
			out.println("<tr><td>" + book.getBid() + "</td><td>" + book.getBtitle() + "</td>");
			out.println("<td><img src='../bookImg/" + book.getBimage1()+"'width='15'></td>");
			out.println("<td>" + book.getBprice() + "</td><td>" + book.getBdiscount() + "</td>");
		}
	}
%>
</table>
	<div CLASS="paging">
<%
	int bookTotalCnt = bDao.getBookTotCnt();
	int pageCnt = (int)Math.ceil((double)bookTotalCnt/PAGESIZE);
	int startPage = ((currentPage -1)/BLOCKSIZE) * BLOCKSIZE + 1;
	int endPage = startPage + BLOCKSIZE - 1;
	if(endPage > pageCnt) {
		endPage = pageCnt;
	}
	if(startPage > BLOCKSIZE) {
%>
	[ <a href='ex3_listboardp.jsp?pageNum=<%=startPage-1%>'>이전</a> ]

<% 
	}
	for (int i=startPage ; i<=endPage ; i++) {
		if(i==currentPage) {
			out.println("[ <b> " + i+ " </b> ] ");
		} else {
			out.println("[ <a href='ex3_listboardp.jsp?pageNum=" +i+ "'>" + i + "</a> ]");
		}
	}
	if (endPage < pageCnt) {
%>
	[ <a href="ex3_listboardp.jsp?pageNum=<%=endPage+1%>">다음</a> ]
	<% }%>
	</div>
</body>
</html>