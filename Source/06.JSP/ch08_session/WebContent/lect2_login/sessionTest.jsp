<%@page import="java.util.Enumeration"%>
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
	<%Enumeration<String> names = session.getAttributeNames();
	int cnt = 0;
	while(names.hasMoreElements()){
	String sname = names.nextElement();
	String svalue = (String)session.getAttribute(sname);
	out.println("<h4>" + sname + "(세션속성명) / " + svalue + "(세션속성값)</h4>");
	cnt++;
	}
	if(cnt==0){
		out.println("<h4>유효한 세션 속성이 없습니다</h4>");
		out.println("<button onclick=\"location.href='login.jsp'\">로그인</button>");
		} else {
			out.println("<button onclick=\"location.href='logout.jsp'\">로그아웃</button>");
		}
	%>
		<button onclick="history.go(-1)">이전페이지</button>
		<button onclick="location.href='welcome.jsp'">welcome페이지</button>
</body>
</html>