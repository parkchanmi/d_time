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

	<div class="row">
		<div class="col-lg-12">
			<h3 class="page-header">
				<i class="fa fa-th-large"></i> My page
			</h3>
		</div>
		<div class="col-lg-6">
			<form method="post" action="myinfo.do">
				<div class="panel panel-default">
					<div class="panel-heading">
						<i class="fa fa-user"></i><strong> My page</strong>
					</div>
					<div class="board-notice height-fix">
						<ul>
							<li class="padding-left-10 clear-both margin-bottom20"><i
								class="fa fa-check-square-o color_mypage-icon margin_right fl-left"
								aria-hidden="true"></i>
								<h3 class="fl-left menu-board-notice text-left ">구분 :</h3>
								<h4 class="board-text display-inherit">${login.mem_type}</h4></li>

							<li class="padding-left-10 clear-both margin-bottom20"><i
								class="fa fa-check-square-o color_mypage-icon margin_right fl-left"
								aria-hidden="true"></i>
								<h3 class="fl-left menu-board-notice text-left ">아이디 :</h3>
								<h4 class="board-text display-inherit">${login.mem_id}</h4></li>

							<li class="padding-left-10 clear-both margin-bottom20"><i
								class="fa fa-check-square-o color_mypage-icon margin_right fl-left"
								aria-hidden="true"></i>
								<h3 class="fl-left menu-board-notice text-left ">인증코드 :</h3>
								<h4 class="board-text display-inherit">${login.s_code}</h4></li>

							<li class="padding-left-10 clear-both margin-bottom20"><i
								class="fa fa-check-square-o color_mypage-icon margin_right fl-left"
								aria-hidden="true"></i>
								<h3 class="fl-left menu-board-notice text-left ">이름 :</h3>
								<h4 class="board-text display-inherit">${login.mem_name}</h4></li>

							<li class="padding-left-10 clear-both margin-bottom20"><i
								class="fa fa-check-square-o color_mypage-icon margin_right fl-left"
								aria-hidden="true"></i>
								<h3 class="fl-left menu-board-notice text-left ">연락처 :</h3>
								<h4 class="board-text display-inherit">${login.mem_hp}</h4></li>

							<li class="padding-left-10 clear-both margin-bottom20"><i
								class="fa fa-check-square-o color_mypage-icon margin_right fl-left"
								aria-hidden="true"></i>
								<h3 class="fl-left menu-board-notice text-left ">지점명 :</h3>
								<h4 class="board-text display-inherit">${login.s_name}</h4></li>
						</ul>
					</div>
				</div>
				<div class="btn-3-board">
					<input type="submit" class="btn btn-board" value="수정">
					<a class="btn btn-download" href="#" onClick="history.back()" style="padding: 9px 14px !important;">취소</a>
				</div>
				



				<!-- Bootstrap core JavaScript -->
				<script src="resources/bootstrap/vendor/jquery/jquery.min.js"></script>
				<!-- 	<script src="resources/bootstrap/vendor/popper/popper.min.js"></script> -->
				<script
					src="resources/bootstrap/vendor/bootstrap/js/bootstrap.min.js"></script>



			</form>
		</div>
	</div>


</body>
</html>



