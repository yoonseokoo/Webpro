<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="../css/style.css" rel="stylesheet"/>
</head>
<body>
	 <jsp:useBean id="p" class="com.lec.ex.Person" scope="request"/>
    <jsp:setProperty name="p" property="name" param="name"/>
    <jsp:setProperty name="p" property="age" param="age"/>
    <jsp:setProperty name="p" property="gender" param="gender"/>
    <jsp:setProperty name="p" property="address" param="address"/>
    <jsp:forward page="pView.jsp"/>
</body>
</html>