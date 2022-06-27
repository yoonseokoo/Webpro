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
	<h1>특정 쿠키(쿠키 이름이 cookieName)</h1>
	<%
		Cookie[] cookies = request.getCookies();
		if(cookies!=null) {
			int i=0;
			for(i=0;i<cookies.length;i++){
				String name= cookies[i].getName();
				if(name.equals("cookieName")){
					String value = cookies[i].getValue();
					out.println("<h2>찾고자 하는 쿠키 이름 : " + name + ", 쿠키값 : " + value + "</h2>");
					break;
				}
			}
			if(i==cookies.length){
				out.println("찾고자하는 쿠키가 없습니다");
			}
		} else {
			out.println("생선된 쿠키가 없습니다");
		}
	%>
</body>
</html>