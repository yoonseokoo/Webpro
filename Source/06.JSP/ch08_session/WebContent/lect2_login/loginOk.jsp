<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="<%=conPath %>/css/style.css" rel="stylesheet" type="text/css">	
</head>
<body>
	<%
		String msg="";
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		if(id!=null && id.equals("aaa")) {
			if(pw!=null && pw.equals("111")) {
				session.setAttribute("id", id);
				session.setAttribute("name", "홍길동");
				response.sendRedirect("welcome.jsp");
			} else {
				msg = URLEncoder.encode("Please check your PW", "utf-8");
				response.sendRedirect("login.jsp?msg="+msg);
			}
		} else {
			msg = URLEncoder.encode("Please check your ID", "utf-8");
			response.sendRedirect("login.jsp?msg="+msg);
		}
		
	%>
</body>
</html>