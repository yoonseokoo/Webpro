<%@ page language="java" contentType="text/html; charset= UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="${conPath }/css/style.css" rel="stylesheet">
</head>
<body>
	<form action="${conPath }/input2.do" method="post">
		<table>
			<tr><td colspan="2">현재 총 ${cnt }명</td></tr>
			<tr>
				<th>이름 : </th>
				<td><input type="text" name="name" value="${student.name }"></td>
			</tr>
				<tr>
				<th>국어 : </th>
				<td><input type="number" name="kor" value='<c:if test="${student.kor!=0 }">${student.kor }</c:if>'></td>
			</tr>
			<tr>
				<th>영어 : </th>
				<td><input type="number" name="eng" value='<c:if test="${student.eng!=0 }">${student.eng }</c:if>'></td>
			</tr>
			<tr>
				<th>수학 : </th>
				<td><input type="number" name="math" value='<c:if test="${student.math!=0 }">${student.math }</c:if>'></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit">
				</td>
			</tr>
		</table>
	</form>
	<h4>${nameError }</h4>
	<h4>${korError }</h4>
	<h4>${engError }</h4>
	<h4>${mathError }</h4>
			
</body>
</html>