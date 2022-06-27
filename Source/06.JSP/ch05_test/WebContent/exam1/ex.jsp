<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
		form {
			margin: 0 auto;	
			text-align: center; 
		}
		
		button {
			margin:5px;
			padding:20px;
			background-color:lightpink;
		}
		
		p{
			color:red;
			text-align: center; 
		}
	</style>
</head>
<body>
	<form action="exPro.jsp">
	<h2>동전이 있는 곳을 마춰봐</h2>
	<hr>
	<br>
		 <button name="one" value="1">1번</button>
		 <button name="two" value="2">2번</button>
		 <button name="three" value="3">3번</button>
	</form>
	<div id="msg">
	<%
		String msg = request.getParameter("msg");
		if(msg!=null){
			out.print("<br><br><p>" + msg + "</p>");
		}
	%>
	</div>
</body>
</html>



