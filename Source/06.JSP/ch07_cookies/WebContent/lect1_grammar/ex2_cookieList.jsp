<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<h1>쿠키 리스트</h1>
	<%
		Cookie[] cookies = request.getCookies();
		for (int i=0;i<cookies.length ; i++){
			String name = cookies[i].getName();
			String value = cookies[i].getValue();
			out.println("<h2> COOKIE [" + i + "]: Name : " + name + ", Value: " + value + "</h2>");
			
		}
	%>
</body>
</html>