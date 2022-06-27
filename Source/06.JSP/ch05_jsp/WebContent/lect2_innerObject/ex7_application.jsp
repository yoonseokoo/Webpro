<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
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
	String conPath = request.getContextPath();
	String appPath = application.getContextPath();
	String absolutePath = application.getRealPath(".");
	
	%>
	<h2>conPath : <%=conPath %></h2>
	<h2>appPath : <%=appPath %></h2>
	<h2>absolutePath : <%=absolutePath %></h2>
	<%
	String filePath = application.getRealPath("WEB-INF/input.txt");
	out.println(filePath + "의 내용입니다<br><br>");
	//Construct stream object (open file) - read file - close stream object
	BufferedReader br = new BufferedReader(new FileReader(filePath));
	while(true) {
		String line = br.readLine(); //reads one line at a time till it reaches end (returns null if its at the end of the file)
		if (line==null) break;
		out.println(line+ "<br>");
	
	}
	br.close();
	
	/* BufferedReader br = null;
	try {
		br = new BufferedReader(new FileReader(filePath)); //Construct stream object
		while(true) {
			String line = br.readLine(); //reads one line at a time till it reaches end (returns null if its at the end of the file)
			if (line==null) break;
			out.println(line+ "<br>");
		
		}
	
	}catch (Exception e) {
		out.println("File does not exist or is not readable");
	} finally {
		try {
			if(br!=null)
				br.close();
			
		} catch (Exception e) {
	} */
	%>
</body>
</html>