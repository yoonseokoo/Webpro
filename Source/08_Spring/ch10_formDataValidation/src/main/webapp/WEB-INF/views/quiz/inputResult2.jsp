<%@ page language="java" contentType="text/html; charset= UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${conPath }/css/style.css" rel="stylesheet">
</head>
<body>
	<table>
		<tr><td colspan="2">현재 총 ${cnt }명</td></tr>
		<tr>
			<th>이름:</th>
			<td>${student2.name }</td>
		</tr>
		<tr>
			<th>국어:</th>
			<td>${student2.kor }</td>
		</tr>
		<tr>
			<th>영어:</th>
			<td>${student2.eng }</td>
			</tr>
		<tr>
			<th>수학:</th>
			<td>${student2.math }</td>
		</tr>
		<tr>
			<th>총점:</th>
			<td>${student2.kor+student2.eng+student2.math }</td>
		</tr>
		<tr>
		<th>평균:</th>
			<td><fmt:formatNumber type="number" value="${(student2.kor + student2.eng + student2.math)/3 }" pattern="0.00" maxFractionDigits="2"/></td>
		</tr>						
		<tr>
			<td colspan="2">
				<button onclick="history.back()">뒤로가기</button>
				<button onclick="location.href='${conPath }/inputForm.do'">다시입력</button>
			</td>
		</tr>
	</table>
	
</body>
</html>