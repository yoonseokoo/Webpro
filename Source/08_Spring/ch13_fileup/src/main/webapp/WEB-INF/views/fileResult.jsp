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
	<h2>File upload result : ${fileResult }</h2>
	<p>file1 : ${filenames[0] }</p>
	<p>file2 : ${filenames[1] }</p>
	<p>file3 : ${filenames[2] }</p>
	<c:if test="${not empty filenames[0] }">
		<img src="upload/${filenames[0] }">
	</c:if>
	<c:if test="${empty filenames[0] }">
		no file1 attached
	</c:if>
	<c:if test="${not empty filenames[1] }">
		<img src="upload/${filenames[1] }">
	</c:if>
	<c:if test="${empty filenames[1] }">
		no file2 attached
	</c:if>
	<c:if test="${not empty filenames[2] }">
		<img src="upload/${filenames[2] }">
	</c:if>
	<c:if test="${empty filenames[2] }">
		no file3 attached
	</c:if>
</body>
</html>