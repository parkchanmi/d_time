<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "controller.all.member.Member_DAO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- Bootstrap core CSS -->
 <link href="resources/bootstrap/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
 
<title>My page</title>
</head>
<body>
		<h1>My page</h1>
	<center>
		<form method="post" action="myinfo.do">
			<table>

				<tr>
					<td height="100px" align="center">구분 : </td>
					<td>${login.mem_type}</td>
				</tr>

				<tr>
					<td height="100px" align="center">아이디 : </td>
					<td>${login.mem_id}</td>

				</tr>

				<tr>
					<td height="100px" align="center">비밀번호 : </td>
					<td>${login.mem_pwd}</td>
				</tr>


				<tr>
					<td height="100px" align="center">이름 : </td>
					<td>${login.mem_name}</td>
				</tr>


				<tr>
					<td height="100px" align="center">연락처 : </td>
					<td>${login.mem_hp}</td>
				</tr>




				<tr>
					<td height="100px" align="center">지점명 : </td>
					<td>${login.s_no}</td>

				</tr>


				<tr>
					<td colspan="2" align="center">
					<div class="form-group">
					<input type="submit"  class="btn btn-primary btn-block m-t-md" value="수정하기"> 
					</div>
												
					<td colspan="1" align="center">
					<div class="form-group">
					
					  <a  type="button" class="btn btn-default btn-block m-t-md"  href="#" onClick="history.back()">취소</a>  

					<!-- <input type="button" value="취소" class="btn btn-default btn-block m-t-md" 
						onclick="window.location='main_member.do'"> -->
					</div>
				</tr>

			</table>
			
			<!-- Bootstrap core JavaScript -->
	<script src="resources/bootstrap/vendor/jquery/jquery.min.js"></script>
<!-- 	<script src="resources/bootstrap/vendor/popper/popper.min.js"></script> -->
	<script src="resources/bootstrap/vendor/bootstrap/js/bootstrap.min.js"></script>
	
	
	
		</form>
</center>
</body>
</html>