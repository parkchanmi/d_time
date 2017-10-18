<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- Bootstrap core CSS -->
<link href="resources/bootstrap/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<title>회원가입</title>
</head>
<body>
	<div class="row">
		<div class="col-lg-12">
			<h3 class="page-header">
				<i class="fa fa-th-large"></i> My page 확인
			</h3>
		</div>
		<div class="col-lg-6">
			<form method="post" action="myinfo_pwdCheck.do">
				<div class="panel panel-default">
					<div class="panel-heading">
						<i class="fa fa-user"></i><strong> 나의 정보 수정하기</strong>
					</div>
					<div class="board-notice height-fix">
						<div class="padding-126 clear-both margin-bottom20"><i
							class="fa fa-check-square-o color_mypage-icon margin_right fl-left"
							aria-hidden="true"></i>
							<h3 class="fl-left menu-board-notice text-left ">비밀번호 :</h3>
							<h4 class="board-text display-inherit fl-left margin-right-num"><input
								class='col-lg-12 form-control input-sm' type="password"
								name="mem_pwd"/></h4>
							<input type="submit" class="btn btn-board" value="확인">
						</div>
					</div>
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