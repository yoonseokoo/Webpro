<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<% response.setStatus(200); %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script> 
	console.log('예외 메세지 : ' + '<%=exception.getMessage()%>');
	console.log('예외 타입 : ' + '<%=exception.getClass().getName()%>');
	</script>
</head>
<body>
	<h1>공사중입니다. 0으로 나누는 부분은 아직 처리되지 않습니다</h1>
	<h6>문의 주시면 감사하겠습니다 mail 주소 추가</h6>
	<%
		System.out.println("예외 메세지 : " + exception.getMessage());
		System.out.println("예외 타입 : " + exception.getClass().getName());
	%>
</body>
</html>