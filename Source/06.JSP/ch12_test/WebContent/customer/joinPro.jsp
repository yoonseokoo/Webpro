<%@page import="java.sql.Timestamp"%>
<%@page import="com.lec.customer.CustomerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	
</head>
<body>
<%	
	request.setCharacterEncoding("utf-8"); 
%>
	<jsp:useBean id="dto" class="com.lec.customer.CustomerDto" scope="page"/>
	<jsp:setProperty name="dto" property="*" />
<%
	String tempbirth = request.getParameter("tempbirth");
	if(!tempbirth.equals("")){
	dto.setCbirth(Timestamp.valueOf(tempbirth + " 00:00:00"));
	}
	
	CustomerDao cDao = new CustomerDao();
	int result = cDao.confirmId(dto.getCid()); // Checking for ID duplicates
	if(result == CustomerDao.CUSTOMER_NONEXISTENT){ // Available ID
		result = cDao.joinCustomer(dto); // Sign-in
		if(result == CustomerDao.SUCCESS){ // Sign-in successfull
			session.setAttribute("cid", dto.getCid());
%>
			<script>
				alert('Thank you for signing up. Please login to access account');		
				location.href = 'login.jsp';
			</script>
<%		}else{ // SIGNUP FAIL
%>
			<script>
				alert('Sign up failed. Program fails to read data that is too long. Please try again');																																											
				location.href = 'join.jsp';
			</script>			
<%		}
	}else{ // ID NON-UNIQUE
%>	<script>
			alert('ID is already in use. Please use different ID');
			history.back();
	</script>			
<%}%>
</body>
</html>



