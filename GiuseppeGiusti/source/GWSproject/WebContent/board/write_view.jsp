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
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200;400&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

	<!-- summernote css/js-->
	<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
	<link href="${conPath }/css/style.css" rel="stylesheet">
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
<jsp:include page="../main/header.jsp"/>
	<form action="${conPath }/write.do" method="post" enctype="multipart/form-data">
	<div id="boardList_wrap">
		<table>
			<caption>원글쓰기</caption>
			<tr>
				<th>작성자</th>
				<td>
					<input type="text" name="mId" required="required" value="${member.mId }" readonly="readonly">
				</td>
			</tr>
			<tr>
				<th>제목</th>
					<td><input type="text" name="bTitle" required="required">
				</td>
			</tr>
			<tr>
				<th>본문</th>
				<td>
					<textarea name="bContent" id="summernote"></textarea>
				</td>
			</tr>
			<tr>
				<th>사진</th>
				<td>
					<input type="file" name="bImage" class="photo">
				</td>
			</tr>
			<tr>
				<th></th>
				<td colspan="3">
					<input type="submit" value="글쓰기" class="btn2" >
					<input type="reset" value="초기화" class="btn2">
					<input type="button" value="목록" onclick="location='${conPath }/list.do'" class="btn2">
				</td>
			</tr>
		</table>
	</div>
	</form>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>