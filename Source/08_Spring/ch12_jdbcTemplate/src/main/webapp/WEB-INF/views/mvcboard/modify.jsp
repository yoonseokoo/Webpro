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
	<form action="${conPath }/mvcboard/modify.do" method="post">
  	<input type="hidden" name="pageNum" value="${param.pageNum }">
  	<table>
  		<tr>
  			<th>글번호</th>
  			<td><input type="text" name="bid" value="${bDto.bid }" readonly="readonly"></td>
  		</tr>
  		<tr>
  			<th>작성자</th>
  			<td><input type="text" name="bname" value="${bDto.bname }" required="required"></td>
  		</tr>
  		<tr>
  			<th>글제목</th>
  			<td><input type="text" name="btitle" value="${bDto.btitle }" required="required"></td>
  		</tr>
  		<tr>
  			<th>본문</th>
  			<td><textarea rows="5" cols="32" name="bcontent">${bDto.bcontent }</textarea></td>
  		</tr>
  		<tr>
  		<td colspan="2">
  					<input type="submit" value="수정" class="btn">
  					<input type="reset" value="초기화" class="btn">
  					<input type="button" value="목록" class="btn"
  						onclick="location.href='${conPath}/mvcboard/list.do?pageNum=${param.pageNum }'">
  		</td></tr>
  	</table>
  </form>
</body>
</html>
ml>