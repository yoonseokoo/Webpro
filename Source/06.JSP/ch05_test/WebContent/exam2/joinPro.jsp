
<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="<%=conPath %>/css/join.css" rel="stylesheet">
</head>
	<body>
<%
	String name = request.getParameter("name");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	Date birth = Date.valueOf(request.getParameter("birth"));
	Timestamp birth2 = Timestamp.valueOf(request.getParameter("birth") + " 00:00:00");
	String [] hobby = request.getParameterValues("hobby");
	String gender = request.getParameter("gender");
	String email = request.getParameter("email");
	String [] mailSend = request.getParameterValues("mailSend");
	Date date = new Date(System.currentTimeMillis()); 
	String ip     = request.getRemoteAddr();
	
	out.println("<html>");
	out.println("<head>");
	out.println("</head>");
	out.println("<body>");
	out.println("<div id='joinForm_wrap'>");
	out.println("<div id='join_title'>회원가입정보</div>");
	out.println("<h2>Name : " + name + "</h2>");
	out.println("<h2>id : " + id + "</h2>");
	out.println("<h2>pw: ");
	for (int i = 0; i <= pw.length(); i++) {
		out.println('*');
	}
	out.println("</h2>");
	out.println("<h2>birth : " + birth + "</h2>");
	out.println("<h2>birth2 : " + birth2 + "</h2>");
	out.println("<h2>hobby : ");
		for (int i = 0; i < hobby.length; i++) {
			if (i == hobby.length - 1) {
				out.println(hobby[i]);
			} else {
				out.println(hobby[i] + ", ");
			}
		}
	out.println("</h2>");
	out.println("</h2>");
	out.println("<h2>Gender : " + gender + "</h2>");
	out.println("<h2>Email : " + email + "</h2>");
	out.println("<h2>mailSend : " + Arrays.toString(mailSend) + "</h2>");
	out.println("<h2>가입일 : " + date + "</h2>");
	out.println("<h2>가입IP : " + ip + "</h2>");
	out.println("</div>");
	out.println("</body>");
	out.println("</html>");
	%>
	<%@ include file="footer.jsp" %>
</body>
</html>