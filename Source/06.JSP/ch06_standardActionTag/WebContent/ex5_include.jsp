<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% String conPath = request.getContextPath(); %>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="<%=conPath %>/css/ex.css" rel="stylesheet" type = "text/css">
</head>
<body>
	<h1>ex5_include.jsp 페이지입니다</h1>
	<h2>반갑습니다</h2>
	<jsp:include page="includePage.jsp"/>
	<h1>다시 ex5_include.jsp 페이지입니다</h1>
	<h1>다시 ex5_include.jsp 페이지입니다</h1>
</body>
</html>