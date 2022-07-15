<%@ page language="java" contentType="text/html; charset= UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${conPath }/css/style.css" rel="stylesheet">
</head>
<body>
	<h2>Always print 'cnt & list',regardless of what has been requested </h2>
	<h3>cnt : ${cnt }</h3>
	<h3>list : ${list }</h3>
	<hr>
	<%-- <form action="${conPath }/member/join1"> --%>
	<%-- <form action="${conPath }/member/join2"> --%>
	<%-- <form action="${conPath }/member/join3"> --%>
	<%-- <form action="${conPath }/member/join4"> --%>
	<%-- <form action="${conPath }/member/join5"> --%>
	<form action="${conPath }/member/join6">
		<table>
			<caption>Personal information form</caption>
			<tr><th>Name</th><td><input type="text" name="name"></td>
			<tr><th>Id</th><td><input type="text" name="id"></td>
			<tr><th>Pw</th><td><input type="password" name="pw"></td>
			<tr><th>Age</th><td><input type="Number" name="age"></td>
			<tr><th>Email</th><td><input type="email" name="email"></td>
			<tr><th>Address</th><td><input type="text" name="address"></td>
			<tr><td colspan="2"><input type="submit" value="join"></td></tr>
		</table>
	</form>
	<a href="${conPath }/studentId/aaa">studentId에 aaa로 전송</a>
	<a href="${conPath }/studentId/bbb">studentId에 bbb로 전송</a>
	<a href="${conPath }/studentId/윤윤윤">studentId에 윤윤윤로 전송</a>
</body>
</html>