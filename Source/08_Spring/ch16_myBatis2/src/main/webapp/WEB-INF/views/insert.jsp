<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset= UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<title>Home</title>
	<meta charset="UTF-8">
	<link href="${conPath }/css/style.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.0.js" ></script>
	<script>
		$(document).ready(function(){
			$('form').submit(function(){
				var msg = $('span').text();
				if(!msg ){
					alert('Please check ID availability');
					return false;
				}else if(msg != 'This ID is available'){
					alert('This ID is already in use. Please choose another ID');
					frm.empno.focus();
					return false;
				}
			});
			
		});
		function chk(){
			if(! frm.empno.value){
				alert('Please insert an ID');
				frm.empno.focus();
			}else{
				var empno = frm.empno.value;
				var ename = frm.ename.value;
				var job = frm.job.value;
				var mgr = frm.mgr.value;
				var hiredate = frm.hiredate.value;
				if(! hiredate) {
					hiredate = '<%=new Date(System.currentTimeMillis()) %>';
				}
				var sal = frm.sal.value;
				var sal = frm.sal.value;
				if(! sal){
					sal = 0;
				}
				var comm = frm.comm.value;
				if(!comm){
					comm = 0;
				}
				var deptno = frm.deptno.value;
				location.href = 'confirmNo.do?empno='+empno+'&ename='+ename+'&job='+job +
				'&mgr=' + mgr + '&hiredate=' + hiredate + '&sal='+sal +
				'&comm=' + comm + '&deptno='+deptno;
	}
}
	</script>
</head>
<body>
	<c:if test="${not empty insertResult }">
		<script>alert('${insertResult}');</script>
	</c:if>
	<form action="insert.do" method="post" name="frm">
		<table>
			<caption>Add Employee Information</caption>
			<tr>
				<th>Employee no</th>
					<td>
						<input type="number" name="empno" required="required" maxlength="5" value="${emp.empno }" style="width:80px;">
						<input type="button" value="Check availability" onclick="chk()" class="btn"><br>
						<span><c:if test="${not empty msg }">${msg }</c:if></span>
					</td>
			</tr>
			<tr>
				<th>Name</th>
				<td>
					<input type="text" name="ename" required="required" value="${emp.ename }"  style="width:80px;">
				</td>
			</tr>
			<tr>
				<th>Job</th>
				<td>
					<input type="text" name="job" required="required" value="${emp.job }"  style="width:80px;">
				</td>
			</tr>
			<tr>
				<th>Manager</th>
				<td>
					<select name="mgr">
						<c:forEach var="mgrEmp" items="${managerList }">
							<option value="${mgrEmp.empno }"
								<c:if test="${emp.mgr==mgrEmp.empno }"> 
									selected="selected" 
								</c:if>
								>${mgrEmp.empno } - ${mgrEmp.ename } 
							</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<th>Hired date</th>
				<td>
					<input type="date" name="hiredate" required="required" style="width:200px;" value="${emp.hiredate }">
				</td>
			</tr>
			<tr>
				<th>Salary</th>
				<td>
					<input type="number" name="sal" required="required" style="width:200px;" value="${emp.sal }">
				</td>
			</tr>
			<tr>
				<th>Commission</th>
				<td>
					<input type="number" name="comm" required="required" style="width:200px;" value="${emp.comm }">
				</td>
			</tr>
			<tr>
				<th>Department No</th>
				<td>
					<select name="deptno" style="width:200px;">
						<c:forEach var="dept" items="${deptList }">
									<option value="${dept.deptno }" 
										<c:if test="${emp.deptno==dept.deptno }"> selected="selected" </c:if>
									>${dept.deptno }-${dept.dname }-${dept.loc }</option>
								</c:forEach>
						</select>
				</td>
			</tr>
			<tr><td colspan="2"><input type="submit" value="등록" class="btn"></td></tr>
	</table>
</form>
</body>
</html>