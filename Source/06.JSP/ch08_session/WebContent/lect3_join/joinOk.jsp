<%@page import="java.io.PrintWriter"%>
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
		String agree = request.getParameter("agree");
		if(agree.equals("y")) {
			String id = (String)session.getAttribute("id");
			String pw = (String)session.getAttribute("pw");
			String name = (String)session.getAttribute("name");
			
			//[1] SAVE IN FILE, UNDER THE 'SOURCE' FOLDER
			String filePath = "C:/Users/user/Desktop/unie/Source/06.JSP/ch08_session/WebContent/WEB-INF/" + id + ".txt";
			PrintWriter writer = new PrintWriter(filePath); //since since is jsp, try/catch is unnecessary
			writer.println("오늘은 DB에 insert 대신 파일 출력");
			writer.println("아이디: " + id);
			writer.println("비밀번호: " + pw);
			writer.println("이름: " + name);
			writer.close();
			session.removeAttribute("pw");
			session.removeAttribute("name");
			response.sendRedirect("result.jsp?msg=success");
		} else {
			session.invalidate(); //DELETE ALL SESSIONS
			response.sendRedirect("result.jsp?msg=fail");
		}
	%>
	
</body>
</html>