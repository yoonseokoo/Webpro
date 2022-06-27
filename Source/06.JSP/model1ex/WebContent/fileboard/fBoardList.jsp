<%@page import="com.lec.dto.FileboardDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.lec.dao.FileboardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String conPath = request.getContextPath(); %> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="<%=conPath%>/css/style.css" rel="stylesheet">
	<style>
		#content_form{
			height: 570px; 
			padding-top:30px;
		}
	</style>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div id="content_form">
		<table>
			<tr>
				<td colspan="7">
					<%if(session.getAttribute("customer")!=null){%>
						<a href="fBoardWriteForm.jsp">글쓰기</a>
					<%}%>
				</td>
			</tr>
			<tr>
				<th>글번호</th>
				<th>작성자</th>
				<th>글제목</th>
				<th>메일</th>
				<th>IP</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
			<% 
				String pageNum = request.getParameter("pageNum");
				if(pageNum==null) pageNum = "1";
				int currentPage = Integer.parseInt(pageNum);
				final int PAGESIZE = 10, BLOCKSIZE = 10;
				int startRow = (currentPage-1) * PAGESIZE + 1;
				int endRow   = startRow + PAGESIZE - 1;
				FileboardDao fbDao = FileboardDao.getInstance();
				ArrayList<FileboardDto> dtos = fbDao.listBoard(startRow, endRow);
				if(dtos.isEmpty()){
					out.println("<tr><td colspan='7'>글이 업습니다</td></tr>");
				}else{
					for(FileboardDto d : dtos){ //글번호, 작성자(이름), 제목, 메일, IP, 작성일, 조회수
			%>		<tr>
							<td><%=d.getFnum() %></td>
							<td><%=d.getCname() %></td>
							<td class="left">
								<%if(d.getFre_level()>0){ %>
										<img src="<%=conPath %>/img/level.gif" width="<%=d.getFre_level()*20 %>"
																													height="10">
										<img src="<%=conPath %>/img/re.gif">
								<%} %>
								<%if(d.getFhit()>10){ %>
										<img src="<%=conPath%>/img/hot.gif">
								<%} %>
								<a href="fBoardContent.jsp?fnum=<%=d.getFnum()%>&pageNum=<%=pageNum%>">
								<%=d.getFsubject() %></a>
								<%if(d.getFfilename()!=null){ %>
										<img src="<%=conPath %>/img/fileup.jpg" height="10">
								<%} %>
							</td>
							<td><%=d.getCemail()==null? " - " : d.getCemail()%></td>	
							<td><%=d.getFip() %></td>
							<td><%=d.getFrdate() %></td>
							<td><%=d.getFhit() %></td>
						</tr>								
			<%	}//for
				} // if %>
		</table>
		<div class="paging">
		<%
			int totCnt = fbDao.getFileboardCnt(); // 글 수
			int pageCnt = (int)Math.ceil((double)totCnt/PAGESIZE); // 페이지 수
			int startPage = ((currentPage-1)/BLOCKSIZE) * BLOCKSIZE + 1;
			int endPage = startPage + BLOCKSIZE -1;
			if(endPage > pageCnt) endPage = pageCnt;
			if(startPage > BLOCKSIZE){
		%>	
				[ <a href="<%=conPath %>/fileboard/fBoardList.jsp?pageNum=<%=startPage-1%>">이전</a> ]
		<%}
			for(int i=startPage ; i<=endPage ; i++){
				if(i==currentPage){
					out.println("<b>"+i +"</b>");
				}else{
					out.println("<a href='"+conPath+"/fileboard/fBoardList.jsp?pageNum="+i+"'>"+i+"</a>");
				}
			}
			if(endPage < pageCnt){
		%>
				[ <a href="<%=conPath %>/fileboard/fBoardList.jsp?pageNum=<%=endPage+1%>">다음</a> ]
		<%}%>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>