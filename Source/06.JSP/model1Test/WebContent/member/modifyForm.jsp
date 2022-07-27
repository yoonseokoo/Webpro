<%@page import="com.lec.dto.MemberDto"%>
<%@page import="com.lec.dao.MemberDao"%>
<%@page import="java.sql.Date"%>
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
	<style>
		#content_form {
		width:600px; 
		margin: 10px auto;
		padding:20px;
		text-align: center;
		}
	#content_form caption{          	
		margin:10px auto;
		padding-bottom:20px;     	
		border-bottom:1px solid #625750;
		color:#625750;          	
		font-size:1.5em;
		text-align:center;       	
		font-weight:bold;
	}
	#content_form table{
		margin:0 auto; 
		color:#dfcdc3; 
		}
	#content_form table tr{
		height:40px; 
		}
	#content_form table th{
		width:300px;        	
		font-size:0.9em;
		color:#625750;     
		text-align:left;    	
		padding-left:10px;
	}
	#content_form table td {
		width: 300px;
	}
	#cusno, #custname, #phone, #address, #birth, #grade, #city, #joindate {
		border: 1px solid #5f6769; 
		height:20px;	
		width:95%; 
		padding:3px;
	}
	
	.btn {
		color: #ffffff;        	
		background: #5f6769;
		border:0;              
		outline: none;
		width:32%;              
		padding:5px 0; 
	}
	</style>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div id="content_form">
	<%
		int cusno = Integer.parseInt(request.getParameter("cusno"));
		MemberDao mDao = MemberDao.getInstance();
		MemberDto mDto = mDao.detail(cusno);
	%>
		<form action="modifyPro.jsp" method="post">
			<table>
				<caption>정보 수정</caption>
				<tr><th>회원번호</th>
						<td><input type="text" name="cusno" id="cusno" value="<%=cusno %>" readonly="readonly"></td>
				</tr>
				<tr><th>회원성명</th>
						<td><input type="text" name="custname" id="custname" value="<%=mDto.getCustname() %>"
										autofocus="autofocus" required="required"></td>
				</tr>
				<tr><th>회원전호</th>
						<td><input type="text" name="phone" id="phone" value="<%=mDto.getPhone() %>"
										autofocus="autofocus" required="required"></td>
				</tr>
				<tr><th>회원주소</th>
						<td><input type="text" name="address" id="address" value="<%=mDto.getAddress() %>"
										autofocus="autofocus"></td>
				</tr>
				<tr><th>가입일자</th>
						<td><input type="text" name="tempbirth" id="joindate" value="<%=mDto.getJoindate() %>"
										readonly="readonly" ></td>
				</tr>
				<tr><th>고객등급</th>
						<td><input type="text" name="grade" id="grade" value="<%=mDto.getGrade() %>"></td>
				</tr>
				<tr><th>도시코드</th>
						<td><input type="text" name="city" id="city" value="<%=mDto.getCity() %>"></td>
				</tr>
				
				<tr>
					<td colspan="2">
						<input type="submit" value="글수정" class="btn">
						<input type="reset" value="조회" class="btn" onclick="history.go(-1)">
			</table>
		</form>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>


























