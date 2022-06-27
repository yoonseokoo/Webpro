<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String conPath = request.getContextPath(); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>1. 표현식 태그 이용</h2>
	<p>Arithmetic operators: 10+1 = <%=10+1 %></p>
	<p>Arithmetic operators: 10/0.0= <%=10/0.0 %></p> <!-- divided by 0 causes error, but divided by 0.0 gives infinity -->
	<p>Relational operators: 1==2 => <%=1==2 %></p>
	<p>Relational operators: 1!=2 => <%=1!=2 %></p>
	<p>Relational operators: 1<2 => <%=1<2 %></p>
	<p>Conditional operators: <%=(1>2) ? "1이 2보다 큽니다":"1이 2보다 크지 않습니다" %></p>
	<p>logical operators: (1>2) || (1<2) = <%= (1>2) || (1<2) %></p>
	<p>logged in? <%=session.getAttribute("customer")==null ? "Before login" : "After login" %></p>
	<p>logged in? <%=session.getAttribute("customer")!=null ? "After login" : "Before login" %></p>
	<p>Has the pageNum parameter? <%=request.getParameter("pageNum")==null? "No pageNum parameter" : "pageNum parameter came through" %>></p>
	<p>name parameter : <%=request.getParameter("name")%></p>
	<%-- <p>name parameter CAPITALIZED : <%=request.getParameter("name").toUpperCase() %></p> --%>
	
	
	
	<h2>2. EL표기법 이용 (표현식 안에 쓸수 있는 연산자는 다 사용 가능)</h2>
	<h2>1. 표현식 태그 이용</h2>
	<p>Arithmetic operators: 10+1 = ${10+1 }</p>
	<p>Arithmetic operators: 10/0.0= ${10/0.0 }</p> <!-- divided by 0 causes error, but divided by 0.0 gives infinity -->
	<p>Relational operators: 1==2 => ${1 eq 2 }</p>
	<p>Relational operators: 1!=2 => ${1!=2 }</p>
	<p>Relational operators: 1<2 => ${1<2 }</p>
	<p>Conditional operators: ${(1>2) ? "1이 2보다 큽니다":"1이 2보다 크지 않습니다" }</p>
	<p>logical operators: (1>2) || (1<2) = ${(1>2) || (1<2) }/p>
	<p>logged in? ${customer == null? "Before login" : "After login" }</p>
	<p>logged in? ${customer eq null ? "Before login" : "After login" }</p>
	<p>logged in? ${empty customer? "Before login" : "After login" }</p>
	<p>logged in? ${not empty customer? "After login" : "Before login" }</p>
	<p>Has the pageNum parameter? ${ empty param.pageNum ? "No pageNum parameter" : "pageNum parameter came through" }</p>
	<p>name parameter : ${param.name  }</p>
	<p>name parameter CAPITALIZED : ${param.name.toUpperCase() }</p>
</body>
</html>


















