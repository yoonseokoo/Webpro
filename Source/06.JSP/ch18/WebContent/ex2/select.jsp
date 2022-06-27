<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${insertResult == 1 }">
		<script> 
			alert('insert successful');
		</script>
	</c:if>
	<c:if test="${deleteResult == 1 }">
		<script> 
			alert('delete successful');
		</script>
	</c:if>
	<c:if test="${updateResult == 1 }">
		<script> 
			alert('update successful');
		</script>
	</c:if>
	<h1>select.jsp 입니다</h1>
	<h3>select 결과 ${list }</h3>
</body>
</html>