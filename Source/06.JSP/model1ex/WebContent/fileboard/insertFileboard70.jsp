<%@page import="com.lec.dto.FileboardDto"%>
<%@page import="com.lec.dao.FileboardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
<%
	FileboardDao fbDao = FileboardDao.getInstance();
	FileboardDto fbDto = new FileboardDto();
	for(int i=0 ; i<70 ; i++){
		if(i%3==0){
			fbDto.setCid("aaa");
		}else if(i%3==1){
			fbDto.setCid("bbb");
		}else if(i%3==2){
			fbDto.setCid("ccc");
		}
		fbDto.setFsubject("for문으로 강제 입력한 글 "+i);
		fbDto.setFcontent("본문 내용");
		if(i%5==0){
			fbDto.setFfilename("쿠키.docx");
		}else{
			fbDto.setFfilename(null);
		}
		fbDto.setFpw("111");
		fbDto.setFip("192.168.10."+i);
		fbDao.insertBoard(fbDto);
	}
	response.sendRedirect("fBoardList.jsp");
%>
</body>
</html>