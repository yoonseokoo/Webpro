<%@page import="java.util.ArrayList"%>
<%@page import="com.lec.friend.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="<%=conPath %>/css/style.css" rel="stylesheet" type="text/css">
	<style>
		p {width:400px; margin: 0 auto;}
	</style>
	<script>
		function search(){
			var fname = add_frm.fname.value;
			var fphone = add_frm.fphone.value;
			location.href = 'friendInputList.jsp?fname='+fname+'&fphone='+fphone;
		}
	</script>
	
</head>
<body>
	<form action="friendInputListPro.jsp" method="post" name="add_frm">
			
				<p>친구이름  <input type="text" name="fname" required="required"	size="6" value="<%
																														String fname = request.getParameter("fname");
																														if(fname!=null) out.print(fname); %>">
				전화  <input type="text" name="fphone" size="14" value="<%
																						String fphone = request.getParameter("fphone");
																						if(fphone!=null) out.print(fphone); %>">
				<input type="button" value="검색 " onclick="search()">
				<input type="button" value="추가 ">
			</p>
	</form>
	
	<table>
		<tr><th>순번</th><th>이름</th><th>전화</th></tr>
		<%
			FriendDao friendDao = FriendDao.getInstance();
			ArrayList<FriendDto> friends = friendDao.select(fname, fphone);
			for(FriendDto friend : friends){
				out.println("<tr>");
				out.println("<td>"+friend.getFno()+"</td>");
				out.println("<td>"+friend.getFname()+"</td>");
				out.println("<td>"+(friend.getFphone()!=null? friend.getFphone():"")+"</td>");
				out.println("</tr>");
		}%>
	</table>
</body>
</html>