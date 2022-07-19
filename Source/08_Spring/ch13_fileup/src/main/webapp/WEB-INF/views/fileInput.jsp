<%@ page language="java" contentType="text/html; charset= UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<head>
	<title>Home</title>
	<meta charset="UTF-8">
	<link href="${conPath }/css/style.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.0.js" ></script>
	<script>
		$(document).ready(function(){
			
		});
	</script>
</head>
<body>
	<div align="center">
		<hr width="500" color="green">
		<h2>File upload</h2>	
		<hr width="500" color="green">
		<form action="fileupload" method="post" enctype="multipart/form-data">
			<p>file1 <input type="file" name="file1"></p>
			<p>file2 <input type="file" name="file2"></p>
			<p>file3 <input type="file" name="file3"></p>
			<input type="submit" value="send">
		</form>
	</div>
</body>
</html>