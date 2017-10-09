<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>Cafe. CiCHA</title>
<link
	href="/d_time/resources/bootstrap/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Custom fonts for this template-->
<link
	href="/d_time/resources/bootstrap/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<!-- Page level plugin CSS-->
<link
	href="/d_time/resources/bootstrap/vendor/datatables/dataTables.bootstrap4.css"
	rel="stylesheet">
<!-- Custom styles for this template-->
<link href="/d_time/resources/bootstrap/css/sb-admin.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
</head>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-1.9.0.min.js"
	integrity="sha256-f6DVw/U4x2+HjgEqw5BZf67Kq/5vudRZuRkljnbF344="
	crossorigin="anonymous"></script>
<script type="text/javascript" src="/d_time/jqplot/js/jquery.jqplot.js"></script>
<script type="text/javascript"
	src="/d_time/jqplot/js/plugins/jqplot.pieRenderer.js"></script>
<script type="text/javascript"
	src="/d_time/jqplot/js/plugins/jqplot.enhancedPieLegendRenderer.js"></script>
<link rel="stylesheet" type="text/css"
	href="/DaengDaeng/jqplot/css/jquery.jqplot.css" />
<script type="text/javascript"
	src="/d_time/jqplot/js/plugins/jqplot.pieRenderer.js"></script>
<script type="text/javascript"
	src="/d_time/jqplot/js/plugins/jqplot.enhancedPieLegendRenderer.js"></script>
<script type="text/javascript"
	src="/d_time/jqplot/js/plugins/jqplot.barRenderer.js"></script>
<script type="text/javascript"
	src="/d_time/jqplot/js/plugins/jqplot.pointLabels.js"></script>
<script type="text/javascript"
	src="/d_time/jqplot/js/plugins/jqplot.categoryAxisRenderer.js"></script>

	<!-- Bootstrap core JavaScript-->
	<!-- <script src="/d_time/resources/bootstrap/vendor/jquery/jquery.min.js"></script> -->
	<script src="/d_time/resources/bootstrap/vendor/popper/popper.min.js"></script>
	<script
		src="/d_time/resources/bootstrap/vendor/bootstrap/js/bootstrap.min.js"></script>
	<!-- Core plugin JavaScript-->
	<script
		src="/d_time/resources/bootstrap/vendor/jquery-easing/jquery.easing.min.js"></script>
	<!-- Page level plugin JavaScript-->
	<script
		src="/d_time/resources/bootstrap/vendor/datatables/jquery.dataTables.js"></script>
	<script
		src="/d_time/resources/bootstrap/vendor/datatables/dataTables.bootstrap4.js"></script>
	<!-- Custom scripts for all pages-->
	<script src="/d_time/resources/bootstrap/js/sb-admin.min.js"></script>
	<!-- Custom scripts for this page-->
	<script
		src="/d_time/resources/bootstrap/js/sb-admin-datatables.min.js"></script>



	<tiles:insertAttribute name="header" />

	<div class="content-wrapper">

		<tiles:insertAttribute name="body" />

	</div>

	<tiles:insertAttribute name="footer" />
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">Select "Logout" below if you are ready
					to end your current session.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="login.html">Logout</a>
				</div>
			</div>
		</div>
	</div>

</body>
</html>