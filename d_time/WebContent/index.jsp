<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<c:if test="${check==1}"> 
<script>
alert('비밀번호 변경완료');
</script>
</c:if>

<c:if test="${join==1}"> 
<script>
alert('회원가입 완료');
</script>
</c:if>
<script>
$(document).ready(function(){
	$('#myModal').on('shown.bs.modal', function () {
		  $('#myInput').focus()
		})
       // $("#myModal").modal('show');
 });

</script>

<c:if test="${empty_login==1}">
<script>
alert('비어있음!');
//location.href="#myModal";

</script>
</c:if>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>[Cafe. CiCHA] manage site</title>

<!-- Bootstrap core CSS -->
<link href="resources/bootstrap/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom fonts for this template -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic"
	rel="stylesheet" type="text/css">

<!-- Custom styles for this template -->
<link href="resources/bootstrap/css/business-casual.css"
	rel="stylesheet">

</head>

<body>

	<div
		class="tagline-upper text-center text-heading text-shadow text-white mt-5 d-none d-lg-block">Cafe. CiCHA</div>
	<div
		class="tagline-lower text-center text-expanded text-shadow text-uppercase text-white mb-5 d-none d-lg-block">3481
		Melrose Place | Beverly Hills, CA 90210 | 123.456.7890</div>

	<!-- Navigation -->
	<!-- <nav class="navbar navbar-expand-lg navbar-light bg-faded py-lg-4">
		<div class="container">
			<a
				class="navbar-brand text-uppercase text-expanded font-weight-bold d-lg-none"
				href="#">Start Bootstrap</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav mx-auto">
					<li class="nav-item active px-lg-4"><a
						class="nav-link text-uppercase text-expanded" href="index.html">Home
							<span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item px-lg-4"><a
						class="nav-link text-uppercase text-expanded" href="about.html">About</a>
					</li>
					<li class="nav-item px-lg-4"><a
						class="nav-link text-uppercase text-expanded" href="blog.html">Blog</a>
					</li>
					<li class="nav-item px-lg-4"><a
						class="nav-link text-uppercase text-expanded" href="contact.html">Contact</a>
					</li>
					<li class="nav-item px-lg-4"><a
						class="nav-link text-uppercase text-expanded" data-toggle="modal"
						href="#myModal">Login</a></li>
				</ul>
			</div>
		</div>
	</nav> -->

	<div class="container">

		<div class="bg-faded p-4 my-4">
			<!-- Image Carousel -->
			<div id="carouselExampleIndicators" class="carousel slide"
				data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#carouselExampleIndicators" data-slide-to="0"
						class="active"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
				</ol>
				<div class="carousel-inner" role="listbox">
					<div class="carousel-item active">
						<img class="d-block img-fluid w-100"
							src="resources/bootstrap/img/slide-1.jpg" alt="">
						<!-- <div class="carousel-caption d-none d-md-block">
							<h3 class="text-shadow">First Slide</h3>
							<p class="text-shadow">This is the caption for the first
								slide.</p>
						</div> -->
						
					</div>
					<div class="carousel-item">
						<img class="d-block img-fluid w-100"
							src="resources/bootstrap/img/slide-2.jpg" alt="">
						<!-- <div class="carousel-caption d-none d-md-block">
							<h3 class="text-shadow">Second Slide</h3>
							<p class="text-shadow">This is the caption for the second
								slide.</p>
						</div> -->
					</div>
					<div class="carousel-item">
						<img class="d-block img-fluid w-100"
							src="resources/bootstrap/img/slide-3.jpg" alt="">
						<!-- <div class="carousel-caption d-none d-md-block">
							<h3 class="text-shadow">Third Slide</h3>
							<p class="text-shadow">This is the caption for the third
								slide.</p>
						</div> -->
					</div>
				</div>
				<a class="carousel-control-prev" href="#carouselExampleIndicators"
					role="button" data-slide="prev"> <span
					class="carousel-control-prev-icon" aria-hidden="true"></span> <span
					class="sr-only">Previous</span>
				</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
					role="button" data-slide="next"> <span
					class="carousel-control-next-icon" aria-hidden="true"></span> <span
					class="sr-only">Next</span>
				</a>
			</div>
			<!-- Welcome Message -->
			<div class="text-center mt-4">
				<div class="text-heading text-muted text-lg">Welcome To</div>
				<h1 class="my-2">Cafe. CiCHA</h1>
				<div class="text-heading text-muted text-lg">
					By <strong>BEAN</strong>
				</div>
			</div>
			<div class="text-center mt-4">
			<button class="btn btn-default" data-toggle="modal" href="#myModal"><h3 class="my-2"><b>Login</b></h3></button>
			</div>
		</div>

	

	</div>
	<!-- /.container -->

	<footer class="bg-faded text-center py-5">
		<div class="container">
			<p class="m-0">Copyright &copy; cafe. CiCHA 2017</p>
		</div>
	</footer>

	<div class="modal fade" id="myModal" tabindex="1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">Welcome</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">

					<form accept-charset="UTF-8" role="form" method="post" action="/d_time/login_check.do">
						<legend>로그인</legend>
						<div class="form-group">
							<label for="mem_id"> 아이디</label> 
							<input name="mem_id" value='' id="mem_id"
								placeholder="Id" type="text"
								class="form-control" />
						</div>
						<div class="form-group">
							<label for="mem_pwd">비밀번호</label> 
							<input name="mem_pwd" id="mem_pwd" value='' placeholder="Password" type="password"
								class="form-control" />
						</div>
						<div class="form-group">
							<input type="submit"  class="btn btn-primary btn-block m-t-md" value="로그인"> 
							
						</div>
						<span class='text-center'><a
							href="pwfindForm.jsp"
							class="text-sm">비밀번호 찾기</a></span>
						<hr />
						<div class="form-group">
							<a class="btn btn-default btn-block m-t-md" href="joinForm.jsp"> 회원가입</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="myModal_join" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog_join">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">Welcome</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">
					<form accept-charset="UTF-8" role="form" method="post" action="">
						<legend>Join</legend>
						<div class="form-group">
							<label for="username-email">아이디</label> <input name="user_id"
								value='' id="username-email" placeholder="E-mail or Username"
								type="text" class="form-control" />
						</div>
						<div class="form-group">
							<label for="password">비밀번호</label> <input name="password"
								id="password" value='' placeholder="Password" type="password"
								class="form-control input-join" /> <label for="password">비밀번호 확인</label>
							<input name="password" id="password" value=''
								placeholder="Password" type="password"
								class="form-control input-join" />
						</div>
						<div class="form-group"> 
							<a href="main_admin.jsp"><input type="submit"
								class="btn btn-default btn-login-submit btn-block m-t-md"
								value="Join" /></a>
						</div>
						<hr />
						<div class="form-group">
							<a class="btn btn-default btn-block m-t-md" data-toggle="modal"
							 	href="#myModal_join">Join</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap core JavaScript -->
	<script src="resources/bootstrap/vendor/jquery/jquery.min.js"></script>
	<script src="resources/bootstrap/vendor/popper/popper.min.js"></script>
	<script src="resources/bootstrap/vendor/bootstrap/js/bootstrap.min.js"></script>
</form>
</body>

</html>