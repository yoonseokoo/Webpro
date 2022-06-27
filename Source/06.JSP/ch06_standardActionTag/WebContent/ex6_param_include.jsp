<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<h1>ex6_param_include.jsp 페이지이빈다</h1>
	<hr>
	<jsp:include page="ex4.jsp">
	<jsp:param value="1" name="n"/>
	<jsp:param value="aaa" name="id"/>
	<jsp:param value="111" name="pw"/>
</body>
</html>