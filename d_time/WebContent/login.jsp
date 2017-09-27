<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>Cafe. CiCHA</title>
<!-- Bootstrap core CSS-->
<link href="resources/bootstrap/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Custom fonts for this template-->
<link
	href="resources/bootstrap/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<!-- Page level plugin CSS-->
<link
	href="resources/bootstrap/vendor/datatables/dataTables.bootstrap4.css"
	rel="stylesheet">
<!-- Custom styles for this template-->
<link href="resources/bootstrap/css/sb-admin.css" rel="stylesheet">
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="page-header">
				<h2>심플한 로그인 폼</h2>
			</div>
			<div class="col-md-3">
				<div class="login-box well">
					<form accept-charset="UTF-8" role="form" method="post" action="">
						<legend>로그인</legend>
						<div class="form-group">
							<label for="username-email">이메일 or 아이디</label> <input
								name="user_id" value='' id="username-email"
								placeholder="E-mail or Username" type="text"
								class="form-control" />
						</div>
						<div class="form-group">
							<label for="password">비밀번호</label> <input name="password"
								id="password" value='' placeholder="Password" type="password"
								class="form-control" />
						</div>
						<div class="form-group">
							<input type="submit"
								class="btn btn-default btn-login-submit btn-block m-t-md"
								value="Login" />
						</div>
						<span class='text-center'><a
							href="/bbs/index.php?mid=index&act=dispMemberFindAccount"
							class="text-sm">비밀번호 찾기</a></span>
						<hr />
						<div class="form-group">
							<a href="" class="btn btn-default btn-block m-t-md"> 회원가입</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/bootstrap.min.js"></script>
</body>
</html>