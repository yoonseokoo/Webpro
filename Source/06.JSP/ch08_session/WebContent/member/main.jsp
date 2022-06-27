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
			line-height: 600px; 
			text-align: center;
			font-size:1.5em; 
			font-weight: bold;
		}
		
		div{
		font-weight: bold;
		color: #A47160;
		}
	</style>
</head>
<body>
	<jsp:include page="header.jsp"/>
	<div id="mainForm_wrap">
		Main 화면
	</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>





