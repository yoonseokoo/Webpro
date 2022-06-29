<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<link href="${conPath }/css/style.css" rel="stylesheet">
	<link href="${conPath }/se2/css/ko_KR/smart_editor2.css" rel="stylesheet" type="text/css">
</head>
<body>
<form action="${conPath }/naverSmartEditwrite.do" method="post" enctype="multipart/form-data">
	<table>
		<caption>글쓰기</caption>
		<tr><th>글제목</th>
				<td style="text-align: left;"><input type="text" name="btitle" required="required"></td>
		</tr>
		<tr><th>글본문</th>
				<td>
				<script type="text/javascript" src="${conPath }/se2/js/service/HuskyEZCreator.js" charset="utf-8" ></script>
										
					<textarea rows="5" cols="32" name="bcontent" id="bcontent"></textarea>
					<script type="text/javascript">
						var oEditors = [];
						nhn.husky.EZCreator.createInIFrame({
							 oAppRef: oEditors,
							 elPlaceHolder: "bcontent",
							 sSkinURI: "${conPath }/se2/SmartEditor2Skin.html",
							 fCreator: "createSEditor2"
							});
						</script>		
				</td>
		</tr>
		<tr><th>첨부파일</th>
				<td><input type="file" name="bfile"></td>
		<tr><td colspan="2"><input type="submit" value="글쓰기">	
				<input type="button" value="목록" onclick="location.href='${conPath }/noEditList.do'">
				</td>
		</tr>
	</table>
</form>
</body>
</html>