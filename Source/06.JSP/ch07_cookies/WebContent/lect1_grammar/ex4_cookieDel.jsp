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
	<h1>특정쿠키 (쿠키이름이 cookieName인 쿠키) 삭제</h1>
	<%
		Cookie[] cookies = request.getCookies();
	if(cookies!=null){
		for(Cookie c : cookies) {
			String name = c.getName();
			if(name.equals("cookieName")){
				//쿠키삭제 : 같은이름의 쿠키를 만들어
				Cookie cookie = new Cookie("cookieName", "cookieValue");
				cookie.setMaxAge(0);
				response.addCookie(cookie);
				out.println("<h3>쿠키삭제성공</h3>");
				break;
			}
		}
	}
	%>
</body>
</html>