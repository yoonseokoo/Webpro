<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title></title>
	<style>
	
		p, h1{
			text-align:center;
		}
		form {
			border: 1px solid black;
			width:40%;
			margin: 0 auto;
		}
		</style>
</head>
<body>
<%!String name, id, pw; %>
	<%
	request.setCharacterEncoding("utf-8");
	name = request.getParameter("name");
	id = request.getParameter("id");
	pw = request.getParameter("pw");
	%>
	
	<h1>결과 화면</h1>
	<p>아이디는 <%=id %> 이고</p>
	<p>패스위드는 <%=pw %> 입니다</p>
	<p><%=name %>님 반갑습니다</p>
	

</body>
</html>