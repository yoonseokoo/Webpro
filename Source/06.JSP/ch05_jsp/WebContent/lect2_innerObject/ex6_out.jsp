<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ page buffer = "16kb" %> <!-- setting buffer size (default is 8kb) -->
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<h2>버퍼의 크기 : <%=out.getBufferSize() %></h2>
	<h2>버퍼의 남은 크기 : <%=out.getRemaining() %></h2>
	<%
	for (int i = 0 ; i < 1000 ; i++){
	out.print("<h2>데스트람 : i = " + i + "번째에서 남은 버퍼 크기: " + out.getRemaining() + "<br>");
	}
	%>
</body>
</html>