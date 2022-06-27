
<%@page import="com.lec.dto.CustomerDto"%>
<%@page import="com.lec.dao.FileboardDao"%>
<%@page import="com.lec.dto.FileboardDto"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.io.IOException"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String conPath = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=conPath%>/css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<%
	String path = request.getRealPath("fileboardUpload");
	int maxSize = 1024*1024*5;
	String ffilename = null;
	MultipartRequest mRequest = null;
	try {
		mRequest = new MultipartRequest (request, path, maxSize, "utf-8", new DefaultFileRenamePolicy());
		Enumeration<String> params = mRequest.getFileNames();
		String param = params.nextElement();
		ffilename = mRequest.getFilesystemName(param);
	} catch (IOException e) {
		System.out.println(e.getMessage());
	}
	if (ffilename!=null) {
		InputStream is = null;
		OutputStream os = null;
		try {
	File serverFile = new File(path+"/"+ffilename);
	is = new FileInputStream(serverFile);
	os = new FileOutputStream("C:/Users/user/Desktop/unie/Source/06.JSP/model1ex/WebContent/fileboardUpload/" + ffilename);
	byte[] bs = new byte[(int) serverFile.length()];
	int readByteCnt;
	while((readByteCnt = is.read(bs))!=-1) {
		os.write(bs, 0, readByteCnt);
	}
		} catch (Exception e) {
	System.out.println(e.getMessage());
		} finally {
	if(os!=null) {
		os.close();
	}
	if(is!=null) {
		is.close();
	}
		}
	}
	String pageNum = mRequest.getParameter("pageNum");
	int fnum = Integer.parseInt(mRequest.getParameter("fnum"));
	String cid = ((CustomerDto)session.getAttribute("customer")).getCid();
	String fsubject = mRequest.getParameter("fsubject");
	String fcontent = mRequest.getParameter("fcontent");
	String fpw = mRequest.getParameter("fpw");
	int fref = Integer.parseInt(mRequest.getParameter("fref"));
	int fre_step = Integer.parseInt(mRequest.getParameter("fre_step"));
	int fre_level = Integer.parseInt(mRequest.getParameter("fre_level"));
	String fip = request.getRemoteAddr();
	FileboardDto fbDto = new FileboardDto(fnum, cid, fsubject, fcontent, ffilename, fpw, 0, fref, fre_step, fre_level, fip, null);
	FileboardDao fbDao = FileboardDao.getInstance();
	int result;
	if(fnum == 0) { //NEW POST
		result = fbDao.insertBoard(fbDto);
	} else { //REPLY POST
		result = fbDao.reply(fbDto);
	}
	if (result == FileboardDao.SUCCESS) {
%>
		<script>
			alert('글쓰기 성공');
			location.href = 'fBoardList.jsp?pageNum=<%=pageNum%>';
		</script>
	<% }else{ %>
		<script>
			alert('글쓰기 실패');
			history.back();
		</script>
	<% } %>

</body>
</html>