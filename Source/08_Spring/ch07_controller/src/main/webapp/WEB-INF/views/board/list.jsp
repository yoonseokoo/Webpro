<%@ page language="java" contentType="text/html; charset=UTF-8"
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
		<h2>This is board's list.jsp page</h2>
		<c:if test="${list.size() eq 0 }">
			<h3>There are no members in the list</h3>
		</c:if>
		<c:if test="${list.size() != 0 }">
			<c:forEach var="member" items="${list }">
			<h3>id : ${member.id } / pw : ${member.pw }</h3>
		</c:forEach>
		<h3>In total there are ${list.size() } people in the list</h3>
		</c:if>
		<h2 onclick="location.href='${conPath}/'">Go to the main page</h2>
</body>
</html>