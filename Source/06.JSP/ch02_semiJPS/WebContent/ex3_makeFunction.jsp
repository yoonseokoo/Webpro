<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
<%-- indicator(<%@ ~%> : page propertes --%>
<%-- script (<% ~%>: javacode --%>
<%-- initialization (<%! ~%>: variable, function --%>
	<%
	long result = power(2,3);
	%>
	<p> 2 to the power of 3 is <%=result %></p>
	<p> 9 to the power of 11 is <%=power(9,11) %></p>
	<%!
	private long power(int a, int b) { //function to calculate a^b
		long temp = 1;
		for (int i=1 ; i<=b ; i++){
			temp*=a;
		}
		return temp;
	}
	%>
</body>
</html>