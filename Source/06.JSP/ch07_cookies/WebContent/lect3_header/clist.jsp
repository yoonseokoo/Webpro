<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String conPath = request.getContextPath(); %> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
		#mainForm_wrap{
			width:430px; 
			margin: 0 auto;
			height:600px; 
			text-align: center;
			font-size:1.5em; 
			font-weight: bold;
		}
	</style>
</head>
<body>
	<jsp:include page="header.jsp"/>
	<div id="mainForm_wrap">
<%
	Boolean outOk = false;
	Cookie[] cs = request.getCookies();
	if(cs!=null) {
		for(Cookie c : cs){
			String cname = c.getName();
			String cvalue = c.getValue();
			if(cname.equals("id") || cname.equals("name")){
				out.println("<h3> 쿠키이름  : " + cname + "<br>쿠키값 : " + cvalue + "</h3>");
				outOk = true;
			}
		}
	} 
	if (!outOk) {
		out.println("<h3>생성된 쿠키가 없습니다(단, 시스템 쿠키는 제외)</h3>");
	}
	%>
	</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>





