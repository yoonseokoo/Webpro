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
	<% //ADDING ATTRIBUTE (FEATURE) TO SESSION BY TYPE OBJECT
		session.setAttribute("sessionName", "sesssionValue");
		session.setAttribute("myNum", 123);
	%>
	<h1>세션에 sessionName 속서 추가</h1>
	<h1>세션에 myNum 속서 추가</h1>
	<a href = "ex2_sessionGet.jsp">세션 GET</a>
</body>
</html>