<%@page import="com.lec.dto.BookDto"%>
<%@page import="com.lec.dao.BookDao"%>
<%@page import="java.sql.Date"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String conPath = request.getContextPath(); %> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="<%=conPath%>/css/style.css" rel="stylesheet">
</head>
<body>
<% // 한글 인코딩처리 - multipartRequest객체 생성 - 첨부된 파일명 get - 그외 파라미터에서 입력된 정보 get - insert 
	request.setCharacterEncoding("utf-8");
	String path = request.getRealPath("bookImg");
	int maxSize = 1024*1024*5; // 최대 업로드 용량이 5M
	String[] image = {"",""}; // 저장된 파일명 저장소
	MultipartRequest mRequest = null;
	try{
		// multipartRequest 객체 생성
		mRequest = new MultipartRequest(request, path, maxSize, 
																		"utf-8", new DefaultFileRenamePolicy());
		// 서버에 저장된 파일명 get
		Enumeration<String> paramNames = mRequest.getFileNames(); // 파라미터 이름들
		int idx = 0;
		while(paramNames.hasMoreElements()){
			String param = paramNames.nextElement(); // 파라미터 이름
			image[idx] = mRequest.getFilesystemName(param); // 저장된 파일명
			idx++;
		}		// while
	}catch(Exception e){
		System.out.println(e.getMessage());
	}
	// 서버의 bookImg폴더 파일을 소스의 bookImg폴더로 복사
	for(String img : image){
		if(img!=null){
			InputStream is = null;
			OutputStream os = null;
			File serverFile = new File(path+"/"+img);
			try{
				is = new FileInputStream(serverFile);
				os = new FileOutputStream("D:/webPro/src_home/06_JSP/model1ex/WebContent/bookImg/"+img);
				byte[] bs = new byte[(int)serverFile.length()];
				while(true){
					int readbyteCnt = is.read(bs);
					if(readbyteCnt==-1) break;
					os.write(bs, 0, readbyteCnt);
				}
			}catch(Exception e){
				System.out.println(e.getMessage());
			}finally{
				if(os!=null) os.close();
				if(is!=null) is.close();
			}
		}
	}
	// 파일첨부외 파라미터에서 입력된 정보 get
	int bid = 0;
	String btitle = mRequest.getParameter("btitle");
	int    bprice = Integer.parseInt(mRequest.getParameter("bprice"));
	String bimage1 = image[1]==null? "noImg.png": image[1];
	String bimage2 = image[0]!=null? image[0]:"NOTHING.JPG";
	String bcontent = mRequest.getParameter("bcontent");
	int    bdiscount = Integer.parseInt(mRequest.getParameter("bdiscount"));
	Date   brdate = null;
	// DB에 insert
	BookDao bDao = BookDao.getInstance();
	BookDto book = new BookDto(bid, btitle, bprice, bimage1, bimage2, 
			bcontent, bdiscount, brdate);
	int result = bDao.insertBook(book);
	if(result == BookDao.SUCCESS){
%>
		<script>
			alert('책등록 성공');
			location.href = "bookRegister.jsp";
		</script>
<% }else{ %>
		<script>
			alert('책등록 실패');
			history.back();
		</script>
<% }%>
</body>
</html>
