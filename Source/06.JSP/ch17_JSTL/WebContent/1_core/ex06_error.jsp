<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>Exception handling</h2>
	<c:catch var="error">
	<h2>테스트</h2>
	<%=8/0 %>
	<p>As soon as exception occurs, it escapes the catch section. If this prints it means that exception has not occured</p>
	</c:catch>
	Exception type and message: <c:out value="${error }" default="예외발생 안 됨"/>
</body>
</html>