<%@page import="com.lec.dto.BoardDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.lec.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="<%=conPath %>/css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<a href = "xx.jsp">xx</a>
	<%--
	// CHECK [1]:
		BoardDao bDao = BoardDao.getInstance();	
		out.println("<h2>1. DB 글갯수 : </h2><br>" + "객수는 " + bDao.getBoardTotalCnt() + "입니다");
		
	// CHECK [2]:
		out.println("<h2>2. 글목록 : </h2>");
		ArrayList<BoardDto> dtos = bDao.listBoard();
		for(BoardDto dto : dtos) {
			out.println(dto + "<br>");
		}
	// CHECK [3]:
		out.println("<h2>3. 글쓰기: </h2>");
		BoardDto dto = new BoardDto(0, "김길동", "글제목n", "본문\n임다", "kim@k.com", 0 ,"1",  0, 0, 0, "127.0.0.2" , null);
		int result = bDao.insertBoard(dto);
		out.println(result == BoardDao.SUCCESS ? "글쓰기 성공" : "글씨기 실패");
		
	// CHECK [4]:
		out.println("<h2>4. 글찾기: </h2>");
		out.println("1번 글은: " + bDao.getBoardOneLine(1));
			
	// CHECK [5]:
		out.println("<h2>5. 조회수 올리기: </h2>");
		bDao.readcountUp(16);
		dto = bDao.getBoardOneLine(16);
		out.println("수정 후 정보" + dto);
		
	// CHECK [6]:
		out.println("<h2>6. 글수정: </h2>");
		dto.setSubject("바뀐제목xxxx");
		dto.setContent("바뀐본문xxx");
		result = bDao.updateBoard(dto);
		if (result == BoardDao.SUCCESS) {
			dto = bDao.getBoardOneLine(16);
			out.println("수정 후의 7번 글" + dto);
		} else {
			out.println("수정실패");
		}
	// CHECK [7]:
		out.println("<h2>7. 글삭제: </h2>");
		result = bDao.deleteBoard(16, "11"); //wrong PW purposely to checks
		out.println(result == BoardDao.SUCCESS ? "16글 삭제 성공 " : "16번글 삭제 실패");
		result = bDao.deleteBoard(16, "1"); //wrong PW purposely to checks
		out.println(result == BoardDao.SUCCESS ? "16글 삭제 성공 " : "16번글 삭제 실패");
	--%>
</body>
</html>