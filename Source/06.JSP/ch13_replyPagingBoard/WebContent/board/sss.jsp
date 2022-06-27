<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	}else{				
			ArrayList<BoardDto> dtos = dao.listBoard(startRow, endRow);
			for(BoardDto dto : dtos){
				
				out.println("<tr><td>"+dto.getNum()+"</td><td>"+dto.getWriter()+"</td>");
				out.println("<td class='left'>");
				if(dto.getRe_indent() > 0){
					int width = (dto.getRe_indent()-1) * 10;
					out.println("<img src='../img/level.gif' width='"+width+"' height='10'>");
					out.println("<img src='../img/re.gif'>");
				}
				if(dto.getReadcount() > 10){
					out.println("<img src='"+conPath +"/img/hot.gif'>");
				}
				out.println("<a href='content.jsp?num="+ dto.getNum()+"&pageNum=" + pageNum + "'>" + dto.getSubject() +"</a></td>");
				out.println("<td>"+ (dto.getEmail()!=null ? dto.getEmail() : "" ) + "</td><td>"+dto.getReadcount() + "</td></tr>");
			}
		}
</body>
</html>