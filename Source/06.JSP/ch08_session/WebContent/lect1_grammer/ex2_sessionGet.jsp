<%@page import="java.util.Enumeration"%>
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
<% 
	// [1] PRITING SPECIFIC SESSION
	String sessionName = (String)session.getAttribute("sessionName");
	Integer myNum = (Integer)session.getAttribute("myNum");
	out.println("sessionName : " + sessionName + "<br>");
	out.println("myNum : " + myNum + "<br>");
	out.println("id : " + session.getAttribute("id") + "<br>");
	
	// [2] PRINTING LIST OF ALL SESSIONS
	out.println("<h4>모든 세션 속성들 list</h4>");
	Enumeration<String> sAttrNames = session.getAttributeNames();
	int cnt = 0;
	while(sAttrNames.hasMoreElements()){
		String sname = sAttrNames.nextElement();
		String svalue = session.getAttribute(sname).toString();
		out.println(sname+"(세션이름) / " + svalue + "(세션값)<br>");
		cnt++;
	}
	if (cnt==0){
		out.println("추가된 세션 속성이 없습니다");
	}
	
	// [3] DELETING SPECIFIC SESSION
	session.removeAttribute("myNum");
	out.println("<h4>myNum session 삭제 후</h4>");
	sAttrNames = session.getAttributeNames();
	cnt = 0;
	while(sAttrNames.hasMoreElements()){
		String sname = sAttrNames.nextElement();
		String svalue = session.getAttribute(sname).toString();
		out.println(sname+"(세션이름) / " + svalue + "(세션값)<br>");
		cnt++;
	}
	if (cnt==0){
		out.println("추가된 세션 속성이 없습니다");
	}
	// [4] DELETING ALL SESSIONS
	session.invalidate();
	out.println("<h4>모든 세션 삭제 후</h4>");
	if (request.isRequestedSessionIdValid()) {
		out.println("session valid<br>");
	} else {
		out.println("session invalid<br>");
	}
	out.println("<h4>sesssion ID: " + session.getId() + "</h4>");
	out.println("<h4>세션의 유효시간 : " + session.getMaxInactiveInterval() + "<br>"); //prints in seconds
	%>
</body>
</html>











