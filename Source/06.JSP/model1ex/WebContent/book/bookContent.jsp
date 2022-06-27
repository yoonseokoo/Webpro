<%@page import="com.lec.dto.BookDto"%>
<%@page import="com.lec.dao.BookDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String conPath = request.getContextPath(); %> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="<%=conPath%>/css/style.css" rel="stylesheet">
	<style>
		#content_form{
			width:1000px; margin: 0px auto; height: 500px; 
			text-align: center;
			color: #003300;
			padding-top:100px;
		}
	</style>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div id="content_form">
	<%
		int bid = Integer.parseInt(request.getParameter("bid"));
		String pageNum = request.getParameter("pageNum");
		BookDao bDao = BookDao.getInstance();
		BookDto book = bDao.getBook(bid);
	%>
		<table>
			<tr>
				<td rowspan="4">
					<img src="<%=conPath%>/bookImg/<%=book.getBimage1()%>">
					<img src="<%=conPath%>/bookImg/<%=book.getBimage2()%>">
				</td>
				<th><%=book.getBid() %>번 도서 상세보기</th>
			</tr>
			<tr><td><%=book.getBtitle() %></td></tr>
			<tr>
				<td>
					<%if(book.getBdiscount()!=0){ %>
						<del><%=book.getBprice() %>원</del><br>
						<%=book.getBprice() * (100-book.getBdiscount()) / 100 %>원<br>
						<b><%=book.getBdiscount() %>% 할인</b>
					<%}else{ %>
						<b><%=book.getBprice() %>원</b><br>
						베스트셀러
					<%} %>
				</td>
			</tr>
			<tr>
				<td>
					<button>구매</button>
					<button onclick="location='ex3_list_productp.jsp?pageNum=<%=pageNum%>'">목록</button>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<pre><%=book.getBcontent() %></pre>
				</td>
			</tr>
		</table>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>