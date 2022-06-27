<%@page import="com.lec.member.MemberDto"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="<%=conPath %>/css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<%! 
		String id, name, phone1, phone2, phone3, gender, email, address;
		Timestamp birth; 
	%>
	<%
		MemberDto member = (MemberDto)session.getAttribute("member");
	if(member == null) {
		response.sendRedirect("login.jsp");
	} else {
		id = member.getId();
		name = member.getName();
		phone1 = member.getPhone1();
		phone2= member.getPhone2();
		phone3 = member.getPhone3();
		gender = member.getGender();
		email = member.getEmail();
		address = member.getAddress();
		birth = member.getBirth();
	}
	%>
</body>
<form action="modifyOk.jsp" method="post" name="modify_frm" onsubmit="return infoConfirm()">
	<table>
		<caption>정보수정</caption>
		<tr>
			<th>아이디</th>
			<td>
				<input type="text" name="id" value="<%=id %>" readonly="readonly">
			</td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td>
				<input type="password" name="oldPw" required="required">
			</td>
		</tr>
		<tr>
			<th>새비밀번호</th>
			<td>
				<input type="password" name="newPw" placeholder="Only required in case of password change">
			</td>
		</tr>
		<tr>
			<th>새비밀번호 확인</th>
			<td>
				<input type="password" name="newPwChk">
			</td>
		</tr>
		<tr>
			<th>이름</th>
			<td>
				<input type="text" name="name" value=<%=name %> required="required">
			</td>
		</tr>
		<tr>
			<th>전화번호</th>
				<td colspan="3">
					<select name="phone1">
						<option></option>
						<option <% if("010".equals(phone1)) {
																	out.print("selected='selected'"); 
																	}%>>010</option>
						<option <% if("02".equals(phone1)) {
																	out.print("selected='selected'"); 
																	}%>>02</option>
						<option <% if("031".equals(phone1)) {
																	out.print("selected='selected'"); 
																	}%>>031</option>
						<option <% if("032".equals(phone1)) {
																	out.print("selected='selected'"); 
																	}%>>032</option>
					</select>
				<input type="text" name="phone2" value='<%=phone2!=null ? phone2: "" %>' size="2">
				<input type="text" name="phone3" value='<%=phone3!=null ? phone3: ""  %>' size="2">
			</td>
		</tr>
		<tr>
			<th>성별</th>
				<td>
					<%if("m".equals(gender)) { %>
						<input type="radio" checked="checked" name="gender" value="m">남
						<input type="radio" name="gender" value="f">여
						
					<%} else if("f".equals(gender)) { %>
						<input type="radio" name="gender" value="m">남
						<input type="radio" checked="checked" name="gender" value="f">여
					<% } else { %>
						<input type="radio" name="gender" value="m">남
						<input type="radio" name="gender" value="f">여
					<% } %>
				</td>
			</tr>
			<tr>
				<th>이메일</th>
					<td>
						<input type="email" name="email" value='<%=email==null? "":email %>'>
					</td>
			</tr>
			<tr>
				<th>생일</th>
					<td>
						<input type="date" name="tempbirth" value='<%=birth==null ? "" : birth.toString().substring(0,10) %>'>
					</td>
			</tr>
			<tr>
				<th>주소</th>
					<td>
						<input type="text" name="address" value='<%=address==null ? "" : address %>'>
					</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="정보수정">
					<input type="reset" value="취소" onclick="history.back()">
					<input type="button" value="로그아웃" onclick="location.href='logout.jsp'">
				</td>
			</tr>
	</table>
</form>
</body>


</html>



























