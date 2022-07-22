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
			$('select').change(function(){
				$('form').submit();
			});
			$('input[type=text]').keyup(function(){
				$('form').submit();
			});
		});
	</script>
</head>
<body>
	<div id=wrap>
		<form action="" method="get">
			사원명 <input type="text" name="ename" value="${schEmp.ename }" size="5">
			직책 <input type="text" name="job" value="${schEmp.job }" size="5">
			부서 <select name="deptno">
					<option value="0">모든부터</option>
					<c:forEach var="dept" items="${deptList }">
						<option value="${dept.deptno }"
							<c:if test="${dept.deptno eq schEmp.deptno }">
								selected="selected"
							</c:if>
						>${dept.dname }</option>
					</c:forEach>
				</select>
			<table>
				<tr>
					<th>사원번호</th>
					<th>이름</th>
					<th>직책</th>
					<th>관리자</th>
					<th>입사일</th>
					<th>급여</th>
					<th>상여</th>
					<th>부서번호</th>
				</tr>
				<c:if test="${empList.size() eq 0 }">
					<tr><th colspan="8">검색 결과의 맞는 사원이 없습니다</th></tr>
				</c:if>
				<c:forEach var="emps" items="${empList }">
					<tr>
						<td>${emps.empno }</td>
						<td>${emps.ename }</td>
						<td>${emps.job }</td>
						<td>${emps.mgr }</td>
						<td><fmt:formatDate value="${emps.hiredate }" pattern="yy년 MM월 dd일"/></td>
						<td align="right"><fmt:formatNumber value="${emps.sal }" pattern="#,###,###"/></td>
						<td align="right"><fmt:formatNumber value="${emps.comm }" pattern="#,###,###"/></td>
						<td>${emps.deptno }</td>			
					</tr>
				</c:forEach>
			</table>
		</form>
	</div>
</body>
</html>