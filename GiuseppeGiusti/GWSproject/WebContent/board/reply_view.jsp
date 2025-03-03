<%@ page language="java" contentType="text/html; charset=UTF-8"
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
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200;400&display=swap" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

	<!-- include summernote css/js-->
	<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
	<script>
				 $(document).ready(function() {
					 $('#summernote').summernote({
					        height: 300,
					        minHeight: null,
					        maxHeight: null,
					        lang : 'ko-KR',
					        onImageUpload: function(files, editor, welEditable) {
					                sendFile(files[0], editor, welEditable);
					            }
	
					    });
				 });
	</script>
</head>
<body>
<body>
<jsp:include page="../main/header.jsp"/>
	<form action="${conPath }/reply.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="pageNum" value="${param.pageNum }">
		<input type="hidden" name="bGroup" value="${reply_view.bGroup }">
		<input type="hidden" name="bStep" value="${reply_view.bStep }">
		<input type="hidden" name="bIndent" value="${reply_view.bIndent }">
	<div id="boardList_wrap">
		<table>
			<caption>${reply_view.bId }번 글의 답글 쓰기</caption>
			
			<tr>
				<th>작성자</th>
				<td>
					<input type="text" name="mId" readonly="readonly" value="${member.mName }(${member.mId })">
				</td>
				
			</tr>
			<tr><th>제목</th><td><input type="text" name="bTitle" required="required" value=" [답]${reply_view.bTitle }"></td></tr>
			<tr><th>본문</th><td><textarea name="bContent" id="summernote"></textarea></td></tr>
			<tr>
				<th>사진</th>
				<td>
					<input type="file" name="bImage" class="photo">
				</td>
			</tr>
			<tr>
				<td colspan="3">
					<input type="submit" value="글쓰기" class="btn2">
					<input type="reset" value="초기화" class="btn2">
					<input type="button" value="목록" onclick="location='${conPath }/list.do'" class="btn2">
				</td>
			</tr>
		</table>
	</div>
	
	</form>
	<jsp:include page="../main/footer.jsp"/>
</body>
</body>
</html>