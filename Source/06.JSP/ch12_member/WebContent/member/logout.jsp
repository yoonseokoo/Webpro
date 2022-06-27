<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script>
	setTimeout(function(){
		location.href = 'main.jsp';
		
	}, 2000)</script>
	<link href="<%=conPath %>/css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<%session.invalidate(); %>
	<h2>You have been logged out.<br>You will be redirected to the main page in a few seconds</h2>
</body>
</html>