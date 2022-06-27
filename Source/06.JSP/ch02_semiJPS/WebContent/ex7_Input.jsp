<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
		p, h1{
			text-align:center;
		}
		input {
			height: 30px;
		}
		form {
			border: 1px solid black;
			width:40%;
			margin: 0 auto;
		}
	</style>
</head>
<body>
		<h1>로그인 화면</h1>
	<form action="ex7_Out.jsp" method="post">
		<p>NAME: <input type="text" name = "name" ></p>
		<p>ID: <input type="text" name = "id"></p>
		<p>PW: <input type="password" name = "pw" ></p>
		<p><input type="submit" value="로그인"></p>
	</form>
</body>
</html>






