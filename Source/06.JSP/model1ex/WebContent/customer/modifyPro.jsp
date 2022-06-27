<%@page import="com.lec.dto.CustomerDto"%>
<%@page import="java.sql.Date"%>
<%@page import="com.lec.dao.CustomerDao"%>
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
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
%>
	<jsp:useBean id="dto" class="com.lec.dto.CustomerDto"/>
	<jsp:setProperty name="dto" property="*" />
	<%
		String tempbirth = request.getParameter("tempbirth");
			dto.setCbirth(Date.valueOf(tempbirth));
			String oldPw = request.getParameter("oldPw");
			CustomerDto customer = (CustomerDto)session.getAttribute("customer");
			String sessionPw = null;
			if(customer!=null){
		sessionPw = customer.getCpw();
			}
			if(dto.getCpw()==null){
		dto.setCpw(sessionPw);
			}
			if(oldPw.equals(sessionPw)){
		CustomerDao mDao = CustomerDao.getInstance();
		int result = mDao.updateCustomer(dto);
		if(result == CustomerDao.SUCCESS){
			session.setAttribute("customer", dto);
	%>				<script>
						alert('회원정보 수정이 완료되었습니다');
						location.href = '<%=conPath%>/main/main.jsp';
					</script>
<%			}else{%>
					<script>
						alert('회원정보 수정이 실패되었습니다. 정보가 너무 깁니다');
						location.href = 'modify.jsp';
					</script>
<%			}
		}else{
%>
			<script>
				alert('현비밀번호가 바르지 않습니다. 확인하세요');
				history.back();
			</script>			
<%	}%>	
</body>
</html>










