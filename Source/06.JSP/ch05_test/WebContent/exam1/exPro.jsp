<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
		h2 {
			margin: 0 auto;
			text-align:center;
			color:red;
		}
		
		h3 {
			margin: 0 auto;
			text-align:center;
			padding: 0 0 60px 0;
		}
		input {
			margin: 0 auto;
			padding:10px;
			display: flex;
			background-color:lightpink;
		}
	</style>
</head>
	<body>
<%
	String one = request.getParameter("one");
	String two = request.getParameter("two");
	String three = request.getParameter("three");
	int number;
	int computer = (int) (Math.random() * 3); //where the coin is
	
	if (one != null) {
		number = Integer.parseInt(one);
	} else if (two != null) {
		number = Integer.parseInt(two);
	} else {
		number = Integer.parseInt(three);
	}
	if(number == computer) {
		out.println("<h2>정답입니다</h2>");
		out.println("<br><h3>동전이 있던 곳은 " + computer + "</h3>");
		out.println("<input type=\"button\"value=\"다시 도전\" onclick=\"history.back()\">");
	} else {
		String msg = "<b>Wrong! Try Again! <br> (" + number + "은(는) 아니고 정답은 " + computer + ")</b>";
		msg = URLEncoder.encode(msg, "utf-8");
		response.sendRedirect("ex.jsp?msg="+msg);
	}
	%>
	
</body>
</html>