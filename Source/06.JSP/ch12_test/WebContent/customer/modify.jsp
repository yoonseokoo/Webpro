<%@page import="com.lec.customer.CustomerDto"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="<%=conPath %>/css/modify.css" rel="stylesheet" type="text/css">
</head>
<body>
	<%! 
		String cid, cname, ctel, cemail, caddress, cgender;
		Timestamp cbirth; 
		
	%>
	<%
		CustomerDto customer = (CustomerDto)session.getAttribute("customer");
	if(customer == null) {
		response.sendRedirect("login.jsp");
	} else {
		cid = customer.getCid();
		cname = customer.getCname();
		ctel = customer.getCtel();
		cemail = customer.getCemail();
		caddress = customer.getCaddress();
		cgender = customer.getCgender();
		cbirth = customer.getCbirth();
	}
	%>
</body>
<jsp:include page="header.jsp"/>
<div id="modifyForm_wrap">
<form action="modifyPro.jsp" method="post" name="modify_frm">
	<div id="modify_title">정보수정</div>
	<table>
		<caption>정보수정</caption>
		<tr>
			<th>아이디</th>
			<td>
				<input type="text" name="cid" value="<%=cid %>" class="id" readonly="readonly">
			</td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td>
				<input type="password" name="oldPw" class="pw" required="required">
			</td>
		</tr>
		<tr>
			<th>새비밀번호</th>
			<td>
				<input type="password" name="cpw" class="pw" placeholder="Only required in case of password change">
			</td>
		</tr>
		<tr>
			<th>이름</th>
			<td>
				<input type="text" name="cname" class="name" value=<%=cname %> required="required">
			</td>
		</tr>
		
		<tr>
			<th>전화</th>
			<td>
				<input type="text" name="ctel" class="tel" value=<%=ctel %>>
			</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>
				<input type="email" name="cemail" class="email" value='<%=cemail==null? "":cemail %>'>
			</td>
		</tr>
		<tr>
			<th>주소</th>
			<td>
				<input type="text" name="caddress" class="address" value='<%=caddress==null ? "" : caddress %>'>
			</td>
		</tr>
		<tr>
			<th>생일</th>
			<td>
				<input type="date" name="tempbirth" class="birth" value='<%=cbirth==null ? "" : cbirth.toString().substring(0,10) %>'>
			</td>
		</tr>
		<tr>
			<th>성별</th>
			<td>
				<%if("m".equals(cgender)) { %>
					<input type="radio" checked="checked" name="cgender" value="m">남
					<input type="radio" name="cgender" value="f">여
						
				<%} else { %>
					<input type="radio" name="cgender" value="m">남
					<input type="radio" checked="checked" name="cgender" value="f">여
				<% } %>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="수정하기" class="modifyBtn_style">
				<input type="reset" value="다시하기" class="modifyBtn_style">
				<input type="button" value="이전으로" class="modifyBtn_style" onclick="history.back()">
			</td>
		</tr>
	</table>
</form>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>



























