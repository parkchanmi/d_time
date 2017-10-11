<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="controller.all.member.Member_DAO"%>
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


	<form method="post" action="myinfo.do">
		<div class="panel panel-default">
			<div class="panel-heading">
				<i class="fa fa-user"></i></span> <strong> My page</strong>
			</div>
			<div class="manage_info">
				<dl>
					<dt>
						<i aria-hidden="true" style="margin-right: 15px"></i>구분 :
						${login.mem_type}
					</dt>

				</dl>



				<dl>
					<dt>
						<i aria-hidden="true" style="margin-right: 15px"></i>아이디 :
						${login.mem_id}
					</dt>

				</dl>



				<dl>
					<dt>
						<i aria-hidden="true" style="margin-right: 15px"></i>비밀번호 :
						${login.mem_pwd}
					</dt>

				</dl>



				<dl>
					<dt>
						<i aria-hidden="true" style="margin-right: 15px"></i>이름 :
						${login.mem_name}
					</dt>

				</dl>



				<dl>
					<dt>
						<i aria-hidden="true" style="margin-right: 15px"></i>연락처 :
						${login.mem_hp}
					</dt>

				</dl>


				<dl>
					<dt>
						<i aria-hidden="true" style="margin-right: 15px"></i>지점명 :
						${login.s_name}
					</dt>

				</dl>

			</div>
		</div>
		<table>
			<tr>
				<td colspan="2" align="center">
					<div class="form-group">
						<input type="submit" class="btn btn-primary btn-block m-t-md"
							value="수정하기">
					</div>
				<td colspan="1" align="center">
					<div class="form-group">

						<a type="button" class="btn btn-default btn-block m-t-md" href="#"
							onClick="history.back()">취소</a>

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

</body>
</html>



