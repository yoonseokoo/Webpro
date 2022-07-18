<%@ page language="java" contentType="text/html; charset= UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${conPath }/css/style.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.js" ></script>
</head>
<body>
	<table>
  		<caption>${bDto.bid }번 글 상세보기</caption>
  		<tr>
  			<th>작성자</th>
  			<td>${bDto.bname }</td>
  		</tr>
  		<tr>
  			<th>제 목</th>
  			<td>${bDto.btitle }</td>
  		</tr>
  		<tr>
  			<th>본 문</th>
  			<td><pre>${bDto.bcontent }</pre></td>
  		</tr>
  		<tr>
  			<th>작성일</th>
  			<td><fmt:formatDate value="${bDto.bdate }" pattern="yy/MM/dd(E) hh:mm:ss(a)"/>
  		<tr>
  			<th>조회수</th>
  			<td>${bDto.bhit }</td>
  		</tr>
  		<tr>
  			<th>ip</th>
  			<td>${bDto.bip }</td>
  		</tr>
  		<tr>
  			<td colspan="2">
  				<button onclick="location='${conPath}/mvcboard/modify.do?bid=${bid }&pageNum=${param.pageNum }'">수정</button>
  				<button onclick="location='${conPath}/mvcboard/delete.do?bid=${bid }&pageNum=${param.pageNum }'">삭제</button>
  				<button onclick="location='${conPath}/mvcboard/reply.do?bid=${bid }&pageNum=${param.pageNum }'">답변</button>
  				<button onclick="location='${conPath}/mvcboard/list.do?pageNum=${param.pageNum }'">목록</button>
  			</td>
  		</tr>
  </table>
</body>
</html>
