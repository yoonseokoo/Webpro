<%@ page language="java" contentType="text/html; charset= UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<title>Home</title>
	<meta charset="UTF-8">
	<link href="${conPath }/css/style.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.0.js" ></script>
	<script>
		$(document).ready(function(){
			
		});
		function trclicked(empno){
			location.href='${conPath}/detail.do?empno='+empno + '&pageNum=${paging.currentPage}';
		}
	</script>
</head>
<body>
	<c:set var="num" value="${paging.totCnt - paging.startRow +1 }"/>
	<table>
		<caption>Employees list</caption>
		<tr>
			<td colspan="6" align="right">
				<a href="${conPath }/writeForm.do"></a>
			</td>
		</tr>
		<tr>
			<th>Number</th>
			<th>Emp Number</th>
			<th>Name</th>
			<th>Job</th>
			<th>Hired date</th>
			<th>Salary</th>
		</tr>
		<c:forEach items="${empList }" var="emp">
			<tr onclick="trclicked(${emp.empno})">
				<td>${num }</td>
				<td>${emp.empno }</td>
				<td>${emp.ename }</td>
				<td>${emp.job }</td>
				<td>${emp.hiredate }</td>
				<td><fmt:formatNumber value="${emp.sal }" groupingUsed="true" pattern="#,###,###"/></td>
			
			<c:set var="num" value="${num-1 }"/>
				
			</tr>
		</c:forEach>
	
	</table>
	<br>
	<br>
	<c:if test="${paging.startPage>paging.blockSize }">
		[ <a href="${conPath }/empList.do?pageNum=${paging.startPage-1}">이전</a> ]
	</c:if>
	<c:forEach var="i" begin="${paging.startPage }"
		end="${paging.endPage }">
		<c:if test="${paging.currentPage==i }">
			[ <b> ${i }</b> ]
		</c:if>
		<c:if test="${paging.currentPage!=i }">
			[ <a href="${conPath }/empList.do?pageNum=${i}"> ${i }</a> ]
		</c:if>
	</c:forEach>
	<c:if test="${paging.endPage<paging.pageCnt }">
		[ <a href="${conPath }/empList.do?pageNum=${paging.endPage+1}">다음</a> ]
	</c:if>
</body>
</html>
