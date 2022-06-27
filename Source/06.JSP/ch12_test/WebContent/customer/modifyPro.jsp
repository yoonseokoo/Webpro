
<%@page import="com.lec.customer.CustomerDao"%>
<%@page import="com.lec.customer.CustomerDto"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<% request.setCharacterEncoding("utf-8"); %>
	<jsp:useBean id="dto" class="com.lec.customer.CustomerDto"/>
	<jsp:setProperty name="dto" property="*"/>
	
	<%
	String tempbirth = request.getParameter("tempbirth");
	if(!tempbirth.equals("")){
		dto.setCbirth(Timestamp.valueOf(tempbirth + " 00:00:00"));
	}
	CustomerDto customer = (CustomerDto)session.getAttribute("customer");
	String sessionPw = null;
	if(customer!=null) {
		sessionPw = customer.getCpw(); 
	}
	String oldPw = request.getParameter("oldPw");
	if(sessionPw.equals(oldPw)){
		if(dto.getCpw() == null) {
			dto.setCpw(oldPw);
		}
		CustomerDao cDao = new CustomerDao();
		int result = cDao.modifyCustomer(dto);
		if(result==CustomerDao.SUCCESS) { //UPDATE SUCCESSFUL
			session.setAttribute("customer", dto); //update info in session
%>			<script>
				alert('Your information has been updated successfully');
				location.href = 'main.jsp';
			</script>
<%
		} else { //UPDATE UNSUCCESSFUL
%>			<script>
				alert('Information could not be updated. Please check your changes');
				location.href = 'modify.jsp';
			</script>
<%	
		}
		
	} else { //if current password is entered incorrectly
		%>
		<script>
			alert('Current password is incorrect. Please check your Pw');
			history.back();
		</script>
		<% } %>
	}
	
	
	%>
</body>
</html>










