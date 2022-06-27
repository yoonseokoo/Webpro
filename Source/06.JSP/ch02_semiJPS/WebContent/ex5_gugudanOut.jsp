<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
	table {
	margin: 0 auto;
	text-align:center;
	}
	</style>
</head>
<body>
	<%
	int su = Integer.parseInt(request.getParameter("su"));
	%>
	<h3>Received parameter value: <%=su %></h3>
	
	
	<table>
	<tr><td><h2> <%=su %> 단 </h2></td></tr>
	<%for(int i=1;i<=9;i++) { %>
		<tr><td> <%=su %> * <%=i%> = <%=su*i%></td></tr>
		<%}%>
		</table>
</body>
</html>