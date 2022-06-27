<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
	
	
	td {
	padding: 5px 12px;
	}
	
	table {
	margin 0 auto;
	}
	
	</style>
</head>
<body>
	<%
	int su = Integer.parseInt(request.getParameter("su"));
	int su2 = Integer.parseInt(request.getParameter("su2"));
	%>
	<h3><%=su %>단 부터 <%=su2 %>단 까지 구구단 출력</h3>
	<table>
	<%for (int i=1 ; i<=9 ; i++) { %>
	<tr>
		<%for(int j=su ; j<=su2 ; j++) { %>
		<td><%=j%> * <%=i%> = <%=i*j %></td>
		<%} %>
		</tr>
		<%} %>
		</table>
		<button onclick='history.go(-1);'>뒤로가기</button>
		<button onclick="location.href='ex6_dansuInput.jsp'">새로하기</button>
		
</body>
</html>




