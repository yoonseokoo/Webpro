<%@page import="com.lec.dto.MemberDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.lec.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	@charset "UTF-8";
	body { 
		font-size: 9pt;
		background-color: #596e79; 
	}
	form {
		margin: 0 auto;
		text-align:center;
		
			}
	table{ 
		margin: 10px auto;
		width:95%;
		padding:10px 20px;
		background-color: #c7b198;
	}
	table tr {
		background-color:  #dfd3c3; 
		height: 40px;
	}
	
	table tr:HOVER {
		background-color: #c7b198;
		cursor: pointer;
	}
	td, th { 
		text-align: center; 
		padding: 10px 20px;
	}
	caption { 
		font-size: 30px; 
		padding:10px;
		color: #f0ece2; 
	}
	
	h2, b {
		text-align:center;
		color:#dfd3c3;
	}
	a { 
		text-decoration: none; 
		color: black;
	}
	.left{
		text-align: left;
	}
	.paging {
		text-align: center;
	}
	input:not(.btn), textarea {
	width: 90%;
}
</style>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<table>
		<caption>회원목록 조회/수정</caption>
	</table>
	<table>
		<tr>
			<th>회원번호</th>
			<th>회원서명</th>
			<th>회원전화</th>
			<th>주소</th>
			<th>가입일</th>
			<th>고객등급</th>
			<th>도시코드</th>
		</tr>
	<%
		MemberDao dao = MemberDao.getInstance();
		ArrayList<MemberDto> dtos = dao.printInfo();
			for (MemberDto d :dtos) {
				out.println("<tr><td><a href='../member/modifyForm.jsp?cusno="+ d.getCusno()+ "'>" + d.getCusno() + "</a></td><td>" + d.getCustname()
							+ "</td><td>" + d.getPhone()+ "</td><td>" + d.getAddress()+ "</td><td>" + d.getJoindate() + "</td><td>" 
							+ d.getGrade()+ "</td><td>" + d.getCity()+"</td></tr>");
		}
	%>
	</table>
		<jsp:include page="../main/footer.jsp"/>
</body>
</html>