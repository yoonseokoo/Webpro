<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    String color = request.getParameter("color");
    if(color==null) {
    	color="white";
    }
    %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
		body {
			background-color: <%=color%>;
		}
	</style>
</head>
<body>
	<h1>배경색 바꾸기</h1>
	<form action="">
		<select name="color">
		<option value="red">RED</option>
		<option value="orange">ORANGE</option>
		<option value="yellow">YELLOW</option>
		<option value="green">GREEN</option>
		<option value="blue">BLUE</option>
		<option value="navy">NAVY</option>
		<option value="purple">PURPLE</option>
		</select>
		<input type="submit" value="적용">
	</form>
</body>
</html>