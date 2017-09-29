<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<center>
		<h1>My page</h1>

		<form method="post" action="myinfo.do">
			<table>

				<tr>
					<td>구분</td>
					<td>${login.mem_type}</td>
				</tr>

				<tr>
					<td>아이디</td>
					<td>${login.mem_id}</td>

				</tr>

				<tr>
					<td>비밀번호</td>
					<td>${login.mem_pwd}</td>
				</tr>


				<tr>
					<td>이름</td>
					<td>${login.mem_name}</td>
				</tr>


				<tr>
					<td>연락처</td>
					<td>${login.mem_hp}</td>
				</tr>




				<tr>
					<td>지점명</td>
					<td>${login.s_no}</td>

				</tr>


				<tr>
					<td colspan="2" align="center"><input type="submit"
						value="수정하기"> <input type="button" value="취소"
						onclick="window.location='/d_time/main_member.jsp'"></td>
				</tr>

			</table>
		</form>
	</center>
</body>
</html>