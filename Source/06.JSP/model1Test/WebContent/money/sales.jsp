<%@page import="com.lec.dto.MoneyDto"%>
<%@page import="com.lec.dao.MoneyDao"%>
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
		<caption>회원매출 조회</caption>
	</table>
	<table>
		<tr>
			<th>회원번호</th>
			<th>회원서명</th>
			<th>고객등급</th>
			<th>매출</th>
		</tr>
	<%
		MemberDao dao = MemberDao.getInstance();
		ArrayList<MemberDto> dtos = dao.MemberSales();
			for (MemberDto d :dtos) {
				out.println("<tr><td>" + d.getCusno() + "</td><td>" + d.getCustname()
							+ "</td><td>" + d.getGdesc()+ "</td><td>" + d.getTot()+ "</td></tr>");
		}
	%>
	</table>
	<table>
		<caption>제품 매출 조회</caption>
	</table>
	<table>
		<tr>
			<th>제품 코드</th>
			<th>매출</th>
		</tr>
	<%
		MoneyDao dao2 = MoneyDao.getInstance();
		ArrayList<MoneyDto> dtos2 = dao2.MoneySales();
			for (MoneyDto d :dtos2) {
				out.println("<tr><td>" + d.getPcode() + "</td><td>" + d.getTotsales()
							+ "</td></tr>");
		}
	%>
	</table>
		<jsp:include page="../main/footer.jsp"/>
</body>
</html>